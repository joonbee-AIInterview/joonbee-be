import { Body, Controller, Get, Post, Req, Res, UseGuards, ValidationPipe } from '@nestjs/common';
import { MemberService } from './member.service';
import { ApiResponse } from 'src/common/config/common';
import { RequestInterviewSaveDTO, RequestLikeDTO } from './dto/request.dto';
import { TokenAuthGuard } from 'src/common/config/auth';
import { Request, Response } from 'express';
import { ApiBody } from '@nestjs/swagger';
 
@Controller('api/member')
export class MemberController {

    constructor(private readonly memberService: MemberService){}

    @UseGuards(TokenAuthGuard)
    @Get('info')
    async myInfoSelect(){

    }


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
    @ApiBody({ type: RequestLikeDTO })
    @Post('like')
    async insertLikeHandler(
        @Body(new ValidationPipe()) dto: RequestLikeDTO,
        @Res() response: Response
        ): Promise<void>{

        const memberId = response.locals.memberId;
        const interviewId = dto.interviewId;
                            
        this.memberService.insertLike(memberId, interviewId);
        const apiResponse: ApiResponse<string> = {
            status: 200,
            data: '성공'
        }
        //프로미스로서 반환하는 값이 업기 떄문에 void
        response.json(apiResponse);
    }

    @UseGuards(TokenAuthGuard)
    @Post('interview/save')
    @ApiBody({ type: RequestInterviewSaveDTO})
    async insertInterviewAndQuestion(
        @Body(new ValidationPipe()) data: RequestInterviewSaveDTO,
        @Res() response: Response
    ){
        const memberId = response.locals.memberId;
        this.memberService.insertInterview(memberId, data);

        const apiResponse: ApiResponse<string> = {
            status: 200,
            data: '성공'
        }
        response.json(apiResponse);          
    }

}
