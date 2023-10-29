import { Router, Request, Response } from 'express';
import { loginAuthentication } from '../controller/login.controller';
import { ApiResponse, CustomError, asyncErrorHandler } from '../utils/api.utils';

interface RequestBody {
    id: string,
    nickName: string
}

const router = Router();

router.post('/nick',asyncErrorHandler(
    async (req: Request, res: Response) => {
        const data: RequestBody = req.body;
        const authToken = await loginAuthentication(data.id, data.nickName);

        const response: ApiResponse<string> = {
            status: 200,
            data: '성공'
        }
        console.log(authToken);
        res.cookie('joonbee-token', authToken, { httpOnly: false, sameSite: 'none', secure: true });
        res.json(response);
}));

export default router;