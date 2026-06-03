import { execSync } from 'child_process';
import { existsSync } from 'fs';
import { resolve } from 'path';

const cwd = process.cwd();
const prismaCli = resolve(cwd, 'node_modules/prisma/build/index.js');
const schema = resolve(cwd, 'PangkasDB/prisma/schema.prisma');

console.log(`[build] cwd: ${cwd}`);
console.log(`[build] prisma CLI: ${existsSync(prismaCli)}`);
console.log(`[build] schema: ${existsSync(schema)}`);

if (!existsSync(prismaCli)) {
  console.error('[build] prisma CLI not found at', prismaCli);
  process.exit(1);
}

if (!existsSync(schema)) {
  console.error('[build] schema not found at', schema);
  process.exit(1);
}

try {
  execSync(
    `node "${prismaCli}" generate --schema="${schema}"`,
    { stdio: 'inherit', cwd }
  );
  console.log('[build] prisma generate OK');
} catch (err) {
  console.error('[build] prisma generate failed:', err.message);
  process.exit(1);
}
