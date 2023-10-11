import { Body, Controller, Get, Param, Post, Put } from '@nestjs/common';
import { OrderService } from './order.service';

@Controller('order')
export class OrderController {
  constructor(private readonly orderService: OrderService) {}

  @Post()
  async createOrder(@Body() body: any) {
    return await this.orderService.create(body);
  }

  @Get()
  async getOrder() {
    return await this.orderService.getAll();
  }

  @Get(':id')
  async getOrders(@Param('id') id: string) {
    return await this.orderService.findOne(id);
  }

  @Put(':id')
  async updateOrder(@Param('id') id: string, @Body() body: any) {
    return await this.orderService.update(id, body);
  }
}
