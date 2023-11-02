import { Category } from './category.entity';
import { UpdateQuestionDto } from 'src/routes/question/dto/update.request.dto';
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
