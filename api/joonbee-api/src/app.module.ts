import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { CommonModule } from './common/common.module';
import { ConfigModule } from '@nestjs/config';
import { MemberModule } from './routes/member/member.module';

@Module({
  imports: [
    CommonModule,
    ConfigModule.forRoot({
      cache: true,
      isGlobal: true,
    }),
    MemberModule
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
