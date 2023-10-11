/* eslint-disable prettier/prettier */
import { InjectRepository } from '@nestjs/typeorm';
import { Reservation } from './entity/reservation.entity';
import { Repository } from 'typeorm';
import { CreateReservationDto } from './dto/create.reservation.dto';
import { Injectable, InternalServerErrorException } from '@nestjs/common';
import { UpdateReservationDto } from './dto/update.reservation.dto';

@Injectable()
export class ReservationService {
  constructor(
    @InjectRepository(Reservation)
    private reservationsRepository: Repository<Reservation>,
  ) {}

  async create(reservation: CreateReservationDto) {
    try {
      return await this.reservationsRepository.save(reservation);
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error creating reservation');
      } else {
        throw error;
      }
    }
  }

  async getById(id: string) {
    try {
      return await this.reservationsRepository.findOneBy({ id: id });
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error getting reservation');
      } else {
        throw error;
      }
    }
  }

  async getByUser(userId: string) {
    try {
      return await this.reservationsRepository.findBy({ applicant: userId });
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException(
          'Error getting reservation by user',
        );
      } else {
        throw error;
      }
    }
  }

  async getAll() {
    try {
      return await this.reservationsRepository.find();
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error getting reservations');
      } else {
        throw error;
      }
    }
  }

  async delete(id: string) {
    try {
      return await this.reservationsRepository.delete(id);
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error deleting reservation');
      } else {
        throw error;
      }
    }
  }

  async update(id: string, reservation: UpdateReservationDto) {
    try {
      return await this.reservationsRepository.update(id, reservation);
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error updating reservation');
      } else {
        throw error;
      }
    }
  }
}
