import * as Joi from 'joi';

// ── Single source of truth for all env var keys ──────────────────────
// Raw strings only exist here. Every other file references by .property.
export const KEYS = {
  NODE_ENV: 'NODE_ENV',
  APP_PORT: 'APP_PORT',
  DB_HOST: 'DB_HOST',
  DB_PORT: 'DB_PORT',
  DB_USERNAME: 'DB_USERNAME',
  DB_PASSWORD: 'DB_PASSWORD',
  DB_DATABASE: 'DB_DATABASE',
} as const;

// ── Joi schema ───────────────────────────────────────────────────────
// Uses computed property names so keys are never repeated as raw strings.
export const envConfigSchema = Joi.object({
  [KEYS.NODE_ENV]: Joi.string()
    .valid('development', 'production', 'test', 'provision')
    .default('development'),
  [KEYS.APP_PORT]: Joi.number().port().default(3000),
  [KEYS.DB_HOST]: Joi.string().required(),
  [KEYS.DB_PORT]: Joi.number().port().default(5432),
  [KEYS.DB_USERNAME]: Joi.string().required(),
  [KEYS.DB_PASSWORD]: Joi.string().required(),
  [KEYS.DB_DATABASE]: Joi.string().required(),
});

// ── Typed interface ──────────────────────────────────────────────────
// Mirrors the shape so ConfigService<EnvConfig> returns typed values.
export interface EnvConfig {
  [KEYS.NODE_ENV]: 'development' | 'production' | 'test' | 'provision';
  [KEYS.APP_PORT]: number;
  [KEYS.DB_HOST]: string;
  [KEYS.DB_PORT]: number;
  [KEYS.DB_USERNAME]: string;
  [KEYS.DB_PASSWORD]: string;
  [KEYS.DB_DATABASE]: string;
}
