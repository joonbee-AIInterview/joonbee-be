"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.InterviewModule = void 0;
const typeorm_1 = require("@nestjs/typeorm");
const interview_controller_1 = require("./interview.controller");
const interview_service_1 = require("./interview.service");
const common_1 = require("@nestjs/common");
const interview_entity_1 = require("../../entity/interview.entity");
const and_question_entity_1 = require("../../entity/and.question.entity");
const category_entity_1 = require("../../entity/category.entity");
let InterviewModule = class InterviewModule {
};
exports.InterviewModule = InterviewModule;
exports.InterviewModule = InterviewModule = __decorate([
    (0, common_1.Module)({
        imports: [typeorm_1.TypeOrmModule.forFeature([
                interview_entity_1.Interview,
                and_question_entity_1.InterviewAndQuestion,
                category_entity_1.Category,
            ])],
        controllers: [interview_controller_1.InterviewController],
        providers: [interview_service_1.InterviewService]
    })
], InterviewModule);
//# sourceMappingURL=interview.module.js.map