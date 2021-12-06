Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C363EC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Dec 2021 21:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iGJfCY/jB7mVpGr35dMrWKDiwfXMt2DXpn7GCTJHQc8=; b=bHul8Gk9qx4cES
	qtEYMzZsOuVoiUjMh4UA8LcJ0zpWmNcNaXpmyXRE/1dqPhAiiIzvz1yhgH2yklt3AE73WMPI4hXbO
	qXppyhJcRvDGobrzA5sF0Eon73T6vf5KHIVSOnvUJXs4SyvAcWQuowzNSmWbyUMUtar+DKUagg7w+
	mcya1XnX7vOoiLkCJhlzy1jsDVht6vF/9kQ67ey3aEKbyxPS19y2jH8JeA9047WqZCZZfSkhnSqk/
	qxT5rW5VT80YduAAKyngkWlMvzUErSUBGr9SZZjYbE30depTkY3zmV4AVHIJMR32CigzzL/XLCE2M
	1rhozREyJPXm2YSWSTjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muLEL-005k64-2J; Mon, 06 Dec 2021 21:09:01 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muLDm-005jqj-2W; Mon, 06 Dec 2021 21:08:27 +0000
Received: by mail-wr1-x429.google.com with SMTP id i5so25138786wrb.2;
 Mon, 06 Dec 2021 13:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yVwInqdQPwWX4Qe3BGSaiec8LwEwiHTiRzv+V8FUPV4=;
 b=j/hARFT0fWHGsb2iMVFhbY7TsVKDd1pdb4bE1pVTXogyrwclHKw+GhxGq/bC+1tTi5
 t9xIENPR7ITnICu04uR5Rrm8dRZv8xuJQmGEiHzmv7ZkTPlMaCxZayjqLHTyQTtx9emH
 9JqL1/wtG6l5pdB0NihNnaU9M4bvo8wOqhl6OwyEwqR92BNJ4CfoUL99lBhLpxmSGbo4
 ZLgWu4OC2YNRvUwZut44zkVv8UWYVN4YjJfNmgJuRS6QAu0mRjESmWV4CucMMXNyYtXh
 owvRtsX1jd7NamruYtA6O5nJqdvVWJ4zAKeJef2LIJpl7jXh4J76EjxWEkj75UpvKtqg
 dr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yVwInqdQPwWX4Qe3BGSaiec8LwEwiHTiRzv+V8FUPV4=;
 b=cZ+fkrzxXWLwIZhTBmVsUY5SQzORY3YE1rYkDkBk9yR0GcfeN8GogOAWgcD+/loJTh
 RQVncttIPuvIA13/p/Vh11Im/0O1S7JU6J7ZnLh0TW4Tgj7LS5nFrXLGkFmMT5osjD4Z
 gEIBhXcWRXm83rrybpHNcG9uHIyWTfj+p77ttJlDviL5JqpzSEfWHU+ddnCTqFXulwt+
 uJoPJubMO+7Zd2XpbUtM246n8AQVQRsavH15PXwS7IWBmFnNPR/vAwnQ1DSLunfWLGjz
 E3HpP56pFmhZlzycFAaLmj16wA7lH1vRXS9wSYD/T6gSBpdAHlvsvwZEZe+AEXafQU3z
 c1Cw==
X-Gm-Message-State: AOAM531/xESFs33jR4/KCDhCD3TpymKXs/s2auwHcAt6cTEoRoh7oBhv
 AW/gIlvEuWS9WT+qSdQqAEeuvyvzFeI=
X-Google-Smtp-Source: ABdhPJxpVXCa7Lm3mSav7+NYGzpVO2VRSAiqRDHaow5+eq/DIiRSpnNldOwc2JisEfWYZf2SKdBj/g==
X-Received: by 2002:adf:f708:: with SMTP id r8mr46149102wrp.198.1638824903916; 
 Mon, 06 Dec 2021 13:08:23 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c0cf-f800-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c0cf:f800:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id p13sm511195wmi.0.2021.12.06.13.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 13:08:22 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	alsa-devel@alsa-project.org
Cc: jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org, lgirdwood@gmail.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Geraldo Nascimento <geraldogabriel@gmail.com>, stable@vger.kernel.org
Subject: [PATCH v2 2/2] ASoC: meson: aiu: Move AIU_I2S_MISC hold setting to
 aiu-fifo-i2s
Date: Mon,  6 Dec 2021 22:08:04 +0100
Message-Id: <20211206210804.2512999-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211206210804.2512999-1-martin.blumenstingl@googlemail.com>
References: <20211206210804.2512999-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_130826_144784_0BB5EEFD 
X-CRM114-Status: GOOD (  17.42  )
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

The out-of-tree vendor driver uses the following approach to set the
AIU_I2S_MISC register:
1) write AIU_MEM_I2S_START_PTR and AIU_MEM_I2S_RD_PTR
2) configure AIU_I2S_MUTE_SWAP[15:0]
3) write AIU_MEM_I2S_END_PTR
4) set AIU_I2S_MISC[2] to 1 (documented as: "put I2S interface in hold
   mode")
5) set AIU_I2S_MISC[4] to 1 (depending on the driver revision it always
   stays at 1 while for older drivers this bit is unset in step 4)
6) set AIU_I2S_MISC[2] to 0
7) write AIU_MEM_I2S_MASKS
8) toggle AIU_MEM_I2S_CONTROL[0]
9) toggle AIU_MEM_I2S_BUF_CNTL[0]

Move setting the AIU_I2S_MISC[2] bit to aiu_fifo_i2s_hw_params() so it
resembles the flow in the vendor kernel more closely. While here also
configure AIU_I2S_MISC[4] (documented as: "force each audio data to
left or right according to the bit attached with the audio data")
similar to how the vendor driver does this. This fixes the infamous and
long-standing "machine gun noise" issue (a buffer underrun issue).

Fixes: 6ae9ca9ce986bf ("ASoC: meson: aiu: add i2s and spdif support")
Reported-by: Christian Hewitt <christianshewitt@gmail.com>
Reported-by: Geraldo Nascimento <geraldogabriel@gmail.com>
Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Tested-by: Geraldo Nascimento <geraldogabriel@gmail.com>
Acked-by: Jerome Brunet <jbrunet@baylibre.com>
Cc: stable@vger.kernel.org
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 sound/soc/meson/aiu-encoder-i2s.c | 33 -------------------------------
 sound/soc/meson/aiu-fifo-i2s.c    | 19 ++++++++++++++++++
 2 files changed, 19 insertions(+), 33 deletions(-)

diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
index 932224552146..67729de41a73 100644
--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -18,7 +18,6 @@
 #define AIU_RST_SOFT_I2S_FAST		BIT(0)
 
 #define AIU_I2S_DAC_CFG_MSB_FIRST	BIT(2)
-#define AIU_I2S_MISC_HOLD_EN		BIT(2)
 #define AIU_CLK_CTRL_I2S_DIV_EN		BIT(0)
 #define AIU_CLK_CTRL_I2S_DIV		GENMASK(3, 2)
 #define AIU_CLK_CTRL_AOCLK_INVERT	BIT(6)
@@ -36,37 +35,6 @@ static void aiu_encoder_i2s_divider_enable(struct snd_soc_component *component,
 				      enable ? AIU_CLK_CTRL_I2S_DIV_EN : 0);
 }
 
-static void aiu_encoder_i2s_hold(struct snd_soc_component *component,
-				 bool enable)
-{
-	snd_soc_component_update_bits(component, AIU_I2S_MISC,
-				      AIU_I2S_MISC_HOLD_EN,
-				      enable ? AIU_I2S_MISC_HOLD_EN : 0);
-}
-
-static int aiu_encoder_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
-				   struct snd_soc_dai *dai)
-{
-	struct snd_soc_component *component = dai->component;
-
-	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_START:
-	case SNDRV_PCM_TRIGGER_RESUME:
-	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		aiu_encoder_i2s_hold(component, false);
-		return 0;
-
-	case SNDRV_PCM_TRIGGER_STOP:
-	case SNDRV_PCM_TRIGGER_SUSPEND:
-	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		aiu_encoder_i2s_hold(component, true);
-		return 0;
-
-	default:
-		return -EINVAL;
-	}
-}
-
 static int aiu_encoder_i2s_setup_desc(struct snd_soc_component *component,
 				      struct snd_pcm_hw_params *params)
 {
@@ -353,7 +321,6 @@ static void aiu_encoder_i2s_shutdown(struct snd_pcm_substream *substream,
 }
 
 const struct snd_soc_dai_ops aiu_encoder_i2s_dai_ops = {
-	.trigger	= aiu_encoder_i2s_trigger,
 	.hw_params	= aiu_encoder_i2s_hw_params,
 	.hw_free	= aiu_encoder_i2s_hw_free,
 	.set_fmt	= aiu_encoder_i2s_set_fmt,
diff --git a/sound/soc/meson/aiu-fifo-i2s.c b/sound/soc/meson/aiu-fifo-i2s.c
index 2388a2d0b3a6..57e6e7160d2f 100644
--- a/sound/soc/meson/aiu-fifo-i2s.c
+++ b/sound/soc/meson/aiu-fifo-i2s.c
@@ -20,6 +20,8 @@
 #define AIU_MEM_I2S_CONTROL_MODE_16BIT	BIT(6)
 #define AIU_MEM_I2S_BUF_CNTL_INIT	BIT(0)
 #define AIU_RST_SOFT_I2S_FAST		BIT(0)
+#define AIU_I2S_MISC_HOLD_EN		BIT(2)
+#define AIU_I2S_MISC_FORCE_LEFT_RIGHT	BIT(4)
 
 #define AIU_FIFO_I2S_BLOCK		256
 
@@ -90,6 +92,10 @@ static int aiu_fifo_i2s_hw_params(struct snd_pcm_substream *substream,
 	unsigned int val;
 	int ret;
 
+	snd_soc_component_update_bits(component, AIU_I2S_MISC,
+				      AIU_I2S_MISC_HOLD_EN,
+				      AIU_I2S_MISC_HOLD_EN);
+
 	ret = aiu_fifo_hw_params(substream, params, dai);
 	if (ret)
 		return ret;
@@ -117,6 +123,19 @@ static int aiu_fifo_i2s_hw_params(struct snd_pcm_substream *substream,
 	snd_soc_component_update_bits(component, AIU_MEM_I2S_MASKS,
 				      AIU_MEM_I2S_MASKS_IRQ_BLOCK, val);
 
+	/*
+	 * Most (all?) supported SoCs have this bit set by default. The vendor
+	 * driver however sets it manually (depending on the version either
+	 * while un-setting AIU_I2S_MISC_HOLD_EN or right before that). Follow
+	 * the same approach for consistency with the vendor driver.
+	 */
+	snd_soc_component_update_bits(component, AIU_I2S_MISC,
+				      AIU_I2S_MISC_FORCE_LEFT_RIGHT,
+				      AIU_I2S_MISC_FORCE_LEFT_RIGHT);
+
+	snd_soc_component_update_bits(component, AIU_I2S_MISC,
+				      AIU_I2S_MISC_HOLD_EN, 0);
+
 	return 0;
 }
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
