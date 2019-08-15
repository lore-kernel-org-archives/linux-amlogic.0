Return-Path: <SRS0=yXyy=WL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7247EC433FF
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Aug 2019 12:04:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 485E32173E
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Aug 2019 12:04:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="agWk2Tki";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAw+gRew"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 485E32173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ln3D5zqFY2flyVIqF0vmqAox0wrJet6l15GsxTQ17sw=; b=agWk2TkiicvMvW
	Ti4JwoyAgAc6yFv8POL69ySHc+yO7tLoateoljz5dEW2JTn32SqC7Z1ScrZg5MIttyp6ObLKwaY9K
	yZntjH88Jcpf/iz8DnMVYSsOEnE+hJC3s8WYTvpY7+bl8LS+yEwlhTpPlUgPZRooR5LDQs8lvBWUt
	+um2LeCFe43XxGeM8RkXUUMt+mZFIeEcUlZcyKDOFUUgxv/4DIyUluSkO0c5nNL86QsZQwHQFaXkH
	tjJKHfTMSw8aIHZv6kHkyQb/Rs9Q3EusqqtRxkT+SDL/0oeSey0GgqAS96nLj6dWxwxRcihoww1dC
	GI+PO3us3reGC4qFSX2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyEUb-00026X-G1; Thu, 15 Aug 2019 12:04:33 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyEUX-00022V-Ia
 for linux-amlogic@lists.infradead.org; Thu, 15 Aug 2019 12:04:31 +0000
Received: by mail-wr1-x436.google.com with SMTP id u16so2037966wrr.0
 for <linux-amlogic@lists.infradead.org>; Thu, 15 Aug 2019 05:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cv9AHUXZSTIXwb3zYOsS0REKv7j9Ec1lDg+1ePlQxpg=;
 b=ZAw+gRewbIXMvSKpzDkDBQkRe5bSx8jpM3yr5bh1gf9cMqZ+R6+z3acFcNcdJYTRqv
 mMwMOK9cVTrFCLT3fJAQe4wKu1WoTNZSpDmKlp6HLoTnovFL8Ah0LwSBOfLrusGCPGpE
 /fYKXUf5oAMTC1ttqOSCJP9fg5lQUL35x+nPF/2OD1LMXsg5HSlfReJV5Y8wynhfS4ay
 rPJ+xRj8L9UkgsgqhNK36qijyhdymtFHybxIexAxqmGoGwtGBzNnhG/b9ytZwU674l8F
 3QG/SzauClWbJ407RMhpLbVUV46Xx1S47dZw2LNGZX+jMGaDkppUj6j+yVcqdZNkABtf
 WiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cv9AHUXZSTIXwb3zYOsS0REKv7j9Ec1lDg+1ePlQxpg=;
 b=JXDc4UlGJkqKfivm9XvBYHJTbSpoZowAPRwomu9Z9Q0C8ywTP6dlOte8ckZYqeoAI4
 UiTOGZEFhuINXO9Vvt1Pd3WjTfFr7eF4V0Jvbr/RidEJswLSSPXDG2G9diB0noDJBgBl
 /J/PQJln/jZvrYCbajuMFnFTVWO/BJlEx9U0S5QB4ntqbLbJKtm3Lu71pokkDi7cnKEq
 x1+N4A9LogMwbPrROszBDGvO+P/bVJEq/YDq1GJCyIy8dOp2G4PRewMgoIFozJSjDyoS
 IyR7vsfGdHyCU5vi+gctLDtsCBlHT6uaYjGosyrSAfnWGJkFABpNeGVpmwh1KqiOoyFT
 Htdg==
X-Gm-Message-State: APjAAAUjV5E9zVGYbZNBH2ictpxh8iVwO3BSD0HONe+Apqy4XLSqoE34
 yVIctu+1wm0i49StTDu0YWSbQQ2P
X-Google-Smtp-Source: APXvYqxSYV3uua4v60rpIk/MRfYu8bHWpMRlYwl3v4EAYZ1YQ4A295aHbnQ5Pk946m/c3BaPRl+ewA==
X-Received: by 2002:adf:f0ce:: with SMTP id x14mr5151799wro.31.1565870666080; 
 Thu, 15 Aug 2019 05:04:26 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f2f:3200:b8fa:18d8:f880:513c?
 (p200300EA8F2F3200B8FA18D8F880513C.dip0.t-ipconnect.de.
 [2003:ea:8f2f:3200:b8fa:18d8:f880:513c])
 by smtp.googlemail.com with ESMTPSA id t63sm1137065wmt.6.2019.08.15.05.04.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Aug 2019 05:04:25 -0700 (PDT)
Subject: [PATCH net-next 3/3] net: phy: remove genphy_config_init
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 David Miller <davem@davemloft.net>, Kevin Hilman <khilman@baylibre.com>,
 Vivien Didelot <vivien.didelot@gmail.com>
References: <95dfdb55-415c-c995-cba3-1902bdd46aec@gmail.com>
Message-ID: <d184d744-a7ed-b236-8c20-e928ae805234@gmail.com>
Date: Thu, 15 Aug 2019 14:04:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <95dfdb55-415c-c995-cba3-1902bdd46aec@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190815_050429_640988_5981DC95 
X-CRM114-Status: GOOD (  11.35  )
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

Now that all users have been removed we can remove genphy_config_init.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/phy_device.c | 51 ------------------------------------
 include/linux/phy.h          |  1 -
 2 files changed, 52 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 7e7393f3c..d347ddcac 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1895,57 +1895,6 @@ int genphy_soft_reset(struct phy_device *phydev)
 }
 EXPORT_SYMBOL(genphy_soft_reset);
 
-int genphy_config_init(struct phy_device *phydev)
-{
-	int val;
-	__ETHTOOL_DECLARE_LINK_MODE_MASK(features) = { 0, };
-
-	linkmode_set_bit_array(phy_basic_ports_array,
-			       ARRAY_SIZE(phy_basic_ports_array),
-			       features);
-	linkmode_set_bit(ETHTOOL_LINK_MODE_Pause_BIT, features);
-	linkmode_set_bit(ETHTOOL_LINK_MODE_Asym_Pause_BIT, features);
-
-	/* Do we support autonegotiation? */
-	val = phy_read(phydev, MII_BMSR);
-	if (val < 0)
-		return val;
-
-	if (val & BMSR_ANEGCAPABLE)
-		linkmode_set_bit(ETHTOOL_LINK_MODE_Autoneg_BIT, features);
-
-	if (val & BMSR_100FULL)
-		linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Full_BIT, features);
-	if (val & BMSR_100HALF)
-		linkmode_set_bit(ETHTOOL_LINK_MODE_100baseT_Half_BIT, features);
-	if (val & BMSR_10FULL)
-		linkmode_set_bit(ETHTOOL_LINK_MODE_10baseT_Full_BIT, features);
-	if (val & BMSR_10HALF)
-		linkmode_set_bit(ETHTOOL_LINK_MODE_10baseT_Half_BIT, features);
-
-	if (val & BMSR_ESTATEN) {
-		val = phy_read(phydev, MII_ESTATUS);
-		if (val < 0)
-			return val;
-
-		if (val & ESTATUS_1000_TFULL)
-			linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Full_BIT,
-					 features);
-		if (val & ESTATUS_1000_THALF)
-			linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseT_Half_BIT,
-					 features);
-		if (val & ESTATUS_1000_XFULL)
-			linkmode_set_bit(ETHTOOL_LINK_MODE_1000baseX_Full_BIT,
-					 features);
-	}
-
-	linkmode_and(phydev->supported, phydev->supported, features);
-	linkmode_and(phydev->advertising, phydev->advertising, features);
-
-	return 0;
-}
-EXPORT_SYMBOL(genphy_config_init);
-
 /**
  * genphy_read_abilities - read PHY abilities from Clause 22 registers
  * @phydev: target phy_device struct
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 5ac7d2137..d26779f1f 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1069,7 +1069,6 @@ void phy_attached_print(struct phy_device *phydev, const char *fmt, ...)
 void phy_attached_info(struct phy_device *phydev);
 
 /* Clause 22 PHY */
-int genphy_config_init(struct phy_device *phydev);
 int genphy_read_abilities(struct phy_device *phydev);
 int genphy_setup_forced(struct phy_device *phydev);
 int genphy_restart_aneg(struct phy_device *phydev);
-- 
2.22.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
