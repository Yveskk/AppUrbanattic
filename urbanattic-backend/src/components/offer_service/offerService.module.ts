import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { OfferService } from './entity/offerService.entity';
import { OfferServiceController } from './offerService.controller';
import { OfferServiceService } from './offerService.service';

@Module({
  imports: [TypeOrmModule.forFeature([OfferService])],
  controllers: [OfferServiceController],
  providers: [OfferServiceService],
})
export class OfferServiceModule {}
