export interface CreateProductDto {
  id: string;
  name: string;
  createBy: string;
  quantity: number;
  limit: number;
  images: string[];
  price: number;
}
