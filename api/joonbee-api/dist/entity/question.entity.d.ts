import { Category } from './category.entity';
import { UpdateQuestionDto } from 'src/routes/question/dto/update.request.dto';
import { InterviewAndQuestion } from './and.question.entity';
export declare class Question {
    id: number;
    category: Category;
    interviewAndQuestions: InterviewAndQuestion[];
    gptFlag: number;
    questionLevel: number;
    writer: string;
    questionContent: string;
    createdAt: Date;
    updatedAt: Date;
    updateQuestion(updateQuestionDto: UpdateQuestionDto): void;
}
