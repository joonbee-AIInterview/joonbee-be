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
Object.defineProperty(exports, "__esModule", { value: true });
exports.RequestCartInsertDTO = exports.RequestInterviewSaveDTO = exports.RequestLikeDTO = exports.RequestQuestion = void 0;
const swagger_1 = require("@nestjs/swagger");
const class_validator_1 = require("class-validator");
class RequestQuestion {
}
exports.RequestQuestion = RequestQuestion;
__decorate([
    (0, class_validator_1.IsNotEmpty)(),
    (0, swagger_1.ApiProperty)({ description: '질문 ID' }),
    __metadata("design:type", Number)
], RequestQuestion.prototype, "questionId", void 0);
__decorate([
    (0, class_validator_1.IsNotEmpty)(),
    (0, swagger_1.ApiProperty)({ description: '질문 내용' }),
    __metadata("design:type", String)
], RequestQuestion.prototype, "questionContent", void 0);
__decorate([
    (0, class_validator_1.IsNotEmpty)(),
    (0, swagger_1.ApiProperty)({ description: '답변 내용' }),
    __metadata("design:type", String)
], RequestQuestion.prototype, "answerContent", void 0);
class RequestLikeDTO {
}
exports.RequestLikeDTO = RequestLikeDTO;
__decorate([
    (0, class_validator_1.IsNotEmpty)(),
    (0, swagger_1.ApiProperty)({ description: '면접 PK' }),
    __metadata("design:type", Number)
], RequestLikeDTO.prototype, "interviewId", void 0);
class RequestInterviewSaveDTO {
}
exports.RequestInterviewSaveDTO = RequestInterviewSaveDTO;
__decorate([
    (0, swagger_1.ApiProperty)({ description: '카테고리 이름' }),
    __metadata("design:type", String)
], RequestInterviewSaveDTO.prototype, "categoryName", void 0);
__decorate([
    (0, swagger_1.ApiProperty)({
        description: 'questionId(number), questionContent(string), answerContent(string)',
        type: RequestQuestion,
        isArray: true
    }),
    __metadata("design:type", Array)
], RequestInterviewSaveDTO.prototype, "questions", void 0);
class RequestCartInsertDTO {
}
exports.RequestCartInsertDTO = RequestCartInsertDTO;
__decorate([
    (0, class_validator_1.IsNotEmpty)({ message: 'question 번호' }),
    __metadata("design:type", Number)
], RequestCartInsertDTO.prototype, "questionId", void 0);
__decorate([
    (0, class_validator_1.IsNotEmpty)({ message: 'category 이름' }),
    __metadata("design:type", String)
], RequestCartInsertDTO.prototype, "subcategoryName", void 0);
//# sourceMappingURL=request.dto.js.map