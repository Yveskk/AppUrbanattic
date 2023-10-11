import { Column, Entity, PrimaryColumn } from 'typeorm';

@Entity()
export class Ground {
  @PrimaryColumn({ generated: 'uuid' })
  id: string;

  @Column({ default: true })
  state: boolean;

  @Column()
  status: string;

  @Column({ default: Date.now() })
  createAt: string;

  @Column()
  atticId: string;

  @Column()
  createBy: string;

  @Column('text', { array: true, default: [] })
  attachments: string[];
}
