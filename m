Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB643C8300C
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Jun 2023 09:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oh7N4HVhjn0YsuQ9dgYgh9GLprLHwQ20GLecl9eeZ0o=; b=fx6yHSr2X0ZNTP
	w7uQUgQ9C03YPMNf11LEN/DvapD3uYIPqc4O2NqZhmCYmVYfgeIoGf37ZVAQ9dD6OUB5eoolQWroT
	Q/PPWjyvGmtUxZlyUXshTNF10RvvoX2IJQbtQYdO4wdeFt7IE5U3/XGkFznAqBcV3LwQ9Jv/fwY/q
	GCLLybXs2JwE4zHWnf19M6XsyMacPBJULLSmzQS6mygxOb+vlIygryFuBDr3SHN7x6zknKc54xpVh
	Suitg3rYAb3P4iZOzLG1wxsbYyVtTqDXg4l5MrmIgLj03uYK8Emjkl+1rFZtZH6kbCnOzjogBEFXm
	NS1fIFgg9DRpxvBwPp2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8eIt-003OWI-2d;
	Mon, 12 Jun 2023 09:57:39 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8eIq-003OU1-27
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Jun 2023 09:57:38 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f6dfc4dffaso30063315e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Jun 2023 02:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686563855; x=1689155855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QBZGnVp949LqmHfp0hbLm9KUytV5xswsvhn4zf+xDwg=;
        b=G+hv0E9aRmffwN0OQuU5Rq+3v0vUBfiyE2AK4XBCx9aR+rPHals0IPiaSQfST/EXQt
         d79SF2KwA6GT0EdaGSxFno1TJhm63ZEIlD2D3q6YFBOPt9L/bMDVh/zyo4RfMyk9H6a6
         3l0zLpfKrlvC9t2ScdmK9pS3p8x27pAOtGDIXnV6zRmMWPdLqE7cIdWzzFdFlr/N3ayf
         A1tkhyfCVL1DPaFwSnEhncdm9kHRXeSQ2WJITO597/0rnRmm5MUHFU00iAbhbd2y5MrK
         32MuG8OLzzABGr28oUn3PzYn76lL1u45iTmbxKuR4CWcTITBRoTxz7gAOtaUpj9RLXPF
         JKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686563855; x=1689155855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QBZGnVp949LqmHfp0hbLm9KUytV5xswsvhn4zf+xDwg=;
        b=Yp0grcFLv/5jItoiOnLCs2BgtTrUFthlRSis4cI9izI78lHwit7/f/q3TAIpiB9/YM
         5iaa+/ouKzqQIKBnn2kSRMYlLxk8BScO2LDQAfSgfr9mIaivVNY9JptReMlSUiZ5I9sn
         +pjuu7LexhnP+iWlpWbNwkUHGcIStMxo0+nZM+tF/94c+erld87qgxKaPAl4CjbYtaZE
         y1T5YC8FVsgUXf6mYuFD1GVMdcvUrhZwiNlkE61KvKvnTo1xDwDqpgoGyFQCqDJjfxQH
         ssHRpk2HMlKpSMWjdu9wVasRkRHU8bnitMoB6NBm9NT613EWbLwo8yUOMkPAex47J4Hk
         FRtg==
X-Gm-Message-State: AC+VfDy0KOIDzBTwgLQvuxEGf87Q7ZGNM+DgmSLtWV2vhOzjxlyqHG4l
	v2kJBRu1+Iq5aApuzf8r4mt9xw==
X-Google-Smtp-Source: ACHHUZ5QWKxhjPP1zIAUQOMIEjesvfvlM1EUinWaGlKYFYB2NYNJgSIadGHmGre+EpTQObgoqQC2eg==
X-Received: by 2002:a7b:ce88:0:b0:3f7:f4bc:ebe7 with SMTP id q8-20020a7bce88000000b003f7f4bcebe7mr5859896wmj.37.1686563855238;
        Mon, 12 Jun 2023 02:57:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id f25-20020a7bcd19000000b003f7ff520a14sm10829525wmj.22.2023.06.12.02.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:57:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 12 Jun 2023 11:57:18 +0200
Subject: [PATCH v2 01/19] clk: meson: introduce meson-clkc-utils
MIME-Version: 1.0
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-1-38172d17c27a@linaro.org>
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v2-0-38172d17c27a@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3180;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Sw6cxK6E7HYSGAjhmT4F08djxvQKs7eqg8Xnz1cdvKs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkhuwFcdZeJ2nIN3mmWrU/JcOcDQTAsQkkpsoXJa0m
 m3SJxZaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIbsBQAKCRB33NvayMhJ0SXGD/
 9+VFokX7cu+g4xvYB8YpyF0mHuycbo0o8ZetwVYr5sftMLzMginwtCTlW5pbNw0zV8m7coKw9ErBGq
 yATAGnX2k0GRkvUignjShZh715IQiMJlD7sn/hb/6YVzfc74KgHSVsLGz0di5S8V4YCddBQjt2tm0M
 eYjXRAd3ntra12XPDNcTxilQY4xJCkCA1znc+qenXyoUJT7/hRsr5ZrudrKBcizikhXb6Hr1UVhEGF
 E3F6sLQi/lVwcP8GErVgBBLX69tnxDKK1NMygDyxSBYdt9nHe0wDbsWXvZ9kGffgw1WDxS5recgEhZ
 e6Rzq4OETGKlU7ZKynMl5SDj/F6BUep3Wri20fObgK2B8KtLd3qQ6JUb+ZnEbg1/4LFLrt5OXcnWSk
 hdOBzuY6k8K9GFBGFzPzm1CZ556qy3eCgmBEzJ+woMOLTcAigPX57joN4OLuROKe+EyVNaq7c0j4u2
 ESObGndfiUTX7DoNVy3oFSnxhhH8C6yhpUpjZ+iJqH4pwsPMD40rUQL+7BcPPRAaG5ybH6sXBjW7CC
 Flw9AkH4Zi/+hZ3j3qleE7Ae6JZwVJ8Aapx1ASAWDvxbC6/Pv+2q2z/XJc37drSVwVvOpAd4+nb0JX
 Rsoiog1Y1MweeqnG8YxOJgwBZquVXKCr1hsqdVVOuS/yzq2bsoPPuJzWJroA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_025736_693199_87BA2BED 
X-CRM114-Status: GOOD (  14.66  )
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

Let's introduce a new module called meson-clkc-utils that
will contain shared utility functions for all Amlogic clock
controller drivers.

The first utility function is a replacement of of_clk_hw_onecell_get
in order to get rid of the NR_CLKS define in all Amlogic clock
drivers.

The goal is to move all duplicate probe and init code in this module.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/meson/Kconfig            |  3 +++
 drivers/clk/meson/Makefile           |  1 +
 drivers/clk/meson/meson-clkc-utils.c | 25 +++++++++++++++++++++++++
 drivers/clk/meson/meson-clkc-utils.h | 19 +++++++++++++++++++
 4 files changed, 48 insertions(+)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 8ce846fdbe43..d03adad31318 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -30,6 +30,9 @@ config COMMON_CLK_MESON_VID_PLL_DIV
 	tristate
 	select COMMON_CLK_MESON_REGMAP
 
+config COMMON_CLK_MESON_CLKC_UTILS
+	tristate
+
 config COMMON_CLK_MESON_AO_CLKC
 	tristate
 	select COMMON_CLK_MESON_REGMAP
diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index d5288662881d..cd961cc4f4db 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 # Amlogic clock drivers
 
+obj-$(CONFIG_COMMON_CLK_MESON_CLKC_UTILS) += meson-clkc-utils.o
 obj-$(CONFIG_COMMON_CLK_MESON_AO_CLKC) += meson-aoclk.o
 obj-$(CONFIG_COMMON_CLK_MESON_CPU_DYNDIV) += clk-cpu-dyndiv.o
 obj-$(CONFIG_COMMON_CLK_MESON_DUALDIV) += clk-dualdiv.o
diff --git a/drivers/clk/meson/meson-clkc-utils.c b/drivers/clk/meson/meson-clkc-utils.c
new file mode 100644
index 000000000000..9a0620bcc161
--- /dev/null
+++ b/drivers/clk/meson/meson-clkc-utils.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
+ */
+
+#include <linux/of_device.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include "meson-clkc-utils.h"
+
+struct clk_hw *meson_clk_hw_get(struct of_phandle_args *clkspec, void *clk_hw_data)
+{
+	const struct meson_clk_hw_data *data = clk_hw_data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx >= data->num) {
+		pr_err("%s: invalid index %u\n", __func__, idx);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return data->hws[idx];
+}
+EXPORT_SYMBOL_GPL(meson_clk_hw_get);
+
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/meson/meson-clkc-utils.h b/drivers/clk/meson/meson-clkc-utils.h
new file mode 100644
index 000000000000..fe6f40728949
--- /dev/null
+++ b/drivers/clk/meson/meson-clkc-utils.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
+/*
+ * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
+ */
+
+#ifndef __MESON_CLKC_UTILS_H__
+#define __MESON_CLKC_UTILS_H__
+
+#include <linux/of_device.h>
+#include <linux/clk-provider.h>
+
+struct meson_clk_hw_data {
+	struct clk_hw	**hws;
+	unsigned int	num;
+};
+
+struct clk_hw *meson_clk_hw_get(struct of_phandle_args *clkspec, void *clk_hw_data);
+
+#endif

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
