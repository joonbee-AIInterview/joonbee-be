<<<<<<< HEAD
import { SaveQuestionDto } from "src/dto/question/save-in-question.dto";
<<<<<<< HEAD
=======
import { Question } from "src/entity/question.entity";
>>>>>>> d342bec (KAN-27 FEAT: findAllWithCategory, saveQuestion 구현)
=======
import { SaveQuestionDto } from "src/routes/question/dto/save.request.dto";
import { Question } from "src/entity/question.entity";
>>>>>>> 80c5793 (KAN-27 FEAT: Question 등록 삭제 전체조회 구현, 수정 미완성)
import { QuestionService } from "src/routes/question/question.service";
import { UpdateQuestionDto } from "./dto/update.request.dto";
export declare class QuestionController {
    private readonly questionService;
    constructor(questionService: QuestionService);
    saveQuestion(saveQuestionDto: SaveQuestionDto): Promise<number>;
    findAllWithCategory(): Promise<Question[]>;
    deleteQuestion(questionId: number): Promise<number>;
    updateQuestion(questionId: number, updateQuestionDto: UpdateQuestionDto): Promise<void>;
}
