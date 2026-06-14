import { Test, TestingModule } from '@nestjs/testing';
import { INestApplication } from '@nestjs/common';
import request from 'supertest';
import { App } from 'supertest/types';
import { getDataSourceToken } from '@nestjs/typeorm';
import { AppModule } from './../src/app.module';
import { AppService } from '../src/app.service';

describe('AppController (e2e)', () => {
  let app: INestApplication<App>;

  const mockDataSource = {
    query: jest.fn().mockResolvedValue([{ 1: 1 }]),
  };

  beforeEach(async () => {
    const moduleFixture: TestingModule = await Test.createTestingModule({
      imports: [AppModule],
    })
      .overrideProvider(getDataSourceToken())
      .useValue(mockDataSource)
      .compile();

    app = moduleFixture.createNestApplication();
    await app.init();
  });

  it('/ (GET) returns health status', () => {
    return request(app.getHttpServer())
      .get('/')
      .expect(200)
      .expect((res: request.Response) => {
        const body = res.body as AppService.GetHealth;
        expect(body.status).toBe('ok');
        expect(body.database).toBe('connected');
        expect(body).toHaveProperty('timestamp');
        expect(body).toHaveProperty('uptime');
      });
  });

  afterEach(async () => {
    await app.close();
  });
});
