import { Payload } from './../utils/jwt.utils';
import { Router, Request, Response, response } from 'express';
import { loginAuthentication } from '../controller/login.controller';
import { ApiResponse, CustomError, asyncErrorHandler } from '../utils/api.utils';
import { verifyToken } from '../utils/jwt.utils';
import { userInfo } from 'os';
import SseService from '../utils/sub.utils';

interface RequestBody {
    id: string,
    nickName: string
}

const router = Router();
const clients = new Map<string, Response[]>();

router.post('/nick',asyncErrorHandler(
    async (req: Request, res: Response) => {
        const data: RequestBody = req.body;
        const authToken =await loginAuthentication(data.id, data.nickName);

        const response: ApiResponse<string> = {
            status: 200,
            data: '성공'
        }
        console.log(authToken);
        res.cookie('joonbee-token', authToken.accessToken, { httpOnly: false, sameSite: 'none', secure: true });
        res.cookie('joonbee-token-refresh', authToken.refreshToken, { httpOnly: false, sameSite: 'none', secure: true });
        res.json(response);
    }
));

router.get('/events', asyncErrorHandler(
    async (req: Request, res: Response) => {
       /*
        const token = req.cookies.joonbee_token;
        if(!token) throw new CustomError('TOKEN EMPTY',401);
       */
        try{
           // const payload: Payload = verifyToken(token) as Payload;
           // const memberId: string = payload.id;

            const memberId: string = req.query.memberId as string;

            SseService.serverEventResponse(memberId, res);

        } catch (error){
            throw new CustomError('SSE ERROR ',500);
        }
    }
));



export default router;