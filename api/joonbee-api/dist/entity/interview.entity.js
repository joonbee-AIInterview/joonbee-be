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
exports.Interview = void 0;
const typeorm_1 = require("typeorm");
const member_entity_1 = require("./member.entity");
const question_entity_1 = require("./question.entity");
let Interview = class Interview {
};
exports.Interview = Interview;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], Interview.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'member_id', type: 'varchar', length: 255 }),
    __metadata("design:type", String)
], Interview.prototype, "memberId", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'question_id', type: "bigint" }),
    __metadata("design:type", Number)
], Interview.prototype, "questionId", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'question_content', type: 'text' }),
    __metadata("design:type", String)
], Interview.prototype, "questionContent", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'count_flag', type: 'int' }),
    __metadata("design:type", Number)
], Interview.prototype, "countFlag", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => member_entity_1.Member, member => member.id, { onDelete: 'CASCADE' }),
    (0, typeorm_1.JoinColumn)({ name: 'member_id' }),
    __metadata("design:type", member_entity_1.Member)
], Interview.prototype, "member", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => question_entity_1.Question, question => question.id),
    (0, typeorm_1.JoinColumn)({ name: "question_id" }),
    __metadata("design:type", question_entity_1.Question)
], Interview.prototype, "question", void 0);
__decorate([
    (0, typeorm_1.CreateDateColumn)({ name: 'created_at' }),
    __metadata("design:type", Date)
], Interview.prototype, "createdAt", void 0);
__decorate([
    (0, typeorm_1.UpdateDateColumn)({ name: 'updated_at' }),
    __metadata("design:type", Date)
], Interview.prototype, "updatedAt", void 0);
exports.Interview = Interview = __decorate([
    (0, typeorm_1.Entity)('interview')
], Interview);
//# sourceMappingURL=interview.entity.js.map