Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AED606A334
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Nov 2026 10:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lx1OL1TA;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WGWIZt3a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Gqzxf+nZlu+9Cz8QoPgLJvmlTtqUWhESPz1mWsyZ/OE=; b=Lx1OL1TACyTlMJBrviEcv8/lVr
	LTdusd+ch5H6YCz9/vVvdIKZyCmUxUqw12RzBo4b78yPhlXlKQxV2N4pTDqF26uBwT5+ow6qT1Y0Y
	nZzK/TI57i0gHzimmBnuswwVigo/hLHP8fk9fd7h45KNSe4c5gayh1cOh2VYbh30HHdwv6kj6eef+
	ZLdQGTCyW5FrCjLHL0HxEBQIGzEX33XSO71hN67DIDABYaGSljttWjl8VVZ+/226BI9C3WpwIWCLT
	yGjR1hUOAxLarS7D4wIjQRPZEMBsdcImGpqOgqW4reqJRCQ9SXzuRf4FT6mQYMRc/Z0KXe3/tyiCP
	ynQ0/x0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5H5-00000006Isr-0JLp;
	Wed, 11 Nov 2026 10:09:51 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5H1-00000006Ir4-1e75
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Nov 2026 10:09:49 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso21643935e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Nov 2026 02:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794391785; x=1794996585; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yP8LUV7oQ2QnWZcMn4c2h1Fuc/wYBouEPrqAcg2WnpY=;
        b=WGWIZt3aqZBLUb7iO1VIFLhmHwe21GfZPaAMG1yQav6c4p6KflB6TsQdZ63zBLxVHd
         4iupY5U92jdg8Uc3wa5M0gSomdMOhKxX8hz3t461B7lttaBVU7GzIY5vVbYGHJRGv9Dw
         iBNbuFgrbc9sUsa93YH4V2TBuncGea7YrrhRND9bCyKkv9VaXqdaauCGN1PKp4agldmP
         +pW3Q9efo3tJQv1RXPucEs0jKAaZXDcMLGWC1fcuk+UbWEQMLAzn1/9tSPGCNRSolTjW
         9Cso+S7IIzQ0lW0WhZ44P08CU5BtrtJVMYS3RIUWtbn6in6RdVGO1glkIiQAtEeDPzj6
         SLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391785; x=1794996585;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yP8LUV7oQ2QnWZcMn4c2h1Fuc/wYBouEPrqAcg2WnpY=;
        b=NBbB5l5PDkMqyMS4XrDxye2uLep/XIHJlzeWI1vdikCLYDt6nvQQVgYj0YKRQar+NQ
         k36xNGdKPIthrETgovOrdrovnpqU2NYRSd3Xyhtl3gVEHfbIOp32b5X27FxDUjreNnyp
         tzwGlJBpt5qUVEYCDvV3PjbtU4W8M4hav3HziNKfpWF5DOKGXy7xJHBH7moj8Y8njYl2
         ndNV4U9ZE/C9ZfJSuzbHfzeTMTNINJI9fBBJIu7EP0rr5xfmVG4IySXdE7rTzEBPBh4h
         /lfytXrVea80ItGahMzqzPjDHgqrZ6n9C6/soO4FA2bl0TpehZk9YOiQ7lEuVqeGVcrq
         YPng==
X-Forwarded-Encrypted: i=1; AL+hErEmr+gASBFqQR657SP7KLvXzkeaRS+oHMRdLOqgB7ZD9h2WaCCQJCiCmIKMR0d0tnQbFa+7ZEantHU3Zebq@lists.infradead.org
X-Gm-Message-State: APuU4Z+JAMjycTg3Q91lTikTapn2oy+jh6tyhA4pc4b0V68pmLugNQwz
	JJM53Rw9STEiBFs9N7QoqgBcwLkfYIctEhJBgcj6IVagFaEy7Cb+Z/FP2qhfb9SQF/s=
X-Gm-Gg: AYBFou3ifBl4GRdupTa4WUtod+l8GOTIKq7J+y0uZ8Bxq53KWKEdDyNuQ/xt2OVJ8tX
	gz+t8HtNrZbpwdgjT1vCNkBSL76uJSMCt9obvP0WEWBD5fTUXAczSGBle5jI8yIyJN4Rzayd+T/
	3ph9ym0c64VhnTrUDqxGMa/dUDob++jUB5pj2ResGllxKCRNOOlFaJzivgdWzWbA4qrzOuohHG9
	jBnG4OwhyVTgnlW6stRfEpLypfeieY/0T8HRO3reWJudCzddrZH9FOCWelEre7bBhyVEV6gqeXv
	WzYYLfJfz2KGOdY1bmJuTguPStfpWkHgBcayE4TQp/KnioKDCcCNuXX6iEcZYXQaFtQEsrbcEn4
	DmblkJYaLLr5Cg5a+s8rn0ZVz00kASVrjrRXuGKrm6mXJ+GhUUgzwTqw9aHJ8sVpErAc3oSaoaF
	lGA7W52A2VcQd5vkhu1yezEV+8Z6Sbpj7B2weAb+wG1/hxgToCa709X9VLLXXMCr4X13fEE5B1y
	EpwiPRI8rtLhsG8zUyXMeHasbkwGl9YpwUFIqA//apXwrI0UjzyxQ18lhaYiUZ3MxXACuc2TOQ1
	AKBaDiYSw3MiEHOLq+i+fFOQVOdcins1u8/cEvR2fEFVNdLL
X-Received: by 2002:a05:600c:8589:b0:4ba:38a9:85e3 with SMTP id 5b1f17b1804b1-4ba38a9863fmr17830915e9.12.1794391785442;
        Wed, 11 Nov 2026 02:09:45 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm152780285e9.9.2026.11.11.02.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:09:44 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
Date: Wed, 11 Nov 2026 11:09:12 +0100
Subject: [PATCH] ASoC: meson: aiu-fifo: prevent sleeping when spinlock is
 held
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-aiu-fifo-fix-sleep-on-spinlock-v1-1-dc9ee401a7cf@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAMc+9GoC/yWNwQrCQAxEf6XkbKAtUqq/Ih626bRGy+6ysSKU/
 rtR5zDwYHizkaEojM7VRgUvNU3RoTlUJLcQZ7COztTWbdd4OOjKk07J6822AJlTZMsalyQPriG
 QfuyO4TSQS3KBD38Hl+ufbR3ukOfXSvv+AQ5qGu6CAAAA
X-Change-ID: 20261111-aiu-fifo-fix-sleep-on-spinlock-0ecec8d64a9b
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Christian Hewitt <christianshewitt@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7613; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=dQoT8hjh+AUyid6qjr91Zz8IW3/y9GFeueotEzb2A1s=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlf7F4c/2kaP99383eGK5EKm2otMm2Ef699NG1+3Lu8G
 6VcZcFVHaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZiIBBDvivq7zSJFjtstkuO/
 hvEUqZi3v8+ntx485Xx1jrh04XYrhv+lplkaZ94Y/X+64sXNFRES8ffOaxu2aJ9lb5z9KcIi5gc
 bAA==
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_020947_488187_08971230 
X-CRM114-Status: GOOD (  16.40  )
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

dai_links in the gx-card are atomic which means that the DAI trigger
callback is called with the spinlock held. This means that usage of
potentially sleeping functions (e.g. mutexes) is not allowed here.

'snd_soc_component_write'/'snd_soc_component_read' take the component's
io_mutex on entry.

Replace usage of these functions in:
- 'aiu_fifo_i2s_trigger'
- 'fifo_spdif_trigger'
- 'aiu_fifo_pointer'

This is meant to resolve the following runtime bug found while starting I2S
playback on an OdroidC2 device where the kernel was built enabling
CONFIG_DEBUG_ATOMIC_SLEEP and CONFIG_PROVE_LOCKING:

  Playback device is hw:0,0
  Stream parameters are 44100Hz, S16_LE, 2 channels
  Sine wave rate is 1000.0000Hz
  Rate set to 44100Hz (requested 44100Hz)
  Buffer size range from 128 to 262144
  Period size range from 64 [   21.012074] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:623
  [   21.018009] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 267, name: speaker-test
  [   21.026184] preempt_count: 1, expected: 0
  [   21.030151] RCU nest depth: 0, expected: 0
  [   21.034205] locks held by speaker-test/267: 1, last CPU#3:
  [   21.039638]  #0: ffff000003dbd910 (&group->lock#2){....}-{3:3}, at: snd_pcm_stream_lock_irq+0x40/0x60
  [   21.048782] irq event stamp: 5274
  [   21.052059] hardirqs last  enabled at (5273): [<ffff800081494240>] _raw_spin_unlock_irq+0x38/0x80
  [   21.060856] hardirqs last disabled at (5274): [<ffff8000814935c8>] _raw_spin_lock_irq+0x80/0x90
  [   21.069481] softirqs last  enabled at (5238): [<ffff8000800f9aec>] handle_softirqs+0x584/0x5e0
  [   21.078020] softirqs last disabled at (5231): [<ffff800080010324>] __do_softirq+0x1c/0x28
  [   21.086133] CPU: 3 UID: 0 PID: 267 Comm: speaker-test Not tainted 7.3.0 #2 PREEMPT
  [   21.086141] Hardware name: Hardkernel ODROID-C2 (DT)
  [   21.086145] Call trace:
  [   21.086149]  show_stack+0x20/0x40 (C)
  [   21.086160]  dump_stack_lvl+0x6c/0x98
  [   21.086171]  dump_stack+0x18/0x24
  [   21.086179]  __might_resched+0x160/0x230
  [   21.086189]  __might_sleep+0x50/0x90
  [   21.086197]  __mutex_lock+0x64/0x8a0
  [   21.086206]  mutex_lock_nested+0x2c/0x40
  [   21.086215]  snd_soc_component_write+0x38/0x80
  [   21.086227]  aiu_fifo_i2s_trigger+0x74/0x90
  [   21.086237]  soc_dai_trigger.part.0+0x44/0x90
  [   21.086246]  snd_soc_pcm_dai_trigger+0x174/0x280
  [   21.086255]  soc_pcm_trigger+0xe4/0x1f0
  [   21.086265]  dpcm_dai_trigger_fe_be+0x30/0xb0
  [   21.086276]  dpcm_fe_dai_do_trigger+0x11c/0x1a0
  [   21.086287]  dpcm_fe_dai_trigger+0x40/0x60
  [   21.086296]  snd_pcm_do_start+0x4c/0x80
  [   21.086307]  snd_pcm_action_single+0x50/0xc0
  [   21.086316]  snd_pcm_action+0x88/0xb0
  [   21.086325]  snd_pcm_start+0x2c/0x40
  [   21.086335]  __snd_pcm_lib_xfer+0x660/0x810
  [   21.086345]  snd_pcm_common_ioctl+0xa20/0x17e0
  [   21.086356]  snd_pcm_ioctl+0x3c/0x60
  [   21.086366]  __arm64_sys_ioctl+0xac/0x110
  [   21.086376]  invoke_syscall+0x5c/0x120
  [   21.086386]  el0_svc_common.constprop.0+0x48/0xf0
  [   21.086395]  do_el0_svc+0x24/0x40
  [   21.086404]  el0_svc+0x54/0x3b0
  [   21.086414]  el0t_64_sync_handler+0xa0/0xf0
  [   21.086424]  el0t_64_sync+0x198/0x1a0

Fixes: e8712315c44d ("ASoC: soc-component: use io_mutex correctly")
Fixes: 6b59c53c8adc ("ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF datapath on start/stop")
Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
I found this issue while working on [1].
This patch is independent of [1] and they can go in in any order. They
are fixing the same problem in different modules.

[1]: https://lore.kernel.org/all/20261021-gx-formatter-use-spinlock-v1-1-71ebc9224c03@baylibre.com/
---
 sound/soc/meson/aiu-fifo-i2s.c   | 15 ++++++++++++---
 sound/soc/meson/aiu-fifo-spdif.c | 14 ++++++++++----
 sound/soc/meson/aiu-fifo.c       |  6 +++++-
 3 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/sound/soc/meson/aiu-fifo-i2s.c b/sound/soc/meson/aiu-fifo-i2s.c
index eccbc16b293ad..8f785241585df 100644
--- a/sound/soc/meson/aiu-fifo-i2s.c
+++ b/sound/soc/meson/aiu-fifo-i2s.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/regmap.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
@@ -48,14 +49,22 @@ static int aiu_fifo_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 				struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
+	unsigned int val;
+	int ret;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		snd_soc_component_write(component, AIU_RST_SOFT,
-					AIU_RST_SOFT_I2S_FAST);
-		snd_soc_component_read(component, AIU_I2S_SYNC);
+		ret = regmap_write(component->regmap, AIU_RST_SOFT, AIU_RST_SOFT_I2S_FAST);
+		if (ret < 0)
+			return snd_soc_ret(component->dev, ret,
+					   "Failed to write register on trigger");
+
+		ret = regmap_read(component->regmap, AIU_I2S_SYNC, &val);
+		if (ret < 0)
+			return snd_soc_ret(component->dev, ret,
+					   "Failed to read register on trigger");
 		break;
 	}
 
diff --git a/sound/soc/meson/aiu-fifo-spdif.c b/sound/soc/meson/aiu-fifo-spdif.c
index a9861c5d66374..297834bce1c7a 100644
--- a/sound/soc/meson/aiu-fifo-spdif.c
+++ b/sound/soc/meson/aiu-fifo-spdif.c
@@ -69,15 +69,21 @@ static int fifo_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		snd_soc_component_write(component, AIU_RST_SOFT,
-					AIU_RST_SOFT_958_FAST);
+		ret = regmap_write(component->regmap, AIU_RST_SOFT, AIU_RST_SOFT_958_FAST);
+		if (ret < 0)
+			return snd_soc_ret(component->dev, ret,
+					   "Failed to write register on trigger");
+
 		fifo_spdif_dcu_enable(component, true);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_STOP:
-		snd_soc_component_write(component, AIU_RST_SOFT,
-					AIU_RST_SOFT_958_FAST);
+		ret = regmap_write(component->regmap, AIU_RST_SOFT, AIU_RST_SOFT_958_FAST);
+		if (ret < 0)
+			return snd_soc_ret(component->dev, ret,
+					   "Failed to write register on trigger");
+
 		fifo_spdif_dcu_enable(component, false);
 		break;
 	default:
diff --git a/sound/soc/meson/aiu-fifo.c b/sound/soc/meson/aiu-fifo.c
index 8b54f9681d00c..f3cdcce1ebfe3 100644
--- a/sound/soc/meson/aiu-fifo.c
+++ b/sound/soc/meson/aiu-fifo.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/regmap.h>
 #include <linux/dma-mapping.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -37,8 +38,11 @@ snd_pcm_uframes_t aiu_fifo_pointer(struct snd_soc_component *component,
 	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	unsigned int addr;
+	int ret;
 
-	addr = snd_soc_component_read(component, fifo->mem_offset + AIU_MEM_RD);
+	ret = regmap_read(component->regmap, fifo->mem_offset + AIU_MEM_RD, &addr);
+	if (ret < 0)
+		return snd_soc_ret(component->dev, ret, "Failed to read FIFO pointer");
 
 	return bytes_to_frames(runtime, addr - (unsigned int)runtime->dma_addr);
 }

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261111-aiu-fifo-fix-sleep-on-spinlock-0ecec8d64a9b

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
