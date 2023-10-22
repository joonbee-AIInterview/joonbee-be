import { Response } from 'express';
import axios from 'axios';
import * as JWT from '../utils/jwt.utils';

export const naverAuthentication = async (code: string) => {
    const clientId: string = process.env.CLIENTID as string;
    const clientSecret: string = process.env.CLIENTSECRET as string;
    const NAVER_TOKEN_URL: string = process.env.NAVER_TOKEN_URL as string;
    const NAVER_USERINFO_URL: string = process.env.NAVER_USERINFO_URL as string;

    const { data } = await axios.post(NAVER_TOKEN_URL, null,{
        params: {
            grant_type: 'authorization_code',
            client_id: clientId,
            client_secret: clientSecret,
            code: code
        },
        headers: {
            'Content-type': 'application/x-www-form-urlencoded;charset=utf-8',
        }
    });

    const accessToken = data.access_token;
    console.log(accessToken);

    const userInfoRequest = await axios.get(NAVER_USERINFO_URL,{
        headers: {
            Authorization: `Bearer ${accessToken}`,
        },
    });

    console.log(userInfoRequest.data.response);
    const token: string = await JWT.generateToken(userInfoRequest.data.response);
    return token;

}