Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B46ECA9ED0
	for <linux-amlogic@archiver.kernel.org>; Sun, 11 Oct 2026 17:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6TzwkBgbhja3cuy31dYhl0QanHOVQIlKh3ybSjssxw=; b=j2tyykYw9tf3K6
	ej3JWgV5B7W3w0oCNYCrNWUb2QSPQk6MhhiDx53jSF7rmgcFrx3M8YUrMnRsoqaWnlyGgsTl2F1hz
	v8VAxBZDlj0Z0LW+GtzRO+CmRilqCtUkH8GTrCiuOs2xWk1nTYlBI8bZZKJNaAN1VCWbfWQwPT2fT
	5RpO8r+q7dobQllGHj43F5g+oLvsxPHEY40XKBq4WNbec2vgXsJZJS7K3h0SbZfhRZlcbIio+GE5i
	lPb0F3gVujf9W5z8ydzwwJMpsvhqs7B0IZu1Ec+gb+UZGa9fig2K/W6k5bG2iaZSdGQgXMENu/OhV
	YBxLK1PzlrFoJcz5st4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFxAr-00000009FG8-3epp;
	Sun, 11 Oct 2026 17:17:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFxAq-00000009FFX-2RuA;
	Sun, 11 Oct 2026 17:17:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 804E16022C;
	Sun, 11 Oct 2026 17:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC8ADC2BCFD;
	Sun, 11 Oct 2026 17:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791739042;
	bh=JMjVtMuhkqAXxXbMMWX7PhhLtkEr322l/UDHApXDSCo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CxZa1T1m/e5Qmj5OAs0jjM7ikLlVNPmVBWVuVyCv9i6/rti0mfR7cZ3Urs1TsaktQ
	 3dajAV61PMN3qJ5xw00hIBQReVoyuA8u51zyjWfDnxRlrOPrIShsWx7h6YIJhbkVrw
	 TvMxs0+vqoaovIK08t+1JO1Or/eG29wlJTNMMT/ZZSEnEwWQGGwaa20JADG4ItwMgH
	 R2ffs9n0wg4Vh/vmLXxcsNfJJhk6XVCLbK8P+cSIoNPqMZhPgNxRdbjdf5XYhiL4GZ
	 OuCOssCNt22Hxv2YYjCcIRYcjfMFUuFEgpTqiqyBBPl6PFPVSgebDfd1l6UnZy1Gvz
	 Hzu2J0cc6oknQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD7E1CA9ED0;
	Sun, 11 Oct 2026 17:17:21 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Sun, 11 Oct 2026 20:17:22 +0300
Subject: [PATCH 2/2] arm64: dts: meson-gxbb-odroidc2: use color and
 function for the status LED
MIME-Version: 1.0
Message-Id: <20261011-odroidc2-dts-v1-2-f9f0e779af88@gmail.com>
References: <20261011-odroidc2-dts-v1-0-f9f0e779af88@gmail.com>
In-Reply-To: <20261011-odroidc2-dts-v1-0-f9f0e779af88@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791739040; l=1222;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=/X8gBi1JgR7x/35zsuv/f2r5evaENU8kz27T1XRV5c4=;
 b=ifRRKlIhKdzl/MOSg5AU5UAIBcV15SVmr7R7gl2lmCLrchc7kLLnZOKbgHL/YqIpNU+r37HAk
 MtCI9Mx7cZ5BuAcGL9sZRXhqAasl1ush8+pyf4HsIVFvMgv3PxAz9U0
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
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
Reply-To: filipp.dunsky@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Fil Dunsky <filipp.dunsky@gmail.com>

Replace the legacy label on the blue status LED with the standard
color and function properties, following what the other Amlogic boards
already do.  The LED then shows up with a generic blue:status name
instead of the board-specific c2:blue:alive.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 639b97ad5..5f0cd2a71 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -9,6 +9,7 @@
 
 #include "meson-gxbb.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/sound/meson-aiu.h>
 
 / {
@@ -51,7 +52,8 @@ usb_otg_pwr: regulator-usb-pwrs {
 	leds {
 		compatible = "gpio-leds";
 		led-blue {
-			label = "c2:blue:alive";
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_STATUS;
 			gpios = <&gpio_ao GPIOAO_13 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "heartbeat";
 			default-state = "off";

-- 
2.53.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
