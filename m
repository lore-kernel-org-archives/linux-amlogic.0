Return-Path: <SRS0=97z3=VA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D64C4646D
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2019 12:26:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 896FB218BB
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2019 12:26:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U9joN55u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="15DE6QGN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 896FB218BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5OG2NFRdJzQoZ2jakSawR+B5kEBj073fn9poZnvuENc=; b=U9joN55uXzuKH/
	5JvCdMQ299YON5IH7CRN8gz9Yl1cCAftksIQhPRI5M81+5lXvqJcX+adR2DJSZSrn1FlNui43t7lV
	JThi/51LwUPp04JwQU7cv+SlgvWJimCL5+cnk/r/GOdpwI85n5LYLG4of2Ca9g6QqVlZFndZp2GmC
	ieOMjFwGgBJASUUCtvZtwjwH9Y/nAn9d0hDYc1czuGK1g96ab7CgbVX3fB2q4bbcb5HAQ0eOdh7F4
	jvBkaIEAhf1YUhssQGg6vv1WsLo2d3GoPvr2Wzy34egLEJh0ACMe/a3Fo2ApsLDso035ifmDqmty/
	ClIY9bKm30jD/P3kigng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hieLG-0003sh-48; Wed, 03 Jul 2019 12:26:30 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hieLB-0003oj-9u
 for linux-amlogic@lists.infradead.org; Wed, 03 Jul 2019 12:26:27 +0000
Received: by mail-wr1-x443.google.com with SMTP id n4so2547190wrw.13
 for <linux-amlogic@lists.infradead.org>; Wed, 03 Jul 2019 05:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JILUVyhQViuGdxVU7msStBtHX6blqTuLXOnzbseIUxY=;
 b=15DE6QGNII0vC99FAxzXL/XNAKOz1spvux5aiNDajerPemkY0N0Yvhp2NZCZ56aXTd
 V2F1xuct6cDSpr46JtcIMfT0bY+qWkhe+ryMJyyN3VyCojjWzkFD36pkScxrT6gquK2Z
 mNf6E4S6+B9Vjc3sY/l4IQ40/p5dnlRb044FAl8PI7y18/lcpTNGk2LBS1A4BV2d5VkC
 UVkkVb7iyhWRM4GL6g9a1XzJi/zV/bzZ3psfBINcuReBkawJoee3Vf9yBnestkcfkdaZ
 Rji7UjMscG4KTSfq2gpJBzs8UNT7oFgw3yE4242/k0j/r450VClhz57RXPNJt3Rba9cJ
 gcng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JILUVyhQViuGdxVU7msStBtHX6blqTuLXOnzbseIUxY=;
 b=WauI+tmnsv7XDhoVy9E1/zRYrNvh1NNxJZQYQ72lhxYZx1l4pGv7w0Thja8oaZ+H41
 6tjKmoE6azy7bSroYdNuwFraoqlMAE/pT/pdGsra0VJyTiRWa82JU5cC9PSSOTaF3Bc6
 MN4UEUMiCbQN42CcXTq9Su6VCjoTfwYDXVpRRKKKR6sWTYtdiEWe7hotgOOXP4c8c0bB
 lyTvtBAxYIfbM5GnPe9Nxbd7T7QNyH+3Pa2YlNnpkhm6Aa5ggVFd0UrmVwiYkMNHrv8I
 EOVhGA2hzdn+G6TaPgXCSs23L3M7vqtTCq+Gnas2d7XFY4bXCnFjuUkw5U+22SvfClO3
 6kMA==
X-Gm-Message-State: APjAAAUQGVOHcd7fD37VJyymw/kHYFFrkxZdXbAjZUpOjVqMgI1fdmDw
 C2d7IfAROF56sK3YRyyIWfFzvA==
X-Google-Smtp-Source: APXvYqw/fJylWhA1wOFDAASQ7snUTEyMNdcCC+ljsbuq5ZdsSzk61cFVRouS0SUaOm+SNLZ6a3mjPA==
X-Received: by 2002:a5d:4ecc:: with SMTP id s12mr29803490wrv.157.1562156784072; 
 Wed, 03 Jul 2019 05:26:24 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id v67sm2868132wme.24.2019.07.03.05.26.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 05:26:23 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 2/2] clk: meson: axg-audio: add g12a reset support
Date: Wed,  3 Jul 2019 14:26:14 +0200
Message-Id: <20190703122614.3579-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190703122614.3579-1-jbrunet@baylibre.com>
References: <20190703122614.3579-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190703_052625_349287_2142C62E 
X-CRM114-Status: GOOD (  15.81  )
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
index 8028ff6f6610..ce163bd03aad 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
+#include <linux/reset-controller.h>
 #include <linux/slab.h>
 
 #include "axg-audio.h"
@@ -916,6 +917,84 @@ static int axg_register_clk_hw_inputs(struct device *dev,
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
@@ -925,12 +1004,15 @@ static const struct regmap_config axg_audio_regmap_cfg = {
 
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
@@ -1005,8 +1087,27 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
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
+	return ret = devm_reset_controller_register(dev, &rst->rstc);
 }
 
 static const struct audioclk_data axg_audioclk_data = {
@@ -1015,6 +1116,8 @@ static const struct audioclk_data axg_audioclk_data = {
 
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
