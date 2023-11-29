import { Controller, Get, Query, Res, UseGuards } from "@nestjs/common";
import { CartService } from "./cart.service";
import { ApiResponse, CustomError } from "src/common/config/common";
import { ResponseCartQuestionsDTO } from "./dto/response.dto";
import { Response } from 'express';
import { TokenAuthGuard } from "src/common/config/auth";

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
     @UseGuards(TokenAuthGuard)
     @Get('questions')
     async getMemberCarts(
          @Query('page') page: string,
          @Res() response: Response,
     ) {
        // 유효성 검사
        if (page === "") throw new CustomError('페이지가 비었습니다. ', 400);
        // 0인 경우 1로 바꾸기
        if (page === "0") page = "1";
        const memberId = response.locals.memberId;
        
        try {
          const data = await this.cartService.getMemberCarts(Number(page), memberId);
          const apiResponse: ApiResponse<ResponseCartQuestionsDTO> = {
               status: 200,
               data
          }
          response.json(apiResponse);
        } catch (error) {
             throw new CustomError('알 수 없는 에러 : ' + error,500);
        }
     }
}