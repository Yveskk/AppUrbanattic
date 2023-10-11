import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Attic } from './entity/attic.entity';
import { AtticService } from './attic.service';
import { AtticController } from './attic.controller';

@Module({
  imports: [TypeOrmModule.forFeature([Attic])],
  controllers: [AtticController],
  providers: [AtticService],
})
export class AtticModule {}




