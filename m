Return-Path: <SRS0=Oax9=W5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A89D5C3A59B
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Sep 2019 05:50:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78DD221897
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Sep 2019 05:50:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="liGeVOoO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMJhAxPo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78DD221897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pOpqj0oP5jJwznb9rfamDhNZjcUHA4AhtpHMRQ7nyJI=; b=liGeVOoOTOcrDW
	pZqV5Hvo/wWhC6PvkQn+KQCCYUsAWUhVVogdTAyxlLHrkxe+uWrqVACklj45hnzvwrf+BMadqRxPi
	S6a+oVvfyHQS2ArYBzzEGabedAtNzMCM2pVZezO5vzXBMEowP/eHETW4K+9WgLeSZD08liRhCUTUE
	VI4xpgWcB+008YnthoZOMBqMX2Wqu1qKdWkzUT8UUsPGLCFVakfLvDjHJoKW+f53KI0//JYrYFbBG
	gUK1BKsI594TIsr8slu822a6bU15PfaB3ZIsWwtUgW0+dKi12nkvBs3gmV16slxfk5yaHf2Uh09M6
	Ak++g15KQ/v7rEMkQ0Dw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4fEl-00033h-7X; Mon, 02 Sep 2019 05:50:47 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4fE0-0001I8-Tz; Mon, 02 Sep 2019 05:50:02 +0000
Received: by mail-pf1-x443.google.com with SMTP id q5so518132pfg.13;
 Sun, 01 Sep 2019 22:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bEt/v03msRhcSdb84WAU8NHWudPBzPmtzl8y/Hh3kS4=;
 b=WMJhAxPoJN8DisxWl5waf30CVRgh8kXpifzL/ZQZvj1CU37xonIlh4EjK8nqXOgdru
 4UOSWWA40MXJ7llJBClZ+d/IdMWlXLpjY1Al7ROmfHu+NTQqXcek8AoEPmfUdsSVrX5Q
 QRLYuwRoHzo8cDyTfn9ojZ5xuOHDrY4pnH8VEA1/lQ0C8xYyuoBNdXLtAY85scCMFfij
 M53oi19xU0GthorbJYhBabIsArXAA9CQUuftZ+CyfDUEj5GIZx98URVtCXFaepwRgMhA
 R1LZljKZ//WCeqs575PuMzJaSb5mjzHRtcOo/ZUALQJ24bP/pdqEzsXd1O+eb1/iyBlZ
 ACdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bEt/v03msRhcSdb84WAU8NHWudPBzPmtzl8y/Hh3kS4=;
 b=DcqDhYT+ntgmwRe3u+f7xGRlHJiGJCx/BursCB+xyLofEnHp2yPAiXGjBQm8kG9S1x
 N9VNj2SuL4SVvGRWjdvom7QdU2t1BLw3X/3YDcL18irz5RG9J3l5F6Zc1U0aI1rK80tZ
 0o2TVhF71fmgy1ZtP3M5G21Zb9fZFo9MbbeU5D9MrEf/CXY6VfbRisHeug1xl7AR1JXl
 +DAg9sUFFZyj6bhmmuKlaNvcqjJbum7COqQJ2/zW1XVNEUHJqY1IIHIUA0QTZ9vh6piQ
 sAzq0trYXzryq82OkFRRYUqKA1HTWiUIveUkRC9bu3a9wy1BAWwHVyQxynJtrhxt4j0d
 CCwQ==
X-Gm-Message-State: APjAAAU1Gv8/sZbK+/of1NTVcgfrHWIsJO+bYXNHF4KUTDafWfn5c1VA
 igqJdyNOnzfPfjD4C4sOSsk=
X-Google-Smtp-Source: APXvYqxAONevxOs+Hkw8NzwlLEpAGF1KjUE5QTW87zosAlr+KlXZG8qaFyXXXByHEzhUij/y1LvOtQ==
X-Received: by 2002:a62:6801:: with SMTP id d1mr31832332pfc.117.1567403400103; 
 Sun, 01 Sep 2019 22:50:00 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.203])
 by smtp.gmail.com with ESMTPSA id 136sm16533912pfz.123.2019.09.01.22.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2019 22:49:59 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCHv4-next 2/3] arm64: dts: meson: odroid-c2: Add missing linking
 regulator to usb bus
Date: Mon,  2 Sep 2019 05:49:34 +0000
Message-Id: <20190902054935.4899-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190902054935.4899-1-linux.amoon@gmail.com>
References: <20190902054935.4899-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190901_225001_229529_7A1D96F2 
X-CRM114-Status: GOOD (  10.65  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add missing linking regulator node to usb bus for power usb devices.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Re-base on linux-next
Added Ack from Martin.

Changes from previous patch
[1] https://lore.kernel.org/patchwork/patch/1031243/
split the changes and add the comments to power source
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 0cb5831d9daf..d4c8b896dd26 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -36,8 +36,15 @@
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 
+		/*
+		 * signal name from schematics: PWREN
+		 */
 		gpio = <&gpio_ao GPIOAO_5 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
+		/*
+		 * signal name from sehematics: USB_POWER
+		 */
+		vin-supply = <&p5v0>;
 	};
 
 	leds {
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
