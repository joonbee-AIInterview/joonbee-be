import { QuestionService } from "src/routes/question/question.service";
import { Response } from 'express';
import { Category } from "src/entity/category.entity";
import { Repository } from "typeorm";
export declare class QuestionController {
    private readonly questionService;
    private readonly categoryRepository;
    constructor(questionService: QuestionService, categoryRepository: Repository<Category>);
    getQuestions(page: string, category: string, subCategory: string, response: Response): Promise<void>;
    getQuestionsByGPT(category: string, subcategory: string, questionCount: string, response: Response): Promise<void>;
}
