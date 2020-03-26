Return-Path: <SRS0=29RQ=5L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49DEEC43331
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 13:49:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15D05206E6
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Mar 2020 13:49:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rzzCIiD4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bLdXR/wJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15D05206E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yP6B2h3Mhr9Kt11QogJnpIoB/XFQMrElfmoZ+EGFrrE=; b=rzzCIiD4VAf4Xx
	Qwm0/3c6y9P+RzAF71CblgaTKU1jyyFStVtyPFExe6Qr13nyvwEuUEPEdOPpC5daNsZpJobVEEkIb
	nb7FrzcxH/L6Faug/EaoK08lQJeMcWOZXb9BhNoifknaDmsE/cbQlaKLsh5tx2Bcbo77sXKulvs7g
	GREP4AQ2DiHUJRC5kVA5hCI2Mm+MssAvoDr0g0LmZh0trhpqH8wO9OAvM3BxBgQLTiNcMwgSk5Vt9
	A/u8jESRtsVdnqONNk2prNfCXv97qPfTqBaneVvBCI9pvvmsep5de/9maJ5JgrFEbulrFN9yDd0T/
	FDxAeOl795lUB7BDSk7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHStH-0001hP-3K; Thu, 26 Mar 2020 13:49:47 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHSpA-0005rt-4x
 for linux-amlogic@lists.infradead.org; Thu, 26 Mar 2020 13:45:35 +0000
Received: by mail-wm1-x343.google.com with SMTP id 26so7465231wmk.1
 for <linux-amlogic@lists.infradead.org>; Thu, 26 Mar 2020 06:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=67sFvVtkG1ivlSk+fGwbgHaYe6cmIRn/pWHBZ0lu9g4=;
 b=bLdXR/wJazPg41YLpiPbUokG5vLuO47L/bv5lHhqgJwrXrKPuoF0CfDbTzt/pL6oYN
 AZ9NRRYVws2mK6JuK8ESpJ17a5pZ64yHZJcKdREbVXQqnJ1fXHXuOkYPk0QCqIyv8R1T
 rwXFCFPgXp6K2IOjK5EZ9RuQ7rs90tLFLUbJtLEo5oPez3u9GZzC6jW2sVgDG7uhqc5Z
 YymYWEgfSOFN/aU0Vrgw/HxL+faw5cRtFrKVRbIfu/Sw9MZsx4wbUSomIWMWweLYd9VG
 SPCllFmJWsNce0I9nnmXjneBmPa3dFE1djhJ35yMnqVKWNXI37dnfjvlg3UeJBQgMbc6
 wkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=67sFvVtkG1ivlSk+fGwbgHaYe6cmIRn/pWHBZ0lu9g4=;
 b=lxCe/i6NNJwxrovQTsh5+0k4ttuznjA+lGbC9qW0VZRPMN0VSmZYhHK1hArAuX3/bc
 qwuUfclHYy2Ekfukcol9ZrFQmnIOxMUBUvKUN2J1ryqRodM1vT//3Tqn7flIHL0RzSo9
 oivpHF4iZgBKh/Hwr6GKm3XCttj6hjdG9OG26zRFPZkZ7xjW1jeW9DtxICkCkiY5UrmA
 NcyT4+SuhHY5bKZdXWK+kuBp/ECPf6W7VAIQZEj0TYEX8SIuW+0XqEylbg8eDi3SWIWG
 8thjAUKHTCsbidKAKWJmj13HVTAp1m7skO/ac+ugVnZuH/Vadb7G1CfE75h29Q8yzKMs
 ER9g==
X-Gm-Message-State: ANhLgQ0AIBq7HGwbmt19wfcg+XTBSTyQRoWQWyKkI08atWryJDRyZjxp
 la3yGEmw2htZ6iEiHJrO2ri25g==
X-Google-Smtp-Source: ADFU+vuHF3B+GqiyYh0z892h7eeFlpwGJIfm9AgAVwf3x4ExWuzFRA51gjXfmXCgwh5Dcacvi6Cv/A==
X-Received: by 2002:a7b:c20d:: with SMTP id x13mr65827wmi.52.1585230329464;
 Thu, 26 Mar 2020 06:45:29 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id h29sm4079617wrc.64.2020.03.26.06.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Mar 2020 06:45:29 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: kishon@ti.com, balbi@kernel.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org
Subject: [PATCH v2 14/14] dt-bindings: usb: dwc3: remove old DWC3 wrapper
Date: Thu, 26 Mar 2020 14:45:06 +0100
Message-Id: <20200326134507.4808-15-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200326134507.4808-1-narmstrong@baylibre.com>
References: <20200326134507.4808-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_064533_801671_91E2E553 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

There is now an updated bindings for these SoCs making the old
compatible obsolete.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/usb/amlogic,dwc3.txt  | 42 -------------------
 1 file changed, 42 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/amlogic,dwc3.txt

diff --git a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt b/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
deleted file mode 100644
index 9a8b631904fd..000000000000
--- a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Amlogic Meson GX DWC3 USB SoC controller
-
-Required properties:
-- compatible:	depending on the SoC this should contain one of:
-			* amlogic,meson-axg-dwc3
-			* amlogic,meson-gxl-dwc3
-- clocks:	a handle for the "USB general" clock
-- clock-names:	must be "usb_general"
-- resets:	a handle for the shared "USB OTG" reset line
-- reset-names:	must be "usb_otg"
-
-Required child node:
-A child node must exist to represent the core DWC3 IP block. The name of
-the node is not important. The content of the node is defined in dwc3.txt.
-
-PHY documentation is provided in the following places:
-- Documentation/devicetree/bindings/phy/meson-gxl-usb2-phy.txt
-- Documentation/devicetree/bindings/phy/meson-gxl-usb3-phy.txt
-
-Example device nodes:
-		usb0: usb@ff500000 {
-			compatible = "amlogic,meson-axg-dwc3";
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
-
-			clocks = <&clkc CLKID_USB>;
-			clock-names = "usb_general";
-			resets = <&reset RESET_USB_OTG>;
-			reset-names = "usb_otg";
-
-			dwc3: dwc3@ff500000 {
-				compatible = "snps,dwc3";
-				reg = <0x0 0xff500000 0x0 0x100000>;
-				interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
-				dr_mode = "host";
-				maximum-speed = "high-speed";
-				snps,dis_u2_susphy_quirk;
-				phys = <&usb3_phy>, <&usb2_phy0>;
-				phy-names = "usb2-phy", "usb3-phy";
-			};
-		};
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
