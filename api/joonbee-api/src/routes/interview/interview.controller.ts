import { Controller, Get, Query, Res } from '@nestjs/common';
import { InterviewService } from './interview.service';
import { Response } from 'express';
import { ApiResponse, CustomError } from 'src/common/config/common';
import { ResponseInterviewsQuestionCategoryMemberDTO } from './dto/response.dto';

@Controller('api/interview')
export class InterviewController {
     /**
     * Nest.js에서 @Res() 데커레이터를 사용하면 Express.js의 원시 Response객체에
     * 접근하기 때문에 return (Next.js 내장 응답처리 메커니즘)을 무시하고,
     * 원시 Express형식으로 응답을 보내야한다.
     */

     constructor(
          private readonly interviewService: InterviewService
     ) {}

     /**
      * @api 메인 페이지 상단부분 API, 9개씩 페이징 랜덤으로 모두 가져온다.
      */
     // @Get('all')
     // async interviewsWithQuestionCategoryMember(
     //      @Query('page') page: string = "1",
     //      @Query('category') category: string,
     //      @Res() response: Response,
     // ) {
     //      try {
     //           const data = await this.interviewService.interviewsWithQuestionCategoryMember(Number(page), category);
     //           const apiResponse: ApiResponse<ResponseInterviewsQuestionCategoryMemberDTO> = {
     //                status: 200,
     //                data,
     //           }
     //           response.json(apiResponse);
     //      } catch(error) {
     //           throw new CustomError('알 수 없는 에러',500);
     //      }
     // }
}