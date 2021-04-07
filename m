Return-Path: <SRS0=M/XH=JE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5CDDC433ED
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 14:59:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C4446113D
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 14:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C4446113D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Et4ROiYYKYMZyP72Qnp8q1ZL0pgu+zwViz9fq1Dh17k=; b=bpQafBCVAwColMCnDvwC3OHeiQ
	/pkIYX0LTbe1Goihneappi1dAPJXU1xxi/uwBXqrjBB0/Hw+aW7lYPKgtGvHCPBHvR1Nj2RyOysxR
	Hy/WwY23kdyBiiRpyxo+9nsG1PO+INk/nU6mlokWk/nahleVe5yNZdpvRi4cjXD/7c8Lr05dapNe0
	CrXzdD6V8hnV8Xk/RQrJRGtcU4deQNt+rZK/vVQOLMIG+pooqx1LlrQACQa6X8ctKfGwhsYRT8CeQ
	pWWAsQh+fb5dkGPGrBUPB4WzoLsqiJgxbWgrLlnc+oW9p0/h3Yoxe4Ay1OPPL5o3+5vFpCmHuwmSU
	gEUB7vMQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU9eU-005DuA-6b; Wed, 07 Apr 2021 14:59:30 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU9eO-005DtI-DE
 for linux-amlogic@lists.infradead.org; Wed, 07 Apr 2021 14:59:27 +0000
Received: by mail-ed1-x534.google.com with SMTP id r22so8751672edq.9
 for <linux-amlogic@lists.infradead.org>; Wed, 07 Apr 2021 07:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RhiVLxZ189Mfi2/3w2wk+mT3BSMHUmXI5aQWXNu5k2c=;
 b=zZoVhHro6L2LnmIIbWv4pad71Bvb0y4XyBmWu6P/hmrzntRYC0UoynxC+JhP2SKoXn
 UEzcesZpmt7p760jdD0RYi8NswCaIA3X+aKJW5tmY70iG49QyQW34o0HeYE/Iw7QuTxj
 a6GSlrLvuch1v7YuT1uXu0mApwSkZSjjeEO8Zf0820ze9vQ5dP1wqwTcGU5V0mtXEw8V
 cIziaxSKFvXB+k0Zi4h7WVHuTkIw23lFacZs7QDfM4n1zLia7x5pw+yD1CpWlDFQe3Hn
 QRkm2ORd+tRA4G1Zp3DrSUB7MkfwTPo2P+DOk7H3u9YsZZXwbIr0rIELnx3PdBGjYecq
 d5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RhiVLxZ189Mfi2/3w2wk+mT3BSMHUmXI5aQWXNu5k2c=;
 b=bt9DtGXVDgSv+/TVS135YT/8mtct8w+HPVWhKriDsNlfJaSTIsCohH6gjFpbiv+vVZ
 A/669oW1O0uFkQGxC6jqOTzaQwnRcqnTJfdwXlYiXCV1U3WRKAQL5GqJ5rNg2XG72E4E
 CT9pZyhB8zqBnszag2kxMGDRzeLg9mPSpjl1+i+OumNDJOrBz8O4POsRmT14iceFUQyt
 1Xef2s0L2kKiq1j0w/tVuIEBvG4BmSMQAooE4W96yqUhfQhmaakrM05K7k+VGqPOTl2t
 gORh6/Tc0YFk70K39qEPolOlekU9rQ/Hag5VXVLJv0KEze++MUUVX7S9xKl375vvFYbT
 HFCg==
X-Gm-Message-State: AOAM5302HS5bWSTV6P025huly29ePHk+uu7xGQ8az90VjnDyMQIaXWdA
 /VNCy6LdzldExGjO8I2FD5oMxA==
X-Google-Smtp-Source: ABdhPJxzmktfBJNJzlo7KcK7eCSOqr9CD9XKZcsYIEH7+/H04DXrYXnpi/VBjAARwmgiCznZjmuALA==
X-Received: by 2002:a05:6402:1606:: with SMTP id
 f6mr4867670edv.216.1617807563889; 
 Wed, 07 Apr 2021 07:59:23 -0700 (PDT)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id
 pj18sm6144647ejb.101.2021.04.07.07.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 07:59:23 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] ASoC: meson: axg-fifo: add NO_PERIOD_WAKEUP support
Date: Wed,  7 Apr 2021 16:59:14 +0200
Message-Id: <20210407145914.311479-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_155925_214590_CA70A2B7 
X-CRM114-Status: GOOD (  12.83  )
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

On the AXG family, the fifo irq is not necessary for the HW to operate.
It is just used to notify that a period has elapsed. If userpace does not
care for these wakeups (such as pipewire), we are just wasting CPU cycles.

Add support for NO_PERIOD_WAKEUP and disable irq when they are no needed.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index b2e867113226..b9af2d513e09 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -27,8 +27,8 @@ static struct snd_pcm_hardware axg_fifo_hw = {
 		 SNDRV_PCM_INFO_MMAP |
 		 SNDRV_PCM_INFO_MMAP_VALID |
 		 SNDRV_PCM_INFO_BLOCK_TRANSFER |
-		 SNDRV_PCM_INFO_PAUSE),
-
+		 SNDRV_PCM_INFO_PAUSE |
+		 SNDRV_PCM_INFO_NO_PERIOD_WAKEUP),
 	.formats = AXG_FIFO_FORMATS,
 	.rate_min = 5512,
 	.rate_max = 192000,
@@ -113,7 +113,7 @@ int axg_fifo_pcm_hw_params(struct snd_soc_component *component,
 {
 	struct snd_pcm_runtime *runtime = ss->runtime;
 	struct axg_fifo *fifo = axg_fifo_data(ss);
-	unsigned int burst_num, period, threshold;
+	unsigned int burst_num, period, threshold, irq_en;
 	dma_addr_t end_ptr;
 
 	period = params_period_bytes(params);
@@ -142,10 +142,11 @@ int axg_fifo_pcm_hw_params(struct snd_soc_component *component,
 	regmap_field_write(fifo->field_threshold,
 			   threshold ? threshold - 1 : 0);
 
-	/* Enable block count irq */
+	/* Enable irq if necessary  */
+	irq_en = runtime->no_period_wakeup ? 0 : FIFO_INT_COUNT_REPEAT;
 	regmap_update_bits(fifo->map, FIFO_CTRL0,
 			   CTRL0_INT_EN(FIFO_INT_COUNT_REPEAT),
-			   CTRL0_INT_EN(FIFO_INT_COUNT_REPEAT));
+			   CTRL0_INT_EN(irq_en));
 
 	return 0;
 }
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
