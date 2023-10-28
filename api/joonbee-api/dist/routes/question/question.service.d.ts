import { SaveQuestionDto } from "src/dto/question/save-in-question.dto";
import { Category } from "src/entity/category.entity";
import { Question } from "src/entity/question.entity";
import { Repository } from "typeorm";
export declare class QuestionService {
    private questionRepository;
    private categoryRepository;
    constructor(questionRepository: Repository<Question>, categoryRepository: Repository<Category>);
<<<<<<< HEAD
    saveQuestion(saveQuestionDto: SaveQuestionDto): Promise<void>;
=======
    saveQuestion(saveQuestionDto: SaveQuestionDto): Promise<number>;
    findAllWithCategory(): Promise<Question[]>;
>>>>>>> d342bec (KAN-27 FEAT: findAllWithCategory, saveQuestion 구현)
}
