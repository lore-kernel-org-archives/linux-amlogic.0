Return-Path: <SRS0=6t6z=WM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF0E5C3A59D
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Aug 2019 20:32:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A60A8206C1
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Aug 2019 20:32:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mZ7ptab/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t7+fzq1L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A60A8206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3tm2Mkw+QlelVRM2KYeJi4L53bgNh2qkeyPpqBpeTPo=; b=mZ7ptab/K3MXYy
	y8bIaV9dAnWch67TpIl+kiYpgXUXEd5QD2KUSlKAVy6GuI2CJ4KWS86D+RQGKSDWGTGzF4UqaC5Ey
	YdqzFyqnA3i5PzcIvYhX/xKQnHYvhSIgUyk3JNacTmjjJ0Y7FBjFGl0TDd8rcAC5LT5cnrUiDe3Hg
	insBt2W6uG7t5Ze9P88fG7BXLQqwxXBNhgFnx75djTrc6oWrdlA5qfVb3NDDP/p4evjNWaCNb8RUm
	ixaASWmAdWLT62foVUjgw3Jfjct34HI9F9hKvR0sd+pQ7I25WHLP8/xjxedY7NXj02rIKw3Q1J/Mu
	mEWEE2ksxqjLVRNL0NsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyitw-00016k-80; Fri, 16 Aug 2019 20:32:44 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyitr-00013L-Rb
 for linux-amlogic@lists.infradead.org; Fri, 16 Aug 2019 20:32:41 +0000
Received: by mail-wr1-x431.google.com with SMTP id u16so2700202wrr.0
 for <linux-amlogic@lists.infradead.org>; Fri, 16 Aug 2019 13:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2mx9+lMjWlDBJoaKKItBGduSQiKJLy0OqvNV+u7gJVo=;
 b=t7+fzq1L9xHD7bUCZ2AX6xvXFGTs4mIrL0yG57pxQA4WQwa6AP7SF1s4nLVW00zseR
 kgDtLgAm3OjfYz7ibBZdA+qqiG4AVbRF2uQC0Pjr5Mzyb5gqvDaTkgBuvu7xx1VP7Xpk
 gifvoLx2mKPXdA92QhIRuBS/nb7BSUTvvxbRTMDditE7YvlYWN2hx5YDMbEGsv9vpPIw
 hoZxSnNvNIUwS6JldXljosGwu02P5mslm1oAMm5wrO9hBdUwBtlMYYh9Ld+M/FTd13ky
 Sgqw/6uri/dfkjMPon/AuItkL0/IUtiTM4+NdLTNtva7BtY4NIXEjbNVdNxKk8KMGVzl
 7G0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2mx9+lMjWlDBJoaKKItBGduSQiKJLy0OqvNV+u7gJVo=;
 b=jylW7VwHa++cpfDvT/eElAh8IfV8E5oOTTeVyfJmKrXFUT1MZGaiuculZ4xj3ARNSy
 1DwQ7rbPRYgd8jcTnDejNHw04nT9EXlO6OaP6CfPSxxjdh7DR9+DThHyE1btUscACYNW
 C+2ViVZtAyhryZug6dnGZgVLF14QDskT0RzouPC/xSILpilBKpCxAHqEKsj7P1S1YsZG
 J5sHMKlesoR19GRBfX5uIyNDa7DHi0XFq/HfNGul0irOFGC7fWv5HfuissY4rKVa+AwJ
 HoUfPPy8oa8ZW3ABpvl70yWQ63Lh7s2SoLQenjZosIb0ou4y5siaGaqJ/ZsvclmK3UX7
 fwIg==
X-Gm-Message-State: APjAAAVWnJtQ0CUytEnvA/d2738YnEoVxKZh61LEPIXWG+YOKpg87NMH
 OiDz9kgu4ECH6GVPCtnFizf1eLnm
X-Google-Smtp-Source: APXvYqxG65IYpoM1P7kDNVmZsnLwm7l5pbnGfBY5HWJ7PvBsDfsQ0vI/ZG2Zy3jBrjaLR6DoWgEhMg==
X-Received: by 2002:adf:eccb:: with SMTP id s11mr12654945wro.351.1565987558024; 
 Fri, 16 Aug 2019 13:32:38 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f2f:3200:4112:e131:7f21:ec09?
 (p200300EA8F2F32004112E1317F21EC09.dip0.t-ipconnect.de.
 [2003:ea:8f2f:3200:4112:e131:7f21:ec09])
 by smtp.googlemail.com with ESMTPSA id t63sm5004055wmt.6.2019.08.16.13.32.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2019 13:32:37 -0700 (PDT)
Subject: [PATCH net-next v2 3/3] net: phy: remove genphy_config_init
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 David Miller <davem@davemloft.net>, Kevin Hilman <khilman@baylibre.com>,
 Vivien Didelot <vivien.didelot@gmail.com>
References: <62de47ba-0624-28c0-56a1-e2fc39a36061@gmail.com>
Message-ID: <6c657d36-97e5-0feb-ddf2-a59e4c38c437@gmail.com>
Date: Fri, 16 Aug 2019 22:32:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <62de47ba-0624-28c0-56a1-e2fc39a36061@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190816_133239_888546_B2B814DE 
X-CRM114-Status: GOOD (  10.50  )
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
