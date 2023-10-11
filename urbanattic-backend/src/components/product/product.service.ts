/* eslint-disable prettier/prettier */
import { Injectable, InternalServerErrorException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Product } from './entity/product.entity';
import { ILike, Repository } from 'typeorm';
import { CreateProductDto } from './dto/create.product.dto';
import { UpdateProductDto } from './dto/update.product.dto';

@Injectable()
export class ProductService {
  constructor(
    @InjectRepository(Product)
    private productsRepository: Repository<Product>,
  ) {}

  async create(product: CreateProductDto) {
    try {
      return await this.productsRepository.save(product);
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error creating product');
      } else {
        throw error;
      }
    }
  }

  async getAll() {
    try {
      return await this.productsRepository.find();
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error getting products');
      } else {
        throw error;
      }
    }
  }

  async findOne(id: string) {
    try {
      return await this.productsRepository.findOneBy({ id: id });
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error getting product');
      } else {
        throw error;
      }
    }
  }

  getByName(name: string) {
    try {
      return this.productsRepository.findBy({ name: ILike(`%${name}%`) });
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error getting product by name');
      } else {
        throw error;
      }
    }
  }

  async update(id: string, product: UpdateProductDto) {
    try {
      return await this.productsRepository.update(id, product);
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error updating product');
      } else {
        throw error;
      }
    }
  }

  delete(id: string) {
    try {
      return this.productsRepository.delete({ id: id });
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error deleting product');
      } else {
        throw error;
      }
    }
  }
}
