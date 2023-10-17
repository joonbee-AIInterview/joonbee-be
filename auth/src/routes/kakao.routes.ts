import { Router, Request, Response } from 'express';
import axios from 'axios';
import dotenv from 'dotenv';
import { kakaoAuthentication } from '../controller/kakao.controller';
dotenv.config();

const router = Router();

router.get('/callback', async (req: Request, res: Response) => {
    const { code } = req.query;

    const authToken: string = JSON.stringify(kakaoAuthentication);
    res.cookie('joonbee-token',authToken, { httpOnly : false});
    res.json('성공');
});

export default router;
