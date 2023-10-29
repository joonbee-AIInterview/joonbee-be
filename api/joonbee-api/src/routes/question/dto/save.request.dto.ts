export class SaveQuestionDto {

     readonly categoryName: string;
     readonly categoryUpperId: number; // 0 ~ 6
     readonly gptFlag: number; // 인간 0 GPT 1
     readonly questionLevel: number;
     readonly writer: string;
     readonly questionContent: string;
}