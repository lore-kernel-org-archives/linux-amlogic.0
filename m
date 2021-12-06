Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D32C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Dec 2021 21:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=93L7AU/aK3bX6K2CErhmBRPohT9g24g4cG4uNRk8oxs=; b=ymyHg/LNh4owh4
	/kX1Fvwo7Fr7MXy8tSKobD3OWygh4l+R2K124oXYCfEVUlCm5JlzgUUvXAbc4+TYpgJUS1U419YQQ
	U4tHTef/zMrG2Xx4+fVeXtmRvPbmkb4TFuB2kxRSl1QZpxClasZJO9CMtHUY1cjWgVPFDEFp2oE8X
	ZgIrk4M9mdCePz5rgfq4Z+5GJwOSlKizc9zKH2gwGU6aoWrdXp7EQ1qkWO4tx/71efhh2dYxfR87H
	jGYIha+gayPeKsrzGD81BWB4ui8cR4LtMa59UXjbpmZuyM+13v/ENfiGzz7L1FOxGYYEmNYxo8eGm
	YMUMrOVc18taVpRPIEjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muLDr-005jss-56; Mon, 06 Dec 2021 21:08:31 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muLDj-005jpn-Ke; Mon, 06 Dec 2021 21:08:24 +0000
Received: by mail-wr1-x431.google.com with SMTP id u1so25011792wru.13;
 Mon, 06 Dec 2021 13:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wVbLQURO0Z9+ByAGWQaOmsfWDUK6bDVmhiIqKeEs0aE=;
 b=JJI/H5a668Mbw7an8DN7K5GFo+wMZtRO8iMv7j/qlsQGYFUIRN6UN8UO4pRQj4kE4Q
 3E+w1ZmIpJu3OuLUHoI9LMIe8ZBkG26ekEFAwXwIv2KDBvqWUqcgTuKHLPykX3Ai3Jm/
 e/lrTmT3Y4YmHzwAg4UvD7yr+Zw7wBUhk2EHakWmhWg36/pTFpm0yypEDi/g4CEjIiaZ
 0CdFL2GDfoNavQdQNPbIw64cGgxlrrYI0bIc03PrjA048vcvDH8SY1jLtta3PEblBI2j
 XvAdE7zk/vz8Ryvo7GHx+FCqS5wosrdXIsgXuIBBh5MaU09HaDgeLkAFqHFgrwn2i4Zb
 0aFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wVbLQURO0Z9+ByAGWQaOmsfWDUK6bDVmhiIqKeEs0aE=;
 b=jDNkd2iR/9jyyPwtnf17sqo3dsSSTIrulUhzdV8hb8sw66UC8eU8GIfjPN4PYGQwHy
 FO0R/HzEYDjgK/9F+gFJW/B99awUDqGOeOyTYtF+CdTn7csjTYGt13DthCsTfjXYyrdF
 4I1+MBam0LZSawH8mczioovJYh7DGmoWL/5Dn5qfdepjcgVKyvSrHFB6mfs4+FI2zvFU
 VRlEWfwgj5OaumKiu/rFy6dVzJ6ahQfjcXsKZPGeRraRLoByaMTm9DeeUlk7qrJSdzBK
 KgWMcVMYNivtZ7Cy5Dbp6+MI2xVhK8P48s9pSvfJqAOJoC8kUo7VxregH23cEV0BCjL2
 ISxg==
X-Gm-Message-State: AOAM53271R35GN1CBlJ72gqjyM5Vps8w1qnnzCyK/G9x3D9H2gAydUfF
 owM8f6PmO+QO4A/9iYM7jqedCrp3XK0=
X-Google-Smtp-Source: ABdhPJzEwhqm3P3YmM/t7Y0RuKivCcAhGdMYzJbPK7Wpsp6pnDkQCJuVYBBJQWzsPjGC43hmFI+h+Q==
X-Received: by 2002:adf:cd09:: with SMTP id w9mr44802888wrm.619.1638824902076; 
 Mon, 06 Dec 2021 13:08:22 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c0cf-f800-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c0cf:f800:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id p13sm511195wmi.0.2021.12.06.13.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 13:08:20 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	alsa-devel@alsa-project.org
Cc: jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org, lgirdwood@gmail.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 1/2] ASoC: meson: aiu: fifo: Add missing
 dma_coerce_mask_and_coherent()
Date: Mon,  6 Dec 2021 22:08:03 +0100
Message-Id: <20211206210804.2512999-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211206210804.2512999-1-martin.blumenstingl@googlemail.com>
References: <20211206210804.2512999-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_130823_716092_2F6D1BC0 
X-CRM114-Status: GOOD (  10.31  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The FIFO registers which take an DMA-able address are only 32-bit wide
on AIU. Add dma_coerce_mask_and_coherent() to make the DMA core aware of
this limitation.

Fixes: 6ae9ca9ce986bf ("ASoC: meson: aiu: add i2s and spdif support")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 sound/soc/meson/aiu-fifo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/meson/aiu-fifo.c b/sound/soc/meson/aiu-fifo.c
index 4ad23267cace..d67ff4cdabd5 100644
--- a/sound/soc/meson/aiu-fifo.c
+++ b/sound/soc/meson/aiu-fifo.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/dma-mapping.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
@@ -179,6 +180,11 @@ int aiu_fifo_pcm_new(struct snd_soc_pcm_runtime *rtd,
 	struct snd_card *card = rtd->card->snd_card;
 	struct aiu_fifo *fifo = dai->playback_dma_data;
 	size_t size = fifo->pcm->buffer_bytes_max;
+	int ret;
+
+	ret = dma_coerce_mask_and_coherent(card->dev, DMA_BIT_MASK(32));
+	if (ret)
+		return ret;
 
 	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
 				       card->dev, size, size);
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
