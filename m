Return-Path: <SRS0=/lP5=QU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C3DBC282C2
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Feb 2019 15:09:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AB85222BA
	for <linux-amlogic@archiver.kernel.org>; Wed, 13 Feb 2019 15:09:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dfpn8Xu8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="I8nkF1Fi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AB85222BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=1lVU/OgrmZE8ONBu37PJ7kJj2uCtSYA5Lw5gNkCsIf8=; b=dfp
	n8Xu8kwWLQZlyQ3HHvu5l7Wv6BmxgnuJ59/YJnaRzksxuQcF7IIRx2mnHLCkYgbxtSMQHFBNFIOZK
	I5qpT2WGcE2bnhbuymJdUE5wZYztotbNq8kMwA0+/fye/gEpLPpffrF82JI3FB33PwFdxJO5sA5KZ
	ZAqzIrcfjk3I3ei/dkXjgrGfE3tbxVj7UI2fhiln/4XAdtz49aR4yOEJz7XzwZu/RwwXaQM6pwdbi
	v/xKIAfOpuerz6Yk8K82nvSrc9H2cCOyyjSE1Fqe/VJOdAInJaVCtQcG+BC20voEmFY9xfQzFjSTH
	P5osa8kg83RdXbop2u75hKISM6T9H8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtwAP-0005dd-QG; Wed, 13 Feb 2019 15:09:41 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtwAM-0005c6-MI
 for linux-amlogic@lists.infradead.org; Wed, 13 Feb 2019 15:09:40 +0000
Received: by mail-ed1-x543.google.com with SMTP id r15so2202966eds.9
 for <linux-amlogic@lists.infradead.org>; Wed, 13 Feb 2019 07:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=mi2mVO/IJ0Uh7+nXJ3rnWhD82EEtsEXYmxE78KRe3ZM=;
 b=I8nkF1FiJxzndm/qA8SZLIzVcJjdecl3ZazI0iWa0o8ycJ8/AKOhamKC1l0uqkbpm0
 UtLth7fQrN+O9JCyRYeo1m3v9kwqmrs5gHfOI1JZBm4f7ZgGlNEwyh8UJDTMkbIDvUvx
 u83v+zfX3OF8jzrKRmr0987RfX8KxnIGYDRIhBydp4S8+awIfe4UqZCeMKldreLvozRx
 BgjU6CoUYZvR4h5LyACk81U1psflIsok0ft39/QTSYX2HUG15OGWtJe+EH+Flskk5t+B
 Rn99NHTsZnMEvM9LzDpw+xk3ZBSovsL5usLz9Bh6VRgbyIy5xDgf/q2CI7pwcxL90JdO
 RRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mi2mVO/IJ0Uh7+nXJ3rnWhD82EEtsEXYmxE78KRe3ZM=;
 b=qOkZEW6mnyUBn2LZ0sv+5BO2qdz7bgDty71uceyjWWzIpYQ6dEq6FDfEHGliFP6Bqy
 TjKR7RPANZsRE7oJq+TfuMnLhI5KIiBKrbogHZRvbVhbIUKEmrGWBp989ctxWJkBcnf9
 +f/alP+ct7Sb5pAYhnuo6I/2ZVzmmZh309afamNEBysmexkMaFbyHtMnDFhJci1kwMe4
 Vr+BRhwPiGfsN/SxuYT5BSRdhAStI4XjQVUZZI6giYsWn6a0hGabaBt0UIIqRQ4yQjdV
 lUTVmTvWf3ITNmjD79Zx/8Q8+A/o2i8Apqh5UoLX7M2eGsWduYg6lqP3B+FAP8A1T4rY
 //tg==
X-Gm-Message-State: AHQUAuZ1AVvM+vTJsuQZWwIkpH1oskt2ma3M5Yko/t1busgnpLIgA7+7
 UiJhZ955umvLAhTR0nVEQwEExw==
X-Google-Smtp-Source: AHgI3IYrToBTVbuymH9nBQVGfsAKwDtKVKpFVDGMYMHu+JadPkEDHCthNxuAzpLOroxNh7tq/4H9Hg==
X-Received: by 2002:a50:c408:: with SMTP id v8mr778469edf.144.1550070576370;
 Wed, 13 Feb 2019 07:09:36 -0800 (PST)
Received: from loys-ubuntu-BY1835A49200471.thefacebook.com
 ([2620:10d:c092:180::1:4505])
 by smtp.googlemail.com with ESMTPSA id k26sm1903941ejv.63.2019.02.13.07.09.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 13 Feb 2019 07:09:35 -0800 (PST)
From: Loys Ollivier <lollivier@baylibre.com>
To: devicetree@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v4 0/4] Add driver for Mediatek-based GNSS receivers
Date: Wed, 13 Feb 2019 16:09:25 +0100
Message-Id: <1550070569-18588-1-git-send-email-lollivier@baylibre.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_070938_779461_5B6018FC 
X-CRM114-Status: GOOD (  16.77  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Loys Ollivier <lollivier@baylibre.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

This patch series adds a new GNSS driver for the Mediatek-based GNSS receivers.
These receivers transmits NMEA output sequence after boot.
Power management can be done via the main supply and optional backup supply
as defined in the device tree.

The driver has been tested using a GlobalTop pa6h chipset on a Libretech-cc
board using the expansion header. Changes made in the board device tree can
be found below for reference and testing.

Loys

Version 4 changes:
- dt: bindings: use standard name "reset-gpios"
- dt: bindings: use standard name "gnss-fix-gpios"
- dt: bindings: s/an/a UART

Version 3 changes [0]:
- driver: Removed "mediatek,mt3339" compatible
- driver: moved gnss_types_names string diff in the GNSS_TYPE patch
- driver: edited [patch 3/4] commit message to remove ref to vendor protocol
- driver: retained the original copyright
- dt: removed interfaces that are not available on the globaltop SoC
- dt: Added missing pins documentation
- dt: added optional properties pin names

Version 2 changes:
- driver: Renamed driver from Globaltop/gtop to Mediatek/mtk
- driver: Added "mediatek,mt3339" compatible
- dt: Renamed bindings from Globaltop to Mediatek
- dt: Moved the current-speed property as optional
- dt: removed the status line in example
- cover-letter: removed the alias that is not needed anymore

[0]: https://lkml.kernel.org/r/1548693481-1162-1-git-send-email-lollivier@baylibre.com

Loys Ollivier (4):
  dt-bindings: Add vendor prefix for "GlobalTop Technology, Inc."
  dt-bindings: gnss: add mediatek binding
  gnss: add mtk receiver type support
  gnss: add driver for mediatek receivers

 .../devicetree/bindings/gnss/mediatek.txt          |  37 +++++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/gnss/Kconfig                               |  13 ++
 drivers/gnss/Makefile                              |   3 +
 drivers/gnss/core.c                                |   1 +
 drivers/gnss/mtk.c                                 | 152 +++++++++++++++++++++
 include/linux/gnss.h                               |   1 +
 7 files changed, 208 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gnss/mediatek.txt
 create mode 100644 drivers/gnss/mtk.c

---
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
index 90a56af967a7..3b3d4dcc47aa 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
@@ -17,6 +17,7 @@
 
        aliases {
                serial0 = &uart_AO;
                ethernet0 = &ethmac;
        };
 
@@ -269,7 +270,20 @@
        pinctrl-names = "default";
 };
 
+/* This is brought out on the UART_A_TX (8) and UART_A_RX (10) pins: */
+&uart_A {
+       status = "okay";
+       pinctrl-0 = <&uart_a_pins>;
+       pinctrl-names = "default";
+
+       gnss {
+               compatible = "globaltop,pa6h";
+               v-bckp-supply = <&vcc_3v3>;
+               vcc-supply = <&vcc_3v3>;
+               current-speed = <9600>;
+       };
+};
+
 &usb0 {
        status = "okay";
 };

-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
