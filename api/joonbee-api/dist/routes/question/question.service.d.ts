import { RowDataPacket } from 'mysql2';
import { Category } from "src/entity/category.entity";
import { Question } from "src/entity/question.entity";
import { Repository } from "typeorm";
import { ResponseGPTQuestionsDTO, ResponseQuestionsDTO, ResponseQuestionsInfoDTO } from "./dto/response.dto";
export declare class QuestionService {
    private readonly questionRepository;
    private readonly categoryRepository;
    private PAGE_SIZE;
    constructor(questionRepository: Repository<Question>, categoryRepository: Repository<Category>);
    getQuestions(page: number): Promise<ResponseQuestionsDTO>;
    getQuestionsWithCategory(page: number, categoryName: string): Promise<ResponseQuestionsDTO>;
    getQuestionsWithSubcategory(page: number, categoryName: string, subCategoryName: string): Promise<ResponseQuestionsDTO>;
    getQuestionsByGPT(memberId: string, categoryName: string, subcategoryName: string[], questionCount: string): Promise<ResponseGPTQuestionsDTO>;
    makeResult(rowPacket: RowDataPacket[], countQuery: RowDataPacket): ResponseQuestionsDTO;
    findMemberCheckQuestions(memberId: string, questionIds: number[]): Promise<ResponseQuestionsInfoDTO>;
    makeGPTResult(memberId: string, categoryName: string, rowPacket: RowDataPacket[]): ResponseGPTQuestionsDTO;
}
