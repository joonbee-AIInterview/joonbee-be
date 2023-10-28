import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { SaveQuestionDto } from "src/dto/question/save-in-question.dto";
import { Category } from "src/entity/category.entity";
import { Question } from "src/entity/question.entity";
import { Repository } from "typeorm";


@Injectable()
export class QuestionService {

     constructor(@InjectRepository(Question) 
               private questionRepository: Repository<Question>,
               private categoryRepository: Repository<Category>){}
     
     async saveQuestion(saveQuestionDto: SaveQuestionDto): Promise<void> {
          // 기존에 있는 질문인지 유효성 검사
          // 있으면 제거, 없으면 생성
          // 없는 경우, 카테고리테이블과 일치하게만들고 카테고리 조회 후
          // 카테고리(FK) 가져와서 질문에 같이 저장
          
          // const categoryPS =  this.categoryRepository.findOne({ where: {category_name: saveQuestionDto.main_category}  });
          // const questionPS = await this.questionRepository.save(SaveQuestionDto);
          // return 
     }

}