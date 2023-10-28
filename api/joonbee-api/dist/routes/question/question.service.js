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
exports.QuestionService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const category_entity_1 = require("../../entity/category.entity");
const question_entity_1 = require("../../entity/question.entity");
const typeorm_2 = require("typeorm");
let QuestionService = class QuestionService {
    constructor(questionRepository, categoryRepository) {
        this.questionRepository = questionRepository;
        this.categoryRepository = categoryRepository;
    }
    async saveQuestion(saveQuestionDto) {
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> 80c5793 (KAN-27 FEAT: Question 등록 삭제 전체조회 구현, 수정 미완성)
        const categoryPS = await this.categoryRepository.findOne({ where: { category_name: saveQuestionDto.category_name,
                category_upper_id: saveQuestionDto.category_upper_id } });
        if (categoryPS == null) {
            console.log('잘못된 category_name 또는 category_upper_id을 입력했습니다.');
            return;
        }
        const questionPS = await this.questionRepository.createQueryBuilder('question')
            .insert().values({
            category: categoryPS,
            gpt_flag: saveQuestionDto.gpt_flag,
            question_level: saveQuestionDto.question_level,
            writer: saveQuestionDto.writer,
            question_content: saveQuestionDto.question_content
        }).execute();
        return questionPS.identifiers[0].id;
    }
    async findAllWithCategory() {
        return await this.questionRepository.createQueryBuilder('question')
            .leftJoinAndSelect('question.category', 'category')
            .getMany();
<<<<<<< HEAD
>>>>>>> d342bec (KAN-27 FEAT: findAllWithCategory, saveQuestion 구현)
=======
    }
    async deleteQuestion(questionId) {
        await this.questionRepository.delete(questionId);
    }
    async updateQuestion(questionId, updateQuestionDto) {
        const questionPS = await this.questionRepository.findOne({ where: { id: questionId } });
        if (!questionPS) {
            throw new common_1.HttpException('NOT_FOUND', common_1.HttpStatus.NOT_FOUND);
        }
        console.log('전 : ' + questionPS.question_content);
        console.log('후 : ' + questionPS);
>>>>>>> 80c5793 (KAN-27 FEAT: Question 등록 삭제 전체조회 구현, 수정 미완성)
    }
};
exports.QuestionService = QuestionService;
exports.QuestionService = QuestionService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(question_entity_1.Question)),
    __param(1, (0, typeorm_1.InjectRepository)(category_entity_1.Category)),
    __metadata("design:paramtypes", [typeorm_2.Repository,
        typeorm_2.Repository])
], QuestionService);
//# sourceMappingURL=question.service.js.map