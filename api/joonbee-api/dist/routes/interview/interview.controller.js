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
exports.InterviewController = void 0;
const common_1 = require("@nestjs/common");
const interview_service_1 = require("./interview.service");
const common_2 = require("../../common/config/common");
const typeorm_1 = require("@nestjs/typeorm");
const category_entity_1 = require("../../entity/category.entity");
const typeorm_2 = require("typeorm");
let InterviewController = class InterviewController {
    constructor(interviewService, categoryRepository) {
        this.interviewService = interviewService;
        this.categoryRepository = categoryRepository;
    }
    async getInterviews(page, category, response) {
        let data;
        try {
            if (category === "") {
                data = await this.interviewService.getInterviews(Number(page));
            }
            else {
                const check = await this.categoryRepository.findOne({
                    where: {
                        categoryName: category,
                    },
                });
                if (!check || check.categoryLevel !== 0)
                    throw new common_2.CustomError('데이터베이스에 존재하지 않는 상위카테고리입니다. ', 404);
                data = await this.interviewService.getInterviewsWithLikeMemberQuestion(Number(page), category);
            }
            const apiResponse = {
                status: 200,
                data
            };
            response.json(apiResponse);
        }
        catch (error) {
            throw new common_2.CustomError('알 수 없는 에러 : ' + error, 500);
        }
    }
};
exports.InterviewController = InterviewController;
__decorate([
    (0, common_1.Get)('all'),
    __param(0, (0, common_1.Query)('page')),
    __param(1, (0, common_1.Query)('category')),
    __param(2, (0, common_1.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, String, Object]),
    __metadata("design:returntype", Promise)
], InterviewController.prototype, "getInterviews", null);
exports.InterviewController = InterviewController = __decorate([
    (0, common_1.Controller)('api/interview'),
    __param(1, (0, typeorm_1.InjectRepository)(category_entity_1.Category)),
    __metadata("design:paramtypes", [interview_service_1.InterviewService,
        typeorm_2.Repository])
], InterviewController);
//# sourceMappingURL=interview.controller.js.map