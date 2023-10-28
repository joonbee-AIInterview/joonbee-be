export class SaveQuestionDto {

     readonly category_name: string;
     readonly category_upper_id: number; // 0 ~ 6
     readonly gpt_flag: number; // 인간 0 GPT 1
     readonly question_level: number;
     readonly writer: string;
     readonly question_content: string;
}