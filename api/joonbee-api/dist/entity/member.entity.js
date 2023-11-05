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
exports.Member = void 0;
const typeorm_1 = require("typeorm");
const interview_entity_1 = require("./interview.entity");
const cart_entity_1 = require("./cart.entity");
let Member = class Member {
};
exports.Member = Member;
__decorate([
    (0, typeorm_1.PrimaryColumn)({ type: 'varchar', length: 255 }),
    __metadata("design:type", String)
], Member.prototype, "id", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: 'varchar', length: 255, unique: true }),
    __metadata("design:type", String)
], Member.prototype, "email", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: 'varchar', length: 255 }),
    __metadata("design:type", String)
], Member.prototype, "password", void 0);
__decorate([
    (0, typeorm_1.Column)({ type: 'text', nullable: true }),
    __metadata("design:type", String)
], Member.prototype, "thumbnail", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'login_type', type: 'varchar', length: 50, nullable: true }),
    __metadata("design:type", String)
], Member.prototype, "loginType", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'del_flag', type: 'boolean', default: false }),
    __metadata("design:type", Boolean)
], Member.prototype, "delFlag", void 0);
__decorate([
    (0, typeorm_1.Column)({ name: 'nick_name' }),
    __metadata("design:type", String)
], Member.prototype, "nickName", void 0);
__decorate([
    (0, typeorm_1.CreateDateColumn)({ name: 'created_at' }),
    __metadata("design:type", Date)
], Member.prototype, "createdAt", void 0);
__decorate([
    (0, typeorm_1.UpdateDateColumn)({ name: 'updated_at' }),
    __metadata("design:type", Date)
], Member.prototype, "updatedAt", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => interview_entity_1.Interview, (interview) => interview.member),
    __metadata("design:type", Array)
], Member.prototype, "interviews", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => cart_entity_1.Cart, (cart) => cart.member),
    __metadata("design:type", cart_entity_1.Cart)
], Member.prototype, "carts", void 0);
exports.Member = Member = __decorate([
    (0, typeorm_1.Entity)('member')
], Member);
//# sourceMappingURL=member.entity.js.map