import { SaveQuestionDto } from "src/dto/question/save-in-question.dto";
<<<<<<< HEAD
=======
import { Question } from "src/entity/question.entity";
>>>>>>> d342bec (KAN-27 FEAT: findAllWithCategory, saveQuestion 구현)
import { QuestionService } from "src/routes/question/question.service";
export declare class QuestionController {
    private readonly questionService;
    constructor(questionService: QuestionService);
    saveQuestion(saveQuestionDto: SaveQuestionDto): Promise<number>;
    findAllWithCategory(): Promise<Question[]>;
    deleteQuestion(): Promise<void>;
}
