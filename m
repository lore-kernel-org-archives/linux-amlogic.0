Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CAAC433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Mar 2022 10:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EHD43Jbd97W8PYwzFw4dx399/jVnIK4qbEtTGJIAsdg=; b=q0SHisTwjOeZqr
	jgcAenVJ5PUHui0jKlMqZEzPFJdmadVQcQnZsWYo4PYzFKls3RDOK5bXPHFMe0JIGtVp5f4cf4czg
	G8SmyOfzFk9TULZIoK0Wssst7pbG5YvN5BMdjaskkfcjdpVeaQjws6QfbJF8Y8v6u2pivQFx+4x9C
	eqAHd0ZV1C/jLZdiFNBQiHhrL8eLdhouwRxlBkGq2AjYy3RsNBgAQSUhEDs4Dj58yiLi6ZLplxMyB
	WsEFQDDoV+I5E4xXx+z/xoSLQO3p4Y4aggZ7UFbwi4sdHF4tOY1dyOSbC9+c9Mw9G22hXy9eiIsOd
	ZFXZ3VbT1agDxySdbeEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nY3ZS-0047sP-HA; Sat, 26 Mar 2022 10:22:58 +0000
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nY3Z5-0047ln-0Y; Sat, 26 Mar 2022 10:22:36 +0000
Received: by mail-wr1-f46.google.com with SMTP id t11so13816585wrm.5;
 Sat, 26 Mar 2022 03:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d+exwJ0T4eZrE1LWR6DE1MTkGjxyaQIeoK3XOhyJ12M=;
 b=xeXDyzPy9Dbsc2JHGNFjAO4EESK36h51x9npkxgC9WTBTltMIEuS8TjFvVrWt3AeJh
 16OiEY2kzyLYlEXlXD5YiZFMiQ/wr6K+jnrwf+3M4VeLnz5oHUOGCM9MBdJYAA+5V0u2
 ov5vWepLs3nb4qK3uJf7wCxP56Lw3iYorUll9FwLvmJnO4Lr3o7KOY+nSmFFj5o6vmfT
 SRz8nfypmuASNDYRpj0GOnHM2nbUpmddbYnTxcXEGAEEQ/KhgfRW4fOR9Zx/yhhAyMJA
 7K8i9tW+sLQTgYAQOHz7W40N1guFPPuS1va2MBKAiybJacR3IOSarg0lmpXXC6lqJjLa
 NRjA==
X-Gm-Message-State: AOAM533ASL5E8KfxOrPCeuOaY1kMWB6PAsaKPP2P/Ssg0HBgEF/HGopw
 sFyaRtEfBlftu+ZtbJ5HHHc=
X-Google-Smtp-Source: ABdhPJxjN3JLIoXXR3q/9N1jVkloOzSFrQ58HCAROOXM2sTHmSipHOsc3L1UIedgnQdK9jCOApCV6A==
X-Received: by 2002:adf:bc0b:0:b0:203:e55c:c793 with SMTP id
 s11-20020adfbc0b000000b00203e55cc793mr12560145wrg.693.1648290153514; 
 Sat, 26 Mar 2022 03:22:33 -0700 (PDT)
Received: from aryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net.
 [82.11.51.62]) by smtp.googlemail.com with ESMTPSA id
 l15-20020a05600c1d0f00b0038c8ff8e708sm6683057wms.13.2022.03.26.03.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 03:22:33 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Lucas Tanure <tanure@linux.com>
Subject: [PATCH 1/3] i2c: meson: Use _SHIFT and _MASK for register definitions
Date: Sat, 26 Mar 2022 10:22:27 +0000
Message-Id: <20220326102229.421718-2-tanure@linux.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220326102229.421718-1-tanure@linux.com>
References: <20220326102229.421718-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220326_032235_076381_6E179882 
X-CRM114-Status: GOOD (  10.01  )
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
