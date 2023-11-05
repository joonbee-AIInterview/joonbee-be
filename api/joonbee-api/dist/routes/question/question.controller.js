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
const save_request_dto_1 = require("./dto/save.request.dto");
const question_service_1 = require("./question.service");
let QuestionController = class QuestionController {
    constructor(questionService) {
        this.questionService = questionService;
    }
    async saveQuestion(saveQuestionDto) {
        const questionId = await this.questionService.saveQuestion(saveQuestionDto);
        return Object.assign({
            data: { questionId: questionId },
            statusCode: 201,
            statusMsg: `saveQuestion을 이용한 Question 데이터 추가가 성공적으로 완료되었습니다.`,
        });
    }
    async findAllWithCategory() {
        const questionList = await this.questionService.findAllWithCategory();
        return Object.assign({
            data: questionList,
            statusCode: 200,
            statusMsg: `findAllWithCategory을 이용한 Question 데이터 조회가 성공적으로 완료되었습니다.`,
        });
    }
    async findOneWithCategory(questionId) {
        const question = await this.questionService.findOneWithCategory(questionId);
        return Object.assign({
            data: question,
            statusCode: 200,
            statusMsg: `findOneWithCategory을 이용한 Question 데이터 조회가 성공적으로 완료되었습니다.`,
        });
    }
    async deleteQuestion(questionId) {
        await this.questionService.deleteQuestion(questionId);
        return Object.assign({
            data: { questionId: questionId },
            statusCode: 201,
            statusMsg: `deleteQuestion을 이용한 Question 데이터 삭제가 성공적으로 완료되었습니다.`,
        });
    }
    async updateQuestion(questionId, updateQuestionDto) {
        const question = await this.questionService.updateQuestion(questionId, updateQuestionDto);
        return Object.assign({
            data: { question },
            statusCode: 201,
            statusMsg: `updateQuestion을 이용한 Question 데이터 수정이 성공적으로 완료되었습니다.`,
        });
    }
};
exports.QuestionController = QuestionController;
__decorate([
    (0, common_1.Post)('save'),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [save_request_dto_1.SaveQuestionDto]),
    __metadata("design:returntype", Promise)
], QuestionController.prototype, "saveQuestion", null);
__decorate([
    (0, common_1.Get)('all'),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", Promise)
], QuestionController.prototype, "findAllWithCategory", null);
__decorate([
    (0, common_1.Get)(':questionId'),
    __param(0, (0, common_1.Param)('questionId')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", Promise)
], QuestionController.prototype, "findOneWithCategory", null);
__decorate([
    (0, common_1.Delete)('delete/:questionId'),
    __param(0, (0, common_1.Param)('questionId')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", Promise)
], QuestionController.prototype, "deleteQuestion", null);
__decorate([
    (0, common_1.Put)('update/:questionId'),
    __param(0, (0, common_1.Param)('questionId')),
    __param(1, (0, common_1.Body)(new common_1.ValidationPipe())),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, save_request_dto_1.SaveQuestionDto]),
    __metadata("design:returntype", Promise)
], QuestionController.prototype, "updateQuestion", null);
exports.QuestionController = QuestionController = __decorate([
    (0, common_1.Controller)('api/question'),
    __metadata("design:paramtypes", [question_service_1.QuestionService])
], QuestionController);
//# sourceMappingURL=question.controller.js.map