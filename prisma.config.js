import 'dotenv/config';

const url = process.env.DATABASE_URL;

export default {
  schema: 'PangkasDB/prisma/schema.prisma',
  ...(url ? { datasource: { url } } : {}),
};
