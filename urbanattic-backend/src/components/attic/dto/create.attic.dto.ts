export interface CreateAtticDto {
  id: string;
  name: string;
  createBy: string;
  images: string[];
  state: boolean;
  openningTime: string;
  closureHour: string;
}
