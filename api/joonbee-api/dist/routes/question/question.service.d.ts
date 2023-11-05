import { SaveQuestionDto } from "src/routes/question/dto/save.request.dto";
import { Category } from "src/entity/category.entity";
import { Question } from "src/entity/question.entity";
import { Repository } from "typeorm";
export declare class QuestionService {
    private questionRepository;
    private categoryRepository;
    constructor(questionRepository: Repository<Question>, categoryRepository: Repository<Category>);
    saveQuestion(saveQuestionDto: SaveQuestionDto): Promise<number>;
    findQuestionWithCategory(): Promise<Question[]>;
    findOneWithCategory(questionId: number): Promise<Question>;
    deleteQuestion(questionId: number): Promise<void>;
    updateQuestion(questionId: number, updateQuestionDto: SaveQuestionDto): Promise<number>;
}
