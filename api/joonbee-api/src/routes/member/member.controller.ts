import { Controller, Get } from '@nestjs/common';
import { get } from 'http';
import { MemberService } from './member.service';

@Controller('member')
export class MemberController {

    constructor(private readonly memberService: MemberService){}

    @Get('all')
    findAll(){
        return this.memberService.findAll();
    }

}
