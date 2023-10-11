import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  Put,
} from '@nestjs/common';
import { AtticService } from './attic.service';

@Controller('attic')
export class AtticController {
  constructor(private readonly atticService: AtticService) {}

  @Get()
  async getAttics() {
    return await this.atticService.getAll();
  }

  @Post()
  async createAttic(@Body() body: any) {
    return await this.atticService.create(body);
  }

  @Put(':id')
  async updateAttic(@Param('id') id: string, @Body() body: any) {
    return await this.atticService.update(id, body);
  }

  @Get(':id')
  async getAttic(@Param('id') id: string) {
    return await this.atticService.findOne(id);
  }

  @Get('search/:name')
  async searchByName(@Param('name') name: string) {
    return await this.atticService.getByName(name);
  }

  @Delete(':id')
  async deleteAttic(@Param('id') id: string) {
    return await this.atticService.delete(id);
  }
}
