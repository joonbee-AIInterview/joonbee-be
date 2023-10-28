import { ConfigService } from '@nestjs/config';
import { Injectable } from '@nestjs/common';
import { TypeOrmModuleOptions, TypeOrmOptionsFactory } from '@nestjs/typeorm';
import { Member } from 'src/entity/member.entity';
import { Category } from 'src/entity/category.entity';
import { Question } from 'src/entity/question.entity';
import { Like } from 'src/entity/like.entity';
import { Interview } from 'src/entity/interview.entity';

@Injectable()
export class TypeOrmConfigService implements TypeOrmOptionsFactory {

    constructor(private readonly configService: ConfigService){}

    createTypeOrmOptions(): TypeOrmModuleOptions {
        return {
        "type": 'mariadb',
        "host": this.configService.get<string>('DATABASE_HOST'),
        "port": this.configService.get<number>('DATABASE_PORT'),
        "username": this.configService.get<string>('DATABASE_USERNAME'),
        "password": this.configService.get<string>('DATABASE_PASSWORD'),
        "database": this.configService.get<string>('DATABASE_DB'),
<<<<<<< HEAD
        "entities": [Member, Category, Question, Like, Interview],
        "synchronize": false,
        "logging": true
=======
        "entities": [Member, Category, Question, Like],
        "synchronize": true,
        "logging":true // Query log
>>>>>>> 80c5793 (KAN-27 FEAT: Question 등록 삭제 전체조회 구현, 수정 미완성)
        };
      }
}