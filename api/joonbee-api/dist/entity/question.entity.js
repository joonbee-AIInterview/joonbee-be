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
let Question = class Question {
    updateQuestion(updateQuestionDto) {
        this.category.category_name = updateQuestionDto.category_name;
        this.category.category_level = updateQuestionDto.category_level;
        this.category.category_upper_id = updateQuestionDto.category_upper_id;
        this.gpt_flag = updateQuestionDto.gpt_flag;
        this.question_level = updateQuestionDto.question_level;
        this.writer = updateQuestionDto.writer;
        this.question_content = updateQuestionDto.question_content;
    }
};
exports.Question = Question;
__decorate([
    (0, index_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], Question.prototype, "id", void 0);
__decorate([
    (0, index_1.ManyToOne)(() => category_entity_1.Category),
    (0, index_1.JoinColumn)({ name: 'category_id' }),
    __metadata("design:type", category_entity_1.Category)
], Question.prototype, "category", void 0);
__decorate([
    (0, index_1.Column)('tinyint', { nullable: false }),
    __metadata("design:type", Number)
], Question.prototype, "gpt_flag", void 0);
__decorate([
    (0, index_1.Column)('int', { nullable: false }),
    __metadata("design:type", Number)
], Question.prototype, "question_level", void 0);
__decorate([
    (0, index_1.Column)('varchar', { nullable: false }),
    __metadata("design:type", String)
], Question.prototype, "writer", void 0);
__decorate([
    (0, index_1.Column)('text', { nullable: false }),
    __metadata("design:type", String)
], Question.prototype, "question_content", void 0);
__decorate([
    (0, index_1.CreateDateColumn)({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP' }),
    __metadata("design:type", Date)
], Question.prototype, "created_at", void 0);
__decorate([
    (0, index_1.UpdateDateColumn)({ type: 'timestamp', default: () => 'CURRENT_TIMESTAMP', onUpdate: 'CURRENT_TIMESTAMP' }),
    __metadata("design:type", Date)
], Question.prototype, "updated_at", void 0);
exports.Question = Question = __decorate([
    (0, index_1.Entity)('question')
], Question);
//# sourceMappingURL=question.entity.js.map