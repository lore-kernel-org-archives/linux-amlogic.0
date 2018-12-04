Return-Path: <SRS0=ycqe=ON=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA84C04EBF
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 16:58:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5C3A20850
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 16:58:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oFBm7ik7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OrY9HI5d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5C3A20850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q7FagTITVQpiQbAExSIUNgNTLpZOlRRSPAetDAInNOE=; b=oFBm7ik7pcuJ8n
	EUkAJyB0+4GkB4Blh7W69f2n3MXI1Re2B4C6U9wg6nwnwDr19OvrjoKf34+6glcQ0gSM6hYpWlkV8
	IgbDEUEnwZeGFMD41+sfcK2/rD081So24DZM6YFRZzJJ7woF7xSZTeF9xCUGtjOCfYnbur2ehtsCX
	JscX7zdhX/21Ia8gMKBqyR1Fc72FjqMzlgwa5Nr51/WDf7TsjMu1+S8UlKUUWt3ZZiz9coXntEKjp
	fhFDAhROHtWyygMRI55un4BfXjwZ6D3XhoOYRtcjTAMUw67UQLHpwTzFzj6KX+1EehEWsa3/0GsaX
	zFqgJJSYCsbZ1fVHVPuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUE20-0004D2-8l; Tue, 04 Dec 2018 16:58:44 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUE1x-0004Ah-FP
 for linux-amlogic@lists.infradead.org; Tue, 04 Dec 2018 16:58:42 +0000
Received: by mail-wm1-x341.google.com with SMTP id y139so10326271wmc.5
 for <linux-amlogic@lists.infradead.org>; Tue, 04 Dec 2018 08:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wJVyGLtCFC0e76IubhfRv1J+zqc3cu+QjOGSxAy/OS4=;
 b=OrY9HI5dHrgEl05gg4L5JsWStECOaFrTHEECl/2rKKA0DT+0qDdx2wP4EubHbq8FOM
 NcNOQSWITVlfMEi7qjYR22wtWUpENhWsPBJ4Cem/nXpflYiNbO0rkedcdYnWhzC2enxH
 5bnfC6OLEYZFsxXVlDLdK/OqYhKShttQElp7ADCey2DLnEnW2WitdsIbnMxEq7qvL7b+
 dtJakC2lQfu7fp8UeR70EIBV+eho2aI2qo7qDnWnXITYCi9RKyHoclnIQaw08QRAOTY9
 1IRCPMYeExz7z/e1+ordGEgrq1UjgJkGsHdtu/+iRk4NeYlUofFNamcnazsiLovHVIQU
 RtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wJVyGLtCFC0e76IubhfRv1J+zqc3cu+QjOGSxAy/OS4=;
 b=BI3vhzEidtsqyHZu/0kMhKhc6ZCP89Mr1DQhv3sAILpPB6qOWyV1vVl7d2a+0WuABc
 1MQBvosTS7xaemof12OmHSMHCTDSJI0T8W80IyunDZgojtsfM3rauDeAEVdES9oVChG4
 kkTXJjGfiigei8Xlx9bHyuo6xOmTDYQH8+NIpK/EzdmGlPbAPXastCalLd8KuXNuurMS
 5/lnKXX23vdvNlAKQtJilUPde/VaiFkx6yKoVLqYPFxcMbIOOw73DB5QOnyRSBqJyTkv
 bjM8xCpr8AdeEVt42vy/tJB5TlZLFS2+j2CwYi8vzPdiBdtLyBCw+LglxVvmRPFOwB2/
 pSTg==
X-Gm-Message-State: AA+aEWZhBV4Nq6olH87NztqlQW1WJS5AbY//7A8Vzc02RsjaL7Jd8mOt
 rFIgtrK5FeS7wUbC3BCytWNP8A==
X-Google-Smtp-Source: AFSGD/XCtQRzW+7kgW3/fYyh3qJUlzTx1r8MlcU+XPa4KWpHKWQoIlm2AKGBANnHGpp4bA1p5Wedvw==
X-Received: by 2002:a1c:7d54:: with SMTP id y81mr12982144wmc.106.1543942710001; 
 Tue, 04 Dec 2018 08:58:30 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id x81sm10152521wmg.17.2018.12.04.08.58.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Dec 2018 08:58:29 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Subject: [PATCH 1/2] clk: meson: add clk-input helper function
Date: Tue,  4 Dec 2018 17:58:18 +0100
Message-Id: <20181204165819.21541-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181204165819.21541-1-jbrunet@baylibre.com>
References: <20181204165819.21541-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_085841_509531_21741795 
X-CRM114-Status: GOOD (  12.59  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the clock input helper function. Several amlogic clock controllers
will now be registering bypass clock input. Instead of copying this
code in every of them, let's make an helper function for it

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/Makefile    |  2 +-
 drivers/clk/meson/clk-input.c | 44 +++++++++++++++++++++++++++++++++++
 drivers/clk/meson/clkc.h      |  5 ++++
 3 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/meson/clk-input.c

diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index 6da1d7082f1a..e8d1c727cf69 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -3,7 +3,7 @@
 #
 
 obj-$(CONFIG_COMMON_CLK_AMLOGIC) += clk-pll.o clk-mpll.o clk-phase.o vid-pll-div.o
-obj-$(CONFIG_COMMON_CLK_AMLOGIC) += clk-dualdiv.o
+obj-$(CONFIG_COMMON_CLK_AMLOGIC) += clk-dualdiv.o clk-input.o
 obj-$(CONFIG_COMMON_CLK_AMLOGIC_AUDIO)	+= clk-triphase.o sclk-div.o
 obj-$(CONFIG_COMMON_CLK_MESON_AO) += meson-aoclk.o
 obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o
diff --git a/drivers/clk/meson/clk-input.c b/drivers/clk/meson/clk-input.c
new file mode 100644
index 000000000000..06b3e3bb6a66
--- /dev/null
+++ b/drivers/clk/meson/clk-input.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2018 BayLibre, SAS.
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include "clkc.h"
+
+static const struct clk_ops meson_clk_no_ops = {};
+
+struct clk_hw *meson_clk_hw_register_input(struct device *dev,
+					   const char *of_name,
+					   const char *clk_name,
+					   unsigned long flags)
+{
+	struct clk *parent_clk = devm_clk_get(dev, of_name);
+	struct clk_init_data init;
+	const char *parent_name;
+	struct clk_hw *hw;
+	int ret;
+
+	if (IS_ERR(parent_clk))
+		return (struct clk_hw *)parent_clk;
+
+	hw = devm_kzalloc(dev, sizeof(*hw), GFP_KERNEL);
+	if (!hw)
+		return ERR_PTR(-ENOMEM);
+
+	parent_name = __clk_get_name(parent_clk);
+	init.name = clk_name;
+	init.ops = &meson_clk_no_ops;
+	init.flags = flags;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+	hw->init = &init;
+
+	ret = devm_clk_hw_register(dev, hw);
+
+	return ret ? ERR_PTR(ret) : hw;
+}
+EXPORT_SYMBOL_GPL(meson_clk_hw_register_input);
diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index 1efa6be9cfe4..e3cd442db739 100644
--- a/drivers/clk/meson/clkc.h
+++ b/drivers/clk/meson/clkc.h
@@ -138,4 +138,9 @@ extern const struct clk_ops meson_vid_pll_div_ro_ops;
 extern const struct clk_ops meson_clk_dualdiv_ops;
 extern const struct clk_ops meson_clk_dualdiv_ro_ops;
 
+struct clk_hw *meson_clk_hw_register_input(struct device *dev,
+					   const char *of_name,
+					   const char *clk_name,
+					   unsigned long flags);
+
 #endif /* __CLKC_H */
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
