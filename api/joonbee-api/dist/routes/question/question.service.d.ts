import { Question } from "src/entity/question.entity";
import { Repository } from "typeorm";
export declare class QuestionService {
    private questionRepository;
    constructor(questionRepository: Repository<Question>);
}
