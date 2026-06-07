import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';

// Vercel 自动注入 VERCEL_URL；本地开发回退到 localhost
const site =
  process.env.SITE_URL ||
  (process.env.VERCEL_URL ? `https://${process.env.VERCEL_URL}` : 'http://localhost:4321');

export default defineConfig({
  site,
  integrations: [sitemap()],
  output: 'static',
});
