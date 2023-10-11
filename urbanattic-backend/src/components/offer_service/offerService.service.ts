import { Injectable, InternalServerErrorException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { OfferService } from './entity/offerService.entity';
import { Repository } from 'typeorm';
import { CreateOfferServiceDto } from './dto/create.offerService.dto';
import { UpdateOfferServiceDto } from './dto/update.offerService.dto';

@Injectable()
export class OfferServiceService {
  constructor(
    @InjectRepository(OfferService)
    private offerServiceRepository: Repository<OfferService>,
  ) {}

  async create(offerService: CreateOfferServiceDto) {
    try {
      return await this.offerServiceRepository.save(offerService);
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error creating offer service');
      } else {
        throw error;
      }
    }
  }

  async getAll() {
    try {
      return await this.offerServiceRepository.find();
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error getting offer service');
      } else {
        throw error;
      }
    }
  }

  async findOne(id: string) {
    try {
      return await this.offerServiceRepository.findOneBy({ id: id });
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error getting offer service');
      } else {
        throw error;
      }
    }
  }

  async delete(id: string) {
    try {
      return await this.offerServiceRepository.delete(id);
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error deleting offer service');
      } else {
        throw error;
      }
    }
  }

  async update(id: string, offerService: UpdateOfferServiceDto) {
    try {
      return await this.offerServiceRepository.update(id, offerService);
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error updating offer service');
      } else {
        throw error;
      }
    }
  }
}
