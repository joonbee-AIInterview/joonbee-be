export interface ApiResponse<T> {
    status: number;
    data: T;
}
export declare class CustomError extends Error {
    statusCode: number;
    constructor(message: string, statusCode: number);
}
