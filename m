Return-Path: <SRS0=Zj7N=WN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3158BC3A59B
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Aug 2019 10:31:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 023D02086C
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Aug 2019 10:31:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pVXRydsm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIxHeEcU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 023D02086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mK0nM380bAi9V7NLPbbWxzoiHuLGcUb8rmARW+jBff8=; b=pVXRydsm5cde2h
	eSB0s1Qg+/XlBVfo/HwL7YBNnLsHRurmTHnwvtPE8N3EA/+thlEdwLedZ8jXwXmM5nK17tvCNvEKL
	KOTopjAm5cMzwgl7iOarUdS/UQVqKNzlbU44v/CY01nkDYf8ehsfcBTE+UgxTDXJRJWdwWDAARbc7
	0aKzVlqOfyJE2n+NzU31C9d6vvJp/YnpiK8TxiX+pAVvM9KJWHtbyXw1ZafOjvz/qfx/DI/fdXtIK
	xNMT2nek62AjBQGiwXux4JOn+7cW+zHRUy7MLB4NCpf+GMSOUuDdCI3adBSe2Sdxc5GiALEReuMzn
	DqzT+bvyguc8aXNqA+6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyvz6-0003cg-0c; Sat, 17 Aug 2019 10:30:56 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyvz3-0003c8-Ch
 for linux-amlogic@lists.infradead.org; Sat, 17 Aug 2019 10:30:55 +0000
Received: by mail-wr1-x443.google.com with SMTP id r3so3904710wrt.3
 for <linux-amlogic@lists.infradead.org>; Sat, 17 Aug 2019 03:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9wNoz7ijJoCTfhObFEBRQZooFA8ntqj0qgUNidYxe9M=;
 b=DIxHeEcU/3JDLUT7ahMfAB9Hu3qpvZ4VuScOuWybL9UtY1a6kFl8wOfR3EtAeWtPmb
 94QUcDnJblCpaBRBvlOV0TUd20yR+BkTBE4sIXDcOw5Uwu4vThQNzThXPE+g/onVbxps
 yJ7/Qr2DTiWUh/tRL1NZX+7z5dIYTNXpICHk/6oKqq0emN1N7+yWkE+wgxBFeGrzmmtN
 tJTE5VFde75aqgt6axsXx+QOa7JgNv7l7Pdq18gNuWfePeZJ1VcGVxJr1yIlIbrzM2xa
 GjNGGAajEsCvG1hopjVUwJKba6MTETKJ85iKj8af/QtZX0ALpmibm6Fvi15uaXwiyNiy
 yXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9wNoz7ijJoCTfhObFEBRQZooFA8ntqj0qgUNidYxe9M=;
 b=Mp6y0hm6P5H+V5ScRZUqSyHq/vW85HY3ZRXh67F012Lo6T7d08V2yOXcXWo8H4lLIh
 0IrT/aexzfix/ks48BHo4yhYA15kjD/O31koyghkBdXIVLieyKDCsTAxX6vzRABHcn06
 3iNTiZWjQ1kkJ7vdQLAbYorU+dCVDKfz5LlxdHCuYJEEvtie94Z5uHYIFB+QVUFbeOGo
 BwI4lga5rhfFeAOQj+jHx1iLJgsuGOE2BM9IfxnoBVq0/tqvHnLIQMQfpRvaPtxaOrF5
 sORue7NW0KT3yh3LX4eWC6j3ZzW9Qp3faV02cgI/i7pbdE+mI7w9hGF6rAptcpMfxe+/
 /bmQ==
X-Gm-Message-State: APjAAAU9r6MxloOMoeO1YmXWXdnecHZ4vAzc1+IW/MMVmDYTonMiOIQd
 0JkrKY2x7+lA79CD5IYTf/BXPUgo
X-Google-Smtp-Source: APXvYqzpzRl+ZmZIYseIGX4xgKcQY+1pmRGAAPzQnB2zvQN2dWXIRKXom25m3UtLTYUzCxtSjmJw6w==
X-Received: by 2002:adf:ff8e:: with SMTP id j14mr15935552wrr.141.1566037851575; 
 Sat, 17 Aug 2019 03:30:51 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f47:db00:ec01:10b1:c9a3:2488?
 ([2003:ea:8f47:db00:ec01:10b1:c9a3:2488])
 by smtp.googlemail.com with ESMTPSA id n12sm5663566wmc.24.2019.08.17.03.30.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 17 Aug 2019 03:30:50 -0700 (PDT)
Subject: [PATCH net-next v3 1/3] net: phy: remove calls to genphy_config_init
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 David Miller <davem@davemloft.net>, Kevin Hilman <khilman@baylibre.com>,
 Vivien Didelot <vivien.didelot@gmail.com>
References: <8790db9d-af10-c3b1-bc65-ee21bb99e6d9@gmail.com>
Message-ID: <e0ced3f6-323a-2563-0d2a-5ea8a8931aca@gmail.com>
Date: Sat, 17 Aug 2019 12:29:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8790db9d-af10-c3b1-bc65-ee21bb99e6d9@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190817_033053_437200_3CA5D628 
X-CRM114-Status: GOOD (  16.16  )
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Supported PHY features are either auto-detected or explicitly set.
In both cases calling genphy_config_init isn't needed. All that
genphy_config_init does is removing features that are set as
supported but can't be auto-detected. Basically it duplicates the
code in genphy_read_abilities. Therefore remove such calls from
all PHY drivers.

v2:
- remove call also from new adin PHY driver
v3:
- pass NULL as config_init function pointer for dp83848

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/adin.c         |  4 ----
 drivers/net/phy/at803x.c       |  4 ----
 drivers/net/phy/dp83822.c      |  5 -----
 drivers/net/phy/dp83848.c      | 11 +++--------
 drivers/net/phy/dp83tc811.c    |  4 ----
 drivers/net/phy/meson-gxl.c    |  2 +-
 drivers/net/phy/microchip.c    |  1 -
 drivers/net/phy/microchip_t1.c |  1 -
 drivers/net/phy/mscc.c         |  4 ++--
 drivers/net/phy/vitesse.c      |  6 +++---
 10 files changed, 9 insertions(+), 33 deletions(-)

diff --git a/drivers/net/phy/adin.c b/drivers/net/phy/adin.c
index ac79e16cd..4dec83df0 100644
--- a/drivers/net/phy/adin.c
+++ b/drivers/net/phy/adin.c
@@ -356,10 +356,6 @@ static int adin_config_init(struct phy_device *phydev)
 
 	phydev->mdix_ctrl = ETH_TP_MDI_AUTO;
 
-	rc = genphy_config_init(phydev);
-	if (rc < 0)
-		return rc;
-
 	rc = adin_config_rgmii_mode(phydev);
 	if (rc < 0)
 		return rc;
diff --git a/drivers/net/phy/at803x.c b/drivers/net/phy/at803x.c
index 222ccd9ec..d98aa5671 100644
--- a/drivers/net/phy/at803x.c
+++ b/drivers/net/phy/at803x.c
@@ -249,10 +249,6 @@ static int at803x_config_init(struct phy_device *phydev)
 {
 	int ret;
 
-	ret = genphy_config_init(phydev);
-	if (ret < 0)
-		return ret;
-
 	/* The RX and TX delay default is:
 	 *   after HW reset: RX delay enabled and TX delay disabled
 	 *   after SW reset: RX delay enabled, while TX delay retains the
diff --git a/drivers/net/phy/dp83822.c b/drivers/net/phy/dp83822.c
index 7ed4760fb..8a4b1d167 100644
--- a/drivers/net/phy/dp83822.c
+++ b/drivers/net/phy/dp83822.c
@@ -254,13 +254,8 @@ static int dp83822_config_intr(struct phy_device *phydev)
 
 static int dp83822_config_init(struct phy_device *phydev)
 {
-	int err;
 	int value;
 
-	err = genphy_config_init(phydev);
-	if (err < 0)
-		return err;
-
 	value = DP83822_WOL_MAGIC_EN | DP83822_WOL_SECURE_ON | DP83822_WOL_EN;
 
 	return phy_write_mmd(phydev, DP83822_DEVADDR, MII_DP83822_WOL_CFG,
diff --git a/drivers/net/phy/dp83848.c b/drivers/net/phy/dp83848.c
index 6f9bc7d91..54c7c1b44 100644
--- a/drivers/net/phy/dp83848.c
+++ b/drivers/net/phy/dp83848.c
@@ -68,13 +68,8 @@ static int dp83848_config_intr(struct phy_device *phydev)
 
 static int dp83848_config_init(struct phy_device *phydev)
 {
-	int err;
 	int val;
 
-	err = genphy_config_init(phydev);
-	if (err < 0)
-		return err;
-
 	/* DP83620 always reports Auto Negotiation Ability on BMSR. Instead,
 	 * we check initial value of BMCR Auto negotiation enable bit
 	 */
@@ -113,13 +108,13 @@ MODULE_DEVICE_TABLE(mdio, dp83848_tbl);
 
 static struct phy_driver dp83848_driver[] = {
 	DP83848_PHY_DRIVER(TI_DP83848C_PHY_ID, "TI DP83848C 10/100 Mbps PHY",
-			   genphy_config_init),
+			   NULL),
 	DP83848_PHY_DRIVER(NS_DP83848C_PHY_ID, "NS DP83848C 10/100 Mbps PHY",
-			   genphy_config_init),
+			   NULL),
 	DP83848_PHY_DRIVER(TI_DP83620_PHY_ID, "TI DP83620 10/100 Mbps PHY",
 			   dp83848_config_init),
 	DP83848_PHY_DRIVER(TLK10X_PHY_ID, "TI TLK10X 10/100 Mbps PHY",
-			   genphy_config_init),
+			   NULL),
 };
 module_phy_driver(dp83848_driver);
 
diff --git a/drivers/net/phy/dp83tc811.c b/drivers/net/phy/dp83tc811.c
index ac27da168..06f08832e 100644
--- a/drivers/net/phy/dp83tc811.c
+++ b/drivers/net/phy/dp83tc811.c
@@ -277,10 +277,6 @@ static int dp83811_config_init(struct phy_device *phydev)
 {
 	int value, err;
 
-	err = genphy_config_init(phydev);
-	if (err < 0)
-		return err;
-
 	value = phy_read(phydev, MII_DP83811_SGMII_CTRL);
 	if (phydev->interface == PHY_INTERFACE_MODE_SGMII) {
 		err = phy_write(phydev, MII_DP83811_SGMII_CTRL,
diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
index fa80d6dce..e8f2ca625 100644
--- a/drivers/net/phy/meson-gxl.c
+++ b/drivers/net/phy/meson-gxl.c
@@ -136,7 +136,7 @@ static int meson_gxl_config_init(struct phy_device *phydev)
 	if (ret)
 		return ret;
 
-	return genphy_config_init(phydev);
+	return 0;
 }
 
 /* This function is provided to cope with the possible failures of this phy
diff --git a/drivers/net/phy/microchip.c b/drivers/net/phy/microchip.c
index eb1b3287f..a644e8e50 100644
--- a/drivers/net/phy/microchip.c
+++ b/drivers/net/phy/microchip.c
@@ -305,7 +305,6 @@ static int lan88xx_config_init(struct phy_device *phydev)
 {
 	int val;
 
-	genphy_config_init(phydev);
 	/*Zerodetect delay enable */
 	val = phy_read_mmd(phydev, MDIO_MMD_PCS,
 			   PHY_ARDENNES_MMD_DEV_3_PHY_CFG);
diff --git a/drivers/net/phy/microchip_t1.c b/drivers/net/phy/microchip_t1.c
index 3d09b4716..001def450 100644
--- a/drivers/net/phy/microchip_t1.c
+++ b/drivers/net/phy/microchip_t1.c
@@ -48,7 +48,6 @@ static struct phy_driver microchip_t1_phy_driver[] = {
 
 		.features       = PHY_BASIC_T1_FEATURES,
 
-		.config_init    = genphy_config_init,
 		.config_aneg    = genphy_config_aneg,
 
 		.ack_interrupt  = lan87xx_phy_ack_interrupt,
diff --git a/drivers/net/phy/mscc.c b/drivers/net/phy/mscc.c
index 645d354ff..7ada1fd9c 100644
--- a/drivers/net/phy/mscc.c
+++ b/drivers/net/phy/mscc.c
@@ -1725,7 +1725,7 @@ static int vsc8584_config_init(struct phy_device *phydev)
 			return ret;
 	}
 
-	return genphy_config_init(phydev);
+	return 0;
 
 err:
 	mutex_unlock(&phydev->mdio.bus->mdio_lock);
@@ -1767,7 +1767,7 @@ static int vsc85xx_config_init(struct phy_device *phydev)
 			return rc;
 	}
 
-	return genphy_config_init(phydev);
+	return 0;
 }
 
 static int vsc8584_did_interrupt(struct phy_device *phydev)
diff --git a/drivers/net/phy/vitesse.c b/drivers/net/phy/vitesse.c
index 43691b1ac..bb6803527 100644
--- a/drivers/net/phy/vitesse.c
+++ b/drivers/net/phy/vitesse.c
@@ -197,7 +197,7 @@ static int vsc738x_config_init(struct phy_device *phydev)
 
 	vsc73xx_config_init(phydev);
 
-	return genphy_config_init(phydev);
+	return 0;
 }
 
 static int vsc739x_config_init(struct phy_device *phydev)
@@ -229,7 +229,7 @@ static int vsc739x_config_init(struct phy_device *phydev)
 
 	vsc73xx_config_init(phydev);
 
-	return genphy_config_init(phydev);
+	return 0;
 }
 
 static int vsc73xx_config_aneg(struct phy_device *phydev)
@@ -267,7 +267,7 @@ static int vsc8601_config_init(struct phy_device *phydev)
 	if (ret < 0)
 		return ret;
 
-	return genphy_config_init(phydev);
+	return 0;
 }
 
 static int vsc824x_ack_interrupt(struct phy_device *phydev)
-- 
2.22.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
