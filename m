Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF43CA5FCB
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Sep 2026 16:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EkT81adr2QBUcv5usvsgIVDCvzkJ2F8tY3lGML4TyEA=; b=qP0E43muAIpCcu
	8b05cS5zwnL0ZjGdbAtS+V2IxUo33g80P8WZwWcdlPWiRdpCxftpyRWOR1CBFSxHLAJpYDI79T1AC
	MoI90oY9mGE7vWTMf3tecL2R4exexseJMCJZG3NE5OB5nrcKJLV2oCfTNg5zK92z9QqtAiEjQRBC4
	qAOwLyCW6Ud7uQfVoj7Y9pvy+kJ5ayLalujkvVr2EbEeMnzk8aYNK7lGJns0dogcXNSO6PueFuXDV
	SETtN8ZA9bD2PJZIu+BdKAsblJbwJRa80qPR3Vf38X+oRXgjJO4MSq70Jk1YzAfekxu63BNnf6pLS
	1kQjxv2qaRbuq94s0Bug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxXc-00000006kXG-1txy;
	Wed, 30 Sep 2026 16:52:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBxXY-00000006kWZ-0z4I;
	Wed, 30 Sep 2026 16:52:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9EA9E602CA;
	Wed, 30 Sep 2026 16:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C155C4AF12;
	Wed, 30 Sep 2026 16:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790787139;
	bh=7bGe7WD2c1d/kXJJCVb560ERTWE0b/SFleUWw96jKiw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WasMsC6lC+2LSHE7JasyQCI0+xrsU0h/HKM4OZp7Gf3xeC0micTbXkvJOJjpLquej
	 5eMD76CFuRTeiu/xFwBTVnVm6ekc03zB0Llfrnuz6B6426jD/VkiqedQNx8qmOxcYO
	 6oTh3pcpeAS+yxoUbeTCRwXT0v9uzBVTRHWR58CFA/j/QhZCD8BzHhGuNghzyeIq9c
	 ta8gzmdKs6a9vum3DOS9AS39QchO06KqqMlsw5L5KOfkrCSz9ag0m7CyLkv70l/J02
	 uUqE/OEEiHf2xIUa/g8LQnEM9uy2OmyxToEYhm+J6IZVHCUwS9NSY7pCOF+wKc3v+w
	 uQTu1JeLwrKUg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AAD4CA5FC4;
	Wed, 30 Sep 2026 16:52:19 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Wed, 30 Sep 2026 16:52:14 +0000
Subject: [PATCH 1/2] arm64: dts: amlogic: meson-sm1-odroid-hc4: mux the SPI
 NOR HOLD# and WP# pins
MIME-Version: 1.0
Message-Id: <20260930-hc4-spi-nor-v1-1-9a3351e2984e@iav.lv>
References: <20260930-hc4-spi-nor-v1-0-9a3351e2984e@iav.lv>
In-Reply-To: <20260930-hc4-spi-nor-v1-0-9a3351e2984e@iav.lv>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1637; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=R8D2qAhBJWwSqWsnhy/mUQEbfBkFgY23nk2VBBtCEbk=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFl77RzlVLe+vHiscK+Rk1yE9gP+iQYOUqbny5YlnD5o9
 jFMRfFjRykLgxgXg6yYIsuEQxq3MpZc/evvYf4AZg4rE8gQBi5OAZhIWAbD/4pal4TPmxTyn1ny
 y6+Tblzzz7wkz7LAbeaEmksffY+4HmFkWCMocDpq1dE91UYaEat/ShZXGIm9vPTSVXaaofcZxj8
 zOAA=
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>, linux-amlogic@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Igor Velkov <iav@iav.lv>

The SPI NOR flash uses six lines, but nor_pins covers only four: data,
clock and chip select. Nothing claims HOLD# (BOOT_3) and WP# (BOOT_7),
so they keep the boot ROM setting. After a boot from SPI they are in
the nor function and the flash works. After a boot from SD with the
button under the board, they stay eMMC data lines pulled low, and
spi-nor reports "unrecognized JEDEC id bytes: 00 00 00 00 00 00".

Mux them in a board-local group. nor_pins is shared with boards that
use BOOT_0..7 for eMMC, and the HC4 has eMMC disabled.

Tested on ODROID-HC4: after a boot from SD past the SPI, the flash
probes as a 16 MiB mtd0 and reads back correctly.

Fixes: 7178f340e929 ("arm64: dts: meson-sm1-odroid-hc4: add spifc node to ODROID-HC4")
Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
index 3ece30a0a1ff..5ce76a1bfe02 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
@@ -124,9 +124,19 @@ &sd_emmc_c {
 	status = "disabled";
 };
 
+&periphs_pinctrl {
+	hc4_nor_hold_wp_pins: nor-hold-wp {
+		mux {
+			groups = "nor_hold", "nor_wp";
+			function = "nor";
+			bias-disable;
+		};
+	};
+};
+
 &spifc {
 	status = "okay";
-	pinctrl-0 = <&nor_pins>;
+	pinctrl-0 = <&nor_pins>, <&hc4_nor_hold_wp_pins>;
 	pinctrl-names = "default";
 
 	flash@0 {

-- 
2.43.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
