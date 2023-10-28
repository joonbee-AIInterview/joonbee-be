import { Module } from '@nestjs/common';
import { MemberController } from './member.controller';
import { MemberService } from './member.service';
import { Member } from 'src/entity/member.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Like } from 'typeorm';

@Module({
  imports: [TypeOrmModule.forFeature([Member, Like])],
  controllers: [MemberController],
  providers: [MemberService]
})
export class MemberModule {}
