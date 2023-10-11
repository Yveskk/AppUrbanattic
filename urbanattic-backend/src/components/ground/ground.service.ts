/* eslint-disable prettier/prettier */
import { Injectable, InternalServerErrorException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Ground } from './entity/ground.entity';
import { Repository } from 'typeorm';
import { CreateGroundDto } from './dto/create.ground.dto';
import { UpdateGroundDto } from './dto/updateGround.dto';

@Injectable()
export class GroundService {
  constructor(
    @InjectRepository(Ground)
    private groundsRepository: Repository<Ground>,
  ) {}

  async create(ground: CreateGroundDto) {
    try {
      return await this.groundsRepository.save(ground);
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Create ground error');
      } else {
        throw error;
      }
    }
  }

  async getAll() {
    try {
      return await this.groundsRepository.find();
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Get grounds error');
      } else {
        throw error;
      }
    }
  }

  async findOne(id: string) {
    try {
      return await this.groundsRepository.findOneBy({ id: id });
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Get ground error');
      } else {
        throw error;
      }
    }
  }

  async update(id: string, ground: UpdateGroundDto) {
    try {
      return await this.groundsRepository.update(id, ground);
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Update ground error');
      } else {
        throw error;
      }
    }
  }

  async delete(id: string) {
    try {
      return await this.groundsRepository.delete(id);
    } catch (error) {
     if (error instanceof InternalServerErrorException) {
       throw new InternalServerErrorException('Delete ground error');
     } else {
       throw error;
     }
    }
  }

  async getByUser(userId: string) {
    try {
      return await this.groundsRepository.findBy({ createBy: userId });
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Get grounds by user error');
      } else {
        throw error;
      }
    }
  }
}
