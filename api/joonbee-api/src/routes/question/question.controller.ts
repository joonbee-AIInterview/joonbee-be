import { Body, Controller, Post } from "@nestjs/common";
import { SaveQuestionDto } from "src/dto/question/save-in-question.dto";
import { Question } from "src/entity/question.entity";
import { QuestionService } from "src/routes/question/question.service";

@Controller('question')
export class QuestionController {

     constructor(private readonly questionService: QuestionService){}

     @Post('save')
     async saveQuestion(@Body() saveQuestionDto: SaveQuestionDto): Promise<void> {
          console.log(saveQuestionDto); // 출력됨
     }
}