import {
  Body,
  Controller,
  Delete,
  Get,
  HttpStatus,
  Param,
  Post,
  Put,
  Res,
} from '@nestjs/common';
import { ReservationService } from './reservation.service';
import { Response } from 'express';

@Controller('reservation')
export class ReservationController {
  constructor(private readonly reservationService: ReservationService) {}

  @Post()
  async createReservation(@Body() body: any, @Res() res: Response) {
    try {
      const reservation = await this.reservationService.create(body);
      res.status(HttpStatus.CREATED).json({
        message: 'Reservation create',
        code: 0,
        data: reservation,
      });
    } catch (e) {
      res.status(HttpStatus.BAD_REQUEST).json({
        message: 'Reservation not create',
        code: 1,
        error: e,
      });
    }
  }

  @Get()
  async getReservations(@Res() res: Response) {
    try {
      const reservations = await this.reservationService.getAll();
      res.status(HttpStatus.OK).send(reservations);
    } catch (e) {
      res.status(HttpStatus.BAD_REQUEST).json({
        message: 'Reservation not found',
        code: 1,
        error: e,
      });
    }
  }

  @Get(':id')
  async getReservation(@Param('id') id: string, @Res() res: Response) {
    try {
      const reservation = await this.reservationService.getById(id);
      if (reservation == null) {
        res.status(HttpStatus.NOT_FOUND).json({
          message: 'Reservation not found',
          code: 0,
        });
      } else {
        res.status(HttpStatus.OK).send(reservation);
      }
    } catch (e) {
      res.status(HttpStatus.BAD_REQUEST).json({
        message: 'Reservation not found',
        code: 1,
        error: e,
      });
    }
  }

  @Get('user/:uid')
  async getReservationByUser(@Param('uid') uid: string, @Res() res: Response) {
    try {
      const reservations = await this.reservationService.getByUser(uid);
      res.status(HttpStatus.OK).send(reservations);
    } catch (e) {
      res.status(HttpStatus.BAD_REQUEST).json({
        message: 'Reservation not found',
        code: 1,
        error: e,
      });
    }
  }

  @Put(':id')
  async updateReservation(
    @Param('id') id: string,
    @Body() body: any,
    @Res() res: Response,
  ) {
    try {
      await this.reservationService.update(id, body);
      res.status(HttpStatus.OK).json({
        message: 'Reservation update',
        code: 0,
      });
    } catch (e) {
      res.status(HttpStatus.NOT_MODIFIED).json({
        message: 'Reservation not update',
        code: 1,
        error: e,
      });
    }
  }

  @Delete(':id')
  async deleteReservation(@Param('id') id: string, @Res() res: Response) {
    try {
      await this.reservationService.delete(id);
      res.status(HttpStatus.OK).json({
        message: 'Reservation delete',
        code: 0,
      });
    } catch (e) {
      res.status(HttpStatus.BAD_REQUEST).json({
        message: 'Reservation not delete',
        code: 1,
        error: e,
      });
    }
  }
}
