import axios from 'axios';
import * as JWT from '../utils/jwt.utils';
import dotenv from 'dotenv';

dotenv.config();

export const kakaoAuthentication = async (code: string) => {
    const clientId: string = process.env.KAKAO_CLIENTID as string;
    const clientSecret: string = process.env.KAKAO_CLIENTSECRET as string;
    const KAKAO_TOKEN_URL: string = process.env.KAKAO_TOKEN_URL as string;
    const KAKAO_USERINFO_URL: string = process.env.KAKAO_USERINFO_URL as string;

    const { data } = await axios.post(KAKAO_TOKEN_URL, null,{
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
    const userInfoRequest = await axios.get(KAKAO_USERINFO_URL,{
        headers: {
            Authorization: `Bearer ${accessToken}`,
        },
    });
    const token: string = JWT.generateToken(userInfoRequest.data.id);
    console.log(token);
    return token;
  
}

