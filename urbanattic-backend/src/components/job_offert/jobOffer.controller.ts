/* eslint-disable prettier/prettier */
import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  Put,
} from '@nestjs/common';
import { JobOfferService } from './jobOffer.service';
import { JobOfferGateway } from 'src/components/job_offert/jobOffer.gateway';

@Controller('joboffer')
export class JobOfferController {
  constructor(
    private readonly jobOfferService: JobOfferService,
    private jobOfferGateway: JobOfferGateway,
  ) {}

  @Post()
  async createJobOffer(@Body() body: any) {
    const jobOffer = await this.jobOfferService.create(body);
    this.jobOfferGateway.handleNewJobOffer(jobOffer);
    return jobOffer;
  }

  @Get()
  async getJobOffers() {
    return await this.jobOfferService.getAll();
  }

  @Get(':id')
  async getJobOffer(@Param('id') id: string) {
    return await this.jobOfferService.findOne(id);
  }

  @Delete(':id')
  async deleteJobOffer(@Param('id') id: string) {
    return await this.jobOfferService.delete(id);
  }

  @Put(':id')
  async updateJobOffer(@Param('id') id: string, @Body() body: any) {
    return await this.jobOfferService.update(id, body);
  }
}
