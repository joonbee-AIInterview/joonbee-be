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
exports.TypeOrmConfigService = void 0;
const config_1 = require("@nestjs/config");
const common_1 = require("@nestjs/common");
const member_entity_1 = require("../../entity/member.entity");
const category_entity_1 = require("../../entity/category.entity");
const question_entity_1 = require("../../entity/question.entity");
const like_entity_1 = require("../../entity/like.entity");
const interview_entity_1 = require("../../entity/interview.entity");
let TypeOrmConfigService = class TypeOrmConfigService {
    constructor(configService) {
        this.configService = configService;
    }
    createTypeOrmOptions() {
        return {
            "type": 'mariadb',
            "host": this.configService.get('DATABASE_HOST'),
            "port": this.configService.get('DATABASE_PORT'),
            "username": this.configService.get('DATABASE_USERNAME'),
            "password": this.configService.get('DATABASE_PASSWORD'),
            "database": this.configService.get('DATABASE_DB'),
<<<<<<< HEAD
            "entities": [member_entity_1.Member, category_entity_1.Category, question_entity_1.Question, like_entity_1.Like, interview_entity_1.Interview],
            "synchronize": false,
=======
            "entities": [member_entity_1.Member, category_entity_1.Category, question_entity_1.Question, typeorm_1.Like],
            "synchronize": true,
>>>>>>> 80c5793 (KAN-27 FEAT: Question 등록 삭제 전체조회 구현, 수정 미완성)
            "logging": true
        };
    }
};
exports.TypeOrmConfigService = TypeOrmConfigService;
exports.TypeOrmConfigService = TypeOrmConfigService = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [config_1.ConfigService])
], TypeOrmConfigService);
//# sourceMappingURL=confguration.js.map