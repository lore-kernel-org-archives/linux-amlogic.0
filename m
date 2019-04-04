Return-Path: <SRS0=arCo=SG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 302D4C10F13
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 13:12:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0106B214AF
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 13:12:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cW+GgzWb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nWoqbLTF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0106B214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LPUKq0Xgt1lPp24NNdmKAk1JhW5SK/muJDQKTac8g4I=; b=cW+GgzWbKqjfbD
	NbmM1E089RY4MBOPEnxuJRXwFZ8IP9bnJ7ZGos9fs0o2lUCs0DO4kKI0pBBdZ1+YgsyF7YHd2fIVe
	/67p8e6P236DpwEWTR59bQa7YV1lAedBu1TF4WEWZjsMQftz7T3YbLsPxd9jvv8NBEfBBOfVtFpaZ
	wjFj6yg14tXhlKA+lPorZevVcDJZsnTueiQlRL53knHkdY0lmR5fUel9rapUaPiqcK0VY4NcO5Oao
	QKyJcnPAlvQVpqq95WwBFWC7K1RcMm/0H/NPdU66PuzYQUhvJFJBwRTCjoXaejK/uVl6SqPJIAzqV
	aH6QWKPIOHvL3k8h81Dw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hC29z-0001RZ-Gd; Thu, 04 Apr 2019 13:12:03 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hC29v-0001Of-Vf
 for linux-amlogic@lists.infradead.org; Thu, 04 Apr 2019 13:12:02 +0000
Received: by mail-wr1-x441.google.com with SMTP id w1so3773541wrp.2
 for <linux-amlogic@lists.infradead.org>; Thu, 04 Apr 2019 06:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W34/cfcT6NSknRmwI1jY9uNwLfZHBK33QyXRjlFTgPM=;
 b=nWoqbLTFHP0Hbvks+1VbStS8n6ieZIS3NcTMMJ6zh1JNh+jy8OPOkkCEkhqIgCwuRc
 WiVLdCukT2E0aUqL7LRInMoDNs/MfDicoT89ZtuDuGpmIp2u4CBR36EU0u1s5ZCCwX2C
 z4Y3sGzm4nHJDjllJngjY3DijgoPft4lnsxHEV4Ych7nQLIxEHl1sAz35qyehHLeXsWz
 1kG4OapmBUCRl8sCztE2ab9Sr2kH13det5do8lsZ/ItYdzec+Mm3qLyz1M52yf32Za6I
 dAjuFfoih3r0H/YqG6Y0ksIHixXyRX2iK0TTJxJVYFLyJIBLVlos5NUnSWh604nNMfWB
 GMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W34/cfcT6NSknRmwI1jY9uNwLfZHBK33QyXRjlFTgPM=;
 b=J1Ub7snZBaQAA2hw0VeIbuAS0v7UoKL5ASS9PHRucvcnyuy/aLxRwXeLhJn721If9y
 l3J7yrdt4VDAadrgN+rIxNM8B9eiR5cAfgC0mCnykJmRuyktRAqr0fPIMLeHXjao/l97
 2ShH7JFwkLIQsNgpBIjqoRypbHB7Icycrs3Y/PbARLdE3XSI4PdYdsKJ/Yoken425Eyp
 A0vs4IbIsfv5Y/+rygsghHmNJ15xDx8IGgQDxRfuqy3w69gmB0jvWvIOxlIsAXit5LfN
 VxKSJGFuPvZ8hZrVvZ0m/7HrLxbj18QHFzU6yBNtUYcEv8PXPR+DYHb8A0ymkIfr9joS
 3+lg==
X-Gm-Message-State: APjAAAWL3FmYuOpWdZCf8uwuW5cutjf0Iw35kgHSWXmALcb7ytO5iASa
 sAuLeVPjuU4X0wEgywNeNBivoP8Tvco=
X-Google-Smtp-Source: APXvYqwC07qOfvheUKwy+EPsGt1K8mvjN63PoY7Fs/+CwkaKeEEcVIPMtHBoKvX3o+q3Y9GpQkvfEQ==
X-Received: by 2002:adf:fe4d:: with SMTP id m13mr4236000wrs.267.1554383517539; 
 Thu, 04 Apr 2019 06:11:57 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id y133sm21984923wmd.2.2019.04.04.06.11.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 04 Apr 2019 06:11:56 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH net-next v3 1/4] dt-bindings: net: phy: add g12a mdio mux
 documentation
Date: Thu,  4 Apr 2019 15:11:44 +0200
Message-Id: <20190404131147.31156-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190404131147.31156-1-jbrunet@baylibre.com>
References: <20190404131147.31156-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_061200_025190_B1B33CF8 
X-CRM114-Status: GOOD (  11.76  )
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add documentation for the device tree bindings of the MDIO mux of Amlogic
g12a SoC family

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/net/mdio-mux-meson-g12a.txt      | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/mdio-mux-meson-g12a.txt

diff --git a/Documentation/devicetree/bindings/net/mdio-mux-meson-g12a.txt b/Documentation/devicetree/bindings/net/mdio-mux-meson-g12a.txt
new file mode 100644
index 000000000000..3a96cbed9294
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
+mdio_mux: mdio-multiplexer@4c000 {
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
+		internal_ephy: ethernet-phy@8 {
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
