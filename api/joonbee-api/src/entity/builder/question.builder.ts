import { Category } from "../category.entity";
import { Question } from "../question.entity";

export class QuestionBuilder {

     private readonly question: Question;
   
     constructor() {
          this.question = new Question();
     }
   
     withCategory(category: Category): this {
          this.question.category = category;
          return this;
     }
   
     withGptFlag(gptFlag: number): this {
          this.question.gpt_flag = gptFlag;
          return this;
     }
   
     withQuestionLevel(questionLevel: number): this {
          this.question.question_level = questionLevel;
          return this;
     }
   
     withWriter(writer: string): this {
          this.question.writer = writer;
          return this;
     }
   
     withQuestionContent(questionContent: string): this {
          this.question.question_content = questionContent;
          return this;
     }
   
     build(): Question {
          return this.question;
     }
   }