Return-Path: <SRS0=A4ao=2I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DA1AC2D0CD
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 17:24:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FF892467E
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 17:24:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cz/TkpPM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KiZx8uNr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FF892467E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G4yLg0gHfBijgLYIg7FdtWUiUfvsVQ5XY05e6msPFwM=; b=cz/TkpPMcwyCRe
	qByBC8gW4E7BmpYBWRQ92uOD7ou1VUFqk8x/IDvSSCLKtmhoqxWOlwcNk/lE9HPPCldWKyhz/mdNc
	S4GymtLKyj95D7GeM80xru4+0oUHM1O69ifggpDCPQczVjCLDsL2RJwemceDmRf09VVpeA+XX5QRz
	K99pcvOoBgdEVOOw12qx8sApexq5TYp1s/+SL+3fuKq1PKuFaBtET0QvOJopgQ28P82bOfwlL3yYy
	cPVkt0iyFIVREfU6Zov1etoVabpg1wVjHkQinqPACNS7r8SF4b7KBffBhPLry+x5MxnKHWXiot32+
	d4AzBHxSxAKX3BubowbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihd3x-0008TL-P8; Wed, 18 Dec 2019 17:24:41 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihd3q-0008KY-Ca
 for linux-amlogic@lists.infradead.org; Wed, 18 Dec 2019 17:24:36 +0000
Received: by mail-wm1-x344.google.com with SMTP id p17so2825265wmb.0
 for <linux-amlogic@lists.infradead.org>; Wed, 18 Dec 2019 09:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ed5DlqEWvxMQUQebFWG7u2PHMS/9BBAGCyGgvqZnXFo=;
 b=KiZx8uNrDxyr1CKrK3b3Awr2DIit9WJR7AcPGhvWh+Ke9RMBBmd6WxOoHo+tvd/q/U
 Vd88yOfuR+PmI8SIyl1Rq1yi0jopIL3Co9YOI4tOZ1xevV68SYk/Hv+F+zMeal3Dud7u
 FQE7uWelTZ2p/qj9Egevpr/DMohozAfSke97hCvCLczo8NzvXK0u2EilAijqxpLG5xOx
 yrKwR331SHgQhKO8GJEXHNt0szTAsSQKs3f+xhkQkJ9vEbdSfnFhF0E2u5uiUq4HXoHj
 a/5wUgK4r4F+MYvViijY3zW4dVF3vo75atXvOjboq7yx41hWoqaC4peqLJC5a41rRCb/
 5XeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ed5DlqEWvxMQUQebFWG7u2PHMS/9BBAGCyGgvqZnXFo=;
 b=lMTank9yHD7QcpRdeOt3pzRAcndD1iDWl0+mNLfo8tAeKEbqMD6eECBwXmfhWn6gYt
 3AeYRQTHNt13nWsHvmZRKj5En2RnawcEfbO8mnmz03AECLQOUIKfVfGJ1UfoB5+zQeGm
 zr6TGyMioAosf41huvX+Q/Cb/4RVikUhhx/MC3a+YkIN9bZl+HQEOIk2eGu+OeqQiE06
 S58BQQo6RjbQOpFjPjUB3aOzh4O4oFu5ZHIg0WMM3ZeFIDvvai9wTdE5yXmmmsynszze
 0T1RvY9zmmDAZZ7RN+aO+rts8F6M+tfM1Pe6UaIKjMuaiR+IIooG8WSWCGaI2NH9fUCW
 MW7g==
X-Gm-Message-State: APjAAAXhBsy7JUtTZfWee/dO4SJaVAW9uudvo+eftRJtFDyPAo+GRrXH
 OZlb4t9AOpXyS0K39kYC75DWhQ==
X-Google-Smtp-Source: APXvYqz1xXfHwFgFh5QLFX88XE5XgeTWKeWYDflM/DWqS6617x+CfPOPUBBnnPnD6LnKcIJMUh8fWA==
X-Received: by 2002:a1c:9814:: with SMTP id a20mr4437299wme.94.1576689872845; 
 Wed, 18 Dec 2019 09:24:32 -0800 (PST)
Received: from localhost.localdomain (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id 4sm2883231wmg.22.2019.12.18.09.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 09:24:32 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 4/4] ASoC: meson: axg-fifo: relax period size constraints
Date: Wed, 18 Dec 2019 18:24:20 +0100
Message-Id: <20191218172420.1199117-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191218172420.1199117-1-jbrunet@baylibre.com>
References: <20191218172420.1199117-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_092434_444827_9CCE0D23 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Now that the fifo depths and thresholds are properly in the axg-fifo
driver, we can relax the constraints on period. As long as the period is a
multiple of the fifo burst size (8 bytes) things should be OK.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.c | 8 ++++----
 sound/soc/meson/axg-fifo.h | 2 --
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index c2742a02d866..c12b0d5e8ebf 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -34,7 +34,7 @@ static struct snd_pcm_hardware axg_fifo_hw = {
 	.rate_max = 192000,
 	.channels_min = 1,
 	.channels_max = AXG_FIFO_CH_MAX,
-	.period_bytes_min = AXG_FIFO_MIN_DEPTH,
+	.period_bytes_min = AXG_FIFO_BURST,
 	.period_bytes_max = UINT_MAX,
 	.periods_min = 2,
 	.periods_max = UINT_MAX,
@@ -227,17 +227,17 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
 
 	/*
 	 * Make sure the buffer and period size are multiple of the FIFO
-	 * minimum depth size
+	 * burst
 	 */
 	ret = snd_pcm_hw_constraint_step(ss->runtime, 0,
 					 SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
-					 AXG_FIFO_MIN_DEPTH);
+					 AXG_FIFO_BURST);
 	if (ret)
 		return ret;
 
 	ret = snd_pcm_hw_constraint_step(ss->runtime, 0,
 					 SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
-					 AXG_FIFO_MIN_DEPTH);
+					 AXG_FIFO_BURST);
 	if (ret)
 		return ret;
 
diff --git a/sound/soc/meson/axg-fifo.h b/sound/soc/meson/axg-fifo.h
index 521b54e98fd3..b63acd723c87 100644
--- a/sound/soc/meson/axg-fifo.h
+++ b/sound/soc/meson/axg-fifo.h
@@ -31,8 +31,6 @@ struct snd_soc_pcm_runtime;
 					 SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE)
 
 #define AXG_FIFO_BURST			8
-#define AXG_FIFO_MIN_CNT		64
-#define AXG_FIFO_MIN_DEPTH		(AXG_FIFO_BURST * AXG_FIFO_MIN_CNT)
 
 #define FIFO_INT_ADDR_FINISH		BIT(0)
 #define FIFO_INT_ADDR_INT		BIT(1)
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
