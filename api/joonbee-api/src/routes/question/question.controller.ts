import { Body, Controller, Delete, Get, Post } from "@nestjs/common";
import { SaveQuestionDto } from "src/dto/question/save-in-question.dto";
import { Question } from "src/entity/question.entity";
import { QuestionService } from "src/routes/question/question.service";

@Controller('question')
export class QuestionController {

     constructor(private readonly questionService: QuestionService){}

     @Post('save')
     async saveQuestion(@Body() saveQuestionDto: SaveQuestionDto): Promise<number> {
          const questionId = await this.questionService.saveQuestion(saveQuestionDto);
          return Object.assign({
               data: questionId,
               statusCode: 201,
               statusMsg: `saved successfully`,
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

     @Delete()
     async deleteQuestion() {
          
     }
}