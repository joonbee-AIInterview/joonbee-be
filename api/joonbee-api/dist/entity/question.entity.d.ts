import { UpdateQuestionDto } from './../routes/question/dto/update.request.dto';
import { Category } from './category.entity';
export declare class Question {
    id: number;
    category: Category;
    gpt_flag: number;
    question_level: number;
    writer: string;
    question_content: string;
    created_at: Date;
    updated_at: Date;
    updateQuestion(updateQuestionDto: UpdateQuestionDto): void;
}
