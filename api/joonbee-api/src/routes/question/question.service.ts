import { RowDataPacket } from 'mysql2';
import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { Category } from "src/entity/category.entity";
import { Question } from "src/entity/question.entity";
import { Repository } from "typeorm";
import { CustomError } from "src/common/config/common";
import { ResponseQuestionsWithCategoryDTO, ResponseQuestionsWithCategoryData } from "./dto/response.dto";


@Injectable()
export class QuestionService {

     private PAGE_SIZE: number;

     constructor(
          @InjectRepository(Question) 
          private readonly questionRepository: Repository<Question>,
          @InjectRepository(Category)
          private readonly categoryRepository: Repository<Category>
     ){
          this.PAGE_SIZE = 16;
     }

     /**
      * @note 16개의 랜덤질문을 가져온다.
      */
     async questionsWithCategory(page: number, categoryName: string, subCategoryName: string): Promise<ResponseQuestionsWithCategoryDTO> {
          try {
               if (categoryName === "" && subCategoryName != "") {
                    throw new CustomError('카테고리를 선택해주세요.', 403);
               }

               let rowPacket: RowDataPacket[];
               let countQuery: RowDataPacket;
               const skipNumber = (page - 1) * this.PAGE_SIZE;

               if (categoryName === "" && subCategoryName === "") {
                    countQuery = await this.questionRepository.createQueryBuilder('question')
                         .select('COUNT(question.id)', 'count')
                         .getRawOne();

                    rowPacket = await this.questionRepository.createQueryBuilder('question')
                         .select([
                              'question.id AS questionId',
                              'category.id AS categoryId',
                              'question.question_content AS questionContent',
                              'category.category_name AS categoryName'
                         ])
                         .leftJoinAndSelect('question.category', 'category')
                         .orderBy('RAND()')
                         .offset(skipNumber)
                         .limit(this.PAGE_SIZE)
                         .getRawMany();

               } else if (categoryName != "" && subCategoryName === "") {
                    // 상위 카테고리 id 조회
                    const category = await this.categoryRepository
                         .createQueryBuilder('category')
                         .select('category.id')
                         .where('category.category_name = :categoryName', { categoryName })
                         .getOne();

                    // 전체 조회
                    countQuery = await this.questionRepository.createQueryBuilder('question')
                         .innerJoin(
                              subQuery => subQuery.from(Category, 'category')
                              .select('*')
                              .where('category.category_upper_id = :categoryId', { categoryId: category.id }),
                         'category',
                         'question.category_id = category.id'
                         )
                         .select('COUNT(question.id)', 'count')
                         .getRawOne();

                    // 조회된 상위카테고리 id로 category_upper_id과 inner join
                    rowPacket = await this.questionRepository.createQueryBuilder('question')
                         .select([
                              'question.id AS questionId',
                              'category.id AS categoryId',
                              'question.question_content AS questionContent',
                              'category.category_name AS categoryName'
                         ])
                         .innerJoin(
                              subQuery => {
                                   return subQuery
                                     .select('*')
                                     .from(Category, 'category')
                                     .where('category.category_upper_id = :categoryId', { categoryId: category.id });
                              },
                              'category',
                              'question.category_id = category.id'
                         )
                         .orderBy('RAND()')
                         .offset(skipNumber)
                         .limit(this.PAGE_SIZE)
                         .getRawMany();
               } else {
                    // 전체 조회
                    countQuery = await this.questionRepository.createQueryBuilder('question')
                         .innerJoin(
                              subQuery => subQuery.from(Category, 'category')
                                   .select('*')
                                   .where('category.category_name = :subCategoryName', { subCategoryName }),
                              'category',
                              'question.category_id = category.id'
                         )
                         .select('COUNT(question.id)', 'count')
                         .getRawOne();

                    rowPacket = await this.questionRepository.createQueryBuilder('question')
                         .select([
                              'question.id AS questionId',
                              'category.id AS categoryId',
                              'question.question_content AS questionContent',
                              'category.category_name AS categoryName'
                         ])
                         .innerJoin(
                              subQuery => {
                                   return subQuery
                                     .select('*')
                                     .from(Category, 'category')
                                     .where('category.category_name = :subCategoryName', { subCategoryName });
                                 },
                                 'category',
                                 'question.category_id = category.id'
                         )
                         .orderBy('RAND()')
                         .offset(skipNumber)
                         .limit(this.PAGE_SIZE)
                         .getRawMany();
               }

               const questionsWithCategoryDtos: ResponseQuestionsWithCategoryData[] = rowPacket.map(packet => ({
                    questionId: packet.questionId,
                    categoryId: packet.categoryId,
                    questionContent: packet.questionContent,
                    categoryName: packet.categoryName,
               }));

               const result: ResponseQuestionsWithCategoryDTO = {
                    total: Number(countQuery.count),
                    result: questionsWithCategoryDtos
               }
               return result;
               
          } catch(error) {
               console.log('questionsWithCategory ERROR question.service 24\n' + error);
               throw new CustomError('랜덤질문 정보 불러오기 실패', 500);
          }
     }

     // async saveQuestion(saveQuestionDto: SaveQuestionDto): Promise<number> {
     //      // SELECT * FROM category WHERE category_name='category_name' and category_upper_id=category_upper_id;
     //      const categoryPS = await this.categoryRepository.findOne({ where: { categoryName: saveQuestionDto.categoryName,
     //                                                                          categoryUpperId: saveQuestionDto.categoryUpperId } });
     //      if (categoryPS == null) {
     //           console.log('잘못된 category_name 또는 category_upper_id을 입력했습니다.');
     //           return;
     //      }

     //      // INSERT INTO question(...) VALUES(...);
     //      const questionPS = await this.questionRepository.createQueryBuilder('question')
     //                     .insert().values({
     //                          category: categoryPS,
     //                          gptFlag: saveQuestionDto.gptFlag,
     //                          questionLevel: saveQuestionDto.questionLevel,
     //                          writer: saveQuestionDto.writer,
     //                          questionContent: saveQuestionDto.questionContent
     //                     }).execute();
     //      return questionPS.identifiers[0].id;
     // }

     

     // async findOneWithCategory(questionId: number): Promise<Question> {
     //      const questionPS = await this.questionRepository.findOne({ where: { id: questionId }});
     //      console.log(questionPS);
     //      if (!questionPS) {
     //           throw new HttpException('NOT_FOUND', HttpStatus.NOT_FOUND);
     //      }

     //      return await this.questionRepository.createQueryBuilder('question')
     //                     .where('question.id = :questionId', { questionId })
     //                     .leftJoinAndSelect('question.category', 'category')
     //                     .getOne();
     // }

     // async deleteQuestion(questionId: number): Promise<void> {
     //      await this.questionRepository.delete(questionId);
     // }

     // async updateQuestion(questionId: number, updateQuestionDto: SaveQuestionDto): Promise<number> {
     //      const questionPS: Question = await this.questionRepository.findOne({ where: { id: questionId } });
     //      if (!questionPS) {
     //           throw new HttpException('NOT_FOUND', HttpStatus.NOT_FOUND);
     //      }

     //      console.log('전 : ' + questionPS.questionContent);
     //      const category = await this.categoryRepository.findOne({ where: {categoryName: updateQuestionDto.categoryName}});
          
     //      const questionUP = await this.questionRepository.createQueryBuilder('question')
     //                     .update().set({
     //                          category: { id: category.id },
     //                          gptFlag: updateQuestionDto.gptFlag,
     //                          questionLevel: updateQuestionDto.questionLevel,
     //                          writer: updateQuestionDto.writer,
     //                          questionContent: updateQuestionDto.questionContent
     //                     })
     //                     .where("id = :id", {id: questionPS.id})
     //                     .execute();

     //      return questionPS.id;
     // }
}