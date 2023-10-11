import { Injectable, InternalServerErrorException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Order } from './entity/order';
import { Repository } from 'typeorm';
import { CreateOfferServiceDto } from '../offer_service/dto/create.offerService.dto';
import { UpdateOfferServiceDto } from '../offer_service/dto/update.offerService.dto';

@Injectable()
export class OrderService {
  constructor(
    @InjectRepository(Order)
    private orderRepository: Repository<Order>,
  ) {}

  async create(offerService: CreateOfferServiceDto) {
    try {
      return await this.orderRepository.save(offerService);
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error creating order');
      } else {
        throw error;
      }
    }
  }

  async getAll() {
    try {
      return await this.orderRepository.find();
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error getting order');
      } else {
        throw error;
      }
    }
  }

  async findOne(id: string) {
    try {
      return await this.orderRepository.findOneBy({ id: id });
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error getting order');
      } else {
        throw error;
      }
    }
  }

  async update(id: string, offerService: UpdateOfferServiceDto) {
    try {
      return await this.orderRepository.update({ id: id }, offerService);
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error updating order');
      } else {
        throw error;
      }
    }
  }
}
