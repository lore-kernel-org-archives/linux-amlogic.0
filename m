Return-Path: <SRS0=SZaW=RR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C44C43381
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2019 14:02:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 674942070D
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2019 14:02:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uMpkyI9W";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lYzzHowu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="I179FTGH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 674942070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jH26sUyFVhyit98W++HSWpnEXS38LsUxo59X4CvIPXM=; b=uMpkyI9WhbAZzE
	CE/OWhyJqlJOGaIp8mzs9/Ix+sEJUYw4B/crJUZ1GpKItTZO/T9JAygBGKrt4Gzd+ZTNLHOdc5oor
	OWV1mo5oAKgx0mp1bMeXCB2PdoxIJxhdayuMvepCQSiqEYEMWm2LrLUSovLyVtuWROlpSBBFwy2tN
	4+NjGgUMEHvA8IHFHQ4m3TVqWcc/dDNozL7cZoiQuDvWVLrtYrlrj8gv+LfPnkqfakS1K+gmgw4tM
	IikzkwKWejltzGg5w682xutADarYP19lWT+ZRAKpZlS89pLkDOE3LwuMYGGCUzdxDYGwGRn6hHSWD
	9TjT8TKEbFBr+VoSnsKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4Qw3-0000T7-Qb; Thu, 14 Mar 2019 14:02:15 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4Qw1-0000PM-Et
 for linux-amlogic@bombadil.infradead.org; Thu, 14 Mar 2019 14:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gSe5MubfDDFMdYdBkB1bnX6EGj1Asq+NDs4nOR6+nzA=; b=lYzzHowu9JIzFhpqMymIfplEha
 7HDxSvMZp1BU/TMaP+Bo3qL9d1wHAtshsl/mADJN6f/2xASSfrWDDZnQMRyTpC95kv0qgXFOmdzdD
 ak0Sb57cw/L3yeCcVvPubpfTiI1FrRyYuC7hvTyq64SqSsHHieqnaNlg8bHHj050dVWA6Vg53GNYr
 k6gTebOtBfWVZVdN9crmjY36fUVG6v0MFGIT4zjZ484WeuWMUaPIDVQ/XI2bx3poEBtqRMDYxjgVy
 ICr7Tam3JjrlupV5J2Cnm9byuX9hokZvCQFJbS+8NtpOsHn6NLi+cGhY9n8GA4lr41T0e0cr5IYz2
 T+TpE6kQ==;
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4Qvv-0006AO-Da
 for linux-amlogic@lists.infradead.org; Thu, 14 Mar 2019 14:02:11 +0000
Received: by mail-wr1-x442.google.com with SMTP id t5so5994415wri.7
 for <linux-amlogic@lists.infradead.org>; Thu, 14 Mar 2019 07:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gSe5MubfDDFMdYdBkB1bnX6EGj1Asq+NDs4nOR6+nzA=;
 b=I179FTGHDGQnhvAAcTCZkjupEZ7SeeRUFFIjl6S2EabiorJXAHBhtgYjdMKF/Z5rmp
 +eWJv3f1JZOpJ9f45HNffGXG8X+oyHLYOj1bOtC46hQ1T/8i3FQ/EXF5xCAafTv892Zb
 aIGfJbXtUX4BIPDBhDKp1Io7klF4yRWMhQSevipssy8AxjuDySSX4COz4R8YUeR+mn/S
 sOV/YGgukfZt9pBZojGeFlsmty93cBUxtBL8JM8CXumeV8/JV/CuJ7ZoP0D/0vuOrKgc
 KjSXaMWM9GmqT7p0SzzciTSXWpun9T+2+mclRiLftICwDmQWna3JcVjNZV+s6zMh2I2D
 mSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gSe5MubfDDFMdYdBkB1bnX6EGj1Asq+NDs4nOR6+nzA=;
 b=UPzX0LrEoOk8Isb5EJ9OM4XvKjEMGDdM94JwIsRnDiZufUxPYQgb5e8B9LjbUP5Y2U
 t79v5JBG2f1oc+5tvaJ0xo3O9mRYkOuF/nlT+TEmiXTOofzddnkhEn1QrGH0jfKkIXd2
 XbI51BzSiWXr+Z/wo0LPc4+iadX/ABV8NHxwnVIux6nwjx/zTqFpWocz6eWV6tsqBets
 2DBaM2nIzqtT4MZg6WMcKdzCp5BOEugwecXiCeWQSkmpPttAest+M/wxu9lxXd5HzowR
 zXpgrh4YOfUO4vziVVnOzoiaQ0u7rVSiMYij27CtjxIkVZCK5KKsi++tTIpDoFVE5cT5
 rwYQ==
X-Gm-Message-State: APjAAAWrlkpWmRppGUvv6bDOIwZajF8H+rIrjD8Vs32PyrKA3C8ZoBiw
 /FB24p7l1Rk7O56eKz2YI/x8cg==
X-Google-Smtp-Source: APXvYqxOsW0L02QZtLWq3QISHge5mO3XVz+uW+KzndOm8Q1A9D4vhbaWTD5xPJI/b38LcjKpcEsIkw==
X-Received: by 2002:adf:ba84:: with SMTP id p4mr31965743wrg.156.1552572118395; 
 Thu, 14 Mar 2019 07:01:58 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id y7sm2661051wmi.34.2019.03.14.07.01.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 14 Mar 2019 07:01:57 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH net-next 3/3] net: phy: meson-gxl: add g12a support
Date: Thu, 14 Mar 2019 15:01:35 +0100
Message-Id: <20190314140135.19184-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190314140135.19184-1-jbrunet@baylibre.com>
References: <20190314140135.19184-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190314_100207_487284_D65778E2 
X-CRM114-Status: GOOD (  11.71  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The g12a SoC family uses the type of internal PHY that was used on the
gxl family. The quirks of gxl family, like the LPA register corruption,
appear to have been resolved on this new SoC generation.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/net/phy/meson-gxl.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
index 0eec2913c289..49cad0f4c79b 100644
--- a/drivers/net/phy/meson-gxl.c
+++ b/drivers/net/phy/meson-gxl.c
@@ -237,11 +237,25 @@ static struct phy_driver meson_gxl_phy[] = {
 		.config_intr	= meson_gxl_config_intr,
 		.suspend        = genphy_suspend,
 		.resume         = genphy_resume,
+	}, {
+		.phy_id		= 0x01803301,
+		.phy_id_mask	= 0xffffffff,
+		.name		= "Meson G12A Internal PHY",
+		.features	= PHY_BASIC_FEATURES,
+		.flags		= PHY_IS_INTERNAL,
+		.soft_reset     = genphy_soft_reset,
+		.aneg_done      = genphy_aneg_done,
+		.read_status	= genphy_read_status,
+		.ack_interrupt	= meson_gxl_ack_interrupt,
+		.config_intr	= meson_gxl_config_intr,
+		.suspend        = genphy_suspend,
+		.resume         = genphy_resume,
 	},
 };
 
 static struct mdio_device_id __maybe_unused meson_gxl_tbl[] = {
 	{ 0x01814400, 0xfffffff0 },
+	{ 0x01803301, 0xffffffff },
 	{ }
 };
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
