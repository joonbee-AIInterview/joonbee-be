import { HttpException, HttpStatus, Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { SaveQuestionDto } from "src/routes/question/dto/save.request.dto";
import { Category } from "src/entity/category.entity";
import { Question } from "src/entity/question.entity";
import { Repository } from "typeorm";
import { UpdateQuestionDto } from "./dto/update.request.dto";


@Injectable()
export class QuestionService {

     constructor(@InjectRepository(Question) 
               private questionRepository: Repository<Question>,
               @InjectRepository(Category)
               private categoryRepository: Repository<Category>){}

     async saveQuestion(saveQuestionDto: SaveQuestionDto): Promise<number> {
          // SELECT * FROM category WHERE category_name='category_name' and category_upper_id=category_upper_id;
          const categoryPS = await this.categoryRepository.findOne({ where: { category_name: saveQuestionDto.category_name,
                                                                              category_upper_id: saveQuestionDto.category_upper_id } });
          if (categoryPS == null) {
               console.log('잘못된 category_name 또는 category_upper_id을 입력했습니다.');
               return;
          }

          // INSERT INTO question(...) VALUES(...);
          const questionPS = await this.questionRepository.createQueryBuilder('question')
                         .insert().values({
                              category: categoryPS,
                              gpt_flag: saveQuestionDto.gpt_flag,
                              question_level: saveQuestionDto.question_level,
                              writer: saveQuestionDto.writer,
                              question_content: saveQuestionDto.question_content
                         }).execute();
          return questionPS.identifiers[0].id;
     }

     async findAllWithCategory(): Promise<Question[]> {
          // SELECT * FROM question LEFT JOIN category ON question.category_id = category.id; 
          return await this.questionRepository.createQueryBuilder('question')
                         .leftJoinAndSelect('question.category', 'category')
                         .getMany();
     }

     async deleteQuestion(questionId: number): Promise<void> {
          await this.questionRepository.delete(questionId);
     }

     async updateQuestion(questionId: number, updateQuestionDto: UpdateQuestionDto): Promise<void> {
          const questionPS = await this.questionRepository.findOne({ where: { id: questionId } });
          if (!questionPS) {
               throw new HttpException('NOT_FOUND', HttpStatus.NOT_FOUND);
          }
          console.log('전 : ' + questionPS.question_content);
          //questionPS.updateQuestion(updateQuestionDto);
          console.log('후 : ' + questionPS);

     }
}