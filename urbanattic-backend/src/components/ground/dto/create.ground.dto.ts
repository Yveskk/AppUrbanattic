export interface CreateGroundDto {
  state: boolean;
  status?: string;
  atticId: string;
  createBy: string;
  attachments: string[];
}
