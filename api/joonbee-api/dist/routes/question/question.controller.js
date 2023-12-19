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
exports.QuestionController = void 0;
const common_1 = require("@nestjs/common");
const question_service_1 = require("./question.service");
const common_2 = require("../../common/config/common");
const auth_1 = require("../../common/config/auth");
const category_entity_1 = require("../../entity/category.entity");
const typeorm_1 = require("typeorm");
const typeorm_2 = require("@nestjs/typeorm");
let QuestionController = class QuestionController {
    constructor(questionService, categoryRepository) {
        this.questionService = questionService;
        this.categoryRepository = categoryRepository;
    }
    async getQuestions(page = "1", category, subcategory, response) {
        if (page === "")
            throw new common_2.CustomError('페이지가 비었습니다. ', 400);
        if (page === "0")
            page = "1";
        let data;
        try {
            if (category === "" && subcategory === "") {
                data = await this.questionService.getQuestions(Number(page));
            }
            else if (category !== "" && subcategory === "") {
                const check = await this.categoryRepository.findOne({
                    where: {
                        categoryName: category,
                    },
                });
                if (!check || check.categoryLevel !== 0)
                    throw new common_2.CustomError('데이터베이스에 존재하지 않는 상위카테고리입니다. ', 404);
                data = await this.questionService.getQuestionsWithCategory(Number(page), category);
            }
            else {
                const checkCategory = await this.categoryRepository.findOne({
                    where: {
                        categoryName: category,
                    },
                });
                if (!checkCategory || checkCategory.categoryLevel !== 0)
                    throw new common_2.CustomError('데이터베이스에 존재하지 않는 상위카테고리입니다. ', 404);
                const checkSubcategory = await this.categoryRepository.findOne({
                    where: {
                        categoryName: subcategory,
                    },
                });
                if (!checkSubcategory || checkSubcategory.categoryLevel !== 1)
                    throw new common_2.CustomError('데이터베이스에 존재하지 않는 하위카테고리입니다. ', 404);
                data = await this.questionService.getQuestionsWithSubcategory(Number(page), category, subcategory);
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
    async getQuestionsByGPT(category, subcategory, questionCount, response) {
        if (category === "")
            throw new common_2.CustomError('카테고리가 비었습니다. ', 400);
        if (subcategory.length <= 0)
            throw new common_2.CustomError('서브카테고리가 비었습니다. ', 400);
        if (![2, 4, 6, 8, 10].includes(parseInt(questionCount)))
            throw new common_2.CustomError('질문의 개수를 2, 4, 6, 8, 10 중에서 선택해주세요. ', 400);
        const memberId = response.locals.memberId;
        try {
            const data = await this.questionService.getQuestionsByGPT(memberId, category, subcategory, questionCount);
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
exports.QuestionController = QuestionController;
__decorate([
    (0, common_1.Get)('all'),
    __param(0, (0, common_1.Query)('page')),
    __param(1, (0, common_1.Query)('category')),
    __param(2, (0, common_1.Query)('subcategory')),
    __param(3, (0, common_1.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, String, String, Object]),
    __metadata("design:returntype", Promise)
], QuestionController.prototype, "getQuestions", null);
__decorate([
    (0, common_1.UseGuards)(auth_1.TokenAuthGuard),
    (0, common_1.Get)('gpt'),
    __param(0, (0, common_1.Query)('category')),
    __param(1, (0, common_1.Query)('subcategory', new common_1.ParseArrayPipe({ items: String, separator: ',' }))),
    __param(2, (0, common_1.Query)('questionCount')),
    __param(3, (0, common_1.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, Array, String, Object]),
    __metadata("design:returntype", Promise)
], QuestionController.prototype, "getQuestionsByGPT", null);
exports.QuestionController = QuestionController = __decorate([
    (0, common_1.Controller)('api/question'),
    __param(1, (0, typeorm_2.InjectRepository)(category_entity_1.Category)),
    __metadata("design:paramtypes", [question_service_1.QuestionService,
        typeorm_1.Repository])
], QuestionController);
//# sourceMappingURL=question.controller.js.map