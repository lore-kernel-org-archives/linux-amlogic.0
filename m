Return-Path: <SRS0=A3X0=MF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF64C07E95
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 23:26:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CB8061363
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jul 2021 23:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CB8061363
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a7iOnubup7cmIegV+zrlzXMqpKzBoEP/5XTtRyrNdJY=; b=XlYr119rtqLiPc
	MJsSPRX/VA5RnHYp7HbnYVH+A6rcr2D0UtW/tvgrG56lqGXC0E2vTmtqYb3jcweVgTIzoXMjnsPTi
	JJLhrlRGdk7joVSQM6TTPmmHi1oLmLclCCFiA0yJKxRiQWpiOzltwYdSa6tjXA9k4WcrUSgpXeIhw
	uLYW2/xGFE92wTk6VJtPQ53LJe6/vBwDBqLXDCdYI1M9jTqG/xy9eiSBrb+JVz2sfyNeE3s4JLTOY
	OE2xkaxClniqHZmkV/PUJcEWF3+a1QLiK5Z6rUkfqrShU90+9Ho2d0AIXq+53ukY4cbW4pfuqAMkx
	LDncRBrQJOYpipgmSthQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3RnY-00BcBq-35; Tue, 13 Jul 2021 23:26:44 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3RmF-00BbZ8-8V; Tue, 13 Jul 2021 23:25:24 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso228521wmj.4; 
 Tue, 13 Jul 2021 16:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FH75JwQEVliZTaWQznunNwTYXm+Fo6iQYmM7PbpCqSg=;
 b=fX5FxxXqlzoY7IxLhQNQg1smTSkSn1eHqVimKllvBWfJTwrNPzR1Vrmp8VR/Lq1jIo
 a0SbXWKhZenNgh0uKQDmLwDf6R3mFKNIuOupKkUclmsRjj8EKFOWCVZug+H0eE15Japw
 /hxLUZTqVdzeTa7nhhGLSSRlbSsUxM4JRlmxKHE9khgg2nsjtk+euga2pgJTtQuFcIpb
 1apBe7gFE6sDYtHpr0+XzvUcS216jM1IejOTdxW1WfkoHmCzZVDAMD8zDrzKAqvb19Dd
 VaxEtLmqr3NId1hApJ1XxE1uvcQpuyM7pZrIs9WKSmG19HsMwOLMhYz0PxMjl3W+HJiE
 247g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FH75JwQEVliZTaWQznunNwTYXm+Fo6iQYmM7PbpCqSg=;
 b=dtsRCMtgasYldLapvIpZkGvBZmFJXsgIczw/3kVoiWwZgfH9BAUkFHNCohqynbIJO9
 K08ugbb/1EGapxFX6X67ePpZTAP9ZovIigR5eAK+p/xERLSaKb0HDJeNNpbnlds5xCJ9
 4sqhXyKhRzrbPNfRiHVldPL05i8gLwSvQhbtWbzck7CuaE6z2Pv2kZac/sVQYpnjzfmN
 k2ZJamvcMQaSPfrc25EBKcim/aShYlD2wlF7CmTMcPX4s2w8cy3H8r18er/Ecpy5VHeF
 4DfI7ZnEjrEChZ79LXryqJuviGr1piO7QBjMibcIHGV+U0dzfg1Q/lg/ML4NjjqvYMpE
 aDAA==
X-Gm-Message-State: AOAM532gczEJYeGKSkTV+BPs+aaBtcnhPX+Rv9AhwJBmg1Tb3wk/cUy/
 utxn4HGNVwJv8uFFfkoQ69vxBtquhGs=
X-Google-Smtp-Source: ABdhPJxnNKco3a/kivcsIRnmdxRAj+ZXML03zzTKPNo++xrIsOEnuoPpZAmSAlxRz8mspb013enWwg==
X-Received: by 2002:a05:600c:4841:: with SMTP id
 j1mr7773098wmo.88.1626218721546; 
 Tue, 13 Jul 2021 16:25:21 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-2a01-0c23-c041-6f00-f22f-74ff-fe21-0725.c23.pool.telefonica.de.
 [2a01:c23:c041:6f00:f22f:74ff:fe21:725])
 by smtp.googlemail.com with ESMTPSA id o11sm3857390wmc.2.2021.07.13.16.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 16:25:21 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, jbrunet@baylibre.com, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 6/6] clk: meson: meson8b: Export the video clocks
Date: Wed, 14 Jul 2021 01:25:10 +0200
Message-Id: <20210713232510.3057750-7-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713232510.3057750-1-martin.blumenstingl@googlemail.com>
References: <20210713232510.3057750-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210713_162523_365300_A2215617 
X-CRM114-Status: GOOD (  11.50  )
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

Setting the video clocks requires fine-tuned adjustments of various
video clocks. Export the required ones to allow changing the video clock
for the CVBS and HDMI outputs at runtime.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.h              | 12 +-----------
 include/dt-bindings/clock/meson8b-clkc.h | 10 ++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index b5b591943e80..ce62ed47cbfc 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -117,14 +117,11 @@
 #define CLKID_PERIPH_SEL	125
 #define CLKID_AXI_SEL		127
 #define CLKID_L2_DRAM_SEL	129
-#define CLKID_HDMI_PLL_LVDS_OUT	131
-#define CLKID_HDMI_PLL_HDMI_OUT	132
+#define CLKID_HDMI_PLL_LVDS_OUT 131
 #define CLKID_VID_PLL_IN_SEL	133
 #define CLKID_VID_PLL_IN_EN	134
 #define CLKID_VID_PLL_PRE_DIV	135
 #define CLKID_VID_PLL_POST_DIV	136
-#define CLKID_VID_PLL_FINAL_DIV	137
-#define CLKID_VCLK_IN_SEL	138
 #define CLKID_VCLK_IN_EN	139
 #define CLKID_VCLK_DIV1		140
 #define CLKID_VCLK_DIV2_DIV	141
@@ -135,7 +132,6 @@
 #define CLKID_VCLK_DIV6		146
 #define CLKID_VCLK_DIV12_DIV	147
 #define CLKID_VCLK_DIV12	148
-#define CLKID_VCLK2_IN_SEL	149
 #define CLKID_VCLK2_IN_EN	150
 #define CLKID_VCLK2_DIV1	151
 #define CLKID_VCLK2_DIV2_DIV	152
@@ -147,17 +143,11 @@
 #define CLKID_VCLK2_DIV12_DIV	158
 #define CLKID_VCLK2_DIV12	159
 #define CLKID_CTS_ENCT_SEL	160
-#define CLKID_CTS_ENCT		161
 #define CLKID_CTS_ENCP_SEL	162
-#define CLKID_CTS_ENCP		163
 #define CLKID_CTS_ENCI_SEL	164
-#define CLKID_CTS_ENCI		165
 #define CLKID_HDMI_TX_PIXEL_SEL	166
-#define CLKID_HDMI_TX_PIXEL	167
 #define CLKID_CTS_ENCL_SEL	168
-#define CLKID_CTS_ENCL		169
 #define CLKID_CTS_VDAC0_SEL	170
-#define CLKID_CTS_VDAC0		171
 #define CLKID_HDMI_SYS_SEL	172
 #define CLKID_HDMI_SYS_DIV	173
 #define CLKID_MALI_0_SEL	175
diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
index f33781338eda..78aa07fd7cc0 100644
--- a/include/dt-bindings/clock/meson8b-clkc.h
+++ b/include/dt-bindings/clock/meson8b-clkc.h
@@ -105,6 +105,16 @@
 #define CLKID_PERIPH		126
 #define CLKID_AXI		128
 #define CLKID_L2_DRAM		130
+#define CLKID_HDMI_PLL_HDMI_OUT	132
+#define CLKID_VID_PLL_FINAL_DIV	137
+#define CLKID_VCLK_IN_SEL	138
+#define CLKID_VCLK2_IN_SEL	149
+#define CLKID_CTS_ENCT		161
+#define CLKID_CTS_ENCP		163
+#define CLKID_CTS_ENCI		165
+#define CLKID_HDMI_TX_PIXEL	167
+#define CLKID_CTS_ENCL		169
+#define CLKID_CTS_VDAC0		171
 #define CLKID_HDMI_SYS		174
 #define CLKID_VPU		190
 #define CLKID_VDEC_1		196
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
