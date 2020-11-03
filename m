Return-Path: <SRS0=c+5b=EJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2347EC00A89
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2020 01:19:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6950223C7
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2020 01:19:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FbVt254O";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jnyqnucb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6950223C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U7v9RBCIzDwX0Beb0GY+16ADDyGHJv9Ha33t/fFtz5s=; b=FbVt254OSpWsuwWX+0T7F1V0q
	KaYadoQ8LBDqkPpXfNRSWh7Ubd+Bnn9uznPZCXRp1AS0zbKr/twGLurSm3lW6lOWL9AYkR6QYQkxP
	7XtmUFR8Xq686cHNb1uh0wzK/CBPQj2+gquNhkT3Gy/egGK+yzCeYyVoaK2RKv9QitNHv5wBTqH7U
	P3LByu1YYEhpyBW6ri1FhURJpkpl7+J/C5mGTPlU7/NQRLF7HY3D9ZqlQTYB/gygby1HrZX0m1Sz5
	2rAREuCv3eeei8Leh8791rDnYk25OQ5X9Vdy12xy3U6XLLOZJCSm1ZAVclmtViUFzpeYvoe1yKJ3b
	HPbJkIXNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZkyH-0004mj-J5; Tue, 03 Nov 2020 01:18:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZkyD-0004kJ-PI; Tue, 03 Nov 2020 01:18:46 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D00172225E;
 Tue,  3 Nov 2020 01:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604366323;
 bh=ufnCn5RcP8PdtdrwfwNETodaRmphY7fcRIuGG0GD0BE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JnyqnucbasnBROvXC/ewLvBCm7rkjhztyzCT46VCsDa5uXX02e7TRZni6Xb8ks/gd
 5X/CBm8qUpnBhd2uGcaC8BchHTiTZycdzT9noSbitN+IwCKnPTUe7R3nRHOBoT395s
 6MJ6NZ1us/zPm/UjS483QpAHbmgDdppA3CQMWO8E=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 02/35] arm64: dts: meson-axg: add USB nodes
Date: Mon,  2 Nov 2020 20:18:07 -0500
Message-Id: <20201103011840.182814-2-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201103011840.182814-1-sashal@kernel.org>
References: <20201103011840.182814-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_201846_005214_1DB811E0 
X-CRM114-Status: GOOD (  11.97  )
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
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Neil Armstrong <narmstrong@baylibre.com>

[ Upstream commit 1b208bab34dc3f4ef8f408105017d4a7b72b2a2f ]

This adds the USB Glue node, with the USB2 & USB3 controllers along the single
USB2 PHY node.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index b9efc8469265d..fae48efae83e9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -171,6 +171,46 @@ soc {
 		#size-cells = <2>;
 		ranges;
 
+		usb: usb@ffe09080 {
+			compatible = "amlogic,meson-axg-usb-ctrl";
+			reg = <0x0 0xffe09080 0x0 0x20>;
+			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&clkc CLKID_USB>, <&clkc CLKID_USB1_DDR_BRIDGE>;
+			clock-names = "usb_ctrl", "ddr";
+			resets = <&reset RESET_USB_OTG>;
+
+			dr_mode = "otg";
+
+			phys = <&usb2_phy1>;
+			phy-names = "usb2-phy1";
+
+			dwc2: usb@ff400000 {
+				compatible = "amlogic,meson-g12a-usb", "snps,dwc2";
+				reg = <0x0 0xff400000 0x0 0x40000>;
+				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clkc CLKID_USB1>;
+				clock-names = "otg";
+				phys = <&usb2_phy1>;
+				dr_mode = "peripheral";
+				g-rx-fifo-size = <192>;
+				g-np-tx-fifo-size = <128>;
+				g-tx-fifo-size = <128 128 16 16 16>;
+			};
+
+			dwc3: usb@ff500000 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0xff500000 0x0 0x100000>;
+				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+				dr_mode = "host";
+				maximum-speed = "high-speed";
+				snps,dis_u2_susphy_quirk;
+			};
+		};
+
 		ethmac: ethernet@ff3f0000 {
 			compatible = "amlogic,meson-axg-dwmac",
 				     "snps,dwmac-3.70a",
@@ -1734,6 +1774,16 @@ sd_emmc_c: mmc@7000 {
 				clock-names = "core", "clkin0", "clkin1";
 				resets = <&reset RESET_SD_EMMC_C>;
 			};
+
+			usb2_phy1: phy@9020 {
+				compatible = "amlogic,meson-gxl-usb2-phy";
+				#phy-cells = <0>;
+				reg = <0x0 0x9020 0x0 0x20>;
+				clocks = <&clkc CLKID_USB>;
+				clock-names = "phy";
+				resets = <&reset RESET_USB_OTG>;
+				reset-names = "phy";
+			};
 		};
 
 		sram: sram@fffc0000 {
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
