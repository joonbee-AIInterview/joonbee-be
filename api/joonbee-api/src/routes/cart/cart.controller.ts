import { Controller, Get, Post } from "@nestjs/common";
import { CartService } from "./cart.service";

@Controller('/api/cart')
export class CartController {
     /**
     * Nest.js에서 @Res() 데커레이터를 사용하면 Express.js의 원시 Response객체에
     * 접근하기 때문에 return (Next.js 내장 응답처리 메커니즘)을 무시하고,
     * 원시 Express형식으로 응답을 보내야한다.
     */

     constructor(private readonly cartService: CartService){}

     /**
      * @api 사용자의 장바구니 질문을 가져온다.(디폴트)
      */
     @Get()
     async getMemberCarts() {
          
     }

     /**
      * @api 사용자의 장바구니 질문을 상위 카테고리로 필터링해서 가져온다.
      */
     @Get()
     async getMemberCartsByCategory() {
          
     }

     /**
      * @api 사용자의 장바구니 질문을 하위 카테고리로 필터링해서 가져온다.
      */
     @Get()
     async getMemberCartsBySubcategory() {
          
     }

     /**
      * @api 사용자가 질문을 생성하고 동시에 장바구니에 담는다.
      */
     @Post()
     async insertMemberQuestionIntoCart() {
          
     }
}