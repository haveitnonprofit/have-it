import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { KEYS, type EnvConfig } from './env.config';

@Injectable()
export class AppConfigService {
  constructor(private readonly configService: ConfigService<EnvConfig>) {}

  get nodeEnv(): EnvConfig[typeof KEYS.NODE_ENV] {
    return this.configService.get<EnvConfig[typeof KEYS.NODE_ENV]>(
      KEYS.NODE_ENV,
    )!;
  }

  get appPort(): EnvConfig[typeof KEYS.APP_PORT] {
    return this.configService.get<EnvConfig[typeof KEYS.APP_PORT]>(
      KEYS.APP_PORT,
    )!;
  }

  get db(): {
    host: EnvConfig[typeof KEYS.DB_HOST];
    port: EnvConfig[typeof KEYS.DB_PORT];
    username: EnvConfig[typeof KEYS.DB_USERNAME];
    password: EnvConfig[typeof KEYS.DB_PASSWORD];
    database: EnvConfig[typeof KEYS.DB_DATABASE];
  } {
    return {
      host: this.configService.get<EnvConfig[typeof KEYS.DB_HOST]>(
        KEYS.DB_HOST,
      )!,
      port: this.configService.get<EnvConfig[typeof KEYS.DB_PORT]>(
        KEYS.DB_PORT,
      )!,
      username: this.configService.get<EnvConfig[typeof KEYS.DB_USERNAME]>(
        KEYS.DB_USERNAME,
      )!,
      password: this.configService.get<EnvConfig[typeof KEYS.DB_PASSWORD]>(
        KEYS.DB_PASSWORD,
      )!,
      database: this.configService.get<EnvConfig[typeof KEYS.DB_DATABASE]>(
        KEYS.DB_DATABASE,
      )!,
    };
  }
}
