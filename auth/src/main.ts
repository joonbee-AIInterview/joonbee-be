import express, { Request, Response, Router } from 'express';
import dotenv from 'dotenv';
import axios from 'axios';
import kakaoRouter from './routes/kakao.routes';

const app = express();
const PORT = 3000;


app.use('/api/auth/kakao',kakaoRouter);

/**
 *  
 * const clientID = 'YOUR_KAKAO_REST_API_KEY';
  const kakaoAuthURL = `https://kauth.kakao.com/oauth/authorize?client_id=${clientID}&redirect_uri=${redirectURI}&response_type=code`;
 */

app.listen(PORT, () => {
    console.log(`Server is running on http://localhost:${PORT}`);
});

  