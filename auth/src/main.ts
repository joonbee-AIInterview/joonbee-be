import { UserRepository } from './repository/member.repository';
import express, { Request, Response, Router, NextFunction } from 'express';
import dotenv from 'dotenv';
import axios from 'axios';
import kakaoRouter from './routes/kakao.routes';
import naverRouter from './routes/naver.routes';
import googleRouter from './routes/google.routes';
import loginRouter from './routes/login.routes';

import { CustomError, ApiResponse } from './utils/api.utils';

const app = express();
const PORT = 3000;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use('/auth/kakao',kakaoRouter);
app.use('/auth/naver', naverRouter);
app.use('/auth/google',googleRouter);
app.use('/auth/login',loginRouter);

process.on('uncaughtException', (err) => {
    console.error('Uncaught exception:', err);
    // 서버를 안전하게 종료하거나 다른 조치를 취할 수 있습니다.
});

app.get('/test',(req,res) => {
    const userRepository = new UserRepository();

    userRepository.findMember('13b4a').then(data => {
        
        console.log(typeof data);
        console.log(data);
        res.json('test');
    })
})

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

  