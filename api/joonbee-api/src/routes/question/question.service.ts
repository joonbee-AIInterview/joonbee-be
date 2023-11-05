import { HttpException, HttpStatus, Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { SaveQuestionDto } from "src/routes/question/dto/save.request.dto";
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
          // SELECT * FROM category WHERE category_name='category_name' and category_upper_id=category_upper_id;
          const categoryPS = await this.categoryRepository.findOne({ where: { categoryName: saveQuestionDto.categoryName,
                                                                              categoryUpperId: saveQuestionDto.categoryUpperId } });
          if (categoryPS == null) {
               console.log('잘못된 category_name 또는 category_upper_id을 입력했습니다.');
               return;
          }

          // INSERT INTO question(...) VALUES(...);
          const questionPS = await this.questionRepository.createQueryBuilder('question')
                         .insert().values({
                              category: categoryPS,
                              gptFlag: saveQuestionDto.gptFlag,
                              questionLevel: saveQuestionDto.questionLevel,
                              writer: saveQuestionDto.writer,
                              questionContent: saveQuestionDto.questionContent
                         }).execute();
          return questionPS.identifiers[0].id;
     }

     async findQuestionWithCategory(): Promise<Question[]> {
          return await this.questionRepository.createQueryBuilder('question')
                         .leftJoinAndSelect('question.category', 'category')
                         .select([
                              'question.id',
                              'question.questionContent',
                              'category.id',
                              'category.categoryName'
                         ])
                         .getMany();
     }

     async findOneWithCategory(questionId: number): Promise<Question> {
          const questionPS = await this.questionRepository.findOne({ where: { id: questionId }});
          console.log(questionPS);
          if (!questionPS) {
               throw new HttpException('NOT_FOUND', HttpStatus.NOT_FOUND);
          }

          return await this.questionRepository.createQueryBuilder('question')
                         .where('question.id = :questionId', { questionId })
                         .leftJoinAndSelect('question.category', 'category')
                         .getOne();
     }

     async deleteQuestion(questionId: number): Promise<void> {
          await this.questionRepository.delete(questionId);
     }

     async updateQuestion(questionId: number, updateQuestionDto: SaveQuestionDto): Promise<number> {
          const questionPS: Question = await this.questionRepository.findOne({ where: { id: questionId } });
          if (!questionPS) {
               throw new HttpException('NOT_FOUND', HttpStatus.NOT_FOUND);
          }

          console.log('전 : ' + questionPS.questionContent);
          const category = await this.categoryRepository.findOne({ where: {categoryName: updateQuestionDto.categoryName}});
          
          const questionUP = await this.questionRepository.createQueryBuilder('question')
                         .update().set({
                              category: { id: category.id },
                              gptFlag: updateQuestionDto.gptFlag,
                              questionLevel: updateQuestionDto.questionLevel,
                              writer: updateQuestionDto.writer,
                              questionContent: updateQuestionDto.questionContent
                         })
                         .where("id = :id", {id: questionPS.id})
                         .execute();

          return questionPS.id;
     }
}