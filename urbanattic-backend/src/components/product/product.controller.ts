import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  Put,
} from '@nestjs/common';
import { ProductService } from './product.service';

@Controller('product')
export class ProductController {
  constructor(private readonly productService: ProductService) {}

  @Post()
  async createProduct(@Body() body: any) {
    return await this.productService.create(body);
  }

  @Get()
  async getProducts() {
    return await this.productService.getAll();
  }

  @Get('search/:name')
  async searchProductByName(@Param('name') name: string) {
    return await this.productService.getByName(name);
  }

  @Get(':id')
  async getProduct(@Param('id') id: string) {
    return await this.productService.findOne(id);
  }

  @Delete(':id')
  async deleteProduct(@Param('id') id: string) {
    return await this.productService.delete(id);
  }

  @Put(':id')
  async updateProduct(@Param('id') id: string, @Body() body: any) {
    return await this.productService.update(id, body);
  }
}
