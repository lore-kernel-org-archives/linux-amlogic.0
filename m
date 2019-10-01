Return-Path: <SRS0=zbOs=X2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A9AC352AA
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 11:55:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DE4620640
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 11:55:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H0wmMmaI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="lHX5hII/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DE4620640
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YzkZD0EDM2Ca62R4EKPvle6y29Zss9PGomm27vD0Uaw=; b=H0wmMmaIiI6N82
	oq/BkJtWQmjBwCq7PjdDRhqf9tLJlYQLSPUSmY4V6EmKnBpTCm+J6H6LS8xWBSXV88BmkhSOHgv9a
	9O0gBL43VJ13z71QiDDg2muJlUBZl7l56Jas+mTI+UaNe6qhKZ2ljj77cqMfMhHNEzL6GMc0BKx3J
	u1nlDF8tqCSmcplQoJnARQzlHXJCEaUc4nfT9JafcqCl+GStUbZ64AdPpGnwU2jGNl7NPhvIrCzVz
	/EKBWLqtnaFbKwqJa67O3+T/NhQS3XJWTIAjdJAc3xEZ7QD2wikehjqcpU1g9j5ZoQPAVaMBnE3j5
	GCls6Rxe62MrfGIML07A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFGkb-0007G0-AS; Tue, 01 Oct 2019 11:55:29 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFGkU-00076m-01
 for linux-amlogic@lists.infradead.org; Tue, 01 Oct 2019 11:55:23 +0000
Received: by mail-wr1-x444.google.com with SMTP id w12so15143567wro.5
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Oct 2019 04:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=79/6tSnPTRZJSx7l9IqqNNwN+2xwDedu3PFaTFq6EtI=;
 b=lHX5hII/HavOBp9PR/x6k1xIe5WOZuin7rWRrFy66/GQBQS1RCbjdXY2d3zqSzLOTH
 tHhEFans8qI/lDcrzLs6QhgqeEgAnnspDzFOab2LnMetS57O2jZhELMMwSOAGb1uiTly
 ySBXPTM4qeye0bBLiNo7tA8WDtzaJUqNNNFD0HE1/SQUPxfEhwq6VpLLbJFeKftf+TP8
 5/WL6e+GDUe5zePozG/LqQCxDwTJmo8DGJyxBQjd/naBIrmhzgQG/cEVGRLn5e7KI4D6
 Zxf5PT0Kq0K0B5dhUP1ijF7i4hoRLO3EkF6xt0BAgNm6xds1ZhacCWj6WFLkRd64KONj
 hf5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=79/6tSnPTRZJSx7l9IqqNNwN+2xwDedu3PFaTFq6EtI=;
 b=G8Nq8MCy6z2YB874g+Bfk2YfnhURktRWJylataHbfef11j9tTUEPHm1BCOa2yNGjz9
 +vNnRVHHvNa7bVO84qr2ay9ED81Kiuu4cZJfyzXEXYY9ewV05qKw1h9YiVNjz0kH5sa0
 znMPtnfNrtceqz8A6u4lmdDeaUVcViFbQ9bIVzHbvUe2OuIwgjKRZZvxRaSsW3vOZfdx
 pJyz64KjLD0WMNd7Laa/HD4gJnWYvspdmTcFVW0WbGiKiNO2I1OYbce+TgS5YY5rOZmc
 EVRu+stadrZtlwo2IV2WYTnAI/o9cmuyEIm1bb6I5klVRi+3JydG3ojUpm2GsdyMVTTd
 EBJw==
X-Gm-Message-State: APjAAAVQCKpl/v+BL1FmlpHkJjI0+BwVRWBw2y1JRcIz/qz73uJrtAZ7
 BuGN8ZJcY+us7xdZeeJ5VdTAXQ==
X-Google-Smtp-Source: APXvYqwM4rW0g5tDCknEL/a7c4Qsmfn9MeIadCvt7DY4Cna7Ma6Px7o6YSRRurJKiIssbKjEmIeUxw==
X-Received: by 2002:adf:bb8e:: with SMTP id q14mr18860966wrg.74.1569930920794; 
 Tue, 01 Oct 2019 04:55:20 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id p85sm4052171wme.23.2019.10.01.04.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 04:55:20 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 6/7] clk: meson: axg-audio: provide clk top signal name
Date: Tue,  1 Oct 2019 13:55:09 +0200
Message-Id: <20191001115511.17357-7-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191001115511.17357-1-jbrunet@baylibre.com>
References: <20191001115511.17357-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191001_045522_043353_4C515A96 
X-CRM114-Status: GOOD (  13.16  )
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

The peripheral clock on the sm1 goes through some muxes
and dividers before reaching the audio gates. To model that,
without repeating our self too much, the "top" clock signal
is introduced and will serve as a the parent of the gates.

On the axg and g12a, the top clock is just a pass-through to
the audio peripheral clock provided by the main controller.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg-audio.c | 18 +++++++++++++++---
 drivers/clk/meson/axg-audio.h |  3 ++-
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index ce8836776d1c..1a4c50a29ad7 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -74,9 +74,7 @@
 	.hw.init = &(struct clk_init_data) {				\
 		.name = "aud_"#_name,					\
 		.ops = &clk_regmap_gate_ops,				\
-		.parent_data = &(const struct clk_parent_data) {	\
-			.fw_name = "pclk",				\
-		},							\
+		.parent_names = (const char *[]){ "aud_top" },		\
 		.num_parents = 1,					\
 	},								\
 }
@@ -504,6 +502,18 @@ static struct clk_regmap tdmout_c_lrclk =
 	AUD_TDM_LRLCK(out_c, AUDIO_CLK_TDMOUT_C_CTRL);
 
 /* AXG/G12A Clocks */
+static struct clk_hw axg_aud_top = {
+	.init = &(struct clk_init_data) {
+		/* Provide aud_top signal name on axg and g12a */
+		.name = "aud_top",
+		.ops = &(const struct clk_ops) {},
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "pclk",
+		},
+		.num_parents = 1,
+	},
+};
+
 static struct clk_regmap mst_a_mclk_sel =
 	AUD_MST_MCLK_MUX(mst_a_mclk, AUDIO_MCLK_A_CTRL);
 static struct clk_regmap mst_b_mclk_sel =
@@ -691,6 +701,7 @@ static struct clk_hw_onecell_data axg_audio_hw_onecell_data = {
 		[AUD_CLKID_TDMOUT_A_LRCLK]	= &tdmout_a_lrclk.hw,
 		[AUD_CLKID_TDMOUT_B_LRCLK]	= &tdmout_b_lrclk.hw,
 		[AUD_CLKID_TDMOUT_C_LRCLK]	= &tdmout_c_lrclk.hw,
+		[AUD_CLKID_TOP]			= &axg_aud_top,
 		[NR_CLKS] = NULL,
 	},
 	.num = NR_CLKS,
@@ -835,6 +846,7 @@ static struct clk_hw_onecell_data g12a_audio_hw_onecell_data = {
 		[AUD_CLKID_TDM_SCLK_PAD0]	= &g12a_tdm_sclk_pad_0.hw,
 		[AUD_CLKID_TDM_SCLK_PAD1]	= &g12a_tdm_sclk_pad_1.hw,
 		[AUD_CLKID_TDM_SCLK_PAD2]	= &g12a_tdm_sclk_pad_2.hw,
+		[AUD_CLKID_TOP]			= &axg_aud_top,
 		[NR_CLKS] = NULL,
 	},
 	.num = NR_CLKS,
diff --git a/drivers/clk/meson/axg-audio.h b/drivers/clk/meson/axg-audio.h
index c00e28b2e1a9..a4956837f597 100644
--- a/drivers/clk/meson/axg-audio.h
+++ b/drivers/clk/meson/axg-audio.h
@@ -116,9 +116,10 @@
 #define AUD_CLKID_SPDIFOUT_B_CLK_SEL	153
 #define AUD_CLKID_SPDIFOUT_B_CLK_DIV	154
 
+
 /* include the CLKIDs which are part of the DT bindings */
 #include <dt-bindings/clock/axg-audio-clkc.h>
 
-#define NR_CLKS	163
+#define NR_CLKS	164
 
 #endif /*__AXG_AUDIO_CLKC_H */
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
