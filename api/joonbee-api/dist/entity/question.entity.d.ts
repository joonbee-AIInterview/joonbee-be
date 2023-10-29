import { UpdateQuestionDto } from './../routes/question/dto/update.request.dto';
import { Category } from './category.entity';
export declare class Question {
    id: number;
    category: Category;
    gptFlag: number;
    questionLevel: number;
    writer: string;
    questionContent: string;
    createdAt: Date;
    updatedAt: Date;
    updateQuestion(updateQuestionDto: UpdateQuestionDto): void;
}
