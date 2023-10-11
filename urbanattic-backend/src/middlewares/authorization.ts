import { HttpStatus, Injectable, NestMiddleware } from '@nestjs/common';
import { appConfig } from '../config/app.config';
import { NextFunction, Request, Response } from 'express';

@Injectable()
export class Authorization implements NestMiddleware {
  use(req: Request, res: Response, next: NextFunction): any {
    if (req.headers.urbanattickey === appConfig.apiKey) {
      next();
    } else {
      res.status(HttpStatus.UNAUTHORIZED).json({
        message: 'You are not authorized to make requests to this service',
        code: 1,
      });
    }
  }
}
