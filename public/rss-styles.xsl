<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:atom="http://www.w3.org/2005/Atom" xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="zh-CN">
    <head>
      <title><xsl:value-of select="/rss/channel/title"/> RSS 订阅</title>
      <meta charset="UTF-8"/>
      <meta name="viewport" content="width=device-width, initial-scale=1"/>
      <style>
        body { font-family: -apple-system, system-ui, sans-serif; max-width: 680px; margin: 3rem auto; padding: 0 1.5rem; color: #1a1a18; line-height: 1.7; }
        h1 { font-size: 1.5rem; font-weight: 700; margin-bottom: 0.5rem; }
        .meta { color: #6b6b66; font-size: 0.875rem; margin-bottom: 2rem; }
        .item { border-top: 1px solid #e8e8e4; padding: 1.25rem 0; }
        .item h2 { font-size: 1rem; font-weight: 600; margin-bottom: 0.25rem; }
        .item h2 a { color: inherit; text-decoration: none; }
        .item h2 a:hover { text-decoration: underline; }
        .item-date { font-size: 0.8rem; color: #6b6b66; margin-bottom: 0.5rem; }
        .item-desc { font-size: 0.9rem; color: #444; }
        @media (prefers-color-scheme: dark) {
          body { background: #0f0f0e; color: #e8e8e4; }
          .meta, .item-date { color: #888884; }
          .item { border-color: #2a2a26; }
          .item-desc { color: #aaa; }
        }
      </style>
    </head>
    <body>
      <h1><xsl:value-of select="/rss/channel/title"/></h1>
      <p class="meta">
        RSS 订阅 · <a><xsl:attribute name="href"><xsl:value-of select="/rss/channel/link"/></xsl:attribute>访问博客</a>
      </p>
      <xsl:for-each select="/rss/channel/item">
        <div class="item">
          <h2><a><xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute><xsl:value-of select="title"/></a></h2>
          <div class="item-date"><xsl:value-of select="pubDate"/></div>
          <div class="item-desc"><xsl:value-of select="description"/></div>
        </div>
      </xsl:for-each>
    </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
