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
exports.InterviewAndQuestion = void 0;
const typeorm_1 = require("typeorm");
const interview_entity_1 = require("./interview.entity");
const question_entity_1 = require("./question.entity");
let InterviewAndQuestion = class InterviewAndQuestion {
};
exports.InterviewAndQuestion = InterviewAndQuestion;
__decorate([
    (0, typeorm_1.PrimaryColumn)({ name: 'interview_id' }),
    __metadata("design:type", Number)
], InterviewAndQuestion.prototype, "interviewId", void 0);
__decorate([
    (0, typeorm_1.PrimaryColumn)({ name: 'question_id' }),
    __metadata("design:type", Number)
], InterviewAndQuestion.prototype, "questionId", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'answer_content', type: 'text' }),
    __metadata("design:type", String)
], InterviewAndQuestion.prototype, "answerContent", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => interview_entity_1.Interview, interview => interview.id, { onDelete: 'CASCADE' }),
    (0, typeorm_1.JoinColumn)({ name: 'interview_id' }),
    __metadata("design:type", interview_entity_1.Interview)
], InterviewAndQuestion.prototype, "interview", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => question_entity_1.Question, question => question.id, { onDelete: 'CASCADE' }),
    (0, typeorm_1.JoinColumn)({ name: 'question_id' }),
    __metadata("design:type", question_entity_1.Question)
], InterviewAndQuestion.prototype, "question", void 0);
exports.InterviewAndQuestion = InterviewAndQuestion = __decorate([
    (0, typeorm_1.Entity)('interview_and_question')
], InterviewAndQuestion);
//# sourceMappingURL=and.question.entity.js.map