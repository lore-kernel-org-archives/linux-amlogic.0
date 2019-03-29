Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1121CC4360F
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 14:15:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2D282184C
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 14:15:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iFyzRVe/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="AfQ+NolI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2D282184C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LPUKq0Xgt1lPp24NNdmKAk1JhW5SK/muJDQKTac8g4I=; b=iFyzRVe/Un4gWo
	YlQeysEU+xrPvgs9k++zcjfbuJfew0Hr0/wUMHAUVciXLktZDW1g9qy5x2gmbcijrDzB2BrIHBNo/
	h4OlvcNoBVChJ8KhV8p7cEj0EGMDBvomP4nxVKHhjnlzmFCDOKakPvEH5y+rCrqs+DgujJfMWoVgG
	t/WlnW5WLM6ekrwArxuVepWTaN8hGQAnFVnkiGV0jo8IwY8dIjthPehrcKxuSBadZKsylMTChHYnA
	LaR8M9EtvLd8kh7zzeg+R8ZZutIULcMxNf0TVHeo3T8M/h/5N9AMjboK7oHP2grsaCNrafPJMRZ/A
	OWMn6iYfIjtC4StfEgfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9sI2-0007wd-9d; Fri, 29 Mar 2019 14:15:26 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9sHy-0007ut-Kj
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 14:15:24 +0000
Received: by mail-wm1-x342.google.com with SMTP id z6so9812723wmi.0
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2019 07:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W34/cfcT6NSknRmwI1jY9uNwLfZHBK33QyXRjlFTgPM=;
 b=AfQ+NolIerqL3DyW8Ky54epR8kQB/ARQehPyqVFb6cz5oFaJUHgCQ/4iuQ1Rp1RCLj
 aR2V/9ojxxRgTSyqYEbxikcCccpMH+cdaPCQmjs1U+km4n9Qn/If0SFxKn5iQWJceaJm
 3dv9DBwk7khIzT31On2EoNWX7wMsoDbBGy5eRpUUZKtCuaCsZl31poiSLnzIODZEDb/c
 cPD175a9wrX1FO8+4BDtY3MfW76etcctf7dTDJIpeGpiUjt9IlmMAylxsd5G0hQqkWxt
 qFEST2R2xn2V34YicoTrgcf0o+c6nfWSbgXWGqUhlbFjSMds+sl4RBp6uZK4ajK6HIVK
 lx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W34/cfcT6NSknRmwI1jY9uNwLfZHBK33QyXRjlFTgPM=;
 b=X5wq9/13S9x1SjWsBdPndsk4GskA9Jvm1Z8Dc589L1qGNXTVbRG8qWk9jbSFF56/u6
 o31IlyhSpDB838DOTgYFICzU9NboCu2uCV/GAFTE3XPkrH3f1i0/AcSjkjR3tJgk7/MQ
 V64F3BYNJAsUiPLa1B8Mv4o/+3dZ0A+SQMMRp4AN2oLrIboGCoJlG8x6DuwWmKIfqHz5
 sy3Dq6bSoikRhxhOyYrAyrNiliGeU+xfjrABk+oZwrfIy1auLtpOk4Qxaz4qrSGi2Vt2
 CLu4LBrZFCLhUbMM60uulocJ2fo4zM5q461JZPWOIRWk60GBUpJE1qHMeosO718qCNuD
 h3UQ==
X-Gm-Message-State: APjAAAWgpUkGeuGy1eroVMgxKHisk95hBohUCkzQOuCI34HUS7edeq94
 8/gtWsZSseefDmKl7EioO8WxrO8Mf1I=
X-Google-Smtp-Source: APXvYqxidIYhN7iOAK96hGbHSZo4xLrQvYXEk/YijvZEoY+sVJLDbvd3ZEviNa2Dcq8wl98Szjaovw==
X-Received: by 2002:a1c:9cc1:: with SMTP id f184mr3916979wme.150.1553868920895; 
 Fri, 29 Mar 2019 07:15:20 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id 67sm2464333wmz.41.2019.03.29.07.15.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 29 Mar 2019 07:15:20 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH net-next v2 1/3] dt-bindings: net: phy: add g12a mdio mux
 documentation
Date: Fri, 29 Mar 2019 15:15:10 +0100
Message-Id: <20190329141512.29867-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190329141512.29867-1-jbrunet@baylibre.com>
References: <20190329141512.29867-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_071522_676164_D41EE8AC 
X-CRM114-Status: GOOD (  11.62  )
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
