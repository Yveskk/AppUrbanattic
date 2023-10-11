import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { GroundController } from './ground.controller';
import { GroundService } from './ground.service';
import { Ground } from './entity/ground.entity';

@Module({
  imports: [TypeOrmModule.forFeature([Ground])],
  controllers: [GroundController],
  providers: [GroundService],
})
export class GroundModule {}
