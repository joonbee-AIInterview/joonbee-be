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
exports.Like = void 0;
const typeorm_1 = require("typeorm");
const member_entity_1 = require("./member.entity");
const interview_entity_1 = require("./interview.entity");
let Like = class Like {
};
exports.Like = Like;
__decorate([
    (0, typeorm_1.PrimaryColumn)({ name: 'member_id' }),
    __metadata("design:type", String)
], Like.prototype, "memberId", void 0);
__decorate([
    (0, typeorm_1.PrimaryColumn)({ name: 'interview_id' }),
    __metadata("design:type", Number)
], Like.prototype, "interviewId", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => member_entity_1.Member, member => member.id, { onDelete: 'CASCADE' }),
    (0, typeorm_1.JoinColumn)({ name: 'member_id' }),
    __metadata("design:type", member_entity_1.Member)
], Like.prototype, "member", void 0);
__decorate([
    (0, typeorm_1.ManyToOne)(() => interview_entity_1.Interview, interview => interview.id, { onDelete: 'CASCADE' }),
    (0, typeorm_1.JoinColumn)({ name: 'interview_id' }),
    __metadata("design:type", interview_entity_1.Interview)
], Like.prototype, "interview", void 0);
exports.Like = Like = __decorate([
    (0, typeorm_1.Entity)('like')
], Like);
//# sourceMappingURL=like.entity.js.map