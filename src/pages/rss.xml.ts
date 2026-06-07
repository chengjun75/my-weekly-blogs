import rss from '@astrojs/rss';
import { getCollection } from 'astro:content';
import type { APIContext } from 'astro';

export async function GET(context: APIContext) {
  const posts = (await getCollection('blog', ({ data }) => !data.draft))
    .sort((a, b) => b.data.pubDate.valueOf() - a.data.pubDate.valueOf());

  return rss({
    title: '周度观察',
    description: '每周更新行业观察、认知思考与随笔干货',
    site: context.site!,
    items: posts.map(post => ({
      title: post.data.title,
      pubDate: post.data.pubDate,
      description: post.data.description,
      link: `/blog/${post.id}/`,
    })),
    customData: [
      `<language>zh-CN</language>`,
      `<lastBuildDate>${new Date().toUTCString()}</lastBuildDate>`,
      `<managingEditor>noreply@example.com (周度观察)</managingEditor>`,
      `<ttl>10080</ttl>`,  // 7 days in minutes
    ].join('\n'),
    stylesheet: '/rss-styles.xsl',
  });
}
