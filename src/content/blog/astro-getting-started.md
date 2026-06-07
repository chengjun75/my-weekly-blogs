---
title: 用 Astro 搭建极速静态博客
description: Astro 是一个专为内容驱动网站设计的现代框架，零 JS 默认输出，性能极致。本文介绍核心概念与工作流。
pubDate: 2026-06-03
tags: [技术, Astro, 前端]
---

Astro 是目前构建静态博客的最佳选择之一。它的核心设计理念是 **Islands Architecture**——只在需要交互的地方引入 JavaScript，其余全部输出纯 HTML。

## 核心优势

### 零 JS 默认

与 Next.js、Nuxt 等框架不同，Astro 默认不向客户端发送任何 JavaScript。一篇纯文字博客，就是一个纯 HTML 文件。

### 内容集合

Astro 的内容集合（Content Collections）提供类型安全的 Markdown 管理：

```ts
// src/content.config.ts
const blog = defineCollection({
  schema: z.object({
    title: z.string(),
    pubDate: z.coerce.date(),
  }),
});
```

### 构建速度

得益于 Vite 和 Go 编写的工具链，Astro 构建百篇文章的博客通常在 1 秒内完成。

## 工作流

1. 在 `src/content/blog/` 新建 `.md` 文件
2. 填写 frontmatter（标题、日期、描述）
3. 运行 `npm run dev` 实时预览
4. 推送到 GitHub，Vercel 自动部署

就是这么简单。

## 性能评分

一个配置合理的 Astro 博客，Lighthouse 评分通常在 **99-100** 之间。这对 SEO 和用户体验都极为重要。

---

开始写作吧，技术已经就绪。
