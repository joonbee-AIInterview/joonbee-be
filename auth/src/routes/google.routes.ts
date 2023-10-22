import { NextFunction, Router, Request, Response } from "express";
import { ApiResponse, asyncErrorHandler } from "../utils/api.utils";
import { googleAuthentication } from "../controller/google.controller";

const router = Router();

router.get('/callback', asyncErrorHandler(
     async (req: Request, res: Response, next: NextFunction ) => {
          const { code } = req.query;
          const authToken = await googleAuthentication(code as string); //

          const respones: ApiResponse<string> = {
               status: 200,
               data: '성공'
          }
          res.cookie('joonbee-token', authToken, {httpOnly : false});
          res.json(respones);
     }
));

export default router;