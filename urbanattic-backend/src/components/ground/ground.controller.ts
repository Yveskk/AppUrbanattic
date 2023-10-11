import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  Put,
} from '@nestjs/common';
import { GroundService } from './ground.service';

@Controller('ground')
export class GroundController {
  constructor(private readonly groundService: GroundService) {}

  @Post()
  async createGround(@Body() body: any) {
    return await this.groundService.create(body);
  }

  @Put(':id')
  async updateGround(@Param('id') id: string, @Body() body: any) {
    return await this.groundService.update(id, body);
  }

  @Delete(':id')
  async deleteGround(@Param('id') id: string) {
    return await this.groundService.delete(id);
  }

  @Get('user/:uid')
  async getGroundsByUser(@Param('uid') uid: string) {
    return await this.groundService.getByUser(uid);
  }
}
