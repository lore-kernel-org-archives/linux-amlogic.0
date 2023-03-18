Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B03BC7618E
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Mar 2023 20:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mvOmgyM4zxMq+x+Z7gRxpJyv9m7IhDfvfHg33+wGU+Q=; b=KNPvJdIhL+SkzJ
	FwHUANhMbQtpTkfo7mytT86x9NlEMwOMMrzmTas351yLRmD3ZNLuWg7GrbGBIMy3GMiOZFRVMrMIM
	EIr1+yuYAgVj7IirfYHr3MMbOAizfXv3WNt0l7RqLQ82FAidjliHVFS3B03h1PKdDgg++3UQLyPAp
	LL7zze7VfrlDk5Pt4dr1GiuhRWvGv+kn61yBa7LWXkn3JefpkygwvrhsQhOuvLxHTytvz4M1+etb+
	ePCnZ3J167FZUf+RwTJR6a7GdtmGZL6iCmAWkP5jMzYF9UXwCsEkBxYCRz97VSzKFjp9f/Fb4Hl9d
	k0xDDC29Silzaw2V2qtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pddHr-005MTp-0k;
	Sat, 18 Mar 2023 20:36:23 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pddHo-005MT4-1v;
	Sat, 18 Mar 2023 20:36:22 +0000
Received: by mail-ed1-x533.google.com with SMTP id h8so32884041ede.8;
        Sat, 18 Mar 2023 13:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679171778;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aQmVT/xNc3pdCE3gs02NHjq7u+nOxIXdjSvaq4xrKxs=;
        b=UTo7LbAbMR/ypWg1AZ4tZDqJV903m7B8Fr4EMqrb0QAG0/4EaA/XK0kZJAK7YRC7g4
         mtDih4zIsqICZfvRR8dfr6bOXXARNF1hUnvllxnk5+jQHoZLL5Ikq/2U4UXp78chCTpj
         dwgoajxv1Bf1RVc+VqxS57zAZOpstj26GXNF6hNlS1g6eZjoDHw8wrqNWJKC92b1J04x
         +CJT0SreiNnCEB1aVDu7picqftVfeepenW44V6thhqjns0SdaZ5lVlLcYHUryz02dXSM
         l8ur5uOsF6KUcGgz4vP0xp4QVwLZksp0ZQh2HrBTGR6LaF8pft4g0SQXuHTVDE7TOFrh
         02Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679171778;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aQmVT/xNc3pdCE3gs02NHjq7u+nOxIXdjSvaq4xrKxs=;
        b=xD9G90ysw28MpzhSmB14nVU7LiY7aoWil/AGevgSvkv78wAssRpym5lfR1Ab7MME17
         qZDLgc5yidCqh9GsKR3L8/Z/4Gt4jcsBilTmBoaPyz8B8FpzJ2w4uYfVo9BMc82Fjxb+
         duNQ3vjUn9sDJIP7Z/u6mrCAK+H/YAdb6MwWSAbsCHDbtgOORpy8xRLUMtdvf4hslSh0
         tukKKdGJDZFGPbLgs2TH+1z4W0XVSKCQk3bpvZBuBWc1OLX+PN+t+DRR193MZ7Rky4wx
         VtYAxKJN88peYDHDmOf19nYmm+jsgfIKfMoMri4f+pdhu8p7D2n3hqd5fajBCB+ViWZ2
         Vn9g==
X-Gm-Message-State: AO0yUKW90D25Xp/s8mt8h3IN4u4VFVErfCg+cGJUrmjKFDSDS3hFhQY2
	HjgtHvOM9KDOwTlsz9xjmzw=
X-Google-Smtp-Source: AK7set/hxOo9R4+RbLzF6JiwQmTMIXQ98hXl0eYozZ9N1c6FauyerhrTONCY6l6lWsJO8B5amv0ouA==
X-Received: by 2002:a17:907:2158:b0:878:7cf3:a9e7 with SMTP id rk24-20020a170907215800b008787cf3a9e7mr3579264ejb.65.1679171778215;
        Sat, 18 Mar 2023 13:36:18 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c073:a00:b51a:ddab:12c0:b88a? (dynamic-2a01-0c23-c073-0a00-b51a-ddab-12c0-b88a.c23.pool.telefonica.de. [2a01:c23:c073:a00:b51a:ddab:12c0:b88a])
        by smtp.googlemail.com with ESMTPSA id k22-20020a170906129600b00931508e55dasm2499501ejb.202.2023.03.18.13.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Mar 2023 13:36:17 -0700 (PDT)
Message-ID: <192db694-5bda-513c-31c5-96ec3b2425d9@gmail.com>
Date: Sat, 18 Mar 2023 21:32:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: [PATCH net-next 1/2] net: phy: smsc: export functions for use by
 meson-gxl PHY driver
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Russell King - ARM Linux <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Chris Healy <cphealy@gmail.com>
References: <683422c6-c1e1-90b9-59ed-75d0f264f354@gmail.com>
In-Reply-To: <683422c6-c1e1-90b9-59ed-75d0f264f354@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_133620_656557_BD33DFF2 
X-CRM114-Status: GOOD (  15.17  )
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

The Amlogic Meson internal PHY's have the same register layout as
certain SMSC PHY's (also for non-c22-standard registers). This seems
to be more than just coincidence. Apparently they also need the same
workaround for EDPD mode (energy detect power down). Therefore let's
export SMSC PHY driver functionality for use by the meson-gxl PHY
driver.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/smsc.c  | 20 +++++++++++++-------
 include/linux/smscphy.h |  6 ++++++
 2 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/smsc.c b/drivers/net/phy/smsc.c
index 721871184..730964b85 100644
--- a/drivers/net/phy/smsc.c
+++ b/drivers/net/phy/smsc.c
@@ -54,7 +54,7 @@ static int smsc_phy_ack_interrupt(struct phy_device *phydev)
 	return rc < 0 ? rc : 0;
 }
 
-static int smsc_phy_config_intr(struct phy_device *phydev)
+int smsc_phy_config_intr(struct phy_device *phydev)
 {
 	int rc;
 
@@ -75,8 +75,9 @@ static int smsc_phy_config_intr(struct phy_device *phydev)
 
 	return rc < 0 ? rc : 0;
 }
+EXPORT_SYMBOL_GPL(smsc_phy_config_intr);
 
-static irqreturn_t smsc_phy_handle_interrupt(struct phy_device *phydev)
+irqreturn_t smsc_phy_handle_interrupt(struct phy_device *phydev)
 {
 	int irq_status;
 
@@ -95,18 +96,20 @@ static irqreturn_t smsc_phy_handle_interrupt(struct phy_device *phydev)
 
 	return IRQ_HANDLED;
 }
+EXPORT_SYMBOL_GPL(smsc_phy_handle_interrupt);
 
-static int smsc_phy_config_init(struct phy_device *phydev)
+int smsc_phy_config_init(struct phy_device *phydev)
 {
 	struct smsc_phy_priv *priv = phydev->priv;
 
-	if (!priv->energy_enable || phydev->irq != PHY_POLL)
+	if (!priv || !priv->energy_enable || phydev->irq != PHY_POLL)
 		return 0;
 
 	/* Enable energy detect power down mode */
 	return phy_set_bits(phydev, MII_LAN83C185_CTRL_STATUS,
 			    MII_LAN83C185_EDPWRDOWN);
 }
+EXPORT_SYMBOL_GPL(smsc_phy_config_init);
 
 static int smsc_phy_reset(struct phy_device *phydev)
 {
@@ -186,7 +189,7 @@ static int lan95xx_config_aneg_ext(struct phy_device *phydev)
  * The workaround is only applicable to poll mode. Energy Detect Power-Down may
  * not be used in interrupt mode lest link change detection becomes unreliable.
  */
-static int lan87xx_read_status(struct phy_device *phydev)
+int lan87xx_read_status(struct phy_device *phydev)
 {
 	struct smsc_phy_priv *priv = phydev->priv;
 	int err;
@@ -195,7 +198,8 @@ static int lan87xx_read_status(struct phy_device *phydev)
 	if (err)
 		return err;
 
-	if (!phydev->link && priv->energy_enable && phydev->irq == PHY_POLL) {
+	if (!phydev->link && priv && priv->energy_enable &&
+	    phydev->irq == PHY_POLL) {
 		/* Disable EDPD to wake up PHY */
 		int rc = phy_read(phydev, MII_LAN83C185_CTRL_STATUS);
 		if (rc < 0)
@@ -229,6 +233,7 @@ static int lan87xx_read_status(struct phy_device *phydev)
 
 	return err;
 }
+EXPORT_SYMBOL_GPL(lan87xx_read_status);
 
 static int smsc_get_sset_count(struct phy_device *phydev)
 {
@@ -269,7 +274,7 @@ static void smsc_get_stats(struct phy_device *phydev,
 		data[i] = smsc_get_stat(phydev, i);
 }
 
-static int smsc_phy_probe(struct phy_device *phydev)
+int smsc_phy_probe(struct phy_device *phydev)
 {
 	struct device *dev = &phydev->mdio.dev;
 	struct smsc_phy_priv *priv;
@@ -294,6 +299,7 @@ static int smsc_phy_probe(struct phy_device *phydev)
 
 	return clk_set_rate(refclk, 50 * 1000 * 1000);
 }
+EXPORT_SYMBOL_GPL(smsc_phy_probe);
 
 static struct phy_driver smsc_phy_driver[] = {
 {
diff --git a/include/linux/smscphy.h b/include/linux/smscphy.h
index 1a136271b..80f37c1db 100644
--- a/include/linux/smscphy.h
+++ b/include/linux/smscphy.h
@@ -28,4 +28,10 @@
 #define MII_LAN83C185_MODE_POWERDOWN 0xC0 /* Power Down mode */
 #define MII_LAN83C185_MODE_ALL       0xE0 /* All capable mode */
 
+int smsc_phy_config_intr(struct phy_device *phydev);
+irqreturn_t smsc_phy_handle_interrupt(struct phy_device *phydev);
+int smsc_phy_config_init(struct phy_device *phydev);
+int lan87xx_read_status(struct phy_device *phydev);
+int smsc_phy_probe(struct phy_device *phydev);
+
 #endif /* __LINUX_SMSCPHY_H__ */
-- 
2.39.2



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
