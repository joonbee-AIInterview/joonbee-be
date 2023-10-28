import { Controller, Get, Res } from '@nestjs/common';
import { AppService } from './app.service';
import * as jwt from 'jsonwebtoken';
import { Response } from 'express';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }

  @Get('token')
  getToken(@Res() res: Response): void {

    const testToken = jwt.sign({joonbee : '13b4a'}, 'test', { 'expiresIn' : '1h' } );
    res.cookie('joonbee-token',testToken,{
      maxAge: 1000 * 60 * 60,
    });

    res.send('쿠키발급함');
  }
}
