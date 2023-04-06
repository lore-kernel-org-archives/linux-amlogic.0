Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE1AC7618D
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Apr 2023 20:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xiHyOVIykKgN7+rs/T5DHGgCQqRB5R7IXPyq04nIqd4=; b=sIVwEUjutBqG+G
	asYOXF8ZfpCU1nAQrAfDK5DnDsQPYnQRY9Q9xeR59Cv7C06/zGURHdpx5eTGckqcW60Me+/3EgKok
	LDSQhnANrMVAmhBRLaiN4Z0KV3hu/xclO5D1iAaO3WBWpTUEZRKjIfXevozhx+cMabABirwbpy1zC
	gZphQPfqkp67UaS0qLXuw6UPjeQI8oWUSH7GbbShnYx3wq5emvZX/knWxzH/uNrqgfHchLLPhOtBh
	0uyhPc+JwRBvb0xGHewAk5yHCxMRP3Znn/UkfOZlNeSJIvwpGXzQiS3QnBMeq16he6hyXAZm+KOHV
	QUKmFumz6hfbzmA0T3cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkVsI-008SQI-2P;
	Thu, 06 Apr 2023 20:06:26 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkVsF-008SPI-0u;
	Thu, 06 Apr 2023 20:06:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1680811577; i=hfdevel@gmx.net;
	bh=67pFJdfqDYYvQBqDd/g8dxqcjx/f2Mnl6F5+9ZBNfIs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=KMPl9gQxCIlie0kF4Jeod5kaBGlVS91Nl0uVxP1B1mTYl9SVhm7G9I94es6xxt55j
	 tewi+7SmHpCpwvxEjtXiwwn3B0UUrs/vUo6gVGYGelz+vUyZ4Iaa9BbJuqs/fyLJg1
	 uSyUIIfIyKbEHZPaiGqmLcO8y41acsHjtnprkGaXtn0NFXK1KwHP/2MSqOuX21k7+N
	 dxg+I9veaO+dNFZo4VZ4MvVUYGNowTmjtZIogTe9Ew2ta81susf7JJiXN0zUq17rKA
	 hZhHABEEJeicE4uiaialVtlpp3HqLhPEKkQjzgrHyjO0E+ZPe6cUTGp+xlVfasdrDW
	 mmgJkhdkmdxuA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [77.33.175.73] ([77.33.175.73]) by web-mail.gmx.net
 (3c-app-gmx-bap69.server.lan [172.19.172.69]) (via HTTP); Thu, 6 Apr 2023
 22:06:17 +0200
MIME-Version: 1.0
Message-ID: <trinity-76c5c0b4-a6f7-4679-a1ef-74e745649355-1680811577008@3c-app-gmx-bap69>
From: hfdevel@gmx.net
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] [RESEND] ARM: dts: meson8b: correct uart_B and uart_C clock
 references
Date: Thu, 6 Apr 2023 22:06:17 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:a51ftcmkLmRTtxhKSYJ3QixxCEl3MdhJIa+kXPujRNJiQoHHsMFRQ0pdZ4ArBUwRfqLUy
 BgQteuF7/dWbrOM4lOe/SmXQJ4s5ealx+JXyU4JsiuS+CSi8IkZX+znjKOpynNErfYFExunP7VDx
 PhAbTtyGDEQbXEM2qhPsgpLsYdZbfjjXQAlAalEMjeUBonbjR8m4bLg/s4DvafY/f/HBw1pomSH4
 MMi1qQmzNxdFK4XL/x7KgmTiSM2vLJQ8w9vvSKp4+IS3hPvK0IzoiDkrEJ3Zr/eB9sJemFR5XtvJ
 Q4=
UI-OutboundReport: notjunk:1;M01:P0:hezBSe3RdSw=;vFFS5p7owHpyUbL9jwv/mwW2NaV
 +IOJWekYhxHN7eAa5xWdjrn6zvRKrMci4vpjv5s19rSJ6hgV6uq4xwa703rMsRFFgjeiZQW26
 PmMX05NlkJDQV/WNIB8ZI9HHSGx1qn4WjpFWiIOcQdGE6u9jsp8lJ54PNeaYCLrHTmzReAtNY
 oR8tKz8gE2w1V1RrYnZYO9e2WiL3N/AuavKMu817sLKhXkrFZZ7a5eFNZ9FilVQ5EBmhOJKhz
 0tJJMF1hfp/nRBushqpprlWZKg9df+585Dj6/xg21kQ4bjx+qELnSgfFV0qlaK0U8z55CzZbl
 P6g0nLyD0iNXBvdV2I5DkUqshB18B7Atqo62vfQQkvthGj9XOIBCmo1qzUT8GgIU3ow/NOLDi
 TKfK0yskBkdB6KWG16LuYFbLGtRE7marYkx3GnQMtOW2I62pum1sOOc+Wg9mxhAclEY1Upb/e
 8xM4DL8UOuIHcF6cR6EKnXw6JJS1s9zXwtyJm2qfi691LIp486dtrF5BUmdQI/o9y84a4cocL
 7q6E53D15aBgQSpSQ0oP9TSQDjz3xAAWqoKSCj/ohB+WRp2BpFKiCWlm7ixDVCLSLxYxMBA3i
 4o0/hR+l7ff+ZMVMPDWZmlhXtMarFjax2l3Vkwwy7zy2KzLIGok6IVPTpk/0CqkbYACYMziQA
 G5yuW7teleXiAh0QY8IhpUg0+Vs6mO4etppIeGHAuTQ1E31dnWkIryByGHNdnHUNTb7yRKunu
 0iOH2OSXHaCuWvIYLRg4p4Ak8f50dlMMOZl5R1qFuJV3U3KVRC10LqrWo0merhw1943/pi+A+
 XuL0s8FrTsx754dSNvAkHiUg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_130623_630366_C9F69D4A 
X-CRM114-Status: GOOD (  11.81  )
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

Resending this patch with proper subject line, corrected distribution and reference to what the patch fixes. Thanks, Neil and Martin, for your guidance!

commit b3b6a88d2347d2ec9075603920e616836cb46750
Author: Hans-Frieder Vogt <hfdevel@gmx.net>
Date:   Thu Apr 6 10:21:49 2023 +0200

    [PATCH] correct uart_B and uart_C clock references for meson8b

with the current device tree for meson8b, uarts B (e.g. available on pins 8/10 on Odroid-C1) and C (pins 3/5 on Odroid-C1) do not work, because they are relying on incorrect clocks.
This trivial patch changes the references of pclk to the correct CLKID, which allows to use the two uarts.

Fixes: 3375aa77135f ("ARM: dts: meson8b: Fix the UART device-tree schema validation")

Signed-off-by: Hans-Frieder Vogt <hfdevel@gmx.net>
---
 meson8b.dtsi |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index d5a3fe21e8e7..25f7c985f9ea 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -740,13 +740,13 @@ &uart_A {

 &uart_B {
 	compatible = "amlogic,meson8b-uart";
-	clocks = <&xtal>, <&clkc CLKID_UART0>, <&clkc CLKID_CLK81>;
+	clocks = <&xtal>, <&clkc CLKID_UART1>, <&clkc CLKID_CLK81>;
 	clock-names = "xtal", "pclk", "baud";
 };

 &uart_C {
 	compatible = "amlogic,meson8b-uart";
-	clocks = <&xtal>, <&clkc CLKID_UART0>, <&clkc CLKID_CLK81>;
+	clocks = <&xtal>, <&clkc CLKID_UART2>, <&clkc CLKID_CLK81>;
 	clock-names = "xtal", "pclk", "baud";
 };

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
