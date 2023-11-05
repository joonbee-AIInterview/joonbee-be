"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.MemberModule = void 0;
const common_1 = require("@nestjs/common");
const member_controller_1 = require("./member.controller");
const member_service_1 = require("./member.service");
const member_entity_1 = require("../../entity/member.entity");
const typeorm_1 = require("@nestjs/typeorm");
const interview_entity_1 = require("../../entity/interview.entity");
const like_entity_1 = require("../../entity/like.entity");
const and_question_entity_1 = require("../../entity/and.question.entity");
const category_entity_1 = require("../../entity/category.entity");
const cart_entity_1 = require("../../entity/cart.entity");
let MemberModule = class MemberModule {
};
exports.MemberModule = MemberModule;
exports.MemberModule = MemberModule = __decorate([
    (0, common_1.Module)({
        imports: [typeorm_1.TypeOrmModule.forFeature([
                member_entity_1.Member,
                like_entity_1.Like,
                interview_entity_1.Interview,
                and_question_entity_1.InterviewAndQuestion,
                category_entity_1.Category,
                cart_entity_1.Cart
            ])],
        controllers: [member_controller_1.MemberController],
        providers: [member_service_1.MemberService]
    })
], MemberModule);
//# sourceMappingURL=member.module.js.map