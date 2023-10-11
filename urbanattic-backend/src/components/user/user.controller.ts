import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  Put,
} from '@nestjs/common';
import { UserService } from './user.service';

@Controller('user')
export class UserController {
  constructor(private readonly userService: UserService) {}

  @Post()
  async createUser(@Body() body: any) {
    return await this.userService.create(body);
  }

  @Get()
  async getUsers() {
    return await this.userService.getAll();
  }

  @Get(':id')
  async getUser(@Param('id') id: string) {
    return await this.userService.findOne(id);
  }

  @Put(':id')
  async updateUser(@Param('id') id: string, @Body() body: any) {
    return await this.userService.update(id, body);
  }

  @Delete(':id')
  async deleteUser(@Param('id') id: string) {
    return await this.userService.delete(id);
  }

  @Get('search/:phoneNumber')
  async getUserByPhoneNumber(@Param('phoneNumber') phoneNumber: string) {
    return await this.userService.getByPhoneNumber(phoneNumber);
  }
}
