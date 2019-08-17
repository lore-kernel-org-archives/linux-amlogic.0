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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C2CC3A59B
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Aug 2019 10:31:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B63C2086C
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Aug 2019 10:31:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IJ8I1eWK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMpoJ1s3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B63C2086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3tm2Mkw+QlelVRM2KYeJi4L53bgNh2qkeyPpqBpeTPo=; b=IJ8I1eWKZM5vD7
	sfrdlMhLThgLxxZB6Y60FwwxWjH/MIb3RCj3xkMwAcSOuNeqJ1Ww2NLZE3aM8iN/LftetsSnYDfF2
	dB/pm6jyS11muor11kJfL5W7V5FFSaoxLl0s7fzbb+sTBjdB0dtUoR6tUM6iPcfzGZEZlyApOvacb
	nUjq8Y4kFLbdAxJ2qIoDSCxVLZtwYfuMMyQXekJM//+Ud2rXL+KvTVMQWYuKDO77hTnxhKGzIk+LG
	S5JtvwKGpx7VzqS/tNG4jzXDb24daM+W1N2pwq8rZVZBAY5roQRloG9VOKRFafTjvlye/cN6UxzXF
	UVKtItx0xLFiqjX6CnLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyvz9-0003fz-G7; Sat, 17 Aug 2019 10:30:59 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyvz6-0003cf-6Z
 for linux-amlogic@lists.infradead.org; Sat, 17 Aug 2019 10:30:57 +0000
Received: by mail-wr1-x434.google.com with SMTP id c3so3887870wrd.7
 for <linux-amlogic@lists.infradead.org>; Sat, 17 Aug 2019 03:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2mx9+lMjWlDBJoaKKItBGduSQiKJLy0OqvNV+u7gJVo=;
 b=MMpoJ1s3hl+YCY/O/+iO5aFEjJIhx0Zx+nnq9j+5cg/Z6ItNbYtyqKwb2JnYJArPw4
 RmJXKmk0TBTsgnTVyDuM0bza7GR7ikwVXNFRwkVCwQUva0CTFedOUUyZAxvobOJKsiys
 lwVwvens0SeuCnNF2e9M4cEsg/sGbKRJWFQTzeZ8L2nYxGZa3mcNK+NMz99SYQt2L3S2
 3421csqjHs3xkWEC+8i2EzZi5ozDs9yRuxcozKxgXkh2kAzHYoqQBSV7qFlMCvysWhO6
 jro/wxp7bOaZCBFCFrnPNwWMeK4UzO6a7OY458ktK1SKIGstTa1eyKON8TeaWdUM0LKE
 /aqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2mx9+lMjWlDBJoaKKItBGduSQiKJLy0OqvNV+u7gJVo=;
 b=EJorEHYE3IUMKqMkJVN7kaBfrWfuihAPQj0fhha2vUz8GpUP33auUdVeWJIaQSPzJ6
 ooq58Iop4XiGcRMynVGz0B0YCT3rH01TTgkdDnprYvEe6jZ3ehy8+nth5oUvNCSAiqAw
 V86okBYvIYYgEyiD2EW3KIoiFdbZOOcZDW6TCsm+i5RJAv9Sl1CLmwH7QhvD+UmS2/ZY
 obvTdQ7YH8pUc9Wnsd3ZJczb3w22fhLrv5ZojkA4aSeRcocB9ouahaylR2k2YXJF53ZV
 W01o0WSuL8SMbxpGjYJj7YR58CrgSi1A+PL+nW5nQ62o1P8MjBMK0MLiQ5N1FMNdvbic
 ft7A==
X-Gm-Message-State: APjAAAXCD7pdUcRMRbYcoetlNVPdQn/HOvdWmvAIZ89KLkg/2f7u9cnE
 ULiiALbbuEVFXIuQDPXkqfxuUd/6
X-Google-Smtp-Source: APXvYqwlp+wp6qr873QNLi0m4K/JX4aMGCSQALpg/v34GTsAWnRmrdSr1OXJbsMLzW6Jef8Opwmpeg==
X-Received: by 2002:adf:e3ce:: with SMTP id k14mr14595013wrm.303.1566037854510; 
 Sat, 17 Aug 2019 03:30:54 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f47:db00:ec01:10b1:c9a3:2488?
 (p200300EA8F47DB00EC0110B1C9A32488.dip0.t-ipconnect.de.
 [2003:ea:8f47:db00:ec01:10b1:c9a3:2488])
 by smtp.googlemail.com with ESMTPSA id o14sm13545547wrg.64.2019.08.17.03.30.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 17 Aug 2019 03:30:54 -0700 (PDT)
Subject: [PATCH net-next v3 3/3] net: phy: remove genphy_config_init
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 David Miller <davem@davemloft.net>, Kevin Hilman <khilman@baylibre.com>,
 Vivien Didelot <vivien.didelot@gmail.com>
References: <8790db9d-af10-c3b1-bc65-ee21bb99e6d9@gmail.com>
Message-ID: <a65b09d1-b0f8-b4fe-84e9-902d32ce26bc@gmail.com>
Date: Sat, 17 Aug 2019 12:30:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <8790db9d-af10-c3b1-bc65-ee21bb99e6d9@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190817_033056_246309_01A08136 
X-CRM114-Status: GOOD (  10.58  )
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
index 9c546bae9..d5db7604d 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1885,57 +1885,6 @@ int genphy_soft_reset(struct phy_device *phydev)
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
