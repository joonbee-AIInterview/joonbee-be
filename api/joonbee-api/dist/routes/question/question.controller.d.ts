import { SaveQuestionDto } from "src/dto/question/save-in-question.dto";
import { QuestionService } from "src/routes/question/question.service";
export declare class QuestionController {
    private readonly questionService;
    constructor(questionService: QuestionService);
    saveQuestion(saveQuestionDto: SaveQuestionDto): Promise<void>;
}
