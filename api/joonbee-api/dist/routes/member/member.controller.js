"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.MemberController = void 0;
const common_1 = require("@nestjs/common");
const member_service_1 = require("./member.service");
const request_dto_1 = require("./dto/request.dto");
const auth_1 = require("../../common/config/auth");
const swagger_1 = require("@nestjs/swagger");
let MemberController = class MemberController {
    constructor(memberService) {
        this.memberService = memberService;
    }
    async test(request, response) {
        return response.locals.memberId;
    }
    async insertLikeHandler(dto, response) {
        const memberId = response.locals.memberId;
        const interviewId = dto.interviewId;
        this.memberService.insertLike(memberId, interviewId);
        const apiResponse = {
            status: 200,
            data: '성공'
        };
        response.json(apiResponse);
    }
    async insertInterviewAndQuestion(data, response) {
        const memberId = response.locals.memberId;
        this.memberService.insertInterview(memberId, data);
        const apiResponse = {
            status: 200,
            data: '성공'
        };
        response.json(apiResponse);
    }
};
exports.MemberController = MemberController;
__decorate([
    (0, common_1.UseGuards)(auth_1.TokenAuthGuard),
    (0, common_1.Get)(),
    __param(0, (0, common_1.Req)()),
    __param(1, (0, common_1.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object, Object]),
    __metadata("design:returntype", Promise)
], MemberController.prototype, "test", null);
__decorate([
    (0, common_1.UseGuards)(auth_1.TokenAuthGuard),
    (0, common_1.Post)('like'),
    __param(0, (0, common_1.Body)(new common_1.ValidationPipe())),
    __param(1, (0, common_1.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [request_dto_1.RequestLikeDTO, Object]),
    __metadata("design:returntype", Promise)
], MemberController.prototype, "insertLikeHandler", null);
__decorate([
    (0, common_1.UseGuards)(auth_1.TokenAuthGuard),
    (0, common_1.Post)('interview/save'),
    (0, swagger_1.ApiBody)({ type: request_dto_1.RequestInterviewSaveDTO }),
    __param(0, (0, common_1.Body)(new common_1.ValidationPipe())),
    __param(1, (0, common_1.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [request_dto_1.RequestInterviewSaveDTO, Object]),
    __metadata("design:returntype", Promise)
], MemberController.prototype, "insertInterviewAndQuestion", null);
exports.MemberController = MemberController = __decorate([
    (0, common_1.Controller)('api/member'),
    __metadata("design:paramtypes", [member_service_1.MemberService])
], MemberController);
//# sourceMappingURL=member.controller.js.map