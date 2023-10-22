import jwt from 'jsonwebtoken';
import { CustomError } from './api.utils';
import { client as redisClient, setAsync, getAsync, delAsync }  from './redis.utils';

const TOKEN_KEY = 'test';

interface Payload { // 구현 다 되면 사용예쩡
    userId: number;
    username: string;
    iat?: number; // 발행 시간
    exp?: number; // 만료 시간
}

/**
 * TODO: payload를 PayLoad 타입으로 지정예정
 */
export const generateToken = async (payload: any): Promise<string> => { 
    const expire: number = 7 * 24 * 60 * 60; // refreshToken 만료시간 ( 7 일 )
    if(!payload) throw new CustomError("Error creating OAuth token", 401);
    
    const accessToken: string = jwt.sign({default : payload}, TOKEN_KEY, { 'expiresIn' : '1h' } );
    const refreshToken: string = jwt.sign({default : payload}, TOKEN_KEY, { 'expiresIn' : '7d' } );
    
    try{
        setAsync(accessToken, expire, refreshToken);
       
    }catch{
        console.error('Token Redis Error');
    }

    return accessToken;
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
