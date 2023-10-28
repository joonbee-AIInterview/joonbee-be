import { Category } from "../category.entity";
import { Question } from "../question.entity";
export declare class QuestionBuilder {
    private readonly question;
    constructor();
    withCategory(category: Category): this;
    withGptFlag(gptFlag: number): this;
    withQuestionLevel(questionLevel: number): this;
    withWriter(writer: string): this;
    withQuestionContent(questionContent: string): this;
    build(): Question;
}
