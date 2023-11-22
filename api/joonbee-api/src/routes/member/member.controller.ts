import { Delete, HttpException } from '@nestjs/common';
import { Body, Controller, Get, ParseIntPipe, Post, Query, Req, Res, UseGuards, ValidationPipe } from '@nestjs/common';
import { MemberService } from './member.service';
import { ApiResponse, CustomError, PageResponseDTO } from 'src/common/config/common';
import { RequestCartInsertDTO, RequestInterviewSaveDTO, RequestLikeDTO } from './dto/request.dto';
import { TokenAuthGuard } from 'src/common/config/auth';
import { Request, Response } from 'express';
import { ApiBody } from '@nestjs/swagger';
import { Member } from 'src/entity/member.entity';
import { ResponseCartDTO, ResponseInterviewCategoryDTO, ResponseMyInfoDTO } from './dto/response.dto';
 
@Controller('api/member')
export class MemberController {
   

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
        const memberId: string = response.locals.memberId;
        const data = await this.memberService.myCategoryInfoService(memberId,Number(page));
        const apiResponse: ApiResponse<ResponseInterviewCategoryDTO> = {
            status: 200,
            data
        }
        response.json(apiResponse);
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
        const memberId: string = response.locals.memberId;
        const data = await this.memberService.myCategoryLikeInfoService(memberId,Number(page));
        const apiResponse: ApiResponse<ResponseInterviewCategoryDTO> = {
            status: 200,
            data
        }
        response.json(apiResponse);
    }

    /**
     * @api 장바구니 데이터 조회
     */
    @UseGuards(TokenAuthGuard)
    @Get('cart/read')
    async myCartRead(
        @Query('page') page: string = "1",
        @Res() response: Response
    ){
        const memberId = response.locals.memberId;
        const data: PageResponseDTO<ResponseCartDTO[]> = await this.memberService.myCartReadService(memberId, Number(page));
        
        const apiResponse: ApiResponse<PageResponseDTO<ResponseCartDTO[]>> = {
            status: 200,
            data
        }

        response.json(apiResponse);
    }

    /**
     * @api 장바구니 통계 메뉴
     */
    @UseGuards(TokenAuthGuard)
    @Get('info/cart')
    async myCartStatistics(
        @Res() response: Response
    ){
        const memberId = response.locals.memberId;
        const responseDTO = await this.memberService.getStatisticsForCart(memberId);
        
        const apiResponse: ApiResponse<any> = {
            status: 200,
            data: {
                categoryInfo : responseDTO
            }
        }
        response.json(apiResponse);
    }

    /**
     * @api 장바구니 기능
     */
    @UseGuards(TokenAuthGuard)
    @Post('cart/save')
    @ApiBody({ type: RequestCartInsertDTO})
    async insertCart(
        @Body(new ValidationPipe()) dto: RequestCartInsertDTO,
        @Res() response: Response
    ){
        const memberId: string = response.locals.memberId;
        const {questionId, subcategoryName} = dto;
        
        await this.memberService.insertCartService(memberId, questionId, subcategoryName);
    
        const apiResponse: ApiResponse<string> = {
            status: 200,
            data: '성공'
        }
        response.json(apiResponse);
    }

    /**
     * @api 좋아요 엔드포인트 
     */
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

    /**
     * @api 면접 데이터 저장 
     */
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

    @UseGuards(TokenAuthGuard)
    @Delete('cart/delete')
    async deleteCart(
        @Query('id') questionId: number,
        @Res() response: Response
    ){
        const memberId = response.locals.memberId;

        const success = await this.memberService.deleteCartService(memberId, questionId);
        const apiResponse: ApiResponse<string> = {
            status: success ? 200 : 400,
            data: success ? '성공' : '데이터가 존재하지 않습니다.'
        }
        
        response.status(apiResponse.status);
        response.json(apiResponse);
    }

}
