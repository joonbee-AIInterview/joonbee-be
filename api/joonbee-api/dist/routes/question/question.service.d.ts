import { SaveQuestionDto } from "src/dto/question/save-in-question.dto";
import { Category } from "src/entity/category.entity";
import { Question } from "src/entity/question.entity";
import { Repository } from "typeorm";
export declare class QuestionService {
    private questionRepository;
    private categoryRepository;
    constructor(questionRepository: Repository<Question>, categoryRepository: Repository<Category>);
    saveQuestion(saveQuestionDto: SaveQuestionDto): Promise<void>;
}
