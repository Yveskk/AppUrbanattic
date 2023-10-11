import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  Put,
} from '@nestjs/common';
import { OfferServiceService } from './offerService.service';

@Controller('offer-service')
export class OfferServiceController {
  constructor(private readonly offerServiceService: OfferServiceService) {}

  @Post()
  async createOfferService(@Body() body: any) {
    return await this.offerServiceService.create(body);
  }

  @Get()
  async getOfferServices() {
    return await this.offerServiceService.getAll();
  }

  @Get(':id')
  async getOfferService(@Param('id') id: string) {
    return await this.offerServiceService.findOne(id);
  }

  @Delete(':id')
  async deleteOfferService(@Param('id') id: string) {
    return await this.offerServiceService.delete(id);
  }

  @Put(':id')
  async updateOfferService(@Param('id') id: string, @Body() body: any) {
    return await this.offerServiceService.update(id, body);
  }
}
