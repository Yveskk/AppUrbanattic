import { Column, Entity, PrimaryColumn } from 'typeorm';

@Entity()
export class Order {
  @PrimaryColumn({ generated: 'uuid' })
  id: string;

  @Column({ type: 'text', array: true, default: [] })
  products: string[];

  @Column({ default: Date.now() })
  createAt: string;

  @Column()
  createBy: string;

  @Column()
  status: string;

  @Column({ default: true })
  state: boolean;
}
