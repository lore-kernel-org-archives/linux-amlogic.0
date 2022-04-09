Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6872AC433EF
	for <linux-amlogic@archiver.kernel.org>; Sat,  9 Apr 2022 16:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EHD43Jbd97W8PYwzFw4dx399/jVnIK4qbEtTGJIAsdg=; b=mcrEnwQ73BNrLU
	a7hkLk4on2hiXPYb7VU+NPE2SwPqFZ77e5h8Us27gNGnD1pO32SGLOI3KONDBccwbh1YdRCCOz4a6
	dv1y5lKzs3CsrQned5NcU9epJIGj69nMFMRMqm+6SlLwUg6Ykr4ttEntwQuVACrNj4+Lg4iVvi+XB
	oI19kGXsffmeSyefswwdx34NjwC5J1j6RHnCPo7jrIkDmyfyLK3FWwAGhqHF7n+4wnx5lMH8yyZDA
	VTGPh6v0bpJikDJ1yD/LawWeEyOZIY/lGAzTmlSu3NtHif3GIIRH38OfgbGhrVKI/S6elC6NQ+bMv
	FH9+rqSD1qMTNKq1f0LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndEBr-003VZA-Pq; Sat, 09 Apr 2022 16:43:59 +0000
Received: from mail-ej1-f41.google.com ([209.85.218.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndEBY-003VU3-OH; Sat, 09 Apr 2022 16:43:42 +0000
Received: by mail-ej1-f41.google.com with SMTP id k23so22939082ejd.3;
 Sat, 09 Apr 2022 09:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d+exwJ0T4eZrE1LWR6DE1MTkGjxyaQIeoK3XOhyJ12M=;
 b=uV3d3DVNcfoF541sCJeZtuCR7TJ4ljVTkVoeVz62/UyUlZltaUB+i/SrhpSkfa3ylQ
 nnM9S1QVgL9ePshlnAqRnyR9tKMyOVPiMeg6yitPndAyOFypvjALksci6pb4rznVQU0T
 UJqcPYjnm7dQfduVaZ1luJuNiydr+ByJ5WF+FrdiT6AK1+qpipI8oq/l/xTJDJ4Cus6W
 UqRXT9O5pqSw7BRCTdXd4FvblQ2RTzJZK4d5CsxSSmSd/fUU7fR0+td4eKQuBJgTtPxT
 sDenvqo5evcrcexS1St31L0ZaIZ3PWzgjIKidVlKzDepuJm1DCO1KPacXO6/P5ItNccl
 jb1A==
X-Gm-Message-State: AOAM530wRP7K+HemOIolKjZaEIZbYmV3X2NOGaY0dsYxm4jiLyzBBD9V
 u4Z/NWfHFDMKxAozeq/eoe1vcEB9L54=
X-Google-Smtp-Source: ABdhPJyiRAweB9lGGmp676jc9QHrR6tyx2oWTVWbbwwff6bmFc/Wf12ctbDUUNLbEXFZjid6hvpGGA==
X-Received: by 2002:a17:907:6ea1:b0:6d6:f910:5141 with SMTP id
 sh33-20020a1709076ea100b006d6f9105141mr23393903ejc.123.1649522617393; 
 Sat, 09 Apr 2022 09:43:37 -0700 (PDT)
Received: from aryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net.
 [82.11.51.62]) by smtp.googlemail.com with ESMTPSA id
 hu8-20020a170907a08800b006dfd2056ab2sm9893735ejc.97.2022.04.09.09.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Apr 2022 09:43:37 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Lucas Tanure <tanure@linux.com>
Subject: [PATCH v2 1/2] i2c: meson: Use _SHIFT and _MASK for register
 definitions
Date: Sat,  9 Apr 2022 17:43:33 +0100
Message-Id: <20220409164334.157664-2-tanure@linux.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220409164334.157664-1-tanure@linux.com>
References: <20220409164334.157664-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_094340_829761_8D934F66 
X-CRM114-Status: GOOD (  10.72  )
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

Differentiate between masks and shifts

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/i2c/busses/i2c-meson.c | 41 ++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index 07eb819072c4..4b4a5b2d77ab 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -30,18 +30,21 @@
 #define REG_TOK_RDATA1		0x1c
 
 /* Control register fields */
-#define REG_CTRL_START		BIT(0)
-#define REG_CTRL_ACK_IGNORE	BIT(1)
-#define REG_CTRL_STATUS		BIT(2)
-#define REG_CTRL_ERROR		BIT(3)
-#define REG_CTRL_CLKDIV		GENMASK(21, 12)
-#define REG_CTRL_CLKDIVEXT	GENMASK(29, 28)
-
-#define REG_SLV_ADDR		GENMASK(7, 0)
-#define REG_SLV_SDA_FILTER	GENMASK(10, 8)
-#define REG_SLV_SCL_FILTER	GENMASK(13, 11)
-#define REG_SLV_SCL_LOW		GENMASK(27, 16)
-#define REG_SLV_SCL_LOW_EN	BIT(28)
+#define REG_CTRL_START			BIT(0)
+#define REG_CTRL_ACK_IGNORE		BIT(1)
+#define REG_CTRL_STATUS			BIT(2)
+#define REG_CTRL_ERROR			BIT(3)
+#define REG_CTRL_CLKDIV_SHIFT		12
+#define REG_CTRL_CLKDIV_MASK		GENMASK(21, REG_CTRL_CLKDIV_SHIFT)
+#define REG_CTRL_CLKDIVEXT_SHIFT	28
+#define REG_CTRL_CLKDIVEXT_MASK		GENMASK(29, REG_CTRL_CLKDIVEXT_SHIFT)
+
+#define REG_SLV_ADDR_MASK		GENMASK(7, 0)
+#define REG_SLV_SDA_FILTER_MASK		GENMASK(10, 8)
+#define REG_SLV_SCL_FILTER_MASK		GENMASK(13, 11)
+#define REG_SLV_SCL_LOW_SHIFT		16
+#define REG_SLV_SCL_LOW_MASK		GENMASK(27, REG_SLV_SCL_LOW_SHIFT)
+#define REG_SLV_SCL_LOW_EN		BIT(28)
 
 #define I2C_TIMEOUT_MS		500
 #define FILTER_DELAY		15
@@ -149,11 +152,11 @@ static void meson_i2c_set_clk_div(struct meson_i2c *i2c, unsigned int freq)
 		div = GENMASK(11, 0);
 	}
 
-	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIV,
-			   FIELD_PREP(REG_CTRL_CLKDIV, div & GENMASK(9, 0)));
+	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIV_MASK,
+			   FIELD_PREP(REG_CTRL_CLKDIV_MASK, div & GENMASK(9, 0)));
 
-	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIVEXT,
-			   FIELD_PREP(REG_CTRL_CLKDIVEXT, div >> 10));
+	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIVEXT_MASK,
+			   FIELD_PREP(REG_CTRL_CLKDIVEXT_MASK, div >> 10));
 
 	/* Disable HIGH/LOW mode */
 	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_EN, 0);
@@ -292,8 +295,8 @@ static void meson_i2c_do_start(struct meson_i2c *i2c, struct i2c_msg *msg)
 		TOKEN_SLAVE_ADDR_WRITE;
 
 
-	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_ADDR,
-			   FIELD_PREP(REG_SLV_ADDR, msg->addr << 1));
+	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_ADDR_MASK,
+			   FIELD_PREP(REG_SLV_ADDR_MASK, msg->addr << 1));
 
 	meson_i2c_add_token(i2c, TOKEN_START);
 	meson_i2c_add_token(i2c, token);
@@ -467,7 +470,7 @@ static int meson_i2c_probe(struct platform_device *pdev)
 
 	/* Disable filtering */
 	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR,
-			   REG_SLV_SDA_FILTER | REG_SLV_SCL_FILTER, 0);
+			   REG_SLV_SDA_FILTER_MASK | REG_SLV_SCL_FILTER_MASK, 0);
 
 	meson_i2c_set_clk_div(i2c, timings.bus_freq_hz);
 
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
