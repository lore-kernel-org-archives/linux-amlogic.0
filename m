Return-Path: <SRS0=Id+k=IX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBC6C433DB
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 12:43:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 876A961A17
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 12:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 876A961A17
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3GXax1sv3ObtVV0O8D9KTvYcjA6ySY9aA2s5zdxzHho=; b=a4yRzTxHuHanvAY+MexPXwvlF
	xC0GlNr2dUzCLcvajti4F6Iybd2V/nXbQaAhnbxNdNAtTnpJPYsiRFmMbnc2cMopLQnvhAzxT9jhl
	YFGQJXDlEubY1koYrmgmq9OfC9xXpp0y4jDWzO7QwMqzOITZ8g0lWfDrvAv9aFfKYDvhgOPyLNirs
	oqBTm5ufOmaGItLTFNw756y3tp2GI3K4elz3otGu1KIF4YFiBiv9okwCZtAyAXYOwPoXQE3VHGwIX
	kV1pouAWqJFaUkOQRxubV4f37N70QIJUEKtz+9bqTp3TQBH25iJrxyl4RI/7xYXbyA47rj0vXeidK
	MATOeApgw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPPKi-001Pro-83; Thu, 25 Mar 2021 12:43:28 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPPKC-001PhD-NR; Thu, 25 Mar 2021 12:42:58 +0000
Received: by mail-pg1-x531.google.com with SMTP id m7so1649432pgj.8;
 Thu, 25 Mar 2021 05:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o2X5hf76RVmZgnkS5Xn03sgP0gHvSiJwl9J2bXsWxbQ=;
 b=GiAMmznYYVJYW6pLsXQT82029OkTINrLmsIeyo56MBY0nVsAimf/fqwpKNkmCK+PT7
 bUeax4/5FC/rvoiDASQKherOHi34zDrnLkRu8D+/RPuM+Ibr10aE9ZJ6YzWDExcfBS6q
 Cah0JnCg1h41cbVWICBoHGWVPKtPuJArvgt6h/TZl/ld/5ljNRLChpVEVtAdQmqj/ouD
 DHeRG7G63nPdSQjB8U3LCnDnPbVym+b27hunSt4a4o0YkoYoLa0Yp7h7dBhVFXQAoKdf
 omsPG7ZmwyJOWr7hBrDXAvdWIdsDiJl7xWW6yYv5TO/YMH97cllw8OtmHFdwo7wdcFjI
 l9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o2X5hf76RVmZgnkS5Xn03sgP0gHvSiJwl9J2bXsWxbQ=;
 b=Ab3/sIVGzIT/sIrK4cSQdZySTiPL3ZzivQP10AVBtmXUJE2FuWBpRN4XkaFVCMZ+Q3
 uE6Kp2fNrenrxgDCFElG8W54ufB3xzEHKwc4rqw/O/VBZn6o0CPWOju/uTncMxa8stIq
 +6LNzYibRO3Ii3kWEkmYYofbiPWa/kGCRdwJtXRdHM8AJi5ga6uvEwGP29GpyQ2hamy4
 muppLIXc7djtXMf5mIoM5Ssgcts7xdS/UrnSKbq5zcTfDrkmT5xEbzNLl/xm8DyXIdSD
 ugrLG8A2hzORw9X23gwxF297J/9CXKudemsRnA9rpUJZ0F8gIWQ5BWwqZLcwM0B2DJoQ
 BZUw==
X-Gm-Message-State: AOAM532ongRf9DvamTVbyA3RRqyeQJt/xwnzgc5qg4HPmAxwhiYomnrU
 mYJwtiGcjc2ygHkrYTFc9zs=
X-Google-Smtp-Source: ABdhPJzl7yx6va8IfkiTv9dh6by6gQdg1/hFNrkxOXSCqm+m4B9AJjadDVA7V0kEGKBC17eFs3YaAA==
X-Received: by 2002:a17:902:e309:b029:e6:c17b:895a with SMTP id
 q9-20020a170902e309b02900e6c17b895amr9869758plc.74.1616676175363; 
 Thu, 25 Mar 2021 05:42:55 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.72.9])
 by smtp.gmail.com with ESMTPSA id t17sm6125917pgk.25.2021.03.25.05.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 05:42:55 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Anand Moon <linux.amoon@gmail.com>,
 linux-amlogic@lists.infradead.org
Subject: [PATCHv1 3/6] arm64: dts: meson-gxbb: Add missing ethernet phy mimo
 compatible string
Date: Thu, 25 Mar 2021 12:42:22 +0000
Message-Id: <20210325124225.2760-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210325124225.2760-1-linux.amoon@gmail.com>
References: <20210325124225.2760-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_124257_009668_192E58B2 
X-CRM114-Status: GOOD (  11.81  )
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

Add missing ethernet phy mdio comatible string to help
initialize the phy on Amlogic SoC SBC.

Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts     | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts   | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts    | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts        | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi   | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi      | 1 +
 7 files changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
index e8394a8269ee..f3b0947b8586 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
@@ -69,6 +69,7 @@ mdio {
 
 		eth_phy0: ethernet-phy@0 {
 			/* IC Plus IP101GR (0x02430c54) */
+			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <10000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
index 7273eed5292c..a4c09f1af24a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts
@@ -202,6 +202,7 @@ mdio {
 
 		eth_phy0: ethernet-phy@0 {
 			/* Realtek RTL8211F (0x001cc916) */
+			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
 
 			reset-assert-us = <10000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
index f887bfb445fd..abbc5571efde 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts
@@ -209,6 +209,7 @@ mdio {
 
 		eth_phy0: ethernet-phy@0 {
 			/* IC Plus IP101GR (0x02430c54) */
+			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
 
 			reset-assert-us = <10000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index bfaf7f41a2d6..4287d83d6f2a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -237,6 +237,7 @@ mdio {
 
 		eth_phy0: ethernet-phy@0 {
 			/* Realtek RTL8211F (0x001cc916) */
+			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
 
 			reset-assert-us = <10000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
index 3c93d1898b40..f7a1ffe453bc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts
@@ -75,6 +75,7 @@ mdio {
 
 		eth_phy0: ethernet-phy@3 {
 			/* Micrel KSZ9031 (0x00221620) */
+			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <3>;
 
 			reset-assert-us = <10000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index 9b0b81f191f1..0cf4bde81c6f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -123,6 +123,7 @@ mdio {
 
 		eth_phy0: ethernet-phy@0 {
 			/* Realtek RTL8211F (0x001cc916) */
+			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
 
 			reset-assert-us = <10000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
index a350fee1264d..e652f112bc45 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek.dtsi
@@ -144,6 +144,7 @@ mdio {
 
 		eth_phy0: ethernet-phy@0 {
 			/* Realtek RTL8211F (0x001cc916) */
+			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <0>;
 
 			reset-assert-us = <10000>;
-- 
2.31.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
