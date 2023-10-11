export interface CreateReservationDto {
  date: string;
  arrivingTime: string;
  departureTime: string;
  applicant: string;
  totalPrice: number;
  numberOfPersons: number;
  atticId: string;
  state: boolean;
}
