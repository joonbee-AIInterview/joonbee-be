import { CategoryService } from "./category.service";
import { Category } from "src/entity/category.entity";
export declare class CategoryController {
    private readonly categoryService;
    constructor(categoryService: CategoryService);
    findAll(): Promise<Category[]>;
}
