import { Column, Entity, PrimaryColumn } from 'typeorm';

@Entity()
export class Reservation {
  @PrimaryColumn({ generated: 'uuid' })
  id: string;

  @Column()
  date: string;

  @Column()
  arrivingTime: string;

  @Column()
  departureTime: string;

  @Column()
  applicant: string;

  @Column({ type: 'decimal', scale: 2, precision: 10 })
  totalPrice: number;

  @Column()
  numberOfPersons: number;

  @Column()
  atticId: string;

  @Column({ default: true })
  state: boolean;

  @Column({ default: Date.now() })
  createAt: string;
}
