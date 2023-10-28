import { Body, Controller, Delete, Get, Param, Post, Put, ValidationPipe } from "@nestjs/common";
import { SaveQuestionDto } from "src/routes/question/dto/save.request.dto";
import { Question } from "src/entity/question.entity";
import { QuestionService } from "src/routes/question/question.service";
import { UpdateQuestionDto } from "./dto/update.request.dto";

@Controller('api/question')
export class QuestionController {

     constructor(private readonly questionService: QuestionService){}

     @Post('save')
     async saveQuestion(@Body() saveQuestionDto: SaveQuestionDto): Promise<number> {
          const questionId = await this.questionService.saveQuestion(saveQuestionDto);
          return Object.assign({
               data: { questionId: questionId },
               statusCode: 201,
               statusMsg: `saveQuestion을 이용한 Question 데이터 추가가 성공적으로 완료되었습니다.`,
          });
     }

     @Get('all')
     async findAllWithCategory(): Promise<Question[]> {
          const questionList = await this.questionService.findAllWithCategory();
          return Object.assign({
               data: questionList,
               statusCode: 200,
               statusMsg: `findAllWithCategory을 이용한 Question 데이터 조회가 성공적으로 완료되었습니다.`,
          });
     }

     @Delete('delete/:questionId')
     async deleteQuestion(@Param('questionId') questionId: number): Promise<number> {
          await this.questionService.deleteQuestion(questionId);
          return Object.assign({
               data: { questionId: questionId },
               statusCode: 201,
               statusMsg: `deleteQuestion을 이용한 Question 데이터 삭제가 성공적으로 완료되었습니다.`,
          });
     }
     
     @Put('update/:questionId')
     async updateQuestion(@Param('questionId') questionId: number, @Body(new ValidationPipe()) updateQuestionDto: UpdateQuestionDto): Promise<void> {
          await this.questionService.updateQuestion(questionId, updateQuestionDto);
          return Object.assign({
               statusCode: 201,
               statusMsg: `updateQuestion을 이용한 Question 데이터 수정이 성공적으로 완료되었습니다.`,
          });
     }
}