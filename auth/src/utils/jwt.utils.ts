import { UserRepository } from './../repository/member.repository';
import jwt from 'jsonwebtoken';
import { CustomError } from './api.utils';
import { client as redisClient, setAsync, getAsync, delAsync }  from './redis.utils';

const TOKEN_KEY = 'test';

export interface Payload { // 구현 다 되면 사용예쩡
    id: string,
    email: string,
    password: string,
    thumbnail: string
}

/**
 * TODO: payload를 PayLoad 타입으로 지정예정
 */
export const generateToken = async (payload: Payload): Promise<string> => { 
    const expire: number = 7 * 24 * 60 * 60; // refreshToken 만료시간 ( 7 일 )
    
    if(!payload) throw new CustomError("Error creating OAuth token", 401);
    const userRepository: UserRepository = new UserRepository();
    const accessToken: string = jwt.sign({joonbee : payload.id}, TOKEN_KEY, { 'expiresIn' : '1h' } );
    const refreshToken: string = jwt.sign({joonbee : payload.id}, TOKEN_KEY, { 'expiresIn' : '7d' } );
    
    try{
        setAsync(accessToken, expire, refreshToken);
        const existMemberData: boolean = await userRepository.existMember(payload.id, payload.email);
        if(!existMemberData){
            userRepository.insertMember(payload.id, payload.email, payload.password, payload.thumbnail);
        }
        return accessToken;

    }catch(err){
        console.error(err);
        throw new CustomError("TOKEN ERROR", 500);
    }
}

export const verifyToken = (token: string): Payload | null => {
    try {
        const decoded = jwt.verify(token, TOKEN_KEY) as Payload;
        return decoded;
    } catch (error) {
        console.error("Token verification failed:", error);
        return null;
    }
}
