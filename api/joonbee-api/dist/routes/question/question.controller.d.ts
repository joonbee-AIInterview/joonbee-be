import { QuestionService } from "src/routes/question/question.service";
import { Response } from 'express';
export declare class QuestionController {
    private readonly questionService;
    constructor(questionService: QuestionService);
    getQuestions(page: string, response: Response): Promise<void>;
    getQuestionsByCategory(page: string, category: string, response: Response): Promise<void>;
    getQuestionsBySubcategory(page: string, category: string, subCategory: string, response: Response): Promise<void>;
    getQuestionsByGPT(category: string, subcategory: string, questionCount: string, response: Response): Promise<void>;
}
