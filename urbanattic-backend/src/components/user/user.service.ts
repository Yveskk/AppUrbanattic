/* eslint-disable prettier/prettier */
import {
  Injectable,
  InternalServerErrorException,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { User } from './entity/user.entity';
import { Repository } from 'typeorm';
import { CreateUserDto } from './dto/create.user.dto';
import { UpdateUserDto } from './dto/update.user.dto';

@Injectable()
export class UserService {
  constructor(
    @InjectRepository(User)
    private usersRepository: Repository<User>,
  ) {}

  async create(user: CreateUserDto) {
    try {
      return await this.usersRepository.save(user);
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error creating user');
      } else {
        throw error;
      }
    }
  }

  async getAll() {
    try {
      return await this.usersRepository.find();
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error getting users');
      } else {
        throw error;
      }
    }
  }

  async findOne(id: string) {
    try {
      return await this.usersRepository.findOneBy({ id: id });
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error getting user');
      } else {
        throw error;
      }
    }
  }

  async update(id: string, user: UpdateUserDto) {
    try {
      return await this.usersRepository.update({ id: id }, user);
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error updating user');
      } else {
        throw error;
      }
    }
  }

  async delete(id: string) {
    try {
      return await this.usersRepository.delete(id);
    } catch(error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error deleting user');
      } else {
        throw error;
      }
    }
  }

  async getByPhoneNumber(phoneNumber: string) {
    try {
      return await this.usersRepository.findOneBy({ phoneNumber: phoneNumber });
    } catch (error) {
      if (error instanceof InternalServerErrorException) {
        throw new InternalServerErrorException('Error getting user by phone number');
      } else {
        throw error;
      }
    }
  }
}
