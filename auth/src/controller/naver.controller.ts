import { Response } from 'express';
import axios from 'axios';
import * as JWT from '../utils/jwt.utils';
import { userInfo } from 'os';
import * as crypto from 'crypto';


export const naverAuthentication = async (code: string) => {
    const NAVER_CLIENTID: string = process.env.NAVER_CLIENTID as string;
    const NAVER_CLIENTSECRET: string = process.env.NAVER_CLIENTSECRET as string;
    const NAVER_TOKEN_URL: string = process.env.NAVER_TOKEN_URL as string;
    const NAVER_USERINFO_URL: string = process.env.NAVER_USERINFO_URL as string;
    console.log(NAVER_CLIENTID);
    console.log(NAVER_CLIENTSECRET);
    const sha256Hash = crypto.createHash('sha256');
    const tempPwd = "1234";

    const { data } = await axios.post(NAVER_TOKEN_URL, null,{
        params: {
            grant_type: 'authorization_code',
            client_id: NAVER_CLIENTID,
            client_secret: NAVER_CLIENTSECRET,
            code: code
        },
        headers: {
            'Content-type': 'application/x-www-form-urlencoded;charset=utf-8',
        }
    });
    console.log(data);
    const accessToken = data.access_token;
    console.log(accessToken);

    const userInfoRequest = await axios.get(NAVER_USERINFO_URL,{
        headers: {
            Authorization: `Bearer ${accessToken}`,
        },
    });

    const userData = userInfoRequest.data.response;
   
    let payload: JWT.Payload = {
        id: userData.id,
        email: userData.email,
        password: sha256Hash.update(tempPwd).digest('hex'),
        thumbnail: userData.profile_image,
        loginType: 'NAVER'
    }
    console.log(userInfoRequest.data.response);

    payload = handleNullCheck(payload);
    const token: string = await JWT.generateToken(payload);
    return token;

}

const handleNullCheck = (payLoad: JWT.Payload): JWT.Payload => {
    return {
        id : payLoad.id !== null ? payLoad.id : 'NONE',
        email : payLoad.email !== null ? payLoad.email : 'NONE',
        password : payLoad.password !== null ? payLoad.password : 'NONE',
        thumbnail : payLoad.thumbnail !== null ? payLoad.thumbnail : 'NONE', 
        loginType: 'NAVER'
    };
}