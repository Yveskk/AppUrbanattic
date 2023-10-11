import { Column, Entity, PrimaryColumn } from 'typeorm';

@Entity()
export class OfferService {
  @PrimaryColumn({ generated: 'uuid' })
  id: string;

  @Column()
  nameOfPerson: string;

  @Column()
  title: string;

  @Column()
  description: string;

  @Column()
  attic: string;

  @Column()
  status: string;

  @Column({ default: true })
  state: boolean;

  @Column({ default: Date.now() })
  createAt: string;

  @Column()
  createBy: string;
}
