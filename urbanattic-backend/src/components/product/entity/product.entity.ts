import { Column, Entity, PrimaryColumn } from 'typeorm';

@Entity()
export class Product {
  @PrimaryColumn({ generated: 'uuid' })
  id: string;

  @Column()
  name: string;

  @Column({ default: Date.now() })
  createAt: string;

  @Column()
  createBy: string;

  @Column()
  quantity: number;

  @Column()
  limit: number;

  @Column({ default: false })
  state: boolean;

  @Column('text', { array: true })
  images: string[];

  @Column({ type: 'decimal', default: 0, scale: 2, precision: 10 })
  price: number;
}
