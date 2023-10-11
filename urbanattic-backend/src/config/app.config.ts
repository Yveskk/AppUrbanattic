//import * as process from 'process';
import * as dotenv from 'dotenv';
dotenv.config();

export const appConfig = {
  apiKey: process.env.API_KEY,
  port: parseInt(process.env.PORT, 10),
  dbHost: process.env.DB_HOST,
  dbUsername: process.env.DB_USERNAME,
  dbPassword: process.env.DB_PASSWORD,
  dbName: process.env.DB_NAME,
  dbPort: parseInt(process.env.DB_PORT, 10),
};
