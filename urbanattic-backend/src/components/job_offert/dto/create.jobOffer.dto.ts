export interface CreateJobOfferDto {
  title: string;
  description: string;
  attachments?: string[];
  expireAt: string;
}
