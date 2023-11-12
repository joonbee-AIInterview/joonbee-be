import { RowDataPacket } from 'mysql2';
import { Category } from "src/entity/category.entity";
import { Question } from "src/entity/question.entity";
import { Repository } from "typeorm";
import { ResponseQuestionsDTO, ResponseQuestionsWithCategoryDTO, ResponseQuestionsWithSubcategoryDTO } from "./dto/response.dto";
export declare class QuestionService {
    private readonly questionRepository;
    private readonly categoryRepository;
    private PAGE_SIZE;
    constructor(questionRepository: Repository<Question>, categoryRepository: Repository<Category>);
    getQuestions(page: number): Promise<ResponseQuestionsDTO>;
    getQuestionsWithCategory(page: number, categoryName: string): Promise<ResponseQuestionsWithCategoryDTO>;
    getQuestionsWithSubcategory(page: number, categoryName: string, subCategoryName: string): Promise<ResponseQuestionsWithSubcategoryDTO>;
    makeResult(rowPacket: RowDataPacket[], countQuery: RowDataPacket): ResponseQuestionsWithSubcategoryDTO;
}
