import { QuestionService } from "src/routes/question/question.service";
import { Response } from 'express';
export declare class QuestionController {
    private readonly questionService;
    constructor(questionService: QuestionService);
    questionsWithCategory(page: string, category: string, subCategory: string, response: Response): Promise<void>;
}
