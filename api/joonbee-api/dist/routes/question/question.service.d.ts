import { SaveQuestionDto } from "src/routes/question/dto/save.request.dto";
import { Category } from "src/entity/category.entity";
import { Question } from "src/entity/question.entity";
import { Repository } from "typeorm";
import { UpdateQuestionDto } from "./dto/update.request.dto";
export declare class QuestionService {
    private questionRepository;
    private categoryRepository;
    constructor(questionRepository: Repository<Question>, categoryRepository: Repository<Category>);
<<<<<<< HEAD
<<<<<<< HEAD
    saveQuestion(saveQuestionDto: SaveQuestionDto): Promise<void>;
=======
    saveQuestion(saveQuestionDto: SaveQuestionDto): Promise<number>;
    findAllWithCategory(): Promise<Question[]>;
>>>>>>> d342bec (KAN-27 FEAT: findAllWithCategory, saveQuestion 구현)
=======
    saveQuestion(saveQuestionDto: SaveQuestionDto): Promise<number>;
    findAllWithCategory(): Promise<Question[]>;
    deleteQuestion(questionId: number): Promise<void>;
    updateQuestion(questionId: number, updateQuestionDto: UpdateQuestionDto): Promise<void>;
>>>>>>> 80c5793 (KAN-27 FEAT: Question 등록 삭제 전체조회 구현, 수정 미완성)
}
