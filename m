Return-Path: <SRS0=Dn2N=WI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10981C433FF
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:33:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D47DD216F4
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:33:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VeGHCMRS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kv92oP2M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D47DD216F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1knikAG9NRyy0BiST5sDd9Q8dwi+qe5PhmpzYNOdrHA=; b=VeGHCMRSzg+W0b
	HsdnN70hBfoYZtJ0YtKQdkbDJT5ZIiSbBSHfMZoi0XPjRmjfX+qZoa0N/zHlMfzuXO87XDscRNOtC
	+YinkkE0YzkUr+x1AEIydJy3YyY5vuypANgtSkFP7nQe/1Nx9y0EwKAVyWJVEx1E889LXBUVBwNw6
	6iMXKTls5sLUHAb7kdKX93uaPNif45hCLnuBkq4THmhHXjiA8KJAZ4uCrzA8A3LiKt5mL+SQXUfVX
	1WjJ/6Y4RXt6LaYvC42Es42dRq63kUpIA1fZUvcy15HUiLYh3W3u4DEUsC9lJIgCQNoEPw0GOOWwd
	fSWDlK2HkgHZkeKcPqkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hx9Vt-0003Oy-J7; Mon, 12 Aug 2019 12:33:26 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hx9VU-0003Aj-T3
 for linux-amlogic@lists.infradead.org; Mon, 12 Aug 2019 12:33:02 +0000
Received: by mail-wr1-x443.google.com with SMTP id 31so104443955wrm.1
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Aug 2019 05:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dqJ4n54yjkwbFCEJq5QMHITUyQhmVlnjTeiFqDxqTrc=;
 b=kv92oP2M64Bi/XRGqe2z+1du/iOO7SPa2FaSuz5My6Bls2OISMLzxzQOJmnLEo3BeL
 M7HkQQp07U6ofG0MbpZzf9duWokZdkwK8qM/Ah+qrubLjk+v7LGFBUxOwZIXoWA8/ZAH
 eSbfFpcn99oNw61Co8/UMA12yaMZesLT5o//4C42HM8DIr3zIJH3l3spikX5rTVVBqJ5
 u1IqLYaXOF9pCyXsw6yJRjhhG40K4kcTru3eCyNTaY3AK1s0InOYefn9KaYJRylZm3wA
 tb7636NjIyS5ke7GYIp566pFb8Dx3iJu/fIz+BXeCd6eMUVcEzWIKG1mKhMItakVRjhj
 V8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dqJ4n54yjkwbFCEJq5QMHITUyQhmVlnjTeiFqDxqTrc=;
 b=XKWEWfBAFEGO2Whw4IMsEftuyNc3DlN78bAehRPQ79wrk0BdBL9KZKwGobI3Js9dTW
 pnSTr6vorCF5JhJ126zMZ1qNcZsl/5CDBVRRT4nDLGh4eUMiwaaBgcO1WbibbtFvxQbY
 Y7lWgJE6VQ1DjIRQI8e/upy+RBAbF5gKM858ZKoyc6Jop+8o0LHOwibyJinYWJAhZLgX
 /Yc17lPeviWYrMMEkzbJXSuukHENeY0T1tV6T0AeZZAWdZbZhRqNs77LCwphu8hgyjN0
 TS01/my4ognDoUC8ivYISosqRiVthh72Gd7ciiF8nIYeSdWfpvwRZ4Ny3QHeV5vf59Ah
 pTvA==
X-Gm-Message-State: APjAAAU9hTkstioauxE9XI+vlfN4PGcxS+jReNsWkacmmFgEYzJftZph
 C08zzIRzaNP8uUF0dssXcZkhoA==
X-Google-Smtp-Source: APXvYqwqWFswOPiG61j95oJ0yTvUBxuNRukh5FHJcPalgQyz4/Z/hw+oqpV+YPw2EUIa3geP+g0NKQ==
X-Received: by 2002:adf:a348:: with SMTP id d8mr29164772wrb.235.1565613179498; 
 Mon, 12 Aug 2019 05:32:59 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z6sm15886432wre.76.2019.08.12.05.32.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 05:32:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 2/2] clk: meson: axg-audio: add g12a reset support
Date: Mon, 12 Aug 2019 14:32:53 +0200
Message-Id: <20190812123253.4734-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812123253.4734-1-jbrunet@baylibre.com>
References: <20190812123253.4734-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_053300_947441_D081B008 
X-CRM114-Status: GOOD (  15.94  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On the g12a, the register space dedicated to the audio clock also
provides some resets. Let the clock controller register a reset
provider as well for this SoC family.

the axg SoC family does not appear to provide this feature.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg-audio.c | 107 +++++++++++++++++++++++++++++++++-
 drivers/clk/meson/axg-audio.h |   1 +
 2 files changed, 106 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 741df7e955ca..6be9df1efce5 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
+#include <linux/reset-controller.h>
 #include <linux/slab.h>
 
 #include "axg-audio.h"
@@ -918,6 +919,84 @@ static int devm_clk_get_enable(struct device *dev, char *id)
 	return 0;
 }
 
+struct axg_audio_reset_data {
+	struct reset_controller_dev rstc;
+	struct regmap *map;
+	unsigned int offset;
+};
+
+static void axg_audio_reset_reg_and_bit(struct axg_audio_reset_data *rst,
+					unsigned long id,
+					unsigned int *reg,
+					unsigned int *bit)
+{
+	unsigned int stride = regmap_get_reg_stride(rst->map);
+
+	*reg = (id / (stride * BITS_PER_BYTE)) * stride;
+	*reg += rst->offset;
+	*bit = id % (stride * BITS_PER_BYTE);
+}
+
+static int axg_audio_reset_update(struct reset_controller_dev *rcdev,
+				unsigned long id, bool assert)
+{
+	struct axg_audio_reset_data *rst =
+		container_of(rcdev, struct axg_audio_reset_data, rstc);
+	unsigned int offset, bit;
+
+	axg_audio_reset_reg_and_bit(rst, id, &offset, &bit);
+
+	regmap_update_bits(rst->map, offset, BIT(bit),
+			assert ? BIT(bit) : 0);
+
+	return 0;
+}
+
+static int axg_audio_reset_status(struct reset_controller_dev *rcdev,
+				unsigned long id)
+{
+	struct axg_audio_reset_data *rst =
+		container_of(rcdev, struct axg_audio_reset_data, rstc);
+	unsigned int val, offset, bit;
+
+	axg_audio_reset_reg_and_bit(rst, id, &offset, &bit);
+
+	regmap_read(rst->map, offset, &val);
+
+	return !!(val & BIT(bit));
+}
+
+static int axg_audio_reset_assert(struct reset_controller_dev *rcdev,
+				unsigned long id)
+{
+	return axg_audio_reset_update(rcdev, id, true);
+}
+
+static int axg_audio_reset_deassert(struct reset_controller_dev *rcdev,
+				unsigned long id)
+{
+	return axg_audio_reset_update(rcdev, id, false);
+}
+
+static int axg_audio_reset_toggle(struct reset_controller_dev *rcdev,
+				unsigned long id)
+{
+	int ret;
+
+	ret = axg_audio_reset_assert(rcdev, id);
+	if (ret)
+		return ret;
+
+	return axg_audio_reset_deassert(rcdev, id);
+}
+
+static const struct reset_control_ops axg_audio_rstc_ops = {
+	.assert = axg_audio_reset_assert,
+	.deassert = axg_audio_reset_deassert,
+	.reset = axg_audio_reset_toggle,
+	.status = axg_audio_reset_status,
+};
+
 static const struct regmap_config axg_audio_regmap_cfg = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
@@ -927,12 +1006,15 @@ static const struct regmap_config axg_audio_regmap_cfg = {
 
 struct audioclk_data {
 	struct clk_hw_onecell_data *hw_onecell_data;
+	unsigned int reset_offset;
+	unsigned int reset_num;
 };
 
 static int axg_audio_clkc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct audioclk_data *data;
+	struct axg_audio_reset_data *rst;
 	struct regmap *map;
 	struct resource *res;
 	void __iomem *regs;
@@ -984,8 +1066,27 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 		}
 	}
 
-	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
-					   data->hw_onecell_data);
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
+					data->hw_onecell_data);
+	if (ret)
+		return ret;
+
+	/* Stop here if there is no reset */
+	if (!data->reset_num)
+		return 0;
+
+	rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
+	if (!rst)
+		return -ENOMEM;
+
+	rst->map = map;
+	rst->offset = data->reset_offset;
+	rst->rstc.nr_resets = data->reset_num;
+	rst->rstc.ops = &axg_audio_rstc_ops;
+	rst->rstc.of_node = dev->of_node;
+	rst->rstc.owner = THIS_MODULE;
+
+	return devm_reset_controller_register(dev, &rst->rstc);
 }
 
 static const struct audioclk_data axg_audioclk_data = {
@@ -994,6 +1095,8 @@ static const struct audioclk_data axg_audioclk_data = {
 
 static const struct audioclk_data g12a_audioclk_data = {
 	.hw_onecell_data = &g12a_audio_hw_onecell_data,
+	.reset_offset = AUDIO_SW_RESET,
+	.reset_num = 26,
 };
 
 static const struct of_device_id clkc_match_table[] = {
diff --git a/drivers/clk/meson/axg-audio.h b/drivers/clk/meson/axg-audio.h
index 5d972d55d6c7..c00e28b2e1a9 100644
--- a/drivers/clk/meson/axg-audio.h
+++ b/drivers/clk/meson/axg-audio.h
@@ -22,6 +22,7 @@
 #define AUDIO_MCLK_F_CTRL	0x018
 #define AUDIO_MST_PAD_CTRL0	0x01c
 #define AUDIO_MST_PAD_CTRL1	0x020
+#define AUDIO_SW_RESET		0x024
 #define AUDIO_MST_A_SCLK_CTRL0	0x040
 #define AUDIO_MST_A_SCLK_CTRL1	0x044
 #define AUDIO_MST_B_SCLK_CTRL0	0x048
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
