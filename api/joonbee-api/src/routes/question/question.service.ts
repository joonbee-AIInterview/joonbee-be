import { HttpException, Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { SaveQuestionDto } from "src/dto/question/save-in-question.dto";
import { QuestionBuilder } from "src/entity/builder/question.builder";
import { Category } from "src/entity/category.entity";
import { Question } from "src/entity/question.entity";
import { Repository } from "typeorm";


@Injectable()
export class QuestionService {

     constructor(@InjectRepository(Question) 
               private questionRepository: Repository<Question>,
               @InjectRepository(Category)
               private categoryRepository: Repository<Category>){}

     async saveQuestion(saveQuestionDto: SaveQuestionDto): Promise<number> {
          // SELECT * FROM category WHERE category_name='category_name' and category_level=category_level;
          const categoryPS = await this.categoryRepository.findOne({ where: { category_name: saveQuestionDto.category_name,
                                                                              category_level: saveQuestionDto.category_level } });
          if (categoryPS == null) {
               console.log('잘못된 category_name 또는 category_level을 입력했습니다.');
               return;
          }

          // INSERT INTO question(...) VALUES(...);
          const questionPS = await this.questionRepository.createQueryBuilder('question')
                         .insert()
                         .values({
                              category: categoryPS,
                              gpt_flag: saveQuestionDto.gpt_flag,
                              question_level: saveQuestionDto.question_level,
                              writer: saveQuestionDto.writer,
                              question_content: saveQuestionDto.question_content
                         }).execute();
          return questionPS.identifiers[0].id
     }

     async findAllWithCategory(): Promise<Question[]> {
          // SELECT * FROM question LEFT JOIN category ON question.category_id = category.id; 
          return await this.questionRepository.createQueryBuilder('question')
                         .leftJoinAndSelect('question.category', 'category')
                         .getMany();
     }
}