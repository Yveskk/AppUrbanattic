import { ProductOrderDto } from './productOrder.dto';

export interface CreateOrderDto {
  products: ProductOrderDto[];
  createAt: string;
  createBy: string;
  status: string;
  state: boolean;
}
