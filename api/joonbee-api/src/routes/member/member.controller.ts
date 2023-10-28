import { Body, Controller, Get, Post, Req, Res, UseGuards, ValidationPipe } from '@nestjs/common';
import { MemberService } from './member.service';
import { ApiResponse } from 'src/common/config/common';
import { RequestLikeDTO } from './dto/request.dto';
import { TokenAuthGuard } from 'src/common/config/auth';
import { Request, Response } from 'express';
 
@Controller('api/member')
export class MemberController {

    constructor(private readonly memberService: MemberService){}

    @UseGuards(TokenAuthGuard)
    @Get()
    async test(@Req() request: Request,
                @Res() response: Response){
                
        return response.locals.memberId;
    }
    /**
     * Nest.js에서 @Res() 데커레이터를 사용하면 Express.js의 원시 Response객체에
     * 접근하기 때문에 return (Next.js 내장 응답처리 메커니즘)을 무시하고,
     * 원시 Express형식으로 응답을 보내야한다.
     */

    @UseGuards(TokenAuthGuard)
    @Post('like')
    async insertLikeHandler(@Body(new ValidationPipe()) dto: RequestLikeDTO,
                            @Req() response: Response): Promise<void>{
        // TODO: 유효성검사 쿠키발행 Swagger 등록

        const memberId = response.locals.memberId;

        this.memberService.insertLike(memberId, dto.questionId);
        const apiResponse: ApiResponse<string> = {
            status: 200,
            data: '성공'
        }
        //프로미스로서 반환하는 값이 업기 떄문에 void
        response.json(apiResponse);
    }

}
