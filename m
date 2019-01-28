Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D072C282C8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 18:07:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB2EE2148E
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 18:07:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="goQ5Nrdg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="TSESYOlV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB2EE2148E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=waclH2OshLI8oy0cQXYNX9alBeHw4j4Vzkc7aiv6XeM=; b=goQ5Nrdgq8ut1n
	AyDkMQNKdeQ/Wi7QT/oOrxQGGW3ZGENO5nm9/4wzwtFhl4i/Gg37fJ4GIzOy11sSIVGFfUnDIvsrP
	Mnr+5f6xBfxqWlz8tE26ZgpB4FO0nIT/tqh8TMc8BCAHLt4qvsMnezAhEVgxaV//oIQLzwNMQrjGq
	Nhy9GS8ZiHAfcBUj5PCo05DwpJ+vkXEqrTUNSp4JVhkiTR0iTP0O/I+BjIFajIfnm4AARZJkJnEqJ
	Lq0TRcyxthWw0pEwGHenvA/pes9vYKVsXF4/+fViuOWmL4bOuE4h8KS/Az6/tUEVO4J6A9Hwohfh6
	dEZfn6lvVF5QIe2FlJ4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goBJh-0007AH-54; Mon, 28 Jan 2019 18:07:29 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goBHG-0003qW-CL
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 18:05:18 +0000
Received: by mail-wr1-x441.google.com with SMTP id s12so19120452wrt.4
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Jan 2019 10:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ik8ppvqBDIku5U1/4NdGEUHXc0XKiuzjPuvabcpfASs=;
 b=TSESYOlVltS3TW6AL91xMggjsnr5KhNJCYPFdj017FXAfGforpMTOAXph1J92EPzki
 xs4ntVNrdVJcFsl7hjkLu8Yeo6w9hz8hCvgociDbGwJVozJ55hQ+FMftywCPEQRJvc4t
 vcErwcJbk7O7czHIBtGPj+xweLgLFcbRb8CtHGIVLsH+a8mhM9RxCZnyTxIfcUXklOLw
 T3XX+MNfmrjf3DseHtw+Vz/We92XN7Wq9xD9/351X1AxlMVflMVo1y5nxI5GFllEq8jq
 +HSSA83soF/P1I3CofQQb0HeXiTVFIFgOfDNlaHgwdqs4FY6FEoxjkC893m0teZaHqAz
 /74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ik8ppvqBDIku5U1/4NdGEUHXc0XKiuzjPuvabcpfASs=;
 b=qpSwhs6IFuJAB0NHwb7s4mN2n41atSLD6r02FqFjUlEtZSs2kF6GcCJZjKehMxIFwt
 Zurg4OUbmnnUzs0upAoobICwA5A+adGRRS3oAaS4RXQO2NMBOx0gn/xThmWEhGbjXGI4
 o87T13TqErTXEo25t5uDEVlV+E4jI1TOIzs9m7ZCDbqid+SrbpUg2fnA6M+cZJUeFrEA
 gZGDUu0iY3HMn61ryKMttRcMy5+GHNRZylJpI4PdYfUvUh5Rn5KSl5G9/Cti3ziUgOhK
 hwaOnFuke9ZYyKCOdesI6E667Gep6S4NXx0/P/bTK/bWf3yK9yJVVWBOGJsWUUEFOewe
 z3pA==
X-Gm-Message-State: AJcUukeW7dVFgAn9iweQXnWIv5V4gSEkC46CAbmXXL6DvnnqbuKMI5oB
 MQW8ff1IZyqeuYxF/thoW9WsC+NZqjw=
X-Google-Smtp-Source: ALg8bN4axE3Jm57Ar6p/8Z5k8GxKCnyr15/ghuZ2xAJf2JLr5cweB1zCKXh7dy/WqE+I/F2jF8f1sQ==
X-Received: by 2002:a5d:6152:: with SMTP id y18mr23913249wrt.141.1548698696939; 
 Mon, 28 Jan 2019 10:04:56 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id p6sm145548193wrx.50.2019.01.28.10.04.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Jan 2019 10:04:56 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>
Subject: [PATCH 09/14] clk: meson: take vid-pll-div out of clkc
Date: Mon, 28 Jan 2019 19:04:25 +0100
Message-Id: <20190128180430.28689-10-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190128180430.28689-1-jbrunet@baylibre.com>
References: <20190128180430.28689-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_100458_711175_37DED4D9 
X-CRM114-Status: GOOD (  13.89  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/clkc.h        |  6 ------
 drivers/clk/meson/gxbb.c        |  1 +
 drivers/clk/meson/vid-pll-div.c | 10 +++++++++-
 drivers/clk/meson/vid-pll-div.h | 20 ++++++++++++++++++++
 4 files changed, 30 insertions(+), 7 deletions(-)
 create mode 100644 drivers/clk/meson/vid-pll-div.h

diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index e8e4067bfcd5..ece8ed82b11c 100644
--- a/drivers/clk/meson/clkc.h
+++ b/drivers/clk/meson/clkc.h
@@ -11,11 +11,6 @@
 #include "clk-regmap.h"
 #include "parm.h"
 
-struct meson_vid_pll_div_data {
-	struct parm val;
-	struct parm sel;
-};
-
 struct meson_clk_dualdiv_param {
 	unsigned int n1;
 	unsigned int n2;
@@ -35,7 +30,6 @@ struct meson_clk_dualdiv_data {
 
 /* clk_ops */
 extern const struct clk_ops meson_clk_cpu_ops;
-extern const struct clk_ops meson_vid_pll_div_ro_ops;
 extern const struct clk_ops meson_clk_dualdiv_ops;
 extern const struct clk_ops meson_clk_dualdiv_ro_ops;
 
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 6a8358f3e0ef..f7b919b035ee 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -17,6 +17,7 @@
 #include "clk-regmap.h"
 #include "clk-pll.h"
 #include "clk-mpll.h"
+#include "vid-pll-div.h"
 
 #define IN_PREFIX "ee-in-"
 
diff --git a/drivers/clk/meson/vid-pll-div.c b/drivers/clk/meson/vid-pll-div.c
index 88af0e282ea0..08bcc01c0923 100644
--- a/drivers/clk/meson/vid-pll-div.c
+++ b/drivers/clk/meson/vid-pll-div.c
@@ -5,7 +5,10 @@
  */
 
 #include <linux/clk-provider.h>
-#include "clkc.h"
+#include <linux/module.h>
+
+#include "clk-regmap.h"
+#include "vid-pll-div.h"
 
 static inline struct meson_vid_pll_div_data *
 meson_vid_pll_div_data(struct clk_regmap *clk)
@@ -89,3 +92,8 @@ static unsigned long meson_vid_pll_div_recalc_rate(struct clk_hw *hw,
 const struct clk_ops meson_vid_pll_div_ro_ops = {
 	.recalc_rate	= meson_vid_pll_div_recalc_rate,
 };
+EXPORT_SYMBOL_GPL(meson_vid_pll_div_ro_ops);
+
+MODULE_DESCRIPTION("Amlogic video pll divider driver");
+MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/meson/vid-pll-div.h b/drivers/clk/meson/vid-pll-div.h
new file mode 100644
index 000000000000..c0128e33ccf9
--- /dev/null
+++ b/drivers/clk/meson/vid-pll-div.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 BayLibre, SAS.
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
+ */
+
+#ifndef __MESON_VID_PLL_DIV_H
+#define __MESON_VID_PLL_DIV_H
+
+#include <linux/clk-provider.h>
+#include "parm.h"
+
+struct meson_vid_pll_div_data {
+	struct parm val;
+	struct parm sel;
+};
+
+extern const struct clk_ops meson_vid_pll_div_ro_ops;
+
+#endif /* __MESON_VID_PLL_DIV_H */
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
