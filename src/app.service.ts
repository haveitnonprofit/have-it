import { Injectable } from '@nestjs/common';
import { InjectDataSource } from '@nestjs/typeorm';
import { DataSource } from 'typeorm';

@Injectable()
export class AppService {
  constructor(@InjectDataSource() private readonly dataSource: DataSource) {}

  async getHealth() {
    let databaseStatus = 'disconnected';

    try {
      await this.dataSource.query('SELECT 1');
      databaseStatus = 'connected';
    } catch {
      databaseStatus = 'disconnected';
    }

    return {
      status: 'ok',
      database: databaseStatus,
      timestamp: new Date().toISOString(),
      uptime: process.uptime(),
    };
  }
}
