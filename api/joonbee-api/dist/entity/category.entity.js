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
exports.Category = void 0;
const index_1 = require("typeorm/index");
const question_entity_1 = require("./question.entity");
let Category = class Category {
};
exports.Category = Category;
__decorate([
    (0, index_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], Category.prototype, "id", void 0);
__decorate([
    (0, index_1.Column)({ type: 'varchar', length: 255, name: 'category_name' }),
    __metadata("design:type", String)
], Category.prototype, "categoryName", void 0);
__decorate([
    (0, index_1.Column)({ type: 'tinyint', name: 'category_level' }),
    __metadata("design:type", Number)
], Category.prototype, "categoryLevel", void 0);
__decorate([
    (0, index_1.Column)({ type: 'int', name: 'category_upper_id' }),
    __metadata("design:type", Number)
], Category.prototype, "categoryUpperId", void 0);
__decorate([
    (0, index_1.OneToMany)(() => question_entity_1.Question, question => question.category),
    __metadata("design:type", Array)
], Category.prototype, "questions", void 0);
__decorate([
    (0, index_1.CreateDateColumn)({ name: 'created_at' }),
    __metadata("design:type", Date)
], Category.prototype, "createdAt", void 0);
__decorate([
    (0, index_1.UpdateDateColumn)({ name: 'updated_at' }),
    __metadata("design:type", Date)
], Category.prototype, "updatedAt", void 0);
exports.Category = Category = __decorate([
    (0, index_1.Entity)('category')
], Category);
//# sourceMappingURL=category.entity.js.map