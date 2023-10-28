import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { QuestionService } from './question.service';
import { QuestionController } from './question.controller';
import { Question } from 'src/entity/question.entity';
import { Category } from 'src/entity/category.entity';

@Module({
<<<<<<< HEAD
     imports: [TypeOrmModule.forFeature([Question,Category])], 
=======
     imports: [TypeOrmModule.forFeature([Question, Category])], 
>>>>>>> d342bec (KAN-27 FEAT: findAllWithCategory, saveQuestion 구현)
     controllers: [QuestionController],
     providers: [QuestionService],
})

export class QuestionModule {}