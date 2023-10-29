import { ArgumentsHost, Catch, ExceptionFilter } from "@nestjs/common";
import { CustomError } from "./common";


@Catch()
export class CustomExceptionFilter implements ExceptionFilter {
    catch(exception: unknown, host: ArgumentsHost){
        const ctx = host.switchToHttp();
        const response = ctx.getResponse();
        const request = ctx.getRequest();

        if(exception instanceof CustomError){
            return response.status(exception.statusCode).json({
                statusCode: exception.statusCode,
                message: exception.message,
              });
        }
    }
}