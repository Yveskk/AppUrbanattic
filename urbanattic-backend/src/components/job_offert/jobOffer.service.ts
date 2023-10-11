/* eslint-disable prettier/prettier */
import { Injectable, InternalServerErrorException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { JobOffer } from './entity/jobOffer.entity';
import { Repository } from 'typeorm';
import { CreateJobOfferDto } from './dto/create.jobOffer.dto';
import { UpdateJobOfferDto } from './dto/update.jobOffer.dto';

@Injectable()
export class JobOfferService {
  const;
  constructor(
    @InjectRepository(JobOffer)
    private jobOffersRepository: Repository<JobOffer>,
  ) {}

  async create(jobOffer: CreateJobOfferDto) {
    try {
      return await this.jobOffersRepository.save(jobOffer);
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error creating job offer');
      } else {
        throw error;
      }
    }
  }

  async getAll() {
    try {
      return await this.jobOffersRepository.find();
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error getting job offers');
      } else {
        throw error;
      }
    }
  }

  async findOne(id: string) {
    try {
      return await this.jobOffersRepository.findOneBy({ id: id });
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error getting job offer');
      } else {
        throw error;
      }
    }
  }

  async delete(id: string) {
    try {
      return await this.jobOffersRepository.delete(id);
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error deleting job offer');
      } else {
        throw error;
      }
    }
  }

  async update(id: string, jobOffer: UpdateJobOfferDto) {
    try {
      return await this.jobOffersRepository.update(id, jobOffer);
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error updating job offer');
      } else {
        throw error;
      }
    }
  }
}
