Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78705C52D73
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Aug 2024 16:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C/Fxw9WxAqrc3PKVwYi8E2xsgA+UBnLr4bdygyQcQ1c=; b=wuhK8sSdyhAhJa
	4KQqIfsJOqcVRrYBASB3wQF90k7kbjrfYSdEjlZ2Uzb+T8vedFNk289adIAuuWzJBazvAaw/GRbNH
	9Rdvzie6qCQBFp9tS+WQuxpQhP0iHFuw6ephX6CdWinDfEEc0+tM0uFxXgL6ZqQJR/Ab3vpnkLgtr
	CvR6tz4EPgUvl4LtIV90bJWie1aIHMqupQiT+wIvdtbaf9sjPCYxD8BCpFS1XiAbpK2V8ujJD6ldt
	a446MsC5El7XEjHg8scL8nJ6mBCp8RWo9FQ3TgVsp0ZXUDFU/ddkHZzof6K+JXYsZ/8MWntEmK5Kv
	c+jKBZoYchqBnE5Q9yFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbjVS-00000005ftc-1PJf;
	Wed, 07 Aug 2024 16:27:22 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbjVO-00000005frZ-2U2A
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Aug 2024 16:27:20 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-367990aaef3so21037f8f.0
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Aug 2024 09:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723048036; x=1723652836; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x+dBIqzE9uz4423Miwg6qL/QPsaguESKxdu18p0e9Wk=;
        b=Q+Rn9h8AWoWJw0uuprx75tsSHXshJVJQoTDqX2wX6VYwWoeovzHYEztd7+q0ORGHZb
         YLBjUKhNdLtKicJSxNxCDwEtUsadcH4gv4+DSHDdhN5nvmuQ9ipsLJf28c2yK/6qVHlh
         knyE77rWf+S8s30xymvlzHWmv5DnIkUosBYXHUrGMD09luWHo6/lpCDOBYzwqO4DOLTS
         iBTUH/zia4rLFHX1vg4OhVN2n+RKC1JAqy7RuxVMpT/VOEl4YfgQngy25XMQ8OFnMcGJ
         BZY5WmcXATLxjYdj86bqIykkTqUC39pQlHIw6TxrNDs+n0L8fs7w8K0nY+01F/LsuZsM
         pcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723048036; x=1723652836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+dBIqzE9uz4423Miwg6qL/QPsaguESKxdu18p0e9Wk=;
        b=xCQLs0uAxmAZfArtzWwRpDrnRBttibztb0V6U3i9lf5csLVpPFThOJC5iOq/kuJAU2
         ghTJqMf3RKoihvqq9J4p0XZrbGO0+YoyqwQ241Bn3oQXyV5KZshIdUIGmahkDbNYt0jw
         BPcXeS/CDWsuCm0DoQJSxklH/l0Q7F1ggKDwUXyxdr22Sh9W0a7/Bz31U2AK0ThoGwrP
         NMa16/StlrpB2HlloBn+77+wePOulFhyBOTuHqanTRj7BRBwkGL0XsHkRYa9ogNShSHA
         Z2BUmVanJ/DMylbFArD0fotylgccmMs5N3IlCno/CwBkN6xZ3ZrHv3D1zVj9Su1xjTfj
         CuIA==
X-Forwarded-Encrypted: i=1; AJvYcCX3i/2Kl9Tpf0EHZyScdo2VLjbS0nvj2+fd0uTP5UU1/43Coqq70L8m7uzJ59Bej2E5KAyVjFMFcs4vYRJETUM07YE4X0tV8Pg1oLniyki62wg=
X-Gm-Message-State: AOJu0YyWw/RtsBDF4hdL3dUxmKKGQw9iPs0IeCdUjwAfqqwEXcSRwhFi
	Xekz7zTrMHhOc0iMM1jZlbjE6CI9rMTeprZds8c68uHXj7vlmStcjVRZfTIRPVc=
X-Google-Smtp-Source: AGHT+IFwKsKtdGBREmHTq2kOs7k4+/3e+X9EV8QnAXRSEkHZm0dwuN3Fu+VfeXznpGNYYLj47KdTtw==
X-Received: by 2002:a5d:5c87:0:b0:36b:bd75:ed73 with SMTP id ffacd0b85a97d-36bbd75ef23mr13891573f8f.23.1723048036168;
        Wed, 07 Aug 2024 09:27:16 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:90f1:3c4c:261c:b0f5])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36bbd169697sm16494184f8f.107.2024.08.07.09.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 09:27:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Arseniy Krasnov <avkrasnov@salutedevices.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v2] ASoC: meson: axg-fifo: fix irq scheduling issue with PREEMPT_RT
Date: Wed,  7 Aug 2024 18:27:03 +0200
Message-ID: <20240807162705.4024136-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240807_092718_920152_A3A1BBAC 
X-CRM114-Status: GOOD (  13.52  )
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

With PREEMPT_RT enabled a spinlock_t becomes a sleeping lock.

This is usually not a problem with spinlocks used in IRQ context since
IRQ handlers get threaded. However, if IRQF_ONESHOT is set, the primary
handler won't be force-threaded and runs always in hardirq context. This is
a problem because spinlock_t requires a preemptible context on PREEMPT_RT.

In this particular instance, regmap mmio uses spinlock_t to protect the
register access and IRQF_ONESHOT is set on the IRQ. In this case, it is
actually better to do everything in threaded handler and it solves the
problem with PREEMPT_RT.

Reported-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
Closes: https://lore.kernel.org/linux-amlogic/20240729131652.3012327-1-avkrasnov@salutedevices.com
Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Fixes: b11d26660dff ("ASoC: meson: axg-fifo: use threaded irq to check periods")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 7e6090af720b..75909196b769 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -207,25 +207,18 @@ static irqreturn_t axg_fifo_pcm_irq_block(int irq, void *dev_id)
 	status = FIELD_GET(STATUS1_INT_STS, status);
 	axg_fifo_ack_irq(fifo, status);
 
-	/* Use the thread to call period elapsed on nonatomic links */
-	if (status & FIFO_INT_COUNT_REPEAT)
-		return IRQ_WAKE_THREAD;
+	if (status & ~FIFO_INT_COUNT_REPEAT)
+		dev_dbg(axg_fifo_dev(ss), "unexpected irq - STS 0x%02x\n",
+			status);
 
-	dev_dbg(axg_fifo_dev(ss), "unexpected irq - STS 0x%02x\n",
-		status);
+	if (status & FIFO_INT_COUNT_REPEAT) {
+		snd_pcm_period_elapsed(ss);
+		return IRQ_HANDLED;
+	}
 
 	return IRQ_NONE;
 }
 
-static irqreturn_t axg_fifo_pcm_irq_block_thread(int irq, void *dev_id)
-{
-	struct snd_pcm_substream *ss = dev_id;
-
-	snd_pcm_period_elapsed(ss);
-
-	return IRQ_HANDLED;
-}
-
 int axg_fifo_pcm_open(struct snd_soc_component *component,
 		      struct snd_pcm_substream *ss)
 {
@@ -251,8 +244,9 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
 	if (ret)
 		return ret;
 
-	ret = request_threaded_irq(fifo->irq, axg_fifo_pcm_irq_block,
-				   axg_fifo_pcm_irq_block_thread,
+	/* Use the threaded irq handler only with non-atomic links */
+	ret = request_threaded_irq(fifo->irq, NULL,
+				   axg_fifo_pcm_irq_block,
 				   IRQF_ONESHOT, dev_name(dev), ss);
 	if (ret)
 		return ret;
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
