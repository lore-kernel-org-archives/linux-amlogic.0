Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E3BC7EE43
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jun 2023 20:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S1aln9TT68/2bdKcseXoJsHXfiskmA78Cu2TExWLX3o=; b=AvUTSYhjaGeIlK
	jF0o97dhLKr3tCpFikPuC9xSkXnNidG5DO9tI3Di94J6EaJx2hHGOsmd1SzUTXhRDWOvMyRkZ1arU
	xlDPKrR2t4jykLq6jfIk4tvDe6vRaXH6EsSe/iWgAjVYwBPdpc2sk56jBP1890/WXJ2RM0+ITg1O2
	hF8u9so+aG6Av/HMABqVEciiQb3BL5YClXaMUnHSjdRzs/nSTPtOXhEeeVQMJf4nEoaitn/GcsBBw
	UrxvJ1ZkXRtkTXFjW+9Y88NUYLRXFzYjXDNQE1jeUL2MRoM7Oe0cBmI4n+gJqQqXU7Gp7cQLCeOb9
	I+0ruh2zdiCxY7utNbVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zae-00751U-1X;
	Wed, 07 Jun 2023 20:17:08 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zaX-0074vF-0P;
	Wed, 07 Jun 2023 20:17:05 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 521065FD6E;
	Wed,  7 Jun 2023 23:16:51 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686169011;
	bh=RNbIjESD+IyeiwtGHiouI+gIk7LwD56yfGxWD9gzuYY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ety0yB4LR209Ia4Tpu08KUqoQQDhbQZ+t2TyoGNxGor2mgGlh5hOLVskd/puVaQKA
	 ItakKRYwyFkzq5qGb6H3nTb02RtnQmbRZzRcLmFaSt9hMznVqEz/6LGOBKct7xvofk
	 8/XlN9HqYakI2nqi49c0GsYg8hGwiHU4y0dfxYOsjt1Dl13YZKi9cf5r7dqzrte9XL
	 KSi3VXTGXfG662hLgeYiF8N0u4iIXx7mAdKRe1GGcoxMwaSx3zt+PwKoFd2CUUavar
	 XRsaLv5zTQZaw+O4Q2knvowWPxZ3lgio6xQbC8R8Dpk/vz68+lH4+bWu/Ol3+JWRH+
	 fFQ72fbQsvg1Q==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Wed,  7 Jun 2023 23:16:51 +0300 (MSK)
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>, <jbrunet@baylibre.com>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <conor+dt@kernel.org>
CC: <kernel@sberdevices.ru>, <sdfw_system_team@sberdevices.ru>,
	<rockosov@gmail.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>
Subject: [PATCH v1 1/6] arm64: dts: meson: a1: introduce PLL and Peripherals clk controllers
Date: Wed, 7 Jun 2023 23:16:36 +0300
Message-ID: <20230607201641.20982-2-ddrokosov@sberdevices.ru>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20230607201641.20982-1-ddrokosov@sberdevices.ru>
References: <20230607201641.20982-1-ddrokosov@sberdevices.ru>
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/07 16:55:00 #21454472
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_131701_540198_B1B04159 
X-CRM114-Status: GOOD (  10.97  )
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

This patch adds clkc and clkc_pll dts nodes to A1 SoC main dtsi.
The first one clk controller is responsible for all SoC peripherals
clocks excluding audio clocks. The second one clk controller is used by
A1 SoC PLLs. Actually, there are two different APB heads, so we have two
different drivers.

Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 26 +++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index eed96f262844..a24228808c9c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -6,6 +6,8 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/meson-a1-gpio.h>
+#include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
+#include <dt-bindings/clock/amlogic,a1-peripherals-clkc.h>
 
 / {
 	compatible = "amlogic,a1";
@@ -126,6 +128,30 @@ uart_AO_B: serial@2000 {
 				status = "disabled";
 			};
 
+			clkc_periphs: clock-controller@800 {
+				compatible = "amlogic,a1-peripherals-clkc";
+				reg = <0 0x800 0 0x104>;
+				#clock-cells = <1>;
+				clocks = <&clkc_pll CLKID_FCLK_DIV2>,
+					 <&clkc_pll CLKID_FCLK_DIV3>,
+					 <&clkc_pll CLKID_FCLK_DIV5>,
+					 <&clkc_pll CLKID_FCLK_DIV7>,
+					 <&clkc_pll CLKID_HIFI_PLL>,
+					 <&xtal>;
+				clock-names = "fclk_div2", "fclk_div3",
+					      "fclk_div5", "fclk_div7",
+					      "hifi_pll", "xtal";
+			};
+
+			clkc_pll: pll-clock-controller@7c80 {
+				compatible = "amlogic,a1-pll-clkc";
+				reg = <0 0x7c80 0 0x18c>;
+				#clock-cells = <1>;
+				clocks = <&clkc_periphs CLKID_FIXPLL_IN>,
+					 <&clkc_periphs CLKID_HIFIPLL_IN>;
+				clock-names = "fixpll_in", "hifipll_in";
+			};
+
 			gpio_intc: interrupt-controller@0440 {
 				compatible = "amlogic,meson-a1-gpio-intc",
 					     "amlogic,meson-gpio-intc";
-- 
2.36.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
