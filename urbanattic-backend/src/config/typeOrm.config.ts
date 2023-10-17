import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from '../components/user/entity/user.entity';
import { appConfig } from './app.config';
import { Product } from '../components/product/entity/product.entity';
import { Attic } from '../components/attic/entity/attic.entity';
import { Reservation } from '../components/reservation/entity/reservation.entity';
import { Ground } from '../components/ground/entity/ground.entity';
import { JobOffer } from '../components/job_offert/entity/jobOffer.entity';

export const typeOrmConfig = TypeOrmModule.forRoot({
  type: 'postgres',
  host: appConfig.dbHost,
  port: appConfig.dbPort,
  username: appConfig.dbUsername,
  password: appConfig.dbPassword,
  database: appConfig.dbName,
  entities: [User, Product, Attic, Reservation, Ground, JobOffer],
  synchronize: true,
});
