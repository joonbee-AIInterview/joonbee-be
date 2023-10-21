import { Router, Request, Response, NextFunction} from 'express';
import { naverAuthentication } from '../controller/naver.controller';
import { ApiResponse, asyncErrorHandler } from '../utils/api.utils';

const router = Router();

router.get('/callback',  asyncErrorHandler(
    async (req: Request, res: Response, next: NextFunction) => {
        const { code } = req.query;
        const userInfo = await naverAuthentication(code as string);

        const response: ApiResponse<string> = {
            status: 200,
            data: '성공'
        }
        res.cookie('joonbee-token',userInfo, { httpOnly : false});
        res.json(response);
    })
);

export default router;