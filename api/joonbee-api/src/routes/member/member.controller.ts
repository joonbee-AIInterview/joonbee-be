import { Body, Controller, Get, ParseIntPipe, Post, Query, Req, Res, UseGuards, ValidationPipe } from '@nestjs/common';
import { MemberService } from './member.service';
import { ApiResponse, CustomError } from 'src/common/config/common';
import { RequestInterviewSaveDTO, RequestLikeDTO } from './dto/request.dto';
import { TokenAuthGuard } from 'src/common/config/auth';
import { Request, Response } from 'express';
import { ApiBody } from '@nestjs/swagger';
import { Member } from 'src/entity/member.entity';
import { ResponseInterviewCategoryDTO, ResponseMyInfoDTO } from './dto/response.dto';
 
@Controller('api/member')
export class MemberController {
   /**
     * Nest.js에서 @Res() 데커레이터를 사용하면 Express.js의 원시 Response객체에
     * 접근하기 때문에 return (Next.js 내장 응답처리 메커니즘)을 무시하고,
     * 원시 Express형식으로 응답을 보내야한다.
     */

    constructor(private readonly memberService: MemberService){}

    /**
     * @api token의 memberId로 사용자 PK, 썸네일, 닉네임, 인터뷰개수를 얻을 수 있다.
     */
    @UseGuards(TokenAuthGuard)
    @Get('info')
    async myInfoSelect(
        @Res() response: Response
    ){
        const memberId = response.locals.memberId;
        const dto: ResponseMyInfoDTO =  await this.memberService.myInfoData(memberId);
        
        const apiResponse: ApiResponse<ResponseMyInfoDTO> = {
            status: 200,
            data: dto
        }

        response.json(apiResponse);
    }

    /**
     * @api token을 통해 사용자가 풀었던 카테고리별 질문 개수를 가져온다. 
     */
    @UseGuards(TokenAuthGuard)
    @Get('category')
    async myCategoryInfo(
        @Query('page') page: string = "1",
        @Res() response: Response
    ){
        try{
            const memberId: string = response.locals.memberId;
            const data = await this.memberService.myCategoryInfoService(memberId,Number(page));
            const apiResponse: ApiResponse<ResponseInterviewCategoryDTO> = {
                status: 200,
                data
            }
        response.json(apiResponse);
        }catch(error){
            throw new CustomError('알 수 없는 에러',500);
        }
    }

    /**
     * @api token을 통해 사용자가 추천을 눌렀던 카테고리별 질문 개수를 가져온다. 
    */
    @UseGuards(TokenAuthGuard)
    @Get('category/like')
    async myCategoryLikeInfo(
        @Query('page') page: string = "1",
        @Res() response: Response
    ){
        try{
            const memberId: string = response.locals.memberId;
            const data = await this.memberService.myCategoryLikeInfoService(memberId,Number(page));
            const apiResponse: ApiResponse<ResponseInterviewCategoryDTO> = {
                status: 200,
                data
            }
        response.json(apiResponse);
        }catch(error){
            throw new CustomError('알 수 없는 에러',500);
        }
    }

    @UseGuards(TokenAuthGuard)
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
        @Req() request: Request,
        @Res() response: Response
    ){
        const { categoryName, questions } = request.body;
        
        if (!categoryName || !questions || !Array.isArray(questions) || questions.length === 0) {
            const apiResponse: ApiResponse<string> = {
                status: 200,
                data: '성공'
            }
            response.json(apiResponse);          

        }else{
            const memberId = response.locals.memberId;
            
            const data: RequestInterviewSaveDTO = {
                categoryName,
                questions
            }
            this.memberService.insertInterview(memberId, data);
    
            const apiResponse: ApiResponse<string> = {
                status: 200,
                data: '성공'
            }
            response.json(apiResponse);          
        }
        
    }

}
