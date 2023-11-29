import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { RowDataPacket } from 'mysql2';
import { CustomError } from "src/common/config/common";
import { Cart } from "src/entity/cart.entity";
import { Repository } from "typeorm";
import { ResponseCartQuestionsDTO, ResponseCartQuestionsOfMemberData } from "./dto/response.dto";
import { Category } from "src/entity/category.entity";

@Injectable()
export class CartService {

     private PAGE_SIZE: number;

     constructor(
          @InjectRepository(Cart) 
          private readonly cartRepository: Repository<Cart>,
          @InjectRepository(Cart) 
          private readonly categoryRepository: Repository<Category>,
     ){
          this.PAGE_SIZE = 10;
     }

     /**
      * @note 사용자 장바구니에 있는 모든 질문들을 10개씩 가져온다.   
      */
     async getMemberCarts(page: number, memberId: string): Promise<ResponseCartQuestionsDTO> {
          const skipNumber = (page - 1) * this.PAGE_SIZE;
          try {
               const countQuery: RowDataPacket = await this.cartRepository.createQueryBuilder('cart')
                    .select('COUNT(cart.question_id)', 'count').where('cart.member_id = :member_id', { member_id: memberId })
                    .getRawOne();

               const rowPacket: RowDataPacket[] = await this.cartRepository.createQueryBuilder('cart')
                    .select([
                         'cart.question_id',
                         '(SELECT category_name FROM category WHERE id = (SELECT category_upper_id FROM category WHERE category_name = cart.category_name)) AS category_name',
                         'cart.category_name AS subcategory_name',
                         'q.question_content'
                    ])
                    .innerJoin('question', 'q', 'cart.question_id = q.id').where('cart.member_id = :member_id', { member_id: memberId })
                    .offset(skipNumber).limit(this.PAGE_SIZE).getRawMany();

               const cartQuestionsDTOs: ResponseCartQuestionsOfMemberData[] = rowPacket.map(packet => ({
                    questionId: packet.question_id,
                    category: packet.category_name,
                    subcategory: packet.subcategory_name,
                    questionContent: packet.question_content,
               }));
               const result: ResponseCartQuestionsDTO = {
                    total: Number(countQuery.count),
                    result: cartQuestionsDTOs
               }
               return result;
          } catch (error) {
               console.log('getMemberCarts ERROR cart.service 53\n' + error);
               throw new CustomError('면접 전, 사용자의 장바구니 질문 데이터 전체 조회 실패', 500);
          }
     }

     /**
      * @note 사용자 장바구니에 있는 모든 질문들을 상위 카테고리별로 10개씩 가져온다.
      */
     async getMemberCartsByCategory(page: number, memberId: string, category: string): Promise<ResponseCartQuestionsDTO> {
          const skipNumber = (page - 1) * this.PAGE_SIZE;
          try {
               const countQuery = await this.cartRepository.query(`
                    SELECT COUNT(*) AS count
                         FROM cart
                    INNER JOIN question AS q ON cart.question_id = q.id
                    INNER JOIN category AS cat ON q.category_id = cat.id
                         LEFT JOIN category AS upper_category ON upper_category.id = (SELECT category_upper_id FROM category c WHERE c.category_name = cart.category_name)
                    WHERE cat.category_upper_id = (
                              SELECT id
                    FROM category
                         WHERE category_name = '${category}'
                    ) AND cart.member_id = '${memberId}'
               `);
               
               const rowPacket: RowDataPacket[] = await this.cartRepository.createQueryBuilder('cart')
                    .select([
                         'cart.question_id',
                         'upper_category.category_name AS category_name',
                         'cart.category_name AS subcategory_name',
                         'q.question_content'
                    ])
                    .innerJoin('question', 'q', 'cart.question_id = q.id')
                    .leftJoin('category', 'upper_category', 'upper_category.id = (SELECT category_upper_id FROM category cat WHERE cat.category_name = cart.category_name)')
                    .where('cart.member_id = :member_id', { member_id: memberId }).andWhere('upper_category.category_name = :category_name', { category_name: category })
                    .offset(skipNumber).limit(this.PAGE_SIZE).getRawMany();

               const cartQuestionsDTOs: ResponseCartQuestionsOfMemberData[] = rowPacket.map(packet => ({
                    questionId: packet.question_id,
                    category: packet.category_name,
                    subcategory: packet.subcategory_name,
                    questionContent: packet.question_content,
               }));
               const result: ResponseCartQuestionsDTO = {
                    total: Number(countQuery[0].count),
                    result: cartQuestionsDTOs
               }
               return result;
          } catch (error) {
               console.log('getMemberCartsByCategory ERROR cart.service 100\n' + error);
               throw new CustomError('면접 전, 사용자의 장바구니 상위카테고리 필터 질문 데이터 전체체 조회 실패', 500);
          }
     }

     /**
      * @note 사용자 장바구니에 있는 모든 질문들을 하위 카테고리별로 10개씩 가져온다.
      */
     async getMemberCartsBySubcategory(page: number, memberId: string, category: string, subcategory: string): Promise<ResponseCartQuestionsDTO> {
          const skipNumber = (page - 1) * this.PAGE_SIZE;
          try {
               const countQuery: RowDataPacket = await this.cartRepository.createQueryBuilder('cart')
                    .select('COUNT(*)', 'count').where('cart.member_id = :member_id', { member_id: memberId }).andWhere('cart.category_name = :category_name', { category_name: subcategory })
                    .getRawOne();

               const rowPacket: RowDataPacket[] = await this.cartRepository.createQueryBuilder('cart')
                    .select([
                        'cart.question_id',
                        '(SELECT category_name FROM category WHERE id = (SELECT category_upper_id FROM category WHERE category_name = cart.category_name)) AS category_name',
                        'cart.category_name AS subcategory_name',
                        'q.question_content'
                    ])
                    .innerJoin('question', 'q', 'cart.question_id = q.id').where('cart.member_id = :member_id AND cart.category_name = :category_name', { member_id: memberId, category_name: subcategory })
                    .offset(skipNumber).limit(this.PAGE_SIZE).getRawMany();

               const cartQuestionsDTOs: ResponseCartQuestionsOfMemberData[] = rowPacket.map(packet => ({
                    questionId: packet.question_id,
                    category: packet.category_name,
                    subcategory: packet.subcategory_name,
                    questionContent: packet.question_content,
               }));
               const result: ResponseCartQuestionsDTO = {
                    total: Number(countQuery.count),
                    result: cartQuestionsDTOs
               }
               return result;
          } catch (error) {
               console.log('getMemberCartsBySubcategory ERROR cart.service 137\n' + error);
               throw new CustomError('면접 전, 사용자의 장바구니 하위카테고리 필터 질문 데이터 전체 조회 실패', 500);
          }
     }
}