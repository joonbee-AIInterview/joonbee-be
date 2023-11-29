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
exports.QuestionController = void 0;
const common_1 = require("@nestjs/common");
const question_service_1 = require("./question.service");
const common_2 = require("../../common/config/common");
let QuestionController = class QuestionController {
    constructor(questionService) {
        this.questionService = questionService;
    }
    async getQuestions(page, response) {
        if (page === "")
            throw new common_2.CustomError('페이지가 비었습니다. ', 400);
        try {
            const data = await this.questionService.getQuestions(Number(page));
            const apiResponse = {
                status: 200,
                data
            };
            response.json(apiResponse);
        }
        catch (error) {
            throw new common_2.CustomError('알 수 없는 에러 : ' + error, 500);
        }
    }
    async getQuestionsByCategory(page, category, response) {
        if (page === "")
            throw new common_2.CustomError('페이지가 비었습니다. ', 400);
        if (category === "")
            throw new common_2.CustomError('카테고리가 비었습니다. ', 400);
        if (page === "0")
            page = "1";
        try {
            const data = await this.questionService.getQuestionsWithCategory(Number(page), category);
            const apiResponse = {
                status: 200,
                data
            };
            response.json(apiResponse);
        }
        catch (error) {
            throw new common_2.CustomError('알 수 없는 에러 : ' + error, 500);
        }
    }
    async getQuestionsBySubcategory(page, category, subCategory, response) {
        if (page === "")
            throw new common_2.CustomError('페이지가 비었습니다. ', 400);
        if (category === "")
            throw new common_2.CustomError('카테고리가 비었습니다. ', 400);
        if (subCategory === "")
            throw new common_2.CustomError('서브카테고리가 비었습니다. ', 400);
        if (page === "0")
            page = "1";
        try {
            const data = await this.questionService.getQuestionsWithSubcategory(Number(page), category, subCategory);
            const apiResponse = {
                status: 200,
                data
            };
            response.json(apiResponse);
        }
        catch (error) {
            throw new common_2.CustomError('알 수 없는 에러 : ' + error, 500);
        }
    }
};
exports.QuestionController = QuestionController;
__decorate([
    (0, common_1.Get)('all'),
    __param(0, (0, common_1.Query)('page')),
    __param(1, (0, common_1.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, Object]),
    __metadata("design:returntype", Promise)
], QuestionController.prototype, "getQuestions", null);
__decorate([
    (0, common_1.Get)('all/category'),
    __param(0, (0, common_1.Query)('page')),
    __param(1, (0, common_1.Query)('category')),
    __param(2, (0, common_1.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, String, Object]),
    __metadata("design:returntype", Promise)
], QuestionController.prototype, "getQuestionsByCategory", null);
__decorate([
    (0, common_1.Get)('all/subcategory'),
    __param(0, (0, common_1.Query)('page')),
    __param(1, (0, common_1.Query)('category')),
    __param(2, (0, common_1.Query)('subcategory')),
    __param(3, (0, common_1.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, String, String, Object]),
    __metadata("design:returntype", Promise)
], QuestionController.prototype, "getQuestionsBySubcategory", null);
exports.QuestionController = QuestionController = __decorate([
    (0, common_1.Controller)('api/question'),
    __metadata("design:paramtypes", [question_service_1.QuestionService])
], QuestionController);
//# sourceMappingURL=question.controller.js.map