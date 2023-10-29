import { SaveQuestionDto } from "src/routes/question/dto/save.request.dto";
import { Question } from "src/entity/question.entity";
import { QuestionService } from "src/routes/question/question.service";
import { UpdateQuestionDto } from "./dto/update.request.dto";
export declare class QuestionController {
    private readonly questionService;
    constructor(questionService: QuestionService);
    saveQuestion(saveQuestionDto: SaveQuestionDto): Promise<number>;
    findAllWithCategory(): Promise<Question[]>;
    findOneWithCategory(questionId: number): Promise<Question>;
    deleteQuestion(questionId: number): Promise<number>;
    updateQuestion(questionId: number, updateQuestionDto: UpdateQuestionDto): Promise<void>;
}
