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
const common_2 = require("@nestjs/common");
const member_service_1 = require("./member.service");
const request_dto_1 = require("./dto/request.dto");
const auth_1 = require("../../common/config/auth");
const swagger_1 = require("@nestjs/swagger");
let MemberController = class MemberController {
    constructor(memberService) {
        this.memberService = memberService;
    }
    async myInfoSelect(response) {
        const memberId = response.locals.memberId;
        const dto = await this.memberService.myInfoData(memberId);
        const apiResponse = {
            status: 200,
            data: dto
        };
        response.json(apiResponse);
    }
    async myCategoryInfo(page = "1", response) {
        const memberId = response.locals.memberId;
        const data = await this.memberService.myCategoryInfoService(memberId, Number(page));
        const apiResponse = {
            status: 200,
            data
        };
        response.json(apiResponse);
    }
    async myCategoryLikeInfo(page = "1", response) {
        const memberId = response.locals.memberId;
        const data = await this.memberService.myCategoryLikeInfoService(memberId, Number(page));
        const apiResponse = {
            status: 200,
            data
        };
        response.json(apiResponse);
    }
    async myCartRead(page = "1", response) {
        const memberId = response.locals.memberId;
        const data = await this.memberService.myCartReadService(memberId, Number(page));
        const apiResponse = {
            status: 200,
            data
        };
        response.json(apiResponse);
    }
    async insertCart(dto, response) {
        const memberId = response.locals.memberId;
        const { questionId, categoryName } = dto;
        await this.memberService.insertCartService(memberId, questionId, categoryName);
        const apiResponse = {
            status: 200,
            data: '성공'
        };
        response.json(apiResponse);
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
    async insertInterviewAndQuestion(request, response) {
        const { categoryName, questions } = request.body;
        if (!categoryName || !questions || !Array.isArray(questions) || questions.length === 0) {
            const apiResponse = {
                status: 200,
                data: '성공'
            };
            response.json(apiResponse);
        }
        else {
            const memberId = response.locals.memberId;
            const data = {
                categoryName,
                questions
            };
            this.memberService.insertInterview(memberId, data);
            const apiResponse = {
                status: 200,
                data: '성공'
            };
            response.json(apiResponse);
        }
    }
    async deleteCart(questionId, response) {
        const memberId = response.locals.memberId;
        const success = await this.memberService.deleteCartService(memberId, questionId);
        const apiResponse = {
            status: success ? 200 : 400,
            data: success ? '성공' : '데이터가 존재하지 않습니다.'
        };
        response.status(apiResponse.status);
        response.json(apiResponse);
    }
};
exports.MemberController = MemberController;
__decorate([
    (0, common_2.UseGuards)(auth_1.TokenAuthGuard),
    (0, common_2.Get)('info'),
    __param(0, (0, common_2.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", Promise)
], MemberController.prototype, "myInfoSelect", null);
__decorate([
    (0, common_2.UseGuards)(auth_1.TokenAuthGuard),
    (0, common_2.Get)('category'),
    __param(0, (0, common_2.Query)('page')),
    __param(1, (0, common_2.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, Object]),
    __metadata("design:returntype", Promise)
], MemberController.prototype, "myCategoryInfo", null);
__decorate([
    (0, common_2.UseGuards)(auth_1.TokenAuthGuard),
    (0, common_2.Get)('category/like'),
    __param(0, (0, common_2.Query)('page')),
    __param(1, (0, common_2.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, Object]),
    __metadata("design:returntype", Promise)
], MemberController.prototype, "myCategoryLikeInfo", null);
__decorate([
    (0, common_2.UseGuards)(auth_1.TokenAuthGuard),
    (0, common_2.Get)('cart/read'),
    __param(0, (0, common_2.Query)('page')),
    __param(1, (0, common_2.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, Object]),
    __metadata("design:returntype", Promise)
], MemberController.prototype, "myCartRead", null);
__decorate([
    (0, common_2.UseGuards)(auth_1.TokenAuthGuard),
    (0, common_2.Post)('cart/save'),
    (0, swagger_1.ApiBody)({ type: request_dto_1.RequestCartInsertDTO }),
    __param(0, (0, common_2.Body)(new common_2.ValidationPipe())),
    __param(1, (0, common_2.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [request_dto_1.RequestCartInsertDTO, Object]),
    __metadata("design:returntype", Promise)
], MemberController.prototype, "insertCart", null);
__decorate([
    (0, common_2.UseGuards)(auth_1.TokenAuthGuard),
    (0, common_2.Post)('like'),
    __param(0, (0, common_2.Body)(new common_2.ValidationPipe())),
    __param(1, (0, common_2.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [request_dto_1.RequestLikeDTO, Object]),
    __metadata("design:returntype", Promise)
], MemberController.prototype, "insertLikeHandler", null);
__decorate([
    (0, common_2.UseGuards)(auth_1.TokenAuthGuard),
    (0, common_2.Post)('interview/save'),
    (0, swagger_1.ApiBody)({ type: request_dto_1.RequestInterviewSaveDTO }),
    __param(0, (0, common_2.Req)()),
    __param(1, (0, common_2.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object, Object]),
    __metadata("design:returntype", Promise)
], MemberController.prototype, "insertInterviewAndQuestion", null);
__decorate([
    (0, common_2.UseGuards)(auth_1.TokenAuthGuard),
    (0, common_1.Delete)('cart/delete'),
    __param(0, (0, common_2.Query)('id')),
    __param(1, (0, common_2.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, Object]),
    __metadata("design:returntype", Promise)
], MemberController.prototype, "deleteCart", null);
exports.MemberController = MemberController = __decorate([
    (0, common_2.Controller)('api/member'),
    __metadata("design:paramtypes", [member_service_1.MemberService])
], MemberController);
//# sourceMappingURL=member.controller.js.map