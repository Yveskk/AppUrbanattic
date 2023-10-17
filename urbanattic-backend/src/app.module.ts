import { MiddlewareConsumer, Module, NestModule } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { typeOrmConfig } from './config/typeOrm.config';
import { UserModule } from './components/user/user.module';
import { ProductModule } from './components/product/product.module';
import { ReservationModule } from './components/reservation/reservation.module';
import { AtticModule } from './components/attic/attic.module';
import { GroundModule } from './components/ground/ground.module';
import { JobOfferModule } from './components/job_offert/jobOffer.module';
import { Authorization } from './middlewares/authorization';

@Module({
  imports: [
    typeOrmConfig,
    UserModule,
    ProductModule,
    ReservationModule,
    AtticModule,
    GroundModule,
    JobOfferModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule implements NestModule {
  configure(consumer: MiddlewareConsumer): any {
    consumer.apply(Authorization).forRoutes('');
  }
}
