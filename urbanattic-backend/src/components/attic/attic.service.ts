/* eslint-disable prettier/prettier */
import { Injectable, InternalServerErrorException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Attic } from './entity/attic.entity';
import { ILike, Repository } from 'typeorm';
import { CreateAtticDto } from './dto/create.attic.dto';
import { UpdateAtticDto } from './dto/update.attic.dto';

@Injectable()
export class AtticService {
  constructor(
    @InjectRepository(Attic)
    private atticsRepository: Repository<Attic>,
  ) {}

  async create(attic: CreateAtticDto) {
    try {
      return await this.atticsRepository.save(attic);
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error creating attic');
      } else {
        throw error;
      }
    }
  }

  async getAll() {
    try {
      return await this.atticsRepository.find();
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error getting attics');
      } else {
        throw error;
      }
    }
  }

  async findOne(id: string) {
    try {
      return await this.atticsRepository.findOneBy({ id });
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error getting attic');
      } else {
        throw error;
      }
    }
  }

  update(id: string, attic: UpdateAtticDto) {
    try {
      return this.atticsRepository.update(id, attic);
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error updating attic');
      } else {
        throw error;
      }
    }
  }

  delete(id: string) {
    try {
      return this.atticsRepository.delete(id);
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error deleting attic');
      } else {
        throw error;
      }
    }
  }

  getByName(name: string) {
    try {
      return this.atticsRepository.findBy({ name: ILike(`%${name}%`) });
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error getting attic by name');
      } else {
        throw error;
      }
    }
  }
}
