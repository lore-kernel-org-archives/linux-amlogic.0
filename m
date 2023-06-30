Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908FDEB64DC
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jun 2023 12:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4DIlQY/s3oEn6T3e6ev/iKqNQtvWssGOw13gPM8TA8k=; b=i3eMLUDFDmdWSd
	jbK/Tl1zchhKoso3tETpfIfMCBQ+lvB4sBIBDeANOcesFd7AAEE30Htr0veQwzkLwsUYY0wQCB8JQ
	vbKcL1uTOmp4KeiixPesrx684/mqBEJYAp0SF6bMWyGNQE/VUCEQOuI72tLiQd30rNeB1UvVLcJOR
	pU99VkzX3TQZF2WFlSDG+6pXNfMmPcWGPWNDU+GfKHcXLNQ5dp4Z1mc4lCb3lFlISGDBz2I5mrHAy
	AqMhefvVxDN71RSWyAzv4WzVI6d+mOfPTzCWt9jkwr8gQ04yx/2txlUAQVJXssbIcPgWmeY2G/3Mf
	bzdR6CsZ378aL9cDWghQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFCyS-003ffI-0r;
	Fri, 30 Jun 2023 12:11:40 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFCyA-003fZG-2W;
	Fri, 30 Jun 2023 12:11:23 +0000
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Fri, 30 Jun 2023
 20:11:11 +0800
From: zelong dong <zelong.dong@amlogic.com>
To: <narmstrong@baylibre.com>, <p.zabel@pengutronix.de>,
	<khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <jbrunet@baylibre.com>,
	<devicetree@vger.kernel.org>, <kelvin.zhang@amlogic.com>, Zelong Dong
	<zelong.dong@amlogic.com>
Subject: [PATCH 3/3] arm64: dts: meson: add reset controller for Meson-C3 SoC
Date: Fri, 30 Jun 2023 20:10:59 +0800
Message-ID: <20230630121059.28748-4-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230630121059.28748-1-zelong.dong@amlogic.com>
References: <20230630121059.28748-1-zelong.dong@amlogic.com>
MIME-Version: 1.0
X-Originating-IP: [10.28.11.69]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_051122_815595_E01A95A6 
X-CRM114-Status: UNSURE (   7.71  )
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

From: Zelong Dong <zelong.dong@amlogic.com>

Add the reset controller device of Meson-C3 SoC family

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index 60ad4f3eef9d..62684b7a684c 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/reset/amlogic,meson-c3-reset.h>
 
 / {
 	cpus {
@@ -82,6 +83,12 @@ uart_b: serial@7a000 {
 				clock-names = "xtal", "pclk", "baud";
 			};
 
+			reset: reset-controller@0x2000 {
+				compatible = "amlogic,meson-c3-reset";
+				reg = <0x0 0x2000 0x0 0x98>;
+				#reset-cells = <1>;
+			};
+
 		};
 	};
 };
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
