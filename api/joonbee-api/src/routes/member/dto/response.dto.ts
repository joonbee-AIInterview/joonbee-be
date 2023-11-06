

export class ResponseMyInfoDTO{
    /*
    RowDataPacket {
        m_id: '13b4a',
        m_thumbnail: 'https/vi720.jq4qpBFxnzyEnjQ',    
        m_nick_name: 'test',
        interviewCount: '1'
    }
    */

    id: string;

    thumbnail: string;

    nickName: string;

    interviewCount: number;

    categoryInfo: ResponseCategoryInfoDTO[];
}
export class ResponseCategoryInfoDTO {
    /**
     * 
    [
    RowDataPacket { categoryName: 'react', categoryCount: '1' },
    RowDataPacket { categoryName: 'web', categoryCount: '1' }
    ]
     * 
     */
    categoryName: string;
    categoryCount: number;
}

export class ResponseInterviewCategoryDTO{
    total: number;

    result: ResponseInterviewCategoryData[];
}

export class ResponseInterviewCategoryData{
    categoryName: string;

    questionCount: number;

    interviewId: number;
}


export class ResponseCartDTO{
    questionContent: string;

    questionId: number;
}
