Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1582C25B78
	for <linux-amlogic@archiver.kernel.org>; Tue, 28 May 2024 13:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9V2OzFFT5aMw4kbmvH7k5/iN/pKoatLCJleKeMuZyGk=; b=JQzw3kGERijTWw
	0QBII4vgZrPe1RHPsvd54NotOWFOAoUqaFNcCOC8OIBZiLS6yhNEhWPBgXgFIMgzaxldijQ3Qfv18
	jzpwJlkxLN63S8N8BFqT4wyWifd1o71IOZNPoHx2r8n49OAW3pB2yy86Gz/x3tiydiYl+X3pbOff7
	fs7H3KD4/+Qp/Z2yG/345TcE2HDCspuNAfuZe1bcjLZ+OEy0/6aMBtigpA+0dIXm2ngELZcB2+naQ
	vOtf1LaIkhx+g220wJKxCBS4M0GI2VLmnDgbZp+BKMHR4/J83WG9243940lTVKlQN1FmB0x3ngR0o
	xCE5MAEkbapeokH3RWuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBwwF-00000000oO7-3skW;
	Tue, 28 May 2024 13:32:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBwwB-00000000oMt-43jb;
	Tue, 28 May 2024 13:32:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 816C4620B9;
	Tue, 28 May 2024 13:32:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BC05C32782;
	Tue, 28 May 2024 13:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716903143;
	bh=ct9g6aL365D3+hInh1Gk/WqHw7JZf/efL1FKIUE7YWs=;
	h=From:To:Cc:Subject:Date:From;
	b=XJcfJq+T4o5G6EHYfseBLctsXxdk7SSpPxJtfFNMYmPfcbJeYkP5elcEBSsm82qMl
	 ujzsjfAMuoxivWv5xW+wy/rKlKtDGY4EL3B8inoBnbcqtbZjH+zBik4toSlSglIQxL
	 kwJqHgWm4H1TLBq7VlSkxfo3gI4JlDt3HBhb5rKucBt2TYrXBP8s2pYq6FJP6AoMZJ
	 ZDNxoAkzNIwMWy9zkeRlDIC5rU3XL4EDQLWx18HwBUhrSU89DxOS5MMOwt+qc64jUs
	 JN5vI56LPQKK8P/AuHPgdOwyE+xM780R53jOVJBC6/BcdJTed5ARFcOjZoCxulu1xk
	 r+j603nExc4qw==
From: Arnd Bergmann <arnd@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Dmitry Rokosov <ddrokosov@salutedevices.com>,
	Igor Prusov <ivprusov@salutedevices.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: amlogic: ad402: move thermal-zones to top node
Date: Tue, 28 May 2024 15:31:59 +0200
Message-Id: <20240528133215.2266419-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_063224_074571_2BDD7567 
X-CRM114-Status: UNSURE (   9.56  )
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

From: Arnd Bergmann <arnd@arndb.de>

It appears that this accidentally got added into the spi node, causing
a warning.

arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts:119.16-161.4: Warning (spi_bus_reg): /soc/spi@fd000400/thermal-zones: missing or empty reg property

Fixes: 593ab951232b ("arm64: dts: amlogic: ad402: setup thermal-zones")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../arm64/boot/dts/amlogic/meson-a1-ad402.dts | 62 +++++++++----------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts b/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts
index c8579b6e67cf..6883471a93b4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts
@@ -84,37 +84,6 @@ vddio_1v8: regulator-vddio-1v8 {
 		vin-supply = <&vddao_3v3>;
 		regulator-always-on;
 	};
-};
-
-/* Bluetooth HCI H4 */
-&uart_AO {
-	status = "okay";
-	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
-	pinctrl-names = "default";
-};
-
-&uart_AO_B {
-	status = "okay";
-};
-
-&saradc {
-	status = "okay";
-	vref-supply = <&vddio_1v8>;
-};
-
-&spifc {
-	status = "okay";
-	pinctrl-0 = <&spifc_pins>;
-	pinctrl-names = "default";
-
-	flash@0 {
-		compatible = "spi-nand";
-		status = "okay";
-		reg = <0>;
-		spi-max-frequency = <96000000>;
-		spi-tx-bus-width = <4>;
-		spi-rx-bus-width = <4>;
-	};
 
 	thermal-zones {
 		soc_thermal: soc_thermal {
@@ -161,6 +130,37 @@ map1 {
 	};
 };
 
+/* Bluetooth HCI H4 */
+&uart_AO {
+	status = "okay";
+	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
+	pinctrl-names = "default";
+};
+
+&uart_AO_B {
+	status = "okay";
+};
+
+&saradc {
+	status = "okay";
+	vref-supply = <&vddio_1v8>;
+};
+
+&spifc {
+	status = "okay";
+	pinctrl-0 = <&spifc_pins>;
+	pinctrl-names = "default";
+
+	flash@0 {
+		compatible = "spi-nand";
+		status = "okay";
+		reg = <0>;
+		spi-max-frequency = <96000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
 &usb2_phy1 {
 	phy-supply = <&vcc_3v3>;
 };
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
