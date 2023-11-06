import { Category } from "src/entity/category.entity";
import { Question } from "src/entity/question.entity";
import { Repository } from "typeorm";
import { ResponseQuestionsWithCategoryDTO } from "./dto/response.dto";
import { SaveQuestionDto } from './dto/save.request.dto';
export declare class QuestionService {
    private readonly questionRepository;
    private readonly categoryRepository;
    private PAGE_SIZE;
    constructor(questionRepository: Repository<Question>, categoryRepository: Repository<Category>);
    questionsWithCategory(page: number, categoryName: string, subCategoryName: string): Promise<ResponseQuestionsWithCategoryDTO>;
    saveQuestion(saveQuestionDto: SaveQuestionDto): Promise<number>;
    findOneWithCategory(questionId: number): Promise<Question>;
    deleteQuestion(questionId: number): Promise<void>;
    updateQuestion(questionId: number, updateQuestionDto: SaveQuestionDto): Promise<number>;
}
