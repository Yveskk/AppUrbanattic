/* eslint-disable prettier/prettier */
import {
  SubscribeMessage,
  WebSocketGateway,
  WebSocketServer,
} from '@nestjs/websockets';
import { Server } from 'socket.io';

@WebSocketGateway({
  cors: {
    origin: '*',
  },
})
export class JobOfferGateway {
  @WebSocketServer()
  server: Server;

  @SubscribeMessage('newJobOffer')
  handleNewJobOffer(data: any) {
    this.server.emit('newJobOffer', data);
  }
}
