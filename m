Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E61C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Mar 2022 07:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DvSKMurn98U4oNRcea1SP63TXuLtuoJAAh4/0/t2wsQ=; b=cBzp5hnjU1ILwF
	jU5j+nbKoMyrO18H38n91FBzIj+qaGIadMxoMQeNvGnt94iFybi1kq+IcmO/OFMKTtImzC1l0ihE1
	+Smz4B/UNxyZI4jPiBRZBLsi0XEpVMRVX+bjyLN5xKEXlb6tziD+AgmB1ILpFj+XwresHXWVDQPSv
	E2fqRSiHnOmy7F3IhXK8vh6A0SuiEIO/h91j63K4U5DYfsthCR1weyYjs2sxmnJ7Q8iOo60Pe7bOa
	bvH9PgCJsBRDX/PHCzFk5maizqZB7Q2yfo6bImPpkrOb1rb3wIt2ABYTPHmNRKpiKZezkYtkPIgTa
	gE63Z5x1UCvUxz9aj3Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPgIG-005dVu-Vu; Thu, 03 Mar 2022 07:54:37 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPgI3-005dRW-SY; Thu, 03 Mar 2022 07:54:25 +0000
Received: by mail-ej1-x62c.google.com with SMTP id r13so8830286ejd.5;
 Wed, 02 Mar 2022 23:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=M4XRf2sIBG0/gEW/qp5zl/3bv8xHye0TNCiBP0f7nIc=;
 b=UOdXsYKoHU8Sb4BfBpPn6+kmp5JZbNOgwuuX8KgkW6JEq/jxNwJE3F+raFOL339fDr
 9mhF4u9I3N1QEBYFA69+FF8fgaXVq71GMrA2mNJXuiidC4HHotqNBa5xeUj2LKJs0fSY
 mdgmbuKCyuZ1jfIaymv9hprAYLOOe7B1rYCey1q44pITBLzY5n7Lc/D5k1ZxWqvQNEXS
 8mlcQ9tCHJcgN2UKhXe0/J3maT8dU3yDPXwlvBIXgj1sHwxqduHSjDMOk8L1jS7zq1Gn
 rLeMo+6aYzk0nUIpKFSWE0wt6rz1QylJm6UkHMdkmqtFxgXxt74LsmjikPomvNBHkzyb
 7o5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=M4XRf2sIBG0/gEW/qp5zl/3bv8xHye0TNCiBP0f7nIc=;
 b=KenMzu5fU4exuiJgo3jtE1th8quN8s4NlBOMPkHQv6NXHh2abO/2X0WFHZ0PvbQSGv
 3WcZUyUq4chjxJYFycflAoMTMI3kar++SZ0YOEgTrUWAjd2wlqRXg/rEo5ZMZOcqeyHt
 3zDT520SigDIO9zORfjvjgNG+LDbrAY6AoFwQaUsaFTZCfwUl92NeNHEi63ed5xC2/5f
 O7C7rH0jZoKL1ouGzGhqhYU+hS9J6RgUPWqCADtZO+S9uyT36soheCY5cGc8wyJ5/2Bn
 nf5j+CPLAHlhGmP38nnhH1mJ6GPSQwWUWLrQxX5LAnNFZ4fjpmV7kSowvMAQfzXhBYuL
 lsqA==
X-Gm-Message-State: AOAM530TSQrE9yrawxyOYotnFbv7+nrhOsu6Y1WJP8IqX0KwFfu2ARyr
 xIZtce5WJqCt8RXMsE3YSDxSrBH9oZY=
X-Google-Smtp-Source: ABdhPJwh3lwBn4C1AqDcAdk1HxU1PbxBM+iT5YZF5nv1VJ5aqKL5crIXy447dJvtp1MEyoThyqsaqw==
X-Received: by 2002:a17:907:1c13:b0:6da:62bb:f1ff with SMTP id
 nc19-20020a1709071c1300b006da62bbf1ffmr5237397ejc.276.1646294061921; 
 Wed, 02 Mar 2022 23:54:21 -0800 (PST)
Received: from ?IPV6:2a01:c22:77fb:7800:e497:e843:ca71:bb7d?
 (dynamic-2a01-0c22-77fb-7800-e497-e843-ca71-bb7d.c22.pool.telefonica.de.
 [2a01:c22:77fb:7800:e497:e843:ca71:bb7d])
 by smtp.googlemail.com with ESMTPSA id
 y18-20020a170906471200b006da8a883b5fsm423367ejq.54.2022.03.02.23.54.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Mar 2022 23:54:21 -0800 (PST)
Message-ID: <04cac530-ea1b-850e-6cfa-144a55c4d75d@gmail.com>
Date: Thu, 3 Mar 2022 08:54:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, netdev@vger.kernel.org,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net] net: phy: meson-gxl: fix interrupt handling in forced mode
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_235423_971303_F9EA6F75 
X-CRM114-Status: GOOD (  17.44  )
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

This PHY doesn't support a link-up interrupt source. If aneg is enabled
we use the "aneg complete" interrupt for this purpose, but if aneg is
disabled link-up isn't signaled currently.
According to a vendor driver there's an additional "energy detect"
interrupt source that can be used to signal link-up if aneg is disabled.
We can safely ignore this interrupt source if aneg is enabled.

This patch was tested on a TX3 Mini TV box with S905W (even though
boot message says it's a S905D).

This issue has been existing longer, but due to changes in phylib and
the driver the patch applies only from the commit marked as fixed.

Fixes: 84c8f773d2dc ("net: phy: meson-gxl: remove the use of .ack_callback()")
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/meson-gxl.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
index 7e7904fee..c49062ad7 100644
--- a/drivers/net/phy/meson-gxl.c
+++ b/drivers/net/phy/meson-gxl.c
@@ -30,8 +30,12 @@
 #define  INTSRC_LINK_DOWN	BIT(4)
 #define  INTSRC_REMOTE_FAULT	BIT(5)
 #define  INTSRC_ANEG_COMPLETE	BIT(6)
+#define  INTSRC_ENERGY_DETECT	BIT(7)
 #define INTSRC_MASK	30
 
+#define INT_SOURCES (INTSRC_LINK_DOWN | INTSRC_ANEG_COMPLETE | \
+		     INTSRC_ENERGY_DETECT)
+
 #define BANK_ANALOG_DSP		0
 #define BANK_WOL		1
 #define BANK_BIST		3
@@ -200,7 +204,6 @@ static int meson_gxl_ack_interrupt(struct phy_device *phydev)
 
 static int meson_gxl_config_intr(struct phy_device *phydev)
 {
-	u16 val;
 	int ret;
 
 	if (phydev->interrupts == PHY_INTERRUPT_ENABLED) {
@@ -209,16 +212,9 @@ static int meson_gxl_config_intr(struct phy_device *phydev)
 		if (ret)
 			return ret;
 
-		val = INTSRC_ANEG_PR
-			| INTSRC_PARALLEL_FAULT
-			| INTSRC_ANEG_LP_ACK
-			| INTSRC_LINK_DOWN
-			| INTSRC_REMOTE_FAULT
-			| INTSRC_ANEG_COMPLETE;
-		ret = phy_write(phydev, INTSRC_MASK, val);
+		ret = phy_write(phydev, INTSRC_MASK, INT_SOURCES);
 	} else {
-		val = 0;
-		ret = phy_write(phydev, INTSRC_MASK, val);
+		ret = phy_write(phydev, INTSRC_MASK, 0);
 
 		/* Ack any pending IRQ */
 		ret = meson_gxl_ack_interrupt(phydev);
@@ -237,9 +233,16 @@ static irqreturn_t meson_gxl_handle_interrupt(struct phy_device *phydev)
 		return IRQ_NONE;
 	}
 
+	irq_status &= INT_SOURCES;
+
 	if (irq_status == 0)
 		return IRQ_NONE;
 
+	/* Aneg-complete interrupt is used for link-up detection */
+	if (phydev->autoneg == AUTONEG_ENABLE &&
+	    irq_status == INTSRC_ENERGY_DETECT)
+		return IRQ_HANDLED;
+
 	phy_trigger_machine(phydev);
 
 	return IRQ_HANDLED;
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
