"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.TokenAuthGuard = void 0;
const common_1 = require("@nestjs/common");
const common_2 = require("./common");
const jsonwebtoken_1 = require("jsonwebtoken");
let TokenAuthGuard = class TokenAuthGuard {
    async canActivate(context) {
        const request = context.switchToHttp().getRequest();
        const response = context.switchToHttp().getResponse();
        const token = request.cookies?.['joonbee-token'];
        if (!token) {
            throw new common_2.CustomError('TOKEN이 없습니다.', 401);
        }
        try {
            const decoded = (0, jsonwebtoken_1.verify)(token, 'test');
            console.log(decoded.joonbee);
            response.locals.memberId = decoded.joonbee;
            return true;
        }
        catch (err) {
            console.error(err);
            throw new common_2.CustomError('토큰 이상 에러', 401);
        }
    }
};
exports.TokenAuthGuard = TokenAuthGuard;
exports.TokenAuthGuard = TokenAuthGuard = __decorate([
    (0, common_1.Injectable)()
], TokenAuthGuard);
//# sourceMappingURL=auth.js.map