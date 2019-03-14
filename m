Return-Path: <SRS0=SZaW=RR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC15C10F0B
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2019 14:02:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60E2F21855
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2019 14:02:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uascvoys";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="h12UH4uN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60E2F21855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4jdjxf3NYTbX41ZROk2GpwZjK5TM9xiDkGzXjT3YCW4=; b=UascvoystEInwG
	mdeBGKzfdLcDCf4fNuLFVlHMkD0R6Pg7IyF2OO24EoeUD5DG/DZjQt/xFBbGYdHgCsC2+0rBLgELH
	wOYFY/uxz2e8sjiEZPzRapylpJ4rGPjcBcG+ZSEoJqwopPyU6poG14zjk1ijkwbOCHhwCsqjURl/X
	9LIhJS3rq62+w8nKuHqbgpRBHy0f9ulotowxYHGjP6G/Tjpeu+dKlAM68cAhCYWrSBFA73BXReYPm
	FCR6Td3s4uZVk25D2BU3Ho7J8IptRpKyrb3Lo3zlrPeuHGqORlV1+Y/X8d3Bg2/CmNXk65Cclq0PJ
	CsGMtIyQ7HqWF6P0EzvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4Qvy-0000NT-Gs; Thu, 14 Mar 2019 14:02:10 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4Qvk-0000Gi-9d
 for linux-amlogic@lists.infradead.org; Thu, 14 Mar 2019 14:02:07 +0000
Received: by mail-wm1-x342.google.com with SMTP id e74so3104187wmg.3
 for <linux-amlogic@lists.infradead.org>; Thu, 14 Mar 2019 07:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VrIM0LIaAeyRnbtzdYl720Pekr4qj64JGsc6swg1oRE=;
 b=h12UH4uN+TK+CWagvg7xGzLUqGLu4PZVoiVJpeT4y/1h7Iq1fV58Wm9UTL0VMB85J5
 xixzDy/ousy7RYw7epz+obveAK4Njoxz4uhAtAEMX5J1Frme5pEgrhukvX9JCfP0zLjm
 Ro4PQ+Kpq9SQW0EHZE7ATa9nwM17DgjsfpP6TG9UUWYE4DhO8S10eStLrOQn3I3JHgqb
 nFqYfJlA3dSJeDjxUN0ghhivQBL/77X2DZKVMSycDjTwa1usSaEH5xpBvwVoPc3mp9F0
 MUhi/RoBtC1oOrdxwrgVBGhn4N01ELMCVDFLhW6yK3XhnxeRrAscucOzTDdGmJtVaC4K
 tauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VrIM0LIaAeyRnbtzdYl720Pekr4qj64JGsc6swg1oRE=;
 b=c/WuYToleCfNE+yOFHc70o0UCpkmP73UiuC173vgQflBwd72Knm3J6AhXM9vQSwg8L
 5kEtZF2A+5MvOCx6g95u0pegWOlEDNDfceakkOWD6KlT/Q/a8OQJa3CfCYOIdl3r9okE
 41pBI1hlNo3/SdZqkhFJiYQ9uR/hff5CddJWuyc02Mc8Nsyx9LwGeK2g+xIbM8Y2brC0
 yUyXkgAfGxlpWDjjj/E+W1xK9ZXNyBnfI0WngGKRHvNEDFYmSHqRjGe/K83EXN1oPSDf
 mqVepwiv3hm5YKVlGEddetLy/OFcnUNZhnoDmzkiyP7YAjrL8c96l+htbkM6xKH/oe/6
 /l+Q==
X-Gm-Message-State: APjAAAXbD0h5BXNjc3Y5hGe+SjL+eKnHSpjo/AtajAljyJVKZqXnKKoV
 fKF05RD7o4y5LVNink4pT3YWdw==
X-Google-Smtp-Source: APXvYqx30dID+exeDffHkGRxAS6tGiz1CiwGspdI2h6soSmi9WPVymySTu2maYUw9cnBmRw6gtuXBg==
X-Received: by 2002:a1c:9693:: with SMTP id y141mr2805320wmd.33.1552572114872; 
 Thu, 14 Mar 2019 07:01:54 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id y7sm2661051wmi.34.2019.03.14.07.01.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 14 Mar 2019 07:01:54 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH net-next 1/3] dt-bindings: net: phy: add g12a mdio mux
 documentation
Date: Thu, 14 Mar 2019 15:01:33 +0100
Message-Id: <20190314140135.19184-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190314140135.19184-1-jbrunet@baylibre.com>
References: <20190314140135.19184-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190314_070156_367010_990A5165 
X-CRM114-Status: GOOD (  11.44  )
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
Cc: netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add documentation for the device tree bindings of the MDIO mux of Amlogic
g12a SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/net/mdio-mux-meson-g12a.txt      | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/mdio-mux-meson-g12a.txt

diff --git a/Documentation/devicetree/bindings/net/mdio-mux-meson-g12a.txt b/Documentation/devicetree/bindings/net/mdio-mux-meson-g12a.txt
new file mode 100644
index 000000000000..e738bba6a9de
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/mdio-mux-meson-g12a.txt
@@ -0,0 +1,48 @@
+Properties for the MDIO bus multiplexer/glue of Amlogic G12a SoC family.
+
+This is a special case of a MDIO bus multiplexer. It allows to choose between
+the internal mdio bus leading to the embedded 10/100 PHY or the external
+MDIO bus.
+
+Required properties in addition to the generic multiplexer properties:
+- compatible : amlogic,g12a-mdio-mux
+- reg: physical address and length of the multiplexer/glue registers
+- clocks: list of clock phandle, one for each entry clock-names.
+- clock-names: should contain the following:
+  * "pclk"   : peripheral clock.
+  * "clkin0" : platform crytal
+  * "clkin1" : SoC 50MHz MPLL
+
+Example :
+
+mdio-mux: mdio-multiplexer@4c000 {
+	compatible = "amlogic,g12a-mdio-mux";
+	reg = <0x0 0x4c000 0x0 0xa4>;
+	clocks = <&clkc CLKID_ETH_PHY>,
+		 <&xtal>,
+		 <&clkc CLKID_MPLL_5OM>;
+	clock-names = "pclk", "clkin0", "clkin1";
+	mdio-parent-bus = <&mdio0>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ext_mdio: mdio@0 {
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	int_mdio: mdio@1 {
+		reg = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		internal_ephy: ethernet_phy@8 {
+			compatible = "ethernet-phy-id0180.3301",
+				     "ethernet-phy-ieee802.3-c22";
+			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <8>;
+			max-speed = <100>;
+		};
+	};
+};
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
