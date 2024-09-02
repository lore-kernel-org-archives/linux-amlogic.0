Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844B2CD13CF
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Sep 2024 05:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QQ9ROQAopoSLkkuJ0eP+QN9WLqlEXj15PBqPGo9atVg=; b=CAZzicL8wlaMYt
	XyX8GLYCvW+7MlgxcLBm9CSwlzB3sXyOvffzQ4iYmJ1rxOUqCJlnvbdCa2PbitNJLdNNK5UTROKUU
	8H0qE2y22JZ+83l8Wj59tDYzqaaEPPNR54Xx4RKzA3cLtnCk3rr6zLd+w6KUF6AlAw3p/CfwDaIwk
	gBX4mBx6W+m6yD+Dr6d4+bFmngG3xb9NUgq76nmpLrgeLrOt84AvmWyL6XcfmhA4W07Vl6BgBTzH1
	lEVGUcRpeMIAjto9r+rMWL0+e1s3PNtcZdimAqNBUCNqOuyx84vIYzlCCHTtRRHnWKMDde8qct5/Q
	4IbwPPOsqC2tcgbviG0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skzdb-0000000D1cl-3jf6;
	Mon, 02 Sep 2024 05:30:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skzdG-0000000D1Vh-2n9K;
	Mon, 02 Sep 2024 05:29:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1DCBD5C5702;
	Mon,  2 Sep 2024 05:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27179C4CEC2;
	Mon,  2 Sep 2024 05:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725254981;
	bh=HiB1pHFfUI4P2CUYJCGF3+be/QQQUfYSofVQKfy81l8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=lG6eFj7e9SSO2nGNINyGRUMnxLhtcChHHwaELx6/J/SyJmVePQsMPxwyF/WL9hYkh
	 mkMCvl9g4oIFmv0RkM+WxoqLsdgJqu/JN+muvKWJFWF6UwVE18+X+WWWrT0gHbDpwf
	 3VyiRe6Tbo0TRF9WDL8YKJx6yK8Ie4vyMEHZBgau1LDw5sMqgI+EMBL7c03MPc5sWJ
	 KtoKqhNhV4A9F3mkYl8+XxDrYrK0MRAaivcWXe9oQwCYmT7ysp2hSSGeuvGjUs4jKH
	 SXeME1J0Uazn4dPAd1j8niqdhi3bodGhTssnsCWkjaBC5wVUfZxrq7lb52Cwxn++UF
	 5AMobgCkGd9oQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E5C7CD13CF;
	Mon,  2 Sep 2024 05:29:41 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 02 Sep 2024 13:29:39 +0800
Subject: [PATCH] arm64: dts: amlogic: c3: fix dtbcheck warning
MIME-Version: 1.0
Message-Id: <20240902-fix_warning-v1-1-037029c584fc@amlogic.com>
X-B4-Tracking: v=1; b=H4sIAEJN1WYC/x2MQQqAIBAAvyJ7TrA1xPpKRIitthcLhQrCvycdh
 2HmhUKZqcAkXsh0ceEjNeg7AX53KZLkrTGgwkGNCmXgZ71dTpyiNN4GbTB4qzW04szU9H+bl1o
 /1gYeY10AAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725254979; l=3537;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=3Plhy3KgHss93IzBZRmdUv/l5YYTAOs01NTzF3Jk9sU=;
 b=QAn+zi5Iwq0XYzO4SZDdR9VXLHnf+pXbKVAVhwHQzWrOcpmd15qb0eRPwUvzl4QKJkEMNKOGn
 UWeDZ3hvWTRCsSxy5sCcLPH1atZ5C/50llxtb0sXcFhaY+2iQUdAjAp
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240901_222942_847230_41BA2A09 
X-CRM114-Status: GOOD (  10.17  )
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Fix warning when use W=1 to build dtb, as following error:

arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi:65.7-76.4: Warning
(unit_address_vs_reg): /sram: node has a reg or ranges property,
but no unit name

arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi:168.34-413.6: Warning
(unit_address_vs_reg): /soc/bus@fe000000/pinctrl@4000: node has a
unit name, but no reg or ranges property

arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi:168.34-413.6: Warning
(simple_bus_reg): /soc/bus@fe000000/pinctrl@4000: missing or empty
reg/ranges property

arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409.dts:205.9-245.4:
Warning (avoid_unnecessary_addr_size): /soc/bus@fe000000/spi@56000
/nand@0: unnecessary #address-cells/#size-cells without "ranges",
"dma-ranges" or child "reg" property

Fixes: d4bd8f3023b6 ("arm64: dts: amlogic: add C3 AW419 board")
Fixes: 520b792e8317 ("arm64: dts: amlogic: add some device nodes for C3")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202409010005.A7tSzgEn-lkp@intel.com/
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Fix some warning when use W=1 to make dtb_check.
---
 arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409.dts |  2 --
 arch/arm64/boot/dts/amlogic/amlogic-c3-c308l-aw419.dts |  2 --
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi            | 10 +++++-----
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409.dts b/arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409.dts
index b8d2037afc00..a6736ad2a648 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409.dts
@@ -208,8 +208,6 @@ nand@0 {
 		spi-max-frequency = <83000000>;
 		spi-tx-bus-width = <4>;
 		spi-rx-bus-width = <4>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 		status = "disabled";
 
 		partitions {
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3-c308l-aw419.dts b/arch/arm64/boot/dts/amlogic/amlogic-c3-c308l-aw419.dts
index 4477a2659e27..45f8631f9feb 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3-c308l-aw419.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3-c308l-aw419.dts
@@ -208,8 +208,6 @@ nand@0 {
 		spi-max-frequency = <83000000>;
 		spi-tx-bus-width = <4>;
 		spi-rx-bus-width = <4>;
-		#address-cells = <1>;
-		#size-cells = <1>;
 		status = "disabled";
 
 		partitions {
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
index c0ce776ec463..d0cda759c25d 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
@@ -62,7 +62,7 @@ pwrc: power-controller {
 		};
 	};
 
-	sram {
+	sram@7f50e00 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x07f50e00 0x0 0x100>;
 		#address-cells = <1>;
@@ -169,11 +169,11 @@ periphs_pinctrl: pinctrl@4000 {
 				compatible = "amlogic,c3-periphs-pinctrl";
 				#address-cells = <2>;
 				#size-cells = <2>;
-				ranges;
+				ranges = <0x0 0x0 0x0 0x4000 0x0 0x02de>;
 
-				gpio: bank@4000 {
-					reg = <0x0 0x4000 0x0 0x004c>,
-					      <0x0 0x4100 0x0 0x01de>;
+				gpio: bank@0 {
+					reg = <0x0 0x0 0x0 0x004c>,
+					      <0x0 0x100 0x0 0x01de>;
 					reg-names = "mux", "gpio";
 					gpio-controller;
 					#gpio-cells = <2>;

---
base-commit: 1565ad6d5afc023cc4cc721513c9be28b902dee8
change-id: 20240902-fix_warning-6c8f362fc833

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
