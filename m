Return-Path: <SRS0=7NJC=PF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F92CC43444
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Dec 2018 10:51:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF14120855
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Dec 2018 10:51:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tCm2sZnx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FTfLsvjp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF14120855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=se5TGGeP+PXAGt4Eeq2tqyY/4uOEOS7xr0NdXdePOU8=; b=tCm
	2sZnxiVSCLE6c58zNMqdjA5IbwpkxesC/WA3/X/uD3lNJB3BRfG6rYMQAs5zq5X9Nw9FuIS5FMW6r
	rqS1HYTkhdAcajGnoyBA6zv2AS6VotrWA8rKHx7QUtVESb21om51Csx3ykV+uKoeGRYnA6waQ7p7U
	QE6qcYX6eDSRg1tJfU1T+2zbzH8j0mIXxEdXua/5paWV/m7xUDAFlNfc40ygz4r6SNBYDNxSPMtYf
	l/G+fxBIOth+qhh2rMawRIjpPmQulWvExKixXyS9uLM5TnBoBFrv4bDP5NIzPP6i4n0QLKA8GW0di
	6zFNwClqQutwHSEjlyUaf/+9wFtfLgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gcpjk-0001tm-04; Fri, 28 Dec 2018 10:51:28 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gcpjf-0001rm-6s
 for linux-amlogic@lists.infradead.org; Fri, 28 Dec 2018 10:51:25 +0000
Received: by mail-ed1-x542.google.com with SMTP id g22so17229372edr.7
 for <linux-amlogic@lists.infradead.org>; Fri, 28 Dec 2018 02:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=wA3sLETIlRKxDeeXR4+xPBu2iPGUxyZdr6J70dBcBMc=;
 b=FTfLsvjp9wAwTpVKEXYFpHakm258olb010572UoKlhqZu+eFd2M96e1o8sklL+FVwY
 z/8HWJXAg304i1r2AIAw2SOh8BR4bxqmtQdmaQ+V6o7pf9ImG1CFy2OzKhsgFrNYRcG2
 fMnkp2aK6/MHsw3+OC9jutXDlcd/BDtP66GYfy8SX7S4WJQhdAhIuHnwo0QbvHG2vIEc
 P8Nqwyibc+FuFWoQCkMbzhxidBN0t1jvv8KmJTQs79PZMTaCFFaGlvnbq+W3yHk396MC
 +UIUxUSXaEv73vUgKfCM4PrAfp8TtE+irTB8IRkmRacKz1KUr/af3BtUEcop8cDVHnP4
 wOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wA3sLETIlRKxDeeXR4+xPBu2iPGUxyZdr6J70dBcBMc=;
 b=rHwKKVD9NITrlj05movtPK/fjFeTO9lPtGqAtB8VkKy8L3q6em8VaIkv+L9mr4c0yw
 Gdv8MeWJrH1XeYxo0tdKca+hQN49bDjF+1zYCukTAqB7SxXpkk/8P8cW5otIHy7WKWS4
 s9aICegLg7Ps/q6GxkhIxUEdz38cvDf3n6en60tI/WwmnzzDyzCrwe1CWNetVG6vWTAN
 0tdW7lfN9tZHkLVZ35rZZow/bN0wQDnx6ga5+ddD/nKo1qLWxrHmBshhM5i5yO6LlZwY
 77yoLrufn2Q1sXpd+w3JbZfLhPNkFOtsxWWJ/XZpOHbl5nvNGz24QFvQy5R+FQEbfP6l
 oHzA==
X-Gm-Message-State: AA+aEWZ7cKBn5EuN/YFSC/mUq8BS7nQOQsLbmgcZeUNeiN9CEw0kuFiK
 L0ILrhNp7ym+GNZcHOZKd6tZwg==
X-Google-Smtp-Source: AFSGD/V0yeIx+cijKHQpfNYsgWe4yjvozMJgCgY0/4AQWOY/CSuayOl8aKpd4gZrrXxEbouMFg7VEg==
X-Received: by 2002:a50:b006:: with SMTP id i6mr22275869edd.84.1545994270947; 
 Fri, 28 Dec 2018 02:51:10 -0800 (PST)
Received: from loys-ubuntu-BY1835A49200471.home
 (anice-157-1-157-17.w83-201.abo.wanadoo.fr. [83.201.132.17])
 by smtp.googlemail.com with ESMTPSA id b45sm12919494eda.34.2018.12.28.02.51.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 28 Dec 2018 02:51:10 -0800 (PST)
From: Loys Ollivier <lollivier@baylibre.com>
To: devicetree@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/4] Add driver for globaltop GNSS receivers
Date: Fri, 28 Dec 2018 11:50:31 +0100
Message-Id: <1545994235-8309-1-git-send-email-lollivier@baylibre.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181228_025123_254128_A8468A2D 
X-CRM114-Status: GOOD (  15.49  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kevin Hilman <khilman@baylibre.com>,
 Loys Ollivier <lollivier@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello !

This patch series adds a new GNSS driver for the globaltop GNSS receivers.
These receivers transmits NMEA output sequence as soon as they have booted.
Power management can be done via the main supply and optional backup supply
as defined in the device tree.

The driver has been tested using a GlobalTop pa6h chipset on a Libretech-cc
board using the expansion header. Changes made in the board device tree can
be found below for reference and testing.

Loys

Loys Ollivier (4):
  dt-bindings: Add vendor prefix for "GlobalTop Technology, Inc."
  dt-bindings: gnss: add gtop binding
  gnss: add gtop receiver type support
  gnss: add driver for globaltop receivers

 Documentation/devicetree/bindings/gnss/gtop.txt    |  33 +++++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/gnss/Kconfig                               |  13 ++
 drivers/gnss/Makefile                              |   3 +
 drivers/gnss/core.c                                |   1 +
 drivers/gnss/gtop.c                                | 152 +++++++++++++++++++++
 include/linux/gnss.h                               |   1 +
 7 files changed, 204 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gnss/gtop.txt
 create mode 100644 drivers/gnss/gtop.c

---
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
index 90a56af967a7..3b3d4dcc47aa 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts
@@ -17,6 +17,7 @@
 
        aliases {
                serial0 = &uart_AO;
+               serial1 = &uart_A;
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
