Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B319C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Mar 2022 10:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=blIhw5KqJ8AZ6iQyh541PMD6CfFJUL8UpOkIUveoyGU=; b=xJHhemyavjx5eY
	KAdv/qhrBpJpET791eKWSA3SgvFyKbKBptCY0HtimslgFFJnbnIKemdB0gUoJEbKqTOXYfTgdpbd7
	iVYrJLGLSi2AoY6PVfPNSzajajHAHoKPGxAztU0MRmU1cKljKAaft2gUgfHNjrUug7i2IKySPumH3
	kUdPHrR4S/pDBYPWRXjvBJbfafZmXjBnmGUA2BbhUkYX0+SQp4VYQx4wDHEjJgJYVVH2tmnYU1rqS
	rSWeFLi2F8ZYiZlMoHpsLV6HLGtCDTnDx8NQwgwCdC3fV10bJrjNFkRoGi7TI4glJDGo2j6sYzhmB
	6hcrW0hzk6xVoK172L1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nY3Zf-0047wk-I3; Sat, 26 Mar 2022 10:23:11 +0000
Received: from mail-wr1-f42.google.com ([209.85.221.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nY3Z7-0047mI-4O; Sat, 26 Mar 2022 10:22:38 +0000
Received: by mail-wr1-f42.google.com with SMTP id d7so13812107wrb.7;
 Sat, 26 Mar 2022 03:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YGuZo2Hq9ChT5cMnSJKU17y7ywEpdIIE557tEVvhgqI=;
 b=33JJbdlxdv9a63Wza7sWKBCiDcwfikfTfVwYKpcoTrv8FEgMoLnCrIUdLUwCCGamdD
 6j+t1E4/257RbkHbnGH8HvULdAHxahvHK1ZkZ05LGbBNNREq/5jIoAlGeMDb831y3Mh9
 hF4z6q1O/BZFODUc9aqMlNjAHIuPh3tbtNLpehhNOYEuwmd7MH9lYaZrn/SE6TFmGDiw
 Z1gVir3C8QljcXQpc3G5JN6B4/XGxQlGgWoI2MAAvR7/bPEb5U8DSl+BXcnqQqles+FQ
 Da97LqRAFUIoj9JsFzZNYjBD+Z1WHrhCgMAdwomr7zyIoInV5kDrTsQZ0/DGuiYXNv3S
 o89A==
X-Gm-Message-State: AOAM531xMRUsiim3uRc9P7u6j0wO30rVZRM+WIPWMScWJzMeXp2xNagX
 BbfDNL+5WIEbS21ctGiipd4=
X-Google-Smtp-Source: ABdhPJwkdy9I3mVJNtJcYMmcPEdeTaDwkchZfl1LHWyFYJtZAthsxp5W5FuvoDTIjKY9m4amlMkv+A==
X-Received: by 2002:a05:6000:18c2:b0:203:fc53:c70e with SMTP id
 w2-20020a05600018c200b00203fc53c70emr13102994wrq.198.1648290154316; 
 Sat, 26 Mar 2022 03:22:34 -0700 (PDT)
Received: from aryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net.
 [82.11.51.62]) by smtp.googlemail.com with ESMTPSA id
 l15-20020a05600c1d0f00b0038c8ff8e708sm6683057wms.13.2022.03.26.03.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 03:22:33 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Lucas Tanure <tanure@linux.com>
Subject: [PATCH 2/3] i2c: meson: Use 50% duty cycle for I2C clock
Date: Sat, 26 Mar 2022 10:22:28 +0000
Message-Id: <20220326102229.421718-3-tanure@linux.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220326102229.421718-1-tanure@linux.com>
References: <20220326102229.421718-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220326_032237_193754_26BFD0A0 
X-CRM114-Status: GOOD (  12.72  )
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

The duty cycle of 33% is less than the required
by the I2C specs for the LOW period of the SCL
clock.

Move the duty cyle to 50% for 100Khz or lower
clocks, and (40% High SCL / 60% Low SCL) duty
cycle for clocks above 100Khz.

Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 drivers/i2c/busses/i2c-meson.c | 45 +++++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
index 4b4a5b2d77ab..b913ba20f06e 100644
--- a/drivers/i2c/busses/i2c-meson.c
+++ b/drivers/i2c/busses/i2c-meson.c
@@ -140,29 +140,50 @@ static void meson_i2c_add_token(struct meson_i2c *i2c, int token)
 static void meson_i2c_set_clk_div(struct meson_i2c *i2c, unsigned int freq)
 {
 	unsigned long clk_rate = clk_get_rate(i2c->clk);
-	unsigned int div;
+	unsigned int div_h, div_l;
 
-	div = DIV_ROUND_UP(clk_rate, freq);
-	div -= FILTER_DELAY;
-	div = DIV_ROUND_UP(div, i2c->data->div_factor);
+	if (freq <= 100000) {
+		div_h = DIV_ROUND_UP(clk_rate, freq);
+		div_l = DIV_ROUND_UP(div_h, 4);
+		div_h = DIV_ROUND_UP(div_h, 2) - FILTER_DELAY;
+	} else {
+	/* According to I2C-BUS Spec 2.1, in FAST-MODE, the minimum LOW period is 1.3uS, and
+	 * minimum HIGH is least 0.6us.
+	 * For 400000 freq, the period is 2.5us. To keep within the specs, give 40% of period to
+	 * HIGH and 60% to LOW. This means HIGH at 1.0us and LOW 1.5us.
+	 * The same applies for Fast-mode plus, where LOW is 0.5us and HIGH is 0.26us.
+	 * Duty = H/(H + L) = 2/5
+	 */
+		div_h = DIV_ROUND_UP(clk_rate * 2, freq * 5) - FILTER_DELAY;
+		div_l = DIV_ROUND_UP(clk_rate * 3, freq * 5 * 2);
+	}
 
 	/* clock divider has 12 bits */
-	if (div > GENMASK(11, 0)) {
+	if (div_h > GENMASK(11, 0)) {
 		dev_err(i2c->dev, "requested bus frequency too low\n");
-		div = GENMASK(11, 0);
+		div_h = GENMASK(11, 0);
+	}
+	if (div_l > GENMASK(11, 0)) {
+		dev_err(i2c->dev, "requested bus frequency too low\n");
+		div_l = GENMASK(11, 0);
 	}
 
 	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIV_MASK,
-			   FIELD_PREP(REG_CTRL_CLKDIV_MASK, div & GENMASK(9, 0)));
+			   FIELD_PREP(REG_CTRL_CLKDIV_MASK, div_h & GENMASK(9, 0)));
 
 	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_CLKDIVEXT_MASK,
-			   FIELD_PREP(REG_CTRL_CLKDIVEXT_MASK, div >> 10));
+			   FIELD_PREP(REG_CTRL_CLKDIVEXT_MASK, div_h >> 10));
+
+
+	/* set SCL low delay */
+	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_MASK,
+			   (div_l << REG_SLV_SCL_LOW_SHIFT) & REG_SLV_SCL_LOW_MASK);
 
-	/* Disable HIGH/LOW mode */
-	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_EN, 0);
+	/* Enable HIGH/LOW mode */
+	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR, REG_SLV_SCL_LOW_EN, REG_SLV_SCL_LOW_EN);
 
-	dev_dbg(i2c->dev, "%s: clk %lu, freq %u, div %u\n", __func__,
-		clk_rate, freq, div);
+	dev_dbg(i2c->dev, "%s: clk %lu, freq %u, divh %u, divl %u\n", __func__,
+		clk_rate, freq, div_h, div_l);
 }
 
 static void meson_i2c_get_data(struct meson_i2c *i2c, char *buf, int len)
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
