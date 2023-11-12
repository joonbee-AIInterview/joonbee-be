import { QuestionService } from "src/routes/question/question.service";
import { Response } from 'express';
export declare class QuestionController {
    private readonly questionService;
    constructor(questionService: QuestionService);
    getQuestions(page: string, response: Response): Promise<void>;
    getQuestionsWithCategory(page: string, category: string, response: Response): Promise<void>;
    getQuestionsWithSubcategory(page: string, category: string, subCategory: string, response: Response): Promise<void>;
}
