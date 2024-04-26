Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AD8C19F4F
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Apr 2024 15:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4KJPwxD74L8inYP5ugwxoBDMiols3D1ru5eCRYJsfKI=; b=SFBwVgFR6dTOoh
	EHy5UGrQWYgDc3ZV5vK7xnGFoYnS1epW1/z4KcPJ+mfzpTIypLyUAUVOfRJ9IPP1cuHioaOZTgToM
	3uMNRtEHYQSGIzakw4woIqw1kU2Q3pPA8WwVev9PIcDmyUGGmEIsMP1xPHix+gv8haS/ZGaZc6JZU
	z1fNKzTjyrPAEGwo6HaYtB2m0fHVR+V2c2uGyRFxWFitY6KyCAEozTDv8ydPU5HpduSWpJSlHVg/t
	fvZ6bmYpHACz4YRgiSmXz+5yoS9AIxLR9qAv2SoobKFs/FiSx8JsF6SjksJyL8yuBoZg28oAVxXtg
	UCrOFJk+J7OXOjRqj6GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0NWU-0000000D3H8-3182;
	Fri, 26 Apr 2024 15:30:02 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0NWQ-0000000D3CY-2cdN
	for linux-amlogic@lists.infradead.org;
	Fri, 26 Apr 2024 15:30:00 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-41b5dd5af48so12890385e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 26 Apr 2024 08:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714145396; x=1714750196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdxkC9xy0JdUlM4HJdidG8uU38VPySKk64XDlad2PLg=;
        b=idoxkQdjOKqxH8EofiH1tOI6TGW6m0s9hgVRrgpKnSZD9xm0V4E4Q0OKesC0Cbsvfn
         GXlVxZQtjAng6cxqCk53SR2VJ4gwpK/xLfFUUO/7sP80ovGf8KjNRLCiAimqVs7jXVxa
         EkmMEPjvabSLEzns75Crlc04l7Exu+Dtl8VUE9ygW0sV//6SknqHm42SuS/MNNFd8LCp
         Dl2YGQKyz/gQv55Qdnogex7BsPJ6Y3hTECCcJtIT2MpD9PZ3GP6YADOl58lAveIEoYNp
         A7xh+N3I6O0+Oi+Q+UUs6vLBDftgBy9q1BhKk/BlzQdhLU+wjk/Vf/VL+QcAeCNNVmY8
         WGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714145396; x=1714750196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wdxkC9xy0JdUlM4HJdidG8uU38VPySKk64XDlad2PLg=;
        b=mN+KUUKhZUiGs+4Fyn3YtqqToCZDBO+U6xqAoie7QFxPyFZYqthTHjTr8h7EdyN3iz
         3B1BA1boeKBh45KEYFamj9pNs4KQC/GK3n6QuceQg3rhyFoWkc9TlPyID87UbmKU5dME
         9QycQ53SKsy50hvygq01+No3o7YcO53h3fqydFpOd2OruvS44oAlEPucBoj8AtUQteWK
         ollTQreauKnhK5Wxm8UIg/WPHtykgq5D09uB7zZijxgDtRahQ3+J9wQ7XnwhXRCYNYxM
         zbLZPd3bwXLJY/IaQUYWblofC+ZQD1jhmd+thM1fVocNQOZBFHAbZffL0GZbENtvS3wS
         EvXw==
X-Forwarded-Encrypted: i=1; AJvYcCWFgpci9J5ffgsHJEsyDWZ8Vm4vcU70LEjmT4vmqeaJUz7B9sJKYrMTBSIiUoqajuKzaI1Vj3nPOdS6h5+QRc2rwEt/6sPR6eX6RirolhG52VI=
X-Gm-Message-State: AOJu0YyXtjfIfjDG/TgkJWSFIXuBP4AXmSgEW3mZujxvIEq6d+HbNG7S
	N7bGRlfoA5vcyT+1y17/vi/EYpMTyAtHbPvxyg6AIyzYzJkyD/2gUzxmVF5isJZOtkXwixmp5Yj
	4
X-Google-Smtp-Source: AGHT+IHPpBP3QSa57mdn7C6mGnSnPPrJ1b15kSZTPSoFNzWhfVV6qwoJcqsNBhnR4twzoAilz89DKA==
X-Received: by 2002:a05:600c:4ecf:b0:416:bc18:2a00 with SMTP id g15-20020a05600c4ecf00b00416bc182a00mr2136057wmq.38.1714145395834;
        Fri, 26 Apr 2024 08:29:55 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1926:f73e:8b99:1c0a])
        by smtp.googlemail.com with ESMTPSA id i13-20020a05600c354d00b00419fba938d8sm22628687wmq.27.2024.04.26.08.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 08:29:55 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 1/4] ASoC: meson: axg-fifo: use threaded irq to check periods
Date: Fri, 26 Apr 2024 17:29:38 +0200
Message-ID: <20240426152946.3078805-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240426152946.3078805-1-jbrunet@baylibre.com>
References: <20240426152946.3078805-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_082958_699711_D6A48AFD 
X-CRM114-Status: GOOD (  13.89  )
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

With the AXG audio subsystem, there is a possible random channel shift on
TDM capture, when the slot number per lane is more than 2, and there is
more than one lane used.

The problem has been there since the introduction of the axg audio support
but such scenario is pretty uncommon. This is why there is no loud
complains about the problem.

Solving the problem require to make the links non-atomic and use the
trigger() callback to start FEs and BEs in the appropriate order.

This was tried in the past and reverted because it caused the block irq to
sleep while atomic. However, instead of reverting, the solution is to call
snd_pcm_period_elapsed() in a non atomic context.

Use the bottom half of a threaded IRQ to do so.

Fixes: 6dc4fa179fb8 ("ASoC: meson: add axg fifo base driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/axg-fifo.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index bebee0ca8e38..ecb3eb7a9723 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -204,18 +204,26 @@ static irqreturn_t axg_fifo_pcm_irq_block(int irq, void *dev_id)
 	unsigned int status;
 
 	regmap_read(fifo->map, FIFO_STATUS1, &status);
-
 	status = FIELD_GET(STATUS1_INT_STS, status);
+	axg_fifo_ack_irq(fifo, status);
+
+	/* Use the thread to call period elapsed on nonatomic links */
 	if (status & FIFO_INT_COUNT_REPEAT)
-		snd_pcm_period_elapsed(ss);
-	else
-		dev_dbg(axg_fifo_dev(ss), "unexpected irq - STS 0x%02x\n",
-			status);
+		return IRQ_WAKE_THREAD;
 
-	/* Ack irqs */
-	axg_fifo_ack_irq(fifo, status);
+	dev_dbg(axg_fifo_dev(ss), "unexpected irq - STS 0x%02x\n",
+		status);
+
+	return IRQ_NONE;
+}
+
+static irqreturn_t axg_fifo_pcm_irq_block_thread(int irq, void *dev_id)
+{
+	struct snd_pcm_substream *ss = dev_id;
+
+	snd_pcm_period_elapsed(ss);
 
-	return IRQ_RETVAL(status);
+	return IRQ_HANDLED;
 }
 
 int axg_fifo_pcm_open(struct snd_soc_component *component,
@@ -243,8 +251,9 @@ int axg_fifo_pcm_open(struct snd_soc_component *component,
 	if (ret)
 		return ret;
 
-	ret = request_irq(fifo->irq, axg_fifo_pcm_irq_block, 0,
-			  dev_name(dev), ss);
+	ret = request_threaded_irq(fifo->irq, axg_fifo_pcm_irq_block,
+				   axg_fifo_pcm_irq_block_thread,
+				   IRQF_ONESHOT, dev_name(dev), ss);
 	if (ret)
 		return ret;
 
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
