import { Column, Entity, PrimaryColumn } from 'typeorm';

@Entity()
export class Attic {
  @PrimaryColumn({ generated: 'uuid' })
  id: string;

  @Column()
  name: string;

  @Column({ default: Date.now() })
  createAt: string;

  @Column()
  createBy: string;

  @Column('text', { array: true, default: [] })
  images: string[];

  @Column({ default: true })
  state: boolean;

  @Column()
  openningTime: string;

  @Column()
  closureHour: string;
}
