import { Question } from './question.entity';
export declare class Category {
    id: number;
    categoryName: string;
    categoryLevel: number;
    categoryUpperId: number;
    questions: Question[];
    createdAt: Date;
    updatedAt: Date;
}
