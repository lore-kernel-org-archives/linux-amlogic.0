Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56655C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 20:04:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3218920863
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 20:04:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g88TB3id";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="IX7WNp2h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3218920863
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bS/uIvwlRIFBvut6H8XBs0hzEgEAPpytOXTweqbWJFc=; b=g88TB3id0VXkYu
	eS9fGxYe9razA8Avknqkv4kDgt2einLcbZbX265gpNKACcUT4ZE1eQdZ73wLcwxrUKBzPhIovXVd0
	VzWt2mYGWGxilc3ua8qkNhrUnUfQxrjuOacZAhvZ7B32wQ89GP6YhFQ9/GgbWxQso2A05bMYjsXTe
	Szkiew+IjjWRCa1K0C1W7MB/GmwJuFI9IE/+ccampaUt7utdeJua0smtKnZPi+Xu/ptKZfvVqw2AJ
	aYpSJ58obzwmWXx58qzZdIMHaTOJ2Fi08bAPUjHxW7e45N0i9tJg4Khl0kIgM/fZ7HSWRINs5Lvwj
	KBDsEBIET/NihHcFDp+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSoW4-0002Pr-RF; Mon, 20 May 2019 20:04:12 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSoVS-0001Zj-Jw; Mon, 20 May 2019 20:03:39 +0000
Received: by mail-wm1-x344.google.com with SMTP id j187so577982wmj.1;
 Mon, 20 May 2019 13:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=do0dKBdes1ma1vSqJcaos6AAvi/dpG1xqDF1uEcr96s=;
 b=IX7WNp2h3OoeEP1kMReGf8ZvQsHhieYCtYrGNrzNgPAabFO9RFZj0G2yrehUXRbGdZ
 5RhJq+Lzn4nvDTo+ZTStdwmg8dz7IhlszdHFkksOVKuOgGGhp0aHWq8gDpqhDBDwBhg3
 vf+woIYXk2rmo9VDdDOqHnxVjsuoVnmsK0qYbRRLuFizo/C9BmZ2b7jxtLMqn68T/DnY
 mwFyJ91QdG12cOTPAnglCXosmPh4d79vpsMKAf2rxzvXD0A0MkjsRPe6WlTIaysUyaa8
 cLdU68JcNllPY5GUI5Pa1/eeuH5t/kkjuQOoyDLSrV98ynjAILH2y/MatgPRY+NdaInX
 Apzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=do0dKBdes1ma1vSqJcaos6AAvi/dpG1xqDF1uEcr96s=;
 b=K3qX2LxrHWx+fvj596MExABvsCpA9tN/vQchkr4j3WejtOEJvXzYaWObdpV8vCKmEG
 7caUcoKBx4rZ8nvpn4iUWs9TstXTvnB5YGhyQUcHoRHYjdKuIsVJlWtEerpmPvPRzz2Z
 E/5Vn72TjAp55VhHhFkt2PDZu1nJ1FCO3qKRQeW+PEZzuxhL1uMmqlh6xaRF0rYZ3/9X
 Y8dvx2RAAF5FTaDhYtrwToSysm9I6v+cBmk+tfIjgPkUG6zuIzN+WQI4dEArjKdFJPkK
 H1CbpaVWhlcnKOLpyhgsCTlfH46ZjKpJCHs0HLtzOAOpUT17ts9bYSnYrQR39DsZ96Mh
 i4eg==
X-Gm-Message-State: APjAAAVIoT0Yl3fS02odhV4mcwLQNeyl9lOR8KWgQ5K3D6nqnljd/nqu
 h/vYawK4ZQFgI7uXBlliV5tUt+C+
X-Google-Smtp-Source: APXvYqy9p/CmdbIKMiBY9W6jTMEHHTN6rUdiBTPoRPeTt56omD+TOTEfxBv7/Mwx3XTWgPEXlTjgiA==
X-Received: by 2002:a1c:a846:: with SMTP id r67mr620804wme.24.1558382613169;
 Mon, 20 May 2019 13:03:33 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133EE71009C356FA1F0E19AF9.dip0.t-ipconnect.de.
 [2003:f1:33ee:7100:9c35:6fa1:f0e1:9af9])
 by smtp.googlemail.com with ESMTPSA id t7sm23583379wrq.76.2019.05.20.13.03.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 13:03:32 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org
Subject: [PATCH 4/4] clk: meson: meson8b: add the cts_i958 clock
Date: Mon, 20 May 2019 22:03:19 +0200
Message-Id: <20190520200319.9265-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520200319.9265-1-martin.blumenstingl@googlemail.com>
References: <20190520200319.9265-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_130334_971406_C6BE999D 
X-CRM114-Status: GOOD (  15.41  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the cts_i958 clock to control the clock source of the spdif output
block. It is used to select whether the clock source of the spdif output
is cts_amclk (when data are taken from i2s buffer) or the cts_mclk_i958
(when data are taken from the spdif buffer). The setup for this clock is
identical to GXBB, so this ports commit 7eaa44f6207fb6 ("clk: meson:
gxbb: add cts_i958 clock") to the Meson8/Meson8b/Meson8m2 clock driver.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 24 ++++++++++++++++++++++++
 drivers/clk/meson/meson8b.h |  2 +-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 13ce1783eead..537219fa573e 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -2259,6 +2259,26 @@ static struct clk_regmap meson8b_cts_mclk_i958 = {
 	},
 };
 
+static struct clk_regmap meson8b_cts_i958 = {
+	.data = &(struct clk_regmap_mux_data){
+		.offset = HHI_AUD_CLK_CNTL2,
+		.mask = 0x1,
+		.shift = 27,
+		},
+	.hw.init = &(struct clk_init_data){
+		.name = "cts_i958",
+		.ops = &clk_regmap_mux_ops,
+		.parent_names = (const char *[]){ "cts_amclk",
+						  "cts_mclk_i958" },
+		.num_parents = 2,
+		/*
+		 * The parent is specific to origin of the audio data. Let the
+		 * consumer choose the appropriate parent.
+		 */
+		.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
+	},
+};
+
 /* Everything Else (EE) domain gates */
 
 static MESON_GATE(meson8b_ddr, HHI_GCLK_MPEG0, 0);
@@ -2544,6 +2564,7 @@ static struct clk_hw_onecell_data meson8_hw_onecell_data = {
 		[CLKID_CTS_MCLK_I958_SEL]   = &meson8b_cts_mclk_i958_sel.hw,
 		[CLKID_CTS_MCLK_I958_DIV]   = &meson8b_cts_mclk_i958_div.hw,
 		[CLKID_CTS_MCLK_I958]	    = &meson8b_cts_mclk_i958.hw,
+		[CLKID_CTS_I958]	    = &meson8b_cts_i958.hw,
 		[CLK_NR_CLKS]		    = NULL,
 	},
 	.num = CLK_NR_CLKS,
@@ -2759,6 +2780,7 @@ static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
 		[CLKID_CTS_MCLK_I958_SEL]   = &meson8b_cts_mclk_i958_sel.hw,
 		[CLKID_CTS_MCLK_I958_DIV]   = &meson8b_cts_mclk_i958_div.hw,
 		[CLKID_CTS_MCLK_I958]	    = &meson8b_cts_mclk_i958.hw,
+		[CLKID_CTS_I958]	    = &meson8b_cts_i958.hw,
 		[CLK_NR_CLKS]		    = NULL,
 	},
 	.num = CLK_NR_CLKS,
@@ -2976,6 +2998,7 @@ static struct clk_hw_onecell_data meson8m2_hw_onecell_data = {
 		[CLKID_CTS_MCLK_I958_SEL]   = &meson8b_cts_mclk_i958_sel.hw,
 		[CLKID_CTS_MCLK_I958_DIV]   = &meson8b_cts_mclk_i958_div.hw,
 		[CLKID_CTS_MCLK_I958]	    = &meson8b_cts_mclk_i958.hw,
+		[CLKID_CTS_I958]	    = &meson8b_cts_i958.hw,
 		[CLK_NR_CLKS]		    = NULL,
 	},
 	.num = CLK_NR_CLKS,
@@ -3171,6 +3194,7 @@ static struct clk_regmap *const meson8b_clk_regmaps[] = {
 	&meson8b_cts_mclk_i958_sel,
 	&meson8b_cts_mclk_i958_div,
 	&meson8b_cts_mclk_i958,
+	&meson8b_cts_i958,
 };
 
 static const struct meson8b_clk_reset_line {
diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
index c3787418088e..c889fbeec30f 100644
--- a/drivers/clk/meson/meson8b.h
+++ b/drivers/clk/meson/meson8b.h
@@ -178,7 +178,7 @@
 #define CLKID_CTS_MCLK_I958_SEL	210
 #define CLKID_CTS_MCLK_I958_DIV	211
 
-#define CLK_NR_CLKS		213
+#define CLK_NR_CLKS		214
 
 /*
  * include the CLKID and RESETID that have
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
