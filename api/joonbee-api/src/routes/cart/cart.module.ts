import { TypeOrmModule } from "@nestjs/typeorm";
import { Module } from "@nestjs/common";
import { Cart } from "src/entity/cart.entity";
import { CartService } from "./cart.service";
import { CartController } from "./cart.controller";

@Module({
     imports: [TypeOrmModule.forFeature([
          Cart,
     ])], 
     controllers: [CartController],
     providers: [CartService],
})

export class CartModule {}