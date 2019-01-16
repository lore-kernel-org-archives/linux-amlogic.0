Return-Path: <SRS0=5vFS=PY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92FF3C43387
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 16:52:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62472205C9
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jan 2019 16:52:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ejRdrNDx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xtzWHJB5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62472205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aG2bKh9kzZ3cEXEr+X83lkspDX7gLNpnMKHNT21HdH4=; b=ejRdrNDx+dx5QS
	R0I/p2pYqNZ1kmS+O5otAQswlTV0BCb3BqvEdM7CxV95jxWegJfF6CYC/uiRyLqLsWzBQeYAXt1RS
	dXVM/CAStQ3zFDdFyOckQG86IWCYkq2hbg3bxGUcqXWIt2/Lwq6SofdsPzT7gTOu/hScT7xiocv2E
	3Ry0P06fqH1r/po9eNtgo3NHJa7erlZ7/q5PdUjdImhS7qPAkCfycsF9YhEw+IN7PqvJF3pTFin5a
	cZfQ5lzxAIeuLYa8rdtQrTwk4NfI4sPOJcqw+uL6BDDh6E5EGE+5iabnVNpDV8AhBJO7q217+abGD
	G71J6DZXbNfwGStsC13A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjoQu-0001pw-7Y; Wed, 16 Jan 2019 16:52:52 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gjoQr-0001pS-Tp
 for linux-amlogic@lists.infradead.org; Wed, 16 Jan 2019 16:52:51 +0000
Received: by mail-wr1-x444.google.com with SMTP id x10so7702602wrs.8
 for <linux-amlogic@lists.infradead.org>; Wed, 16 Jan 2019 08:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dUNj70748HNnwQMeBYqdWeK5DbMKqYQpIgSDSRP1d7Y=;
 b=xtzWHJB5UEMKRrAmCfxZB/aeiqtD9KVgCKGMg2KnAYSp7ooLd3kQROL/ZMpcKcSiZx
 JoIf5TUz4ls8RjN4RTKRB6fCzg8XIgF2Ibg9FUcADrm5g9MVhn+txknwXWhPA8NARNFD
 wi1/4NjHP2VS4QrYXKgBzDIlJ/DYDhwRC9bFxPk8YhCck6z+QvinmJ2+v+TBnJXPROdy
 SChfcT9vGDA448hadUOEMc+khus9pFpdDC+XJOpR8oSoNO3yjLEGOySlqpEOs31SXUUo
 VJZAguJKxDTpJLgKMgc+sphN1DjOknhs5bw4pRcRQI0JhAKEgcKiuU++fodpQCPfMm0K
 ZRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dUNj70748HNnwQMeBYqdWeK5DbMKqYQpIgSDSRP1d7Y=;
 b=bGch1u8/F39nfHa+Y/BQrT4hBfPUl24g/4u5ObtSCpIoroZxAsZpVlLcDxCSopIOtv
 Vz3YgTyO1yVS2ZPigWOwUC6EohZjWDMQNVQgFv3WE5j7ykxuCgnR3m78lkxTyc0OGKpk
 8boKFW8V37mnKr3sCj7mvgqwp8NitXy9iYZzpDJiqYABa7aFMHqihMA02jgOjFHNgykr
 TqY5TWu4yMoLEkRPTbR7bqyxLmbaE04yGykeUuEslZBN0LCMUYVR4tANtnh7aUCMtfXG
 lim8cETnx9kGOd2HqfHcSFhHp/0OpGtTntV93vkxejKbkctDsdL3IDS0Iagt/ekHGYPo
 oMzQ==
X-Gm-Message-State: AJcUukd63SclAKJXLkZPWKO2mw/PyKnZgr5iTzAxEkoXBMY5M1Nuukkg
 ZRImsKRe3AsZkpjC1AZO7uluLg==
X-Google-Smtp-Source: ALg8bN7IbKDsp3ZjcRkHs764YhGfJVPFUnU/1pmi+L+5c+9IULukCrCrYcplvURcQAIqMDS+Kd8SxQ==
X-Received: by 2002:adf:e284:: with SMTP id v4mr8067611wri.26.1547657568223;
 Wed, 16 Jan 2019 08:52:48 -0800 (PST)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id a132sm46318997wmh.5.2019.01.16.08.52.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Jan 2019 08:52:47 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] arm64: dts: meson: fix g12a buses
Date: Wed, 16 Jan 2019 17:52:36 +0100
Message-Id: <20190116165236.8330-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190116_085249_963521_3C457717 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

periph and hiu bus addresses/size are wrong.
cbus, aobus and apb just don't exist in the memory map so remove them.

Fixes: 9c8c52f7cb4f ("arm64: dts: meson-g12a: add initial g12a s905d2 SoC DT support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 70 +++++++--------------
 1 file changed, 24 insertions(+), 46 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 3b82a975c663..2aea5ba62fee 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -78,46 +78,40 @@
 		#size-cells = <2>;
 		ranges;
 
-		periphs: periphs@ff634000 {
+		periphs: bus@ff634400 {
 			compatible = "simple-bus";
-			reg = <0x0 0xff634000 0x0 0x2000>;
+			reg = <0x0 0xff634400 0x0 0x400>;
 			#address-cells = <2>;
 			#size-cells = <2>;
-			ranges = <0x0 0x0 0x0 0xff634000 0x0 0x2000>;
+			ranges = <0x0 0x0 0x0 0xff634400 0x0 0x400>;
 		};
 
-		hiubus: bus@ff63c000 {
+		hiu: bus@ff63c000 {
 			compatible = "simple-bus";
-			reg = <0x0 0xff63c000 0x0 0x1c00>;
+			reg = <0x0 0xff63c000 0x0 0x1400>;
 			#address-cells = <2>;
 			#size-cells = <2>;
-			ranges = <0x0 0x0 0x0 0xff63c000 0x0 0x1c00>;
+			ranges = <0x0 0x0 0x0 0xff63c000 0x0 0x1400>;
 		};
 
-		aobus: bus@ff800000 {
-			compatible = "simple-bus";
-			reg = <0x0 0xff800000 0x0 0x100000>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges = <0x0 0x0 0x0 0xff800000 0x0 0x100000>;
-
-			uart_AO: serial@3000 {
-				compatible = "amlogic,meson-gx-uart", "amlogic,meson-ao-uart";
-				reg = <0x0 0x3000 0x0 0x18>;
-				interrupts = <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
-				clocks = <&xtal>, <&xtal>, <&xtal>;
-				clock-names = "xtal", "pclk", "baud";
-				status = "disabled";
-			};
-
-			uart_AO_B: serial@4000 {
-				compatible = "amlogic,meson-gx-uart", "amlogic,meson-ao-uart";
-				reg = <0x0 0x4000 0x0 0x18>;
-				interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>;
-				clocks = <&xtal>, <&xtal>, <&xtal>;
-				clock-names = "xtal", "pclk", "baud";
-				status = "disabled";
-			};
+		uart_AO: serial@ff803000 {
+			compatible = "amlogic,meson-gx-uart",
+				     "amlogic,meson-ao-uart";
+			reg = <0x0 0xff803000 0x0 0x18>;
+			interrupts = <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&xtal>, <&xtal>, <&xtal>;
+			clock-names = "xtal", "pclk", "baud";
+			status = "disabled";
+		};
+
+		uart_AO_B: serial@ff804000 {
+			compatible = "amlogic,meson-gx-uart",
+				     "amlogic,meson-ao-uart";
+			reg = <0x0 0xff804000 0x0 0x18>;
+			interrupts = <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&xtal>, <&xtal>, <&xtal>;
+			clock-names = "xtal", "pclk", "baud";
+			status = "disabled";
 		};
 
 		gic: interrupt-controller@ffc01000 {
@@ -132,22 +126,6 @@
 			#interrupt-cells = <3>;
 			#address-cells = <0>;
 		};
-
-		cbus: bus@ffd00000 {
-			compatible = "simple-bus";
-			reg = <0x0 0xffd00000 0x0 0x25000>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges = <0x0 0x0 0x0 0xffd00000 0x0 0x25000>;
-		};
-
-		apb: apb@ffe00000 {
-			compatible = "simple-bus";
-			reg = <0x0 0xffe00000 0x0 0x200000>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges = <0x0 0x0 0x0 0xffe00000 0x0 0x200000>;
-		};
 	};
 
 	timer {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
