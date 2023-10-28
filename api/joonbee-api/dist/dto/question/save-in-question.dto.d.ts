export declare class SaveQuestionDto {
<<<<<<< HEAD
    readonly main_category: string;
    readonly sub_category: string;
    readonly gpt_flag: number;
=======
    readonly category_name: string;
    readonly category_level: number;
    readonly gpt_flag: number;
    readonly question_level: number;
>>>>>>> d342bec (KAN-27 FEAT: findAllWithCategory, saveQuestion 구현)
    readonly writer: string;
    readonly question_content: string;
}
