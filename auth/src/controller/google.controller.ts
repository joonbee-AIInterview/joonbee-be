import axios from "axios";
import * as JWT from '../utils/jwt.utils';

export const googleAuthentication = async (code: string): Promise<string> => {
     const clientId: string = process.env.GOOGLE_CLIENTID as string;
     const clientSecret: string = process.env.GOOGLE_CLIENTSECRET as string;
     const GOOGLE_TOKEN_URL: string = process.env.GOOGLE_TOKEN_URL as string;
     const GOOGLE_USERINFO_URL: string = process.env.GOOGLE_USERINFO_URL as string;
     const REDIRECT_URI: string = process.env.REDIRECT_URI as string;

     const { data } = await axios.post(GOOGLE_TOKEN_URL, {
          grant_type: 'authorization_code',
          client_id: clientId,
          client_secret: clientSecret,
          redirect_uri: REDIRECT_URI,
          code: code,
     });
     const accessToken = data.access_token;
     const userInfoRequest = await axios.get(GOOGLE_USERINFO_URL, {
          headers: {
               Authorization: `Bearer ${accessToken}`,
           },
     });
     console.log(userInfoRequest.data);
     const token: string = await JWT.generateToken(userInfoRequest.data);
     return token;
}