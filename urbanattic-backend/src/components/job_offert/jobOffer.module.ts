/* eslint-disable prettier/prettier */
import { Module } from '@nestjs/common';
import { JobOfferController } from './jobOffer.controller';
import { JobOfferService } from './jobOffer.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { JobOffer } from './entity/jobOffer.entity';
import { JobOfferGateway } from './jobOffer.gateway';

@Module({
  imports: [TypeOrmModule.forFeature([JobOffer])],
  controllers: [JobOfferController],
  providers: [JobOfferService, JobOfferGateway],
})
export class JobOfferModule {}
