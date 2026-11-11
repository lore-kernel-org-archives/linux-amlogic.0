Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877C1606A33B
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Nov 2026 10:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wf8bfwi3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pKGDmjRQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Q5IK3ULzpashFzGtxcraK20kf/u335PAbr7RChQBpb4=; b=Wf8bfwi30mPHirVXneiLroAiGS
	LVV0SPHJiw0n37B1V+NhsL0d8YBQfhrFv9FUth/8ifFnL21PWAq+xQWAd6mebEgCBZeec3uZaAPIy
	6hRLAegcrtKMSU5ZrCCOcTCmpK6UPSdxPH+FMMBzdkUiMK3pWAINYyMFZb3b8oGO6xu4Yr2VkrZ3q
	weG6O7zyluDT54HyDsoxAXS7P1bgkGGuntT7VzJUjk/NKgaRwgIllHSFw/bk6News5ZO8jWoc6aHJ
	lFcWD1u0xxC9F7+/eICVd0f7F7lUI5pwMwLkRSp92ujPcDJPttefXo01TahroMsO2+QuY/n18bzYY
	klSJRkBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5KA-00000006JMS-0vjM;
	Wed, 11 Nov 2026 10:13:02 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5K4-00000006JJV-3pXP
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Nov 2026 10:13:00 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso28741905e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Nov 2026 02:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794391975; x=1794996775; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n3v1AgR+CHCMi0QrlArcix8UUVt6MgDpIHZcAPaGD/I=;
        b=pKGDmjRQPq8HXdma7N7vLww9Jrsn1Ozpnnfda9ki+Dc8+isi0es1Gh/7iHJH5Qzp8N
         q5XLy2PHG15fQ8u02Has5zEF4gAfWdbVJyiAZDWEI5/3A2rat0V2SJyEBwrGl2xyZNKF
         2AQ25k33oxvL3TFvSICIudQyqijtEZF8idFpha/hm1evPpx1trEiP4zATKFjHgl+gb6k
         +t2srgZQzEQoJYDJUbWMaJzCu/gnSnUITyIrcWco9+12/73XIuDnnC85h8BIySjgQa64
         DBz+/cHL5jR53aNTJRx5PesluPvA2ysBOV7ycNzIrm813QEUHpZU4pUCidsTrQmnUMC8
         c/lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391975; x=1794996775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n3v1AgR+CHCMi0QrlArcix8UUVt6MgDpIHZcAPaGD/I=;
        b=jKuvkFZTfVNCwVrZ8Z43QbLgHK9OuNfLZqKYlLOFKpaF9AKKV4tn/ti/Pztge4zEFV
         BUEmoI1lku8nKz8gSyFwTKk35KtHW2QocuGvjV4MWu0YLZytazV8i5g1WJ66NKnjqnJD
         eIsmgu7xBzYIcEj3p97q49/nhMZl0A3DiLbWsBqub0mCweLiOEXpjYoH5QD5Qxxi6SY2
         cO7QL8pWAQR0pxJZMHRnCnRupAA67xSW6G+wThBH+oekanJGiXyS+r3W/JrZA5drHvDT
         cfiY1Y4rX6dTujGf3h66Gk7C+SDU9FqOlu38Ldc9OPc3z1/5hcLZLCa7C1ryU/31z1zR
         +YSA==
X-Forwarded-Encrypted: i=1; AL+hErGF3UEZ6dpB7irTWTu/4R0vHjMnJif47HFRy7WslZUfGs3aWh6YOr60mqpMA4Evdy5xLDy4X6UQn6m90hif@lists.infradead.org
X-Gm-Message-State: APuU4Z8Y7Diw3pCv1COBMgL/WUk09Q+1pBxZDwkrgtfoye/o5vrd0LuW
	DLV1C4sAgCvbHSaSRyj7SdX0WLTzjGeLolv4oBnczGx/lOZUT614dtMGzPwyjuwYCMM=
X-Gm-Gg: AYBFou1tEXZYB0sv4B/gJWtZzTMYgvsVdJ9upwIAl1dyS6ujGB2+78hVqBaiWDZ9uvM
	S6NmBkD8TTeZNEQkUdhrQwxmRNLoz36rk2uYAjZmCUw8YgxtARsSvmkjgContWdxGxJsKLFMyQU
	Y2XL5x2snxfY8l6kkjjinvkcjCo7uToVIF7WGPgauVeC/AydPPu9VWn4Y1RJ1sxeqCdpyRFjDMc
	gPXySQT3y29+ss99qSRkqdc9kNK0cShFyJBRbN3hq9pDaMORJoLNLBNbIZHacacUXwxCima7k68
	JNYnYpR/VeTgB+OLhMJTYCu4ILIRvdj5jBEtWMwGpXv/6SDMBPeGbAX3Yt2iRTDLEC/6WK2yj7R
	tQCqmac9lQRZQr84JFfKQHyJbt9gozx8QxgxXu7079GEA9Mckl6S7J1WFVGpfYGYzu3BgjtZuTn
	Ny7s1qSFxtVdjiIpjBzENpUQVKWN+Y3L91tCL+EZI2K5z+kme2WK3JkPefQjRVFWLsoHfH6EXsN
	Rhtb4xbnjTSZ4YnmVjDBarypBw8gbWL8pbEbXt2uJ/UW5nhkxHnCUFqatP0YUa51SQbGt5MwI+b
	tX4vhZQPQC698qzyNWrji24YE9sI
X-Received: by 2002:a05:600c:1c0c:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4ba091a5bcbmr39187675e9.0.1794391974882;
        Wed, 11 Nov 2026 02:12:54 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea745sm124194375e9.10.2026.11.11.02.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:12:54 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
Date: Wed, 11 Nov 2026 11:12:48 +0100
Subject: [PATCH v2 1/2] ASoC: meson: gx-formatter: change stream lock from
 mutex to spinlock
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-gx-formatter-use-spinlock-v2-1-763241aeca52@baylibre.com>
References: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
In-Reply-To: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6296; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=AM5clnX3PNR8b5jWnSWhqcd+0TC3ywf0Ls6D1xVD6fs=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlf7JeIHVcOnz7ZzPIyH2f50x0x+8PPf/DoePR8k9ufw
 zLV7aJ8HaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZiIUTDD/1reef7JW5+1Bdr9
 i7g0jZvR+o6h2ivt1hsPzj076tSo+pThr2jr82DTQ63bXtSc8syJ1tBtc+AzO5/8lIvLXs8pYI4
 iIwA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_021257_013605_F3003122 
X-CRM114-Status: GOOD (  19.78  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently a mutex is being used in 'struct gx_stream' to serialize
access to structure data. This was inherited from the AXG design. An
important difference though is that in axg-card dai_links are nonatomic
so callback functions like 'trigger' are allowed to sleep. In GX instead
dai_links are atomic.

For example, starting playback from userspace with
'CONFIG_DEBUG_ATOMIC_SLEEP=y' results in a warning message like:

[ ] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:316
[ ] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 272, name: speaker-test
[ ] preempt_count: 1, expected: 0

due to the following call stack:

snd_pcm_do_start (called with spinlock taken)
  dpcm_fe_dai_trigger
    dpcm_fe_dai_do_trigger
      dpcm_dai_trigger_fe_be
        dpcm_be_dai_trigger
          soc_pcm_trigger
            snd_soc_pcm_dai_trigger
              soc_dai_trigger
                aiu_encoder_i2s_trigger
                  gx_stream_start (takes 'ts->lock')

Fix this by changing the lock type from mutex to spinlock. This is safe
on GX platform because all formatters' functions only perform MMIO regmap
calls that do not sleep.

'spin_lock_irqsave' is used in 'gx_stream_start'/'gx_stream_stop' because
trigger runs with IRQs already disabled and stop can also run in IRQ
context (e.g. in case of XRUN while executing 'aiu_fifo_isr').
'spin_lock_irq' is instead used in 'gx_formatter_attach'/
'gx_formatter_detach' in order to prevent IRQs on the same CPU that might
end up calling 'gx_stream_stop' and therefore deadlock.

While at this also improve 'gx_formatter_detach()' by moving
'gx_formatter_disable()' under the spinlock guard. This makes it symmetric
to 'gx_formatter_attach()' and ensures that the prepare/enable/disable
formatter callbacks are called with spinlock held.

Fixes: a295be8d6210 ("ASoC: meson: gx: add gx-formatter and gx-interface")
Signed-off-by: Valerio Setti <vsetti@baylibre.com>

---

Changes in v2:
- Moved 'gx_formatter_disable()' under the spinlock guard in
  'gx_formatter_detach'. [Martin]
---
 sound/soc/meson/gx-formatter.c | 22 +++++++++++-----------
 sound/soc/meson/gx-formatter.h |  4 ++++
 sound/soc/meson/gx-interface.h |  3 ++-
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/sound/soc/meson/gx-formatter.c b/sound/soc/meson/gx-formatter.c
index 2d3218cce426..d3bc0c6c81cd 100644
--- a/sound/soc/meson/gx-formatter.c
+++ b/sound/soc/meson/gx-formatter.c
@@ -61,7 +61,7 @@ static int gx_formatter_attach(struct gx_formatter *formatter)
 	struct gx_stream *ts = formatter->stream;
 	int ret = 0;
 
-	mutex_lock(&ts->lock);
+	spin_lock_irq(&ts->lock);
 
 	/* Catch up if the stream is already running when we attach */
 	if (ts->ready) {
@@ -74,7 +74,7 @@ static int gx_formatter_attach(struct gx_formatter *formatter)
 
 	list_add_tail(&formatter->list, &ts->formatter_list);
 out:
-	mutex_unlock(&ts->lock);
+	spin_unlock_irq(&ts->lock);
 	return ret;
 }
 
@@ -85,11 +85,10 @@ static void gx_formatter_detach(struct gx_formatter *formatter)
 	if (!ts)
 		return;
 
-	mutex_lock(&ts->lock);
+	spin_lock_irq(&ts->lock);
 	list_del(&formatter->list);
-	mutex_unlock(&ts->lock);
-
 	gx_formatter_disable(formatter);
+	spin_unlock_irq(&ts->lock);
 }
 
 static int gx_formatter_power_up(struct gx_formatter *formatter,
@@ -212,9 +211,10 @@ EXPORT_SYMBOL_GPL(gx_formatter_create);
 int gx_stream_start(struct gx_stream *ts)
 {
 	struct gx_formatter *formatter;
+	unsigned long irq_flags;
 	int ret = 0;
 
-	mutex_lock(&ts->lock);
+	spin_lock_irqsave(&ts->lock, irq_flags);
 
 	/* Start all the formatters attached to the stream */
 	list_for_each_entry(formatter, &ts->formatter_list, list) {
@@ -228,7 +228,7 @@ int gx_stream_start(struct gx_stream *ts)
 	ts->ready = true;
 
 out:
-	mutex_unlock(&ts->lock);
+	spin_unlock_irqrestore(&ts->lock, irq_flags);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(gx_stream_start);
@@ -236,8 +236,9 @@ EXPORT_SYMBOL_GPL(gx_stream_start);
 void gx_stream_stop(struct gx_stream *ts)
 {
 	struct gx_formatter *formatter;
+	unsigned long irq_flags;
 
-	mutex_lock(&ts->lock);
+	spin_lock_irqsave(&ts->lock, irq_flags);
 	ts->ready = false;
 
 	/* Stop all the formatters attached to the stream */
@@ -245,7 +246,7 @@ void gx_stream_stop(struct gx_stream *ts)
 		gx_formatter_disable(formatter);
 	}
 
-	mutex_unlock(&ts->lock);
+	spin_unlock_irqrestore(&ts->lock, irq_flags);
 }
 EXPORT_SYMBOL_GPL(gx_stream_stop);
 
@@ -256,7 +257,7 @@ struct gx_stream *gx_stream_alloc(struct gx_iface *iface)
 	ts = kzalloc_obj(*ts);
 	if (ts) {
 		INIT_LIST_HEAD(&ts->formatter_list);
-		mutex_init(&ts->lock);
+		spin_lock_init(&ts->lock);
 		ts->iface = iface;
 	}
 
@@ -272,7 +273,6 @@ void gx_stream_free(struct gx_stream *ts)
 	 * are removing the TDM DAI. It should not be possible
 	 */
 	WARN_ON(!list_empty(&ts->formatter_list));
-	mutex_destroy(&ts->lock);
 	kfree(ts);
 }
 EXPORT_SYMBOL_GPL(gx_stream_free);
diff --git a/sound/soc/meson/gx-formatter.h b/sound/soc/meson/gx-formatter.h
index b90b1814d79b..9f5a1720481e 100644
--- a/sound/soc/meson/gx-formatter.h
+++ b/sound/soc/meson/gx-formatter.h
@@ -20,6 +20,10 @@ struct gx_formatter_hw {
 
 struct gx_formatter_ops {
 	struct gx_stream *(*get_stream)(struct snd_soc_dapm_widget *w);
+	/*
+	 * Following functions are called with gx_stream->lock held and local
+	 * IRQs disabled so they must not sleep.
+	 */
 	void (*enable)(struct regmap *map);
 	void (*disable)(struct regmap *map);
 	int (*prepare)(struct regmap *map,
diff --git a/sound/soc/meson/gx-interface.h b/sound/soc/meson/gx-interface.h
index 2a6207e393e8..a6a5cc9e7af0 100644
--- a/sound/soc/meson/gx-interface.h
+++ b/sound/soc/meson/gx-interface.h
@@ -9,6 +9,7 @@
 
 #include <linux/clk.h>
 #include <linux/regmap.h>
+#include <linux/spinlock.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
@@ -24,7 +25,7 @@ struct gx_iface {
 struct gx_stream {
 	struct gx_iface *iface;
 	struct list_head formatter_list;
-	struct mutex lock;
+	spinlock_t lock;
 	unsigned int channels;
 	unsigned int width;
 	unsigned int physical_width;

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
