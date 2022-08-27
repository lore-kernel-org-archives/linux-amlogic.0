Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354BEECAAD5
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Aug 2022 20:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rFM1ilrW9Q+h6rNbg8wkVoT8/cGeK0YCBW/ow+JS9BM=; b=Ccog1AaSmYMi6v
	g04DHWhUuzog8+KyJ4auEEijvo1LSXAQHOWi3jq7eS+0RxTU9DReKpdL/GINkLnPz3Fgn2J4Z+uPW
	GN+hbPOkL4RBo07jWg5hlQuwpNxWl0wkpQrmct8oopIOw2sdiaUxCh/zAEUVHaB8Uy5C/QJjrLwuY
	3gBuXdJgGBgoav7fFzbfjrcx/+NtfUlys1byFgmsWy2cyXWAuriO0HjvQlKGmd/on8ImypaOUeMAu
	2QdAjxB/YewZq2823NmJggBbgEbC+fDEfQ84vEPOQgWIwuW/vefAMlDBLepAC5fduXO+q0k84uI/+
	dRfrjWx4mkRodPUzhZgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oS2a2-000hlI-Jk; Sat, 27 Aug 2022 20:38:58 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oS2Zk-000hSH-Ks; Sat, 27 Aug 2022 20:38:43 +0000
Received: from localhost.localdomain (unknown [IPv6:2804:14c:485:4b69:8e8d:6889:90be:7539])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 28B3584564;
	Sat, 27 Aug 2022 22:38:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1661632718;
	bh=3jpqEZWIZxWWYzNxXnnq/bI1NSuSKq6zzQlg3+n0Osg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h4h15ULqjyr8OCGzDK+m8DZIJKKRX5Avv+ED6D0zMb+vanB2nDcCMI8L99Fky1pLo
	 Al+ViM6zwzp1uF8J3m8g7xdYsooJmZCOFz66dsdS8T7/WKPCzkjB4TFJp1DCVc0MjQ
	 OT09ctCcr9T2N36tebvwrfKxsB9WjB/ggTNk5kw43Farr/Af4gAFzbl173yir2Nsn4
	 8jt8xaHImxdUfRKr0sazy7VKWdPnMH6bvI2/BQqPNOL6nfplq3F0vgPzI+6joR6sbu
	 4DUcG/0eCaUyzM2LzLBfwj9JVUlrtlVnvlQRwf36a2Fxg+zVNaA6eIeicH4AQvqTWt
	 FLX3Yk3b5+dcw==
From: Fabio Estevam <festevam@denx.de>
To: martin.blumenstingl@googlemail.com
Cc: linux-arm-kernel@lists.infradead.org,
	khilman@baylibre.com,
	linux-amlogic@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 2/2] arm64: dts: meson-sm1-sei610: Remove 'enable-active-low'
Date: Sat, 27 Aug 2022 17:38:13 -0300
Message-Id: <20220827203813.1742715-2-festevam@denx.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220827203813.1742715-1-festevam@denx.de>
References: <20220827203813.1742715-1-festevam@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220827_133841_744277_57AFC98B 
X-CRM114-Status: UNSURE (   7.24  )
X-CRM114-Notice: Please train this message.
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

The 'enable-active-low' property is not a valid one. 

Only 'enable-active-high' is valid, and when this property is absent
the gpio regulator will act as active low by default.

Remove the invalid 'enable-active-low' property.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Changes since v1:
- Put linux-amlogic on Cc and added Martin's Reviewed-by tag.

 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index 603337ca5608..9068a334ea57 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -171,7 +171,6 @@ vddao_3v3_t: regulator-vddao_3v3_t {
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&vddao_3v3>;
 		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
-		enable-active-low;
 		regulator-always-on;
 	};
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
