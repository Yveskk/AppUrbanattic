export interface CreateOfferServiceDto {
  nameOfPerson: string;
  title: string;
  description: string;
  attic: string;
  status: string;
  state?: boolean;
  createBy: string;
}
