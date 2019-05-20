Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61FABC04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 13:14:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 370AA21479
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 13:14:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nFiZdqur";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0k1cQKVI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 370AA21479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cDQ8eUJv/Db2zT0nC2+8/8qqqGQnFtx/WWsKzNy2vOY=; b=nFiZdquroIO/q5
	IIQwijArOk/XeqgVFI99sOMW4wLdUjqK//gw9CI9PtRq2Fi+ijHlVKhKEqto3LG/gggoK1WvCi7mt
	PIn7OuISEL1+qxRy4YpOtxzvm/F+OajjSX0yzFXmbX/hGuRDIHSSvon4b8Ysb81MBnoDICYyFFbxX
	9NYXaVRiov5il0WPBhzQAi2ISN5wbSKDHNyrn3pMMIhIY0mrGltD1tW625sARIJNrCQcIDJ0KpN/Z
	ZkxqHf3/E2IIcNIFGiaf61/kJy09FM47jSsVVNxEgAv7xTiK9lfT02MNjn333apc8PLpLgr0ZlFns
	e5EvUqjMv4emGzQAx2nw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSi7M-0004le-K7; Mon, 20 May 2019 13:14:16 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSi7J-0004gh-2r
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 13:14:15 +0000
Received: by mail-wr1-x441.google.com with SMTP id d9so1600311wrx.0
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 06:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wgSfjE2+FzU8XOfZWkTKXLvL3btwWWjzue0NBLqBVBw=;
 b=0k1cQKVIN8lOwrP/3OcUY298DXpl9fwzT6sNib2znDy2o8BLBZWIJEeVNDlBqp4Q8f
 qaieuLng9y8+Xvb9U28TJcD5UR11v32GcLRL70osxLMuRn/4/rUQ4CuD5m7qp8qx0Wsw
 J4QxZQDIX6BGBznbQYmWFkpwU2GlwmbLRUoXSO+05Xi6PTFgEM1e6lBFq9YGcDK9VCH1
 wO1Ug/e200kXgPpuNwPGn1ku8+84BG7WA9mjTtmQ1vFiMixsUmbo3ITiZTxjXb/x4kCf
 kDJ/vjnOYWgv01gTK3STSiYPoGmEi2Rltc/ZdBMhSpWxx18tp1wcj6UmQ7XHh99KJzw+
 u92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wgSfjE2+FzU8XOfZWkTKXLvL3btwWWjzue0NBLqBVBw=;
 b=GLq2KkkN2w5zqRJo2AUK0I2MOAjbMyzNjxaVO3ImzXdb0Vwr29t2u+xCpR7kCII+D6
 nSA5VebgzLxbyKUquEIYbUjWl9i8k+O4DDe5NFQ/0GcGk+/ypBdhmkbE4JWcVtZV+WWf
 kQDhflWj1a48/ueCEgO7G95SmFaEicaf0CdjNcbMLgs6LRALU1LBEocQAAMG2ipFKOs+
 3Lu7JedJtOqUXYPSjcGGLaTtcJ/JZmtFqbYL6oWMXebn4S5QusIJNQVl95iRH/dLKOna
 4kMLQdmEscT1BJqZQ+RcvcfWJ7UFyYUkdWYue/tu4vSsrhdbPIbhYUVodLNgZbzAIs/k
 4yDA==
X-Gm-Message-State: APjAAAVlZI7RK1Duu3KNywrHMjg5AT60QYEqFBQumj1ob31fUzM5acRb
 Yy22mHHK51N/UK+ZcxFEFiEq2s8cvME=
X-Google-Smtp-Source: APXvYqxApb5a5AL31sl0uIO+RsAxe3WbEZ8MsyWsdxEq9oVrR6tsUj6oGh6g+Sww30uX1081oQa2oQ==
X-Received: by 2002:a5d:6b50:: with SMTP id x16mr813119wrw.220.1558358051478; 
 Mon, 20 May 2019 06:14:11 -0700 (PDT)
Received: from boomer.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id z8sm18054284wrh.48.2019.05.20.06.14.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 May 2019 06:14:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 3/5] arm64: dts: meson: g12a: add mdio multiplexer
Date: Mon, 20 May 2019 15:13:59 +0200
Message-Id: <20190520131401.11804-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520131401.11804-1-jbrunet@baylibre.com>
References: <20190520131401.11804-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_061413_130497_90392936 
X-CRM114-Status: UNSURE (   9.38  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
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
index def02ebf6501..90da7cc81681 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -1698,6 +1698,38 @@
 				assigned-clock-rates = <100000000>;
 				#phy-cells = <1>;
 			};
+
+			eth_phy: mdio-multiplexer@4c000 {
+				compatible = "amlogic,g12a-mdio-mux";
+				reg = <0x0 0x4c000 0x0 0xa4>;
+				clocks = <&clkc CLKID_ETH_PHY>,
+					 <&xtal>,
+					 <&clkc CLKID_MPLL_50M>;
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
