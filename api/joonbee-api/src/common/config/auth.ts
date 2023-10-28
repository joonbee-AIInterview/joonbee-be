import { CanActivate, ExecutionContext, Injectable } from "@nestjs/common";
import { ExecutionContextHost } from "@nestjs/core/helpers/execution-context-host";
import { CustomError } from "./common";
import { verify } from 'jsonwebtoken';

@Injectable()
export class TokenAuthGuard implements CanActivate {
    async canActivate(context: ExecutionContext): Promise<boolean> {
        const request = context.switchToHttp().getRequest();
        const response = context.switchToHttp().getResponse();
        const token = request.cookies?.['joonbee-token'];
        
        console.log(request.cookies);

        if (!token) {
            throw new CustomError('TOKEN이 없습니다.',401);
        }

        try{
            const decoded = verify(token, 'test');
            response.locals.memberId = decoded.id;
            return true; 
        }catch(err){
            console.error(err);
            throw new CustomError('토큰 이상 에러', 401);
        }
    }
}