Return-Path: <SRS0=YAuX=24=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CADC282DD
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jan 2020 21:47:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A12C206DB
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jan 2020 21:47:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XLwOAfKi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A12C206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2B+GAw8NjKmJNM6PZI35WM7sV7+ZOV+fvtlLvd1MJHs=; b=XLwOAfKiNSe4f0
	5/k3yqZJ5KRvzkMgnVkBQuSSVAzdd6iyI3GbhLa8HJLHxlgOj3quwmh59FDDFlGfCkJo6D1a8QNGM
	Pld1w76zNPGtQL5WOyp6vgX4zaqahwVcj3XgkizXUbXn56aw9W2MPblTM6FY+God0ZbdQ4tX85eKf
	Mzr/o0jHBXlD3IHv9puYQKpAz3wiCqIxpAliZg+0moONP+4J5rBGpYimRVO+NeL2d4RePGUKExNrB
	Pj2Cwd3IUVcMzS1Mr0VkehI1ZcMfej8/nRH0JPAiFLLz/RjOdQmKa+nDb02Eu48OuZqma5k8vKmIW
	Oca3aePucBZsgm4LDqhw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iowgu-0006I6-Gu; Tue, 07 Jan 2020 21:47:08 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iowgr-0006Hh-Fa; Tue, 07 Jan 2020 21:47:07 +0000
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MGiF0-1itqW425oI-00Dkb4; Tue, 07 Jan 2020 22:46:54 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] drm: meson: fix address type confusion
Date: Tue,  7 Jan 2020 22:46:37 +0100
Message-Id: <20200107214653.1173199-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:wHU1alzZM7DUOfIZA4V+q1kUWQ9fSj1sLyOxLkGIVefuXaF2Qf4
 0dWqG0koLC5sMSKZHs+Rq7VqJm9Ltr92efomWHYthb8SJbz30aSIm2vEYsmA+97gL+0lnCx
 RlYZYHnM2e/PazBB4zFGuQ+AvaidFU0+gFveFb9bhX0wB6sU7IURnkayUHVZyGyOBsWg0tD
 xMwmar+1tDp7m2L/vGK7Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IEWNgCfP+i0=:V2b+bPHrEXB28s1CzTWRgv
 axFsPGMB6o0KEZ8t0nuWBf9k87EuD8qG/QWgNwehlloljoKtn4wc1xtK4+uaqxhU5xmFjIK1K
 MNsv+Er4YSGOSsAXJITPBU1RSYliRA+C20aBiZG4IxApbgyLu45j+or4C9YxER7VkdSm386Ym
 H0nznJw1Odi65hqIrAgHo2jBYKwkAE2eG5goQHQGAWWG4oGGOUl/JzKmdOHs504TchgGaUIXt
 5Uhrmp3FV96v9kVYa/fQfsvLWlJHOcD4/43Is5uu5iEhZ6zPIf/7kGhlcmVIs9FqkLmlvmiFh
 XlMbZqXsSVQUnsYh22IoHQl1rDSiqqENOFrXlC8ywI2knKcOjJ4xw8ut9Rv8NUpQ7dDZTBm9/
 udby0QyJJXj6JAALwk4yZm3poSpV44ag7MU6PwdPSQqX0zaejIuBFFHvaL0U7I6xQBmvMLdSu
 RT9dhzdPgoDancPKFOoh97eXXyAqKjH+PCqTAbzFlzQDDJLSS+GSKVhjlQ/Js4fPEHslermL9
 6C10LSKFrVWMNthk6Dc79xwMbSAzt0688ektXtF1ZyWHgL1EvmL1mKni/VUX6mae0uue0V5i5
 HTIblp9oDE3JQZZlWQm2RW+nSrD6xv5jO+phorJY8VR+fVGks0DKoziB74qZEbOpVYqrZMWtV
 63kPKqcGO0ruLLevV4q996JD6MKRO8H5dM9mYkZpBZRUWuz7BNmxSCOs5SP3TBQRUQXtHQEqw
 WzFpg9VHq/a6WMAdDCB9pXX9x+oiskQ40cw3kvTqb3hf7LN1n9VJHxer8qghK7cn2yIhlSqXs
 HLql5WXFGkvzPRPmUEMz6M6gyGd5VX9VdRp8yoGmx+wx9G4xuNgpGi1dQKr1SWHTq0zorA+sy
 SM7kHj54PjL65KJceAiA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_134705_812640_8DF3AD6B 
X-CRM114-Status: GOOD (  12.28  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Julien Masson <jmasson@baylibre.com>,
 Maxime Jourdan <mjourdan@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Casting a pointer to dma_addr_t produces a warning:

drivers/gpu/drm/meson/meson_rdma.c: In function 'meson_rdma_free':
drivers/gpu/drm/meson/meson_rdma.c:59:25: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
  priv->rdma.addr_phys = (dma_addr_t)NULL;

In this case, it's worse because the variable name has the suffix
'_phys', which often indicates a phys_addr_t rather than dma_addr_t,
i.e. yet another incompatible type.

Change it to use consistent naming and avoid NULL.

Fixes: 63fba242c464 ("drm/meson: add RDMA module driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/meson/meson_drv.h  |  2 +-
 drivers/gpu/drm/meson/meson_rdma.c | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
index f9a0c8e9d4d0..04fdf3826643 100644
--- a/drivers/gpu/drm/meson/meson_drv.h
+++ b/drivers/gpu/drm/meson/meson_drv.h
@@ -135,7 +135,7 @@ struct meson_drm {
 	} venc;
 
 	struct {
-		dma_addr_t addr_phys;
+		dma_addr_t addr_dma;
 		uint32_t *addr;
 		unsigned int offset;
 	} rdma;
diff --git a/drivers/gpu/drm/meson/meson_rdma.c b/drivers/gpu/drm/meson/meson_rdma.c
index 25b34b1e72a7..130382178c63 100644
--- a/drivers/gpu/drm/meson/meson_rdma.c
+++ b/drivers/gpu/drm/meson/meson_rdma.c
@@ -27,7 +27,7 @@ int meson_rdma_init(struct meson_drm *priv)
 		/* Allocate a PAGE buffer */
 		priv->rdma.addr =
 			dma_alloc_coherent(priv->dev, SZ_4K,
-					   &priv->rdma.addr_phys,
+					   &priv->rdma.addr_dma,
 					   GFP_KERNEL);
 		if (!priv->rdma.addr)
 			return -ENOMEM;
@@ -47,16 +47,16 @@ int meson_rdma_init(struct meson_drm *priv)
 
 void meson_rdma_free(struct meson_drm *priv)
 {
-	if (!priv->rdma.addr && !priv->rdma.addr_phys)
+	if (!priv->rdma.addr && !priv->rdma.addr_dma)
 		return;
 
 	meson_rdma_stop(priv);
 
 	dma_free_coherent(priv->dev, SZ_4K,
-			  priv->rdma.addr, priv->rdma.addr_phys);
+			  priv->rdma.addr, priv->rdma.addr_dma);
 
 	priv->rdma.addr = NULL;
-	priv->rdma.addr_phys = (dma_addr_t)NULL;
+	priv->rdma.addr_dma = (dma_addr_t)0;
 }
 
 void meson_rdma_setup(struct meson_drm *priv)
@@ -118,11 +118,11 @@ void meson_rdma_flush(struct meson_drm *priv)
 	meson_rdma_stop(priv);
 
 	/* Start of Channel 1 register writes buffer */
-	writel(priv->rdma.addr_phys,
+	writel(priv->rdma.addr_dma,
 	       priv->io_base + _REG(RDMA_AHB_START_ADDR_1));
 
 	/* Last byte on Channel 1 register writes buffer */
-	writel(priv->rdma.addr_phys + (priv->rdma.offset * RDMA_DESC_SIZE) - 1,
+	writel(priv->rdma.addr_dma + (priv->rdma.offset * RDMA_DESC_SIZE) - 1,
 	       priv->io_base + _REG(RDMA_AHB_END_ADDR_1));
 
 	/* Trigger Channel 1 on VSYNC event */
-- 
2.20.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
