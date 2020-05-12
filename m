Return-Path: <SRS0=k9nf=62=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E35FC2D0F8
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 22:25:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CCD123126
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 22:25:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ipv5kHtf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="tC62i/6x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CCD123126
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mnsq6J0uteeT/Ybqq3TFgfA9odZQ+tyzecMn/XJWxOA=; b=Ipv5kHtfmxB1IT
	qZGWbz84rpzU/yuVbdK5zK+/kidodkDSFnqRI+NIVEH6v01MdtNAzDzhv297TFHdTMOYbZX7w4LK7
	sXdEMvH9sXmxkgnQiJgJOIMWOeklZjnNW/yDe82zQ03YR/jK+W63nPPhWNDA4644J1SaPej/emvAG
	7/Q7TKRjuqPDAS0bNI8871dYy3BVo4KdBoBOi3LVWXmZaCSY3F7MGt0A9DJGiuUBDeiiAP6fr3mQ0
	i0b6xdR6a7reauFHmZCebDNPfJIMA+TnKKHom2Kv65zcV+clCFaT3HP1b4g20fHT7W2xa/MnDYh2G
	nAtC2vttbuIHIPewE2yQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYdLM-0006tU-5e; Tue, 12 May 2020 22:25:44 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYdKL-0003eL-IH; Tue, 12 May 2020 22:24:43 +0000
Received: by mail-wm1-x342.google.com with SMTP id e26so24132055wmk.5;
 Tue, 12 May 2020 15:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fWp37uKUDpwomXWa/aIQXLmU2FLlzJyWeA81xl/sOwk=;
 b=tC62i/6xkzIkxqgPl9BJqQyxGIvTg5pd3zHGsIWyYc1BB2pk+poW0X33w5qgL8af3U
 MoQ2pX+pua0szFl29Qhlmsea5fayxALBOtqBV7+8GGbNLq6qKJzGOVtYKLk0LHzt8J1o
 svg9uEpuoNrqkCK0e7sH2caNhMztgiWR9sFgPXSPuVZY1LFm+hLsYzRRjnw1SBolXJ+W
 l9VuNS+WuUvSFJTBFFl6F65Z++OVIyl0EPTvNXmDLYeEMhJePd4JBBPThfQ8VRak/Ef9
 ytG6OOgWMbshtPdYywM1cc8tiH4sjPqCN0oLBzBID9TOqM1i2O1a45bV2YkXsHaCkB6P
 s0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fWp37uKUDpwomXWa/aIQXLmU2FLlzJyWeA81xl/sOwk=;
 b=D/A3DbGBskysqVtyvMbZZGGUJiEWtNtb7B1F4Y+QNiSOuxMiVPw0Kul5Lg5fwTz6Ty
 8RAtmDRCaSTG0aTXoK/5NHFYcrldBXN+EGR73H51NVQdo8THYE4KnjizwqYPD3C2Gys9
 YUg9YRX8lo9eJaHEDWxwiubbkn0dJUkriX+fPSe8jPCK02IfcRcK3nwxPUtyXB9Odf97
 2tJXiyrl6tgDzQL3bTUEggzxtg0Cwihh1PsMZQ79VEVC6CMVB4a8FCyf4Wr/Vf1fFo8h
 5hGF2mJMtAWzgTeeJXlE1aOC+RBFX6inx6dGVrNt5RrybrFjGOAaSyVD9ZdZoA6VAWvV
 ISxA==
X-Gm-Message-State: AGi0PubHB0S4fV8B2BOerU5BrAmlPyj8ZXYAmtpilQCH8EfxrTW4VzQW
 rIBVwryRIPlBkm/+rcmWF9o=
X-Google-Smtp-Source: APiQypI8HaPJS6tn/3p1+VJ3j0duckvAyujR9VAElNDzCa/9oefAMAjeT0RqFgb8MsChyKF/SDPM9g==
X-Received: by 2002:a1c:f416:: with SMTP id z22mr39644193wma.32.1589322279649; 
 Tue, 12 May 2020 15:24:39 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137132E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3713:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id b2sm21758758wrm.30.2020.05.12.15.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 15:24:39 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: kishon@ti.com, robh+dt@kernel.org, vkoul@kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [PATCH v2 5/6] phy: amlogic: meson8b-usb2: unset the IDDQ bit during
 PHY power-on
Date: Wed, 13 May 2020 00:24:23 +0200
Message-Id: <20200512222424.549351-6-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512222424.549351-1-martin.blumenstingl@googlemail.com>
References: <20200512222424.549351-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_152441_644079_0467A841 
X-CRM114-Status: GOOD (  13.12  )
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
Cc: narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thomas Graichen <thomas.graichen@gmail.com>, hexdump0815@googlemail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The vendor driver unsets the set_iddig bit during power-on as well and
sets it when suspending the PHY. I did not notice this in the vendor
driver first, because it's part of the dwc_otg driver there (instead of
their PHY code). While here, also add all other REG_DBG_UART register
bit definitions.

Tested-by: Thomas Graichen <thomas.graichen@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/phy/amlogic/phy-meson8b-usb2.c | 44 +++++++++++++++++++-------
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index 7236b8885f07..436dfa1a8a04 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -78,6 +78,17 @@
 	#define REG_ADP_BC_ACA_PIN_FLOAT		BIT(26)
 
 #define REG_DBG_UART					0x10
+	#define REG_DBG_UART_BYPASS_SEL			BIT(0)
+	#define REG_DBG_UART_BYPASS_DM_EN		BIT(1)
+	#define REG_DBG_UART_BYPASS_DP_EN		BIT(2)
+	#define REG_DBG_UART_BYPASS_DM_DATA		BIT(3)
+	#define REG_DBG_UART_BYPASS_DP_DATA		BIT(4)
+	#define REG_DBG_UART_FSV_MINUS			BIT(5)
+	#define REG_DBG_UART_FSV_PLUS			BIT(6)
+	#define REG_DBG_UART_FSV_BURN_IN_TEST		BIT(7)
+	#define REG_DBG_UART_LOOPBACK_EN_B		BIT(8)
+	#define REG_DBG_UART_SET_IDDQ			BIT(9)
+	#define REG_DBG_UART_ATE_RESET			BIT(10)
 
 #define REG_TEST					0x14
 	#define REG_TEST_DATA_IN_MASK			GENMASK(3, 0)
@@ -172,20 +183,24 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
 	regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_SOF_TOGGLE_OUT,
 			   REG_CTRL_SOF_TOGGLE_OUT);
 
-	if (priv->dr_mode == USB_DR_MODE_HOST &&
-	    priv->match->host_enable_aca) {
-		regmap_update_bits(priv->regmap, REG_ADP_BC,
-				   REG_ADP_BC_ACA_ENABLE,
-				   REG_ADP_BC_ACA_ENABLE);
+	if (priv->dr_mode == USB_DR_MODE_HOST) {
+		regmap_update_bits(priv->regmap, REG_DBG_UART,
+				   REG_DBG_UART_SET_IDDQ, 0);
 
-		udelay(ACA_ENABLE_COMPLETE_TIME);
+		if (priv->match->host_enable_aca) {
+			regmap_update_bits(priv->regmap, REG_ADP_BC,
+					   REG_ADP_BC_ACA_ENABLE,
+					   REG_ADP_BC_ACA_ENABLE);
 
-		regmap_read(priv->regmap, REG_ADP_BC, &reg);
-		if (reg & REG_ADP_BC_ACA_PIN_FLOAT) {
-			dev_warn(&phy->dev, "USB ID detect failed!\n");
-			clk_disable_unprepare(priv->clk_usb);
-			clk_disable_unprepare(priv->clk_usb_general);
-			return -EINVAL;
+			udelay(ACA_ENABLE_COMPLETE_TIME);
+
+			regmap_read(priv->regmap, REG_ADP_BC, &reg);
+			if (reg & REG_ADP_BC_ACA_PIN_FLOAT) {
+				dev_warn(&phy->dev, "USB ID detect failed!\n");
+				clk_disable_unprepare(priv->clk_usb);
+				clk_disable_unprepare(priv->clk_usb_general);
+				return -EINVAL;
+			}
 		}
 	}
 
@@ -196,6 +211,11 @@ static int phy_meson8b_usb2_power_off(struct phy *phy)
 {
 	struct phy_meson8b_usb2_priv *priv = phy_get_drvdata(phy);
 
+	if (priv->dr_mode == USB_DR_MODE_HOST)
+		regmap_update_bits(priv->regmap, REG_DBG_UART,
+				   REG_DBG_UART_SET_IDDQ,
+				   REG_DBG_UART_SET_IDDQ);
+
 	clk_disable_unprepare(priv->clk_usb);
 	clk_disable_unprepare(priv->clk_usb_general);
 
-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
