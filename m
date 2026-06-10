Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEF9CD98CC
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jun 2026 21:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m+hbqpPXT45dH+CNhkp17zKvts9XfE1anWQd9bwUjpo=; b=ixzTsgvUXO3HOw
	bAo3Xrf9rlhOij1GXvhGVqkm9/Oc/mPsB1o1c2lZxAHqh5s6jvCBXxoxZpE5bHkjYwx2Ko7KIzdhm
	mR4Z0H8XExhtPxlBtodRfKQ5Yl0Cr0xyb5uYCwa8v33UBkbMcNt8a8XgUWi/wMGa7Kj268aEEe/iV
	BHGXzUoDc17M724k8GUZPkeN7Ml6WCaVl0zeyczZvVAMhDlErKAAIPq+xnwzz0HxltCoBNxuoExd8
	F2UC9tICvlZjUgHnEQ1wFGrT/U0IzDFaHoIL+6Acwf5c90rIsNpFGJ0SiI3iohwQITffomBBFlHEt
	VlEgGEjQnFsXyFzgwghw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXQUd-00000008NTv-45dn;
	Wed, 10 Jun 2026 21:29:47 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXQUY-00000008NPk-3ODw
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Jun 2026 21:29:45 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so32565715e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Jun 2026 14:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781126981; x=1781731781; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1wcd9+cR2Lw/1NK825QM1reyVrOzsO3D1IfFbzXKQDk=;
        b=liprM0wyVq82uptKhteFWtMXD4stXLynj+3XapamCTjSfT/Nq/L7x8OY0Edgr2rfZx
         kSD0TTj1LInS4y0Cc3Ui4vubGZ8+awwQO+K5AwTXNhLeIBuXNwbWB41VlFsP59eat/9r
         PU8fBSTc3niFWEH40VuxhSxUfTeFo/uslQeUyAWZR0sX2Lsjt4s6hXPltF336O8wJFdL
         iQVa6k6eMCa7G1aNQxfpyXWqnB10BPl1V9t2HqAA5SRSLrNnA6YTUElAlyTN4Zoi9xr1
         PlqAtnIQS7oxcbTEFLSwUqvXTo9Noba6MltyoLwgUziUz6E+RQfuv8FWYBV747u/p30/
         f4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781126981; x=1781731781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1wcd9+cR2Lw/1NK825QM1reyVrOzsO3D1IfFbzXKQDk=;
        b=Gz5MpE52vIpnyzHoqJY7jFnl8vEeZL1fnee+jVFgotuv925epG0EgWH3NgDKr++NXO
         KCnUbx4peZ1IMrOWZZfsATrEvXh2iSWMooaSx2xV92p1B/t+x2m4LJPMGhcUBRkmFxsM
         /e69eakZn4a5IfG6HtQW3JI+5i5cwkUg9/icmPGA9rVWruSrysuMGnXjpCMS/+AUcmZg
         g3ShzWzEjmajpIU93NB6S/2195MlSxwxfu13LyW/L1QTj9ejAjUNhpEKzZJQIxEDlfKe
         cjP0+bsFHFab/Al9Q4Zmp5HdfyF5zVKoJNChlZvxPGhu1ljPPh7bt2k39am1E2JA6fT4
         jSMQ==
X-Forwarded-Encrypted: i=1; AFNElJ8bOq09ZxFnb125OsubQiRz+XFql9si6yM2CNjObpm43xUg8pXtYFw1wxPuL1x3xLAoM87VLIYJop7E/yVV@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm6Yq8qE3c3IGKidMlCYBNE63jIPyEzbwSsi2eIW8UW/ATE6Tu
	0gIfAkx5TTRseh2UsywfOD769Wm0EstzXG1DdXemLv4qjz0IhHyLp/u6VdmCVFJuY1I=
X-Gm-Gg: Acq92OFHncSfVCqgjtR+A4WIqfdCfb6zUC2593UVgFLy04Wb7zCLprP6Olr7vDfIxeh
	BhIW+Sbzc+WynN9/BUnA2Y8s2ajbhMUlPqYG5mBWc/rhFTpIrb6+/iiRFo5CqGba/5eUM5I7OS+
	/nG52R1LbLuals880tXpgvcsDQ7/bhZUUUmtI8GTbJ/G6VPqmLgnPtUlD4tIHr1CozjZHlKcalI
	FXI+BjU419D5t+45kFReB+xqpCSCBKmMxbFt/MJrxKJjRHk804qGdewo+JkBhnUIpiXIbIIOYRS
	B9J0DrisJT0g7wAVdQmyqq89E0wePXV1s5yS49gu7cqZiwQHGxUYSYEWW8vHP70goV0cVBaIaBI
	8T3rOiq83fo3vsMHDdcCu18Icdj0WI+5xHfPvlqqiZ8Y5X5L7NttKHmO9YQXHm9sdtp86JbSH/6
	sku7RjIF/+8nkC/RfBfI7ythoXRirvl+QtUEEYmv1mcA==
X-Received: by 2002:a05:600c:1f83:b0:490:b724:5085 with SMTP id 5b1f17b1804b1-490c2621a5cmr438401955e9.33.1781126981257;
        Wed, 10 Jun 2026 14:29:41 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.238.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e4228768sm970965e9.0.2026.06.10.14.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 14:29:40 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Wed, 10 Jun 2026 23:29:27 +0200
Subject: [PATCH v2 3/4] ASoC: meson: aiu: introduce I2S output formatter
MIME-Version: 1.0
Message-Id: <20260610-reshape-aiu-as-axg-v2-3-cac3663a8b51@baylibre.com>
References: <20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com>
In-Reply-To: <20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4373; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=1AVgdXapivwMhAZ343GX8lNmX+kCIj8zw6th//wHOqE=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDFma1x1ePSnd+f7CXK14q9JTSbxRaod51PSMRfyvXwktf
 vji6EvfjlIWBjEOBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAExkxkKG/zF6VifmBpzlkO6s
 8ijzNUq1Tgrem7vTZ5OM5hGJ6LVZjAx/eP/+0Hc0Lo466hPUnpKyXyPg0Nf83a2c1Z+uHf3/+tx
 xfgA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_142942_936959_8B81F70F 
X-CRM114-Status: GOOD (  18.72  )
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

Introduce aiu-formatter-i2s, a gx_formatter implementation for the AIU I2S
playback path. This is going to replace data formatting tasks that are
currently being implemented in aiu-encoder-i2s.

This should ideally follow the same design pattern used on the AXG
platform (see axg-tdmout), where basically the widget/formatter corresponds
to a single audio component. This is not possible in the GX platform though
because all the features are currently implemented in the AIU audio
component and changing that would require backward incompatible
device-tree changes.

Therefore aiu-formatter-i2s is kept very simple and
it only implements the bare minimum functionalities to provide I2S
playback formatting. It's not a standalone component though because this
is still belongs to AIU.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Makefile            |   1 +
 sound/soc/meson/aiu-formatter-i2s.c | 104 ++++++++++++++++++++++++++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index 146ec81526ba091a174a113ce3d8412ddbbfd9dd..f9ec0ebb01f048728b8f85fd8e58fb90df990470 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -5,6 +5,7 @@ snd-soc-meson-aiu-y += aiu-acodec-ctrl.o
 snd-soc-meson-aiu-y += aiu-codec-ctrl.o
 snd-soc-meson-aiu-y += aiu-encoder-i2s.o
 snd-soc-meson-aiu-y += gx-formatter.o
+snd-soc-meson-aiu-y += aiu-formatter-i2s.o
 snd-soc-meson-aiu-y += aiu-encoder-spdif.o
 snd-soc-meson-aiu-y += aiu-fifo.o
 snd-soc-meson-aiu-y += aiu-fifo-i2s.o
diff --git a/sound/soc/meson/aiu-formatter-i2s.c b/sound/soc/meson/aiu-formatter-i2s.c
new file mode 100644
index 0000000000000000000000000000000000000000..b4604734fe88da2acd6e5c2f9f59e8ecb0a017a5
--- /dev/null
+++ b/sound/soc/meson/aiu-formatter-i2s.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2026 BayLibre, SAS.
+// Author: Valerio Setti <vsetti@baylibre.com>
+
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include "aiu.h"
+#include "gx-formatter.h"
+
+#define AIU_I2S_SOURCE_DESC_MODE_8CH	BIT(0)
+#define AIU_I2S_SOURCE_DESC_MODE_24BIT	BIT(5)
+#define AIU_I2S_SOURCE_DESC_MODE_32BIT	BIT(9)
+#define AIU_RST_SOFT_I2S_FAST		BIT(0)
+
+#define AIU_I2S_DAC_CFG_MSB_FIRST	BIT(2)
+
+static struct snd_soc_dai *
+aiu_formatter_i2s_get_be(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_dapm_path *p;
+	struct snd_soc_dai *be;
+
+	snd_soc_dapm_widget_for_each_sink_path(w, p) {
+		if (!p->connect)
+			continue;
+
+		if (p->sink->id == snd_soc_dapm_dai_in)
+			return (struct snd_soc_dai *)p->sink->priv;
+
+		be = aiu_formatter_i2s_get_be(p->sink);
+		if (be)
+			return be;
+	}
+
+	return NULL;
+}
+
+static struct gx_stream *
+aiu_formatter_i2s_get_stream(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_dai *be = aiu_formatter_i2s_get_be(w);
+
+	if (!be)
+		return NULL;
+
+	return snd_soc_dai_dma_data_get_playback(be);
+}
+
+static int aiu_formatter_i2s_prepare(struct regmap *map,
+				 const struct gx_formatter_hw *quirks,
+				 struct gx_stream *ts)
+{
+	/* Always operate in split (classic interleaved) mode */
+	unsigned int desc = 0;
+	unsigned int tmp;
+
+	/* Reset required to update the pipeline */
+	regmap_write(map, AIU_RST_SOFT, AIU_RST_SOFT_I2S_FAST);
+	regmap_read(map, AIU_I2S_SYNC, &tmp);
+
+	switch (ts->physical_width) {
+	case 16: /* Nothing to do */
+		break;
+
+	case 32:
+		desc |= (AIU_I2S_SOURCE_DESC_MODE_24BIT |
+			 AIU_I2S_SOURCE_DESC_MODE_32BIT);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	switch (ts->channels) {
+	case 2: /* Nothing to do */
+		break;
+	case 8:
+		desc |= AIU_I2S_SOURCE_DESC_MODE_8CH;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_update_bits(map, AIU_I2S_SOURCE_DESC,
+				AIU_I2S_SOURCE_DESC_MODE_8CH |
+				AIU_I2S_SOURCE_DESC_MODE_24BIT |
+				AIU_I2S_SOURCE_DESC_MODE_32BIT,
+				desc);
+
+	/* Send data MSB first */
+	regmap_update_bits(map, AIU_I2S_DAC_CFG,
+				AIU_I2S_DAC_CFG_MSB_FIRST,
+				AIU_I2S_DAC_CFG_MSB_FIRST);
+
+	return 0;
+}
+
+const struct gx_formatter_ops aiu_formatter_i2s_ops = {
+	.get_stream	= aiu_formatter_i2s_get_stream,
+	.prepare	= aiu_formatter_i2s_prepare,
+};

-- 
2.39.5


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
