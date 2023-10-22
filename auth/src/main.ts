import express, { Request, Response, Router, NextFunction } from 'express';
import dotenv from 'dotenv';
import axios from 'axios';
import kakaoRouter from './routes/kakao.routes';
import naverRouter from './routes/naver.routes';
import googleRouter from './routes/google.routes';
import { CustomError, ApiResponse } from './utils/api.utils';

const app = express();
const PORT = 3000;

app.use('/auth/kakao',kakaoRouter);
app.use('/auth/naver', naverRouter);
app.use('/auth/google',googleRouter);

app.use((err: any, req: any, res: any, next: any) => { // Exception 비들웨어는 라우터 뒤에 위치해야한다.
    if (err instanceof CustomError) {
        const response :ApiResponse<string> = {
            status: err.statusCode,
            data: err.message
        }
        res.status(err.statusCode).json(response);
        
    } else {
        const response :ApiResponse<string> = {
            status: 500,
            data: '알 수 없는 에러임 관리자 부르셈'
        }
        console.error(err);
        res.status(500).json(response);
        
    }
});
/**
 * const clientID = 'YOUR_KAKAO_REST_API_KEY';
  const kakaoAuthURL = `https://kauth.kakao.com/oauth/authorize?client_id=${clientID}&redirect_uri=${redirectURI}&response_type=code`;
 */
app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});

  