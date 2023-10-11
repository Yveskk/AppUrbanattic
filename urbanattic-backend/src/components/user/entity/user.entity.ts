import { Column, Entity, PrimaryColumn } from 'typeorm';

@Entity()
export class User {
  @PrimaryColumn({ generated: 'uuid' })
  id: string;

  @Column()
  lastName: string;

  @Column()
  firstName: string;

  @Column()
  phoneNumber: string;

  @Column()
  avatar: string;

  @Column()
  state: boolean;

  @Column({ default: Date.now() })
  createAt: string;

  @Column()
  role: string;
}
