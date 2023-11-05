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
exports.Question = void 0;
const index_1 = require("typeorm/index");
const category_entity_1 = require("./category.entity");
const and_question_entity_1 = require("./and.question.entity");
let Question = class Question {
    updateQuestion(updateQuestionDto) {
        this.category.categoryName = updateQuestionDto.categoryName;
        this.gptFlag = updateQuestionDto.gptFlag;
        this.questionLevel = updateQuestionDto.questionLevel;
        this.writer = updateQuestionDto.writer;
        this.questionContent = updateQuestionDto.questionContent;
    }
};
exports.Question = Question;
__decorate([
    (0, index_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], Question.prototype, "id", void 0);
__decorate([
    (0, index_1.ManyToOne)(() => category_entity_1.Category, category => category.id, { onDelete: 'CASCADE' }),
    (0, index_1.JoinColumn)({ name: 'category_id' }),
    __metadata("design:type", category_entity_1.Category)
], Question.prototype, "category", void 0);
__decorate([
    (0, index_1.OneToMany)(() => and_question_entity_1.InterviewAndQuestion, (imq) => imq.question),
    __metadata("design:type", Array)
], Question.prototype, "interviewAndQuestions", void 0);
__decorate([
    (0, index_1.Column)({ type: 'tinyint', name: 'gpt_flag' }),
    __metadata("design:type", Number)
], Question.prototype, "gptFlag", void 0);
__decorate([
    (0, index_1.Column)({ type: 'int', name: 'question_level' }),
    __metadata("design:type", Number)
], Question.prototype, "questionLevel", void 0);
__decorate([
    (0, index_1.Column)({ type: 'varchar', length: 255, nullable: false }),
    __metadata("design:type", String)
], Question.prototype, "writer", void 0);
__decorate([
    (0, index_1.Column)({ type: 'text', name: 'question_content' }),
    __metadata("design:type", String)
], Question.prototype, "questionContent", void 0);
__decorate([
    (0, index_1.CreateDateColumn)({ name: 'created_at', type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' }),
    __metadata("design:type", Date)
], Question.prototype, "createdAt", void 0);
__decorate([
    (0, index_1.UpdateDateColumn)({ name: 'updated_at', type: 'timestamp', default: () => 'CURRENT_TIMESTAMP', onUpdate: 'CURRENT_TIMESTAMP' }),
    __metadata("design:type", Date)
], Question.prototype, "updatedAt", void 0);
exports.Question = Question = __decorate([
    (0, index_1.Entity)('question')
], Question);
//# sourceMappingURL=question.entity.js.map