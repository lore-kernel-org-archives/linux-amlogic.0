Return-Path: <SRS0=iFsO=4K=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_ADSP_ALL,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB3CC35669
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Feb 2020 23:51:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D156A20707
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Feb 2020 23:51:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IinJZen2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=megous.com header.i=@megous.com header.b="ORPcTNcF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D156A20707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=megous.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VDC0umTVKlBL+dSPFq7rpMfSF9BxaqO+WcK/mUgSjWA=; b=IinJZen2QoKWDx
	Gwj1HqcsBppKcKLVhL3Nd48F44hRWtzqozgDhw+ThzluFca3A6cimXMcyUUWnyUdSmw6Gt5w59w9o
	YcClp7hO3Yk6u9zK77HauuMtnPolze8aJMc9kfwnUZDHs6J0XqKWUhPLCOL8GrxE5i9AgwSmZ1Ien
	wmbIQm3hLROtX2rqt+6I+V+wL4USWcYCsU11UbTNbJmjU8yF7CerG7hsFxm82shX4uJZtzZKQ/9eP
	Q84cjf7CEc8WWCQgiQ9WspMA/K2FtmWXWozubvYMyn5I0YnkYMNubjgzKxaLoFrWobTxhbX1j3Ubk
	r40zvyQofXhGny+Lq7/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5eYp-0005eE-1k; Sat, 22 Feb 2020 23:51:51 +0000
Received: from vps.xff.cz ([195.181.215.36])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5eYl-0005b7-Ly; Sat, 22 Feb 2020 23:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1582415505; bh=cltvQHikJrGK5YS2gg9OUR9Ui1uj17Pe1UWzZvwR4So=;
 h=From:To:Cc:Subject:Date:From;
 b=ORPcTNcFH8uBHuJavnP9cy05HTS1KwWse5MdIVoGXMcxMJ5fAmgg8xnov3wVodURv
 RpnTFrMkYF8DtGqGU6tL7hsNkFQQvHpoLrpg2BYuGcrsgAtnxMddzoWHW8LgZfU4ep
 fV3/r3FMZV26GMvHLt3IXiikt4Gfd89jz6t2qGdk=
From: Ondrej Jirman <megous@megous.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] phy: phy-meson-g12a-usb2: Fix GENMASK misuse
Date: Sun, 23 Feb 2020 00:51:38 +0100
Message-Id: <20200222235142.242732-1-megous@megous.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200222_155148_051218_04EA1B10 
X-CRM114-Status: UNSURE (   6.73  )
X-CRM114-Notice: Please train this message.
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
Cc: Ondrej Jirman <megous@megous.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Arguments to GENMASK should be msb >= lsb.

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
I just grepped the whole kernel tree for GENMASK argument order issues,
and this is one of the three that popped up. No testing was done.

 drivers/phy/amlogic/phy-meson-g12a-usb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/amlogic/phy-meson-g12a-usb2.c b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
index 9065ffc85eb47..cd7eccab26490 100644
--- a/drivers/phy/amlogic/phy-meson-g12a-usb2.c
+++ b/drivers/phy/amlogic/phy-meson-g12a-usb2.c
@@ -66,7 +66,7 @@
 #define PHY_CTRL_R14						0x38
 	#define PHY_CTRL_R14_I_RDP_EN				BIT(0)
 	#define PHY_CTRL_R14_I_RPU_SW1_EN			BIT(1)
-	#define PHY_CTRL_R14_I_RPU_SW2_EN			GENMASK(2, 3)
+	#define PHY_CTRL_R14_I_RPU_SW2_EN			GENMASK(3, 2)
 	#define PHY_CTRL_R14_PG_RSTN				BIT(4)
 	#define PHY_CTRL_R14_I_C2L_DATA_16_8			BIT(5)
 	#define PHY_CTRL_R14_I_C2L_ASSERT_SINGLE_EN_ZERO	BIT(6)
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
