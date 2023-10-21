import jwt from 'jsonwebtoken';
import { CustomError } from './api.utils';

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
export const generateToken = (payload: any): string => { 
    if(!payload) throw new CustomError("Error creating OAuth token", 401);
    return jwt.sign({default : payload}, TOKEN_KEY, { expiresIn: '1h'} );
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