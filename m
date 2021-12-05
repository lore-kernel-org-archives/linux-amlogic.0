Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A544C433F5
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Dec 2021 18:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=93L7AU/aK3bX6K2CErhmBRPohT9g24g4cG4uNRk8oxs=; b=1PdPOa2pGuVopB
	95wj/oUkazKe0G71s1t7MvKDRcxIoeeBLTqNH2ZtSUumWsQK/vVDBOZlRs74H749iYyM3wSxdP8G7
	dSTJ/wuRZs4BuWOamDc5hbuTi0ZmCVhNs4EfKXk60Kq6vIL/fHdV+96Tj61FMnQXvvYIufxLgNFGT
	Kp7MCcRm1Vr/nInvPbogdgQu7I7Otwwd9WneRXShg3JASVgNCeVaqOGyqEzkIK3xjJDMJ7uZ8usY+
	b497nDq1Ckr5zPq1X9khh2LUHocUfqsSmTD9+1Ds89+hsprHrVNF+jDPaNR3BXOl0pZ8E4NZHIsPQ
	gSh6gzYg82HjZebovwXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtvw7-001o0d-Cp; Sun, 05 Dec 2021 18:08:31 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtvw4-001nzQ-CN; Sun, 05 Dec 2021 18:08:29 +0000
Received: by mail-wr1-x42d.google.com with SMTP id u1so17529794wru.13;
 Sun, 05 Dec 2021 10:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wVbLQURO0Z9+ByAGWQaOmsfWDUK6bDVmhiIqKeEs0aE=;
 b=nFjzSkNR7Vt7NUjEHxsBt63+Y69rJq5h500HrTtMLIMNfhUgk7TR5niNnrdiFWf8WA
 +RQK/ThnUEuTN2rv5dzQc2IoCzA8BqP000JH4mLP9eotfQVdXcxKlBIx8rWDaFKgO6Fy
 pNwlAoPpzxF7X5rZcbuj2QuczHPULs64hnvYZf3i4xztjezQ5aRUfoDJ46KcglU4q+na
 NKx/oO6l3U0+oIlMDHDWpQnu+xzCeGds/oIXYweABOqsA4yX/mLk89PXAfZ5jAx7K8YY
 osT8Ld3oyXf1Zb4T3eqg8I8SQjsD7OOwSpfw1ICNlpOVu/RwdoX/pt/pGOK/rl4MAfMe
 yHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wVbLQURO0Z9+ByAGWQaOmsfWDUK6bDVmhiIqKeEs0aE=;
 b=J5ReAoul5nj/o48DawBPHTGs2Z4VHre8MCF2xn5k70g0nr1Pf1MVJ6KAGbadGifFuE
 IQY8WQgzWgS6xRB505+yiFN0f9PBzRCjMr95bW5+IIuul7+V13HJywHfC6Kq+5Pbqmtb
 Re7ocjpiG3drRhet0dN2mjaGnbwg8zY/jWvJKKg92JnNorLaQV5xpLlCg/waQxdIPDi6
 2NkntgWIjWbQu6d2Tg9c0Lc4MjeNNE7KIZqAs0ZBEw8W88ADocGy8igZprNIWBhuzjjd
 fh3w7acvEUWa1kyyf4ymckKjdgDYmcaDjaNbe7X8ASlKzephhYOO5p5LhmWewovTaQZI
 Nd9g==
X-Gm-Message-State: AOAM533b1V5fcpm2s/e00Gkyi8TS0ailmulDbQDJrgQ4IzWDodnZxCvh
 K+aW62Gzx/w4HJy2OI3D/cOZC8LC/Is=
X-Google-Smtp-Source: ABdhPJxrxANxSMd67C/dfrBs5aJyYKwDtHT0izw5kgpG/58jALhXD31larUKefLy5N5zKN1ZkX4fbw==
X-Received: by 2002:adf:fb82:: with SMTP id a2mr36968627wrr.168.1638727706827; 
 Sun, 05 Dec 2021 10:08:26 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c11b-a200-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c11b:a200:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id x13sm9250551wrr.47.2021.12.05.10.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 10:08:26 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 alsa-devel@alsa-project.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH RFC v1 1/2] ASoC: meson: aiu: fifo: Add missing
 dma_coerce_mask_and_coherent()
Date: Sun,  5 Dec 2021 19:08:15 +0100
Message-Id: <20211205180816.2083864-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211205180816.2083864-1-martin.blumenstingl@googlemail.com>
References: <20211205180816.2083864-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211205_100828_446746_4874500F 
X-CRM114-Status: GOOD (  10.02  )
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
