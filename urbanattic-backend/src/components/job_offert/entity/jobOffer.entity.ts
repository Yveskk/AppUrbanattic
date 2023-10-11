import { Column, Entity, PrimaryColumn } from 'typeorm';

@Entity()
export class JobOffer {
  @PrimaryColumn({ generated: 'uuid' })
  id: string;

  @Column()
  title: string;

  @Column()
  description: string;

  @Column('text', { array: true })
  attachments: string[];

  @Column({ default: Date.now() })
  createAt: string;

  @Column({ default: true })
  state: boolean;

  @Column()
  expireAt: string;
}
