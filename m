Return-Path: <SRS0=BjI6=TK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F8BC04A6B
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 16:49:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCF45216C4
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 May 2019 16:49:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QPiqqTgw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0LCy7Hgi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCF45216C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nzmBq0a9Y3k4dlp7Akdxg3Qw3o6TT4F47DTKWQYd9XY=; b=QPiqqTgw2inKv9
	WWUl4kjQhqa71K1mzmSmG3I4ZMHfGhZ/T5HjYiPOaUuFcHBrr61Jal83iFEo/KrhBAPxif/FfdsIA
	nP3fKnS7ntEN+LuVbrIqzs62qzjW07VBgPQHwJr0g/9iatNNNmJQhszjnl+gEt8sWd2smb9TfZhi8
	eBMMo4axTx2Lga9sk5fAjPYAViYDYTSOkTejnM9+CA6c3BsjEPD7Eqr6haTzLYwoJuetgNgdbIf19
	RCmhcBUdDgPjZ3GiizOFLkPD51JMBVUwmdoR9GPMMPdF2+Of7Rz6m7FK4yf5r5Fc8hNgS+9tWERr0
	GItglYeuqHNoMPzM761g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hP8iY-0002Zm-JS; Fri, 10 May 2019 16:49:54 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hP8iU-0002TM-3l
 for linux-amlogic@lists.infradead.org; Fri, 10 May 2019 16:49:51 +0000
Received: by mail-wr1-x444.google.com with SMTP id c5so8632602wrs.11
 for <linux-amlogic@lists.infradead.org>; Fri, 10 May 2019 09:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TYrasecq3jc5SZnbZyshnJpWQT7LH8WGclGzzSNZ9tw=;
 b=0LCy7HgiRFhJTPdSqVAy9EaF9UxWwcbZZxT3Vz1z7I9GsqwZsM4JHbOS7Z45l98M0P
 EPpLkH3mrVYZVR2Xmw/wSjwMLF/kI5uPrrEp/WbaJaSoRtYsfkLgtVjh9/i+XZQa4QRJ
 PdkHnAJfTyQ3fwB87gIepiUqJV79rlCG+Ulu/+y1+rfI7HkP8GnzsUqZdAVmfTWYq96k
 nHTbLplyrmUQOjYLxjMcsAY6q3RVzoKUNRBPOIeyu+TKpA8O5pkjjBuemVzGiSWyRkMU
 0xZ2szPEf9UQk6UlGbaOC1edX02Siry30v/nPuCfOtOutFO5JM2tr+TLtw5q5ZKa1HzR
 9DJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TYrasecq3jc5SZnbZyshnJpWQT7LH8WGclGzzSNZ9tw=;
 b=aoBvDO++CKg3HZDOpfhSTEH6zxP5X3KUEEV6BBdbb6SX45q25Y+6W7hiGeVewS4FE8
 FEtzrXfQvljraJ1f5lD8yB9HxDKsWojyzaw1DWuRZ6VrhKV4qnY42rfX4r61VNukeN8N
 g8/bfTJ8lSC2HbxiHSPVN/6P9K2CtgUO1+OhSxvkFsC8EKeJoeA4DPAPO83e3Sej+jl5
 7kbpodnItVGUCgRe6Y0U+9TG0E2bMpsPSpKuQvxaXblm38xsHmC3b2UD41nHDaSGkCvP
 Bkf1XdrnNya3Nele0rM06GZCpxG59q30zWpTbEVV6QCjgNh4FvMMUDpCSke9NoVACCS5
 5cqQ==
X-Gm-Message-State: APjAAAUpmCkD6e5SIUao2ZNYMRE+wKZs/eiYX8Nd4P5tvoljoXu1Hr+l
 r1yUGBzUuoZs174aJgCH1HPB9A==
X-Google-Smtp-Source: APXvYqxpdF9tqU6dkco+yKgRpO42/D9hSwEZQEkXEt4ynHGrSAVlze7WRq3hAlxik/PhaSnw/Yo1BA==
X-Received: by 2002:adf:f701:: with SMTP id r1mr9066096wrp.130.1557506988408; 
 Fri, 10 May 2019 09:49:48 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id q26sm5114308wmq.25.2019.05.10.09.49.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 May 2019 09:49:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 3/5] arm64: dts: meson: g12a: add mdio multiplexer
Date: Fri, 10 May 2019 18:49:38 +0200
Message-Id: <20190510164940.13496-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190510164940.13496-1-jbrunet@baylibre.com>
References: <20190510164940.13496-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190510_094950_153125_15C0642D 
X-CRM114-Status: UNSURE (   9.19  )
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

Add the g12a mdio multiplexer which allows to connect to either
an external phy through the SoC pins or the internal 10/100 phy

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 32 +++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index fe0f73730525..6e9587aafb5d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -460,6 +460,38 @@
 				assigned-clock-rates = <100000000>;
 				#phy-cells = <1>;
 			};
+
+			eth_phy: mdio-multiplexer@4c000 {
+				compatible = "amlogic,g12a-mdio-mux";
+				reg = <0x0 0x4c000 0x0 0xa4>;
+				clocks = <&clkc CLKID_ETH_PHY>,
+					 <&xtal>,
+					 <&clkc CLKID_MPLL_5OM>;
+				clock-names = "pclk", "clkin0", "clkin1";
+				mdio-parent-bus = <&mdio0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ext_mdio: mdio@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				int_mdio: mdio@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					internal_ephy: ethernet_phy@8 {
+						compatible = "ethernet-phy-id0180.3301",
+							     "ethernet-phy-ieee802.3-c22";
+						interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+						reg = <8>;
+						max-speed = <100>;
+					};
+				};
+			};
 		};
 
 		aobus: bus@ff800000 {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
