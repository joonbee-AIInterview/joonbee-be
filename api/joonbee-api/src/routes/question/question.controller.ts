import { Controller,Get, Query, Res } from "@nestjs/common";
import { QuestionService } from "src/routes/question/question.service";
import { ApiResponse, CustomError } from "src/common/config/common";
import { ResponseQuestionsWithCategoryDTO } from "./dto/response.dto";
import { Response } from 'express';

@Controller('api/question')
export class QuestionController {
     /**
     * Nest.js에서 @Res() 데커레이터를 사용하면 Express.js의 원시 Response객체에
     * 접근하기 때문에 return (Next.js 내장 응답처리 메커니즘)을 무시하고,
     * 원시 Express형식으로 응답을 보내야한다.
     */

     constructor(private readonly questionService: QuestionService){}

     /**
      * @api 메인 페이지 하단부분 API, 16개의 랜덤질문을 가져온다.
      */
     @Get('random')
     async questionsWithCategory(
          @Query('page') page: string = "1",
          @Query('category') category: string,
          @Query('subCategory') subCategory: string,
          @Res() response: Response,
     ) {
        try {
               const data = await this.questionService.questionsWithCategory(Number(page), category, subCategory);
               const apiResponse: ApiResponse<ResponseQuestionsWithCategoryDTO> = {
                    status: 200,
                    data
               }
               response.json(apiResponse);
          } catch(error) {
               throw new CustomError('알 수 없는 에러',500);
          }
     }

     // @Post('save')
     // async saveQuestion(@Body() saveQuestionDto: SaveQuestionDto): Promise<number> {
     //      const questionId = await this.questionService.saveQuestion(saveQuestionDto);
     //      return Object.assign({
     //           data: { questionId: questionId },
     //           statusCode: 201,
     //           statusMsg: `saveQuestion을 이용한 Question 데이터 추가가 성공적으로 완료되었습니다.`,
     //      });
     // }

     // @Get(':questionId')
     // async findOneWithCategory(@Param('questionId') questionId: number): Promise<Question> {
     //      const question = await this.questionService.findOneWithCategory(questionId);
     //      return Object.assign({
     //           data: question,
     //           statusCode: 200,
     //           statusMsg: `findOneWithCategory을 이용한 Question 데이터 조회가 성공적으로 완료되었습니다.`,
     //      });
     // }

     // @Delete('delete/:questionId')
     // async deleteQuestion(@Param('questionId') questionId: number): Promise<number> {
     //      await this.questionService.deleteQuestion(questionId);
     //      return Object.assign({
     //           data: { questionId: questionId },
     //           statusCode: 201,
     //           statusMsg: `deleteQuestion을 이용한 Question 데이터 삭제가 성공적으로 완료되었습니다.`,
     //      });
     // }
     
     // @Put('update/:questionId')
     // async updateQuestion(@Param('questionId') questionId: number, @Body(new ValidationPipe()) updateQuestionDto: SaveQuestionDto): Promise<void> {
     //      const question =  await this.questionService.updateQuestion(questionId, updateQuestionDto);
     //      return Object.assign({
     //           data: { question },
     //           statusCode: 201,
     //           statusMsg: `updateQuestion을 이용한 Question 데이터 수정이 성공적으로 완료되었습니다.`,
     //      });
     // }
}