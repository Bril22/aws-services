import { ValidationPipe } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { Router } from 'express';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  const router = Router();

  app.useGlobalPipes(
    new ValidationPipe({
      whitelist: true,
    }),
  );
  await app.listen(3333);
}
bootstrap();
