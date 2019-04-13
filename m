Return-Path: <SRS0=Clcc=SP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD44C10F11
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 16:37:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05C7A21721
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 16:37:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c5hAkwhB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Luudy5lA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05C7A21721
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5GXFbX1K+OIhiJ0oFsijX9AXO29TlNVdV+HjXOuY0y4=; b=c5hAkwhByWvqUB
	O1o/x1/+zT9dsP1QOzjYyHRQQtWneUjsijCUvMNQyuIETDqXUu2dTDifMXms6eNj2YWiqMhNsoC/0
	gMcgNjxB6LczmU73L11BQfawSaSj60VAnyfjqscqJS5TTv2dxXdkFLierTTPWoTVDSNxJwt6rtGL9
	u0sz69MFJUM11++ZW2Jxm6ll5QfcuL5zi3Ri5HHPEVBqgsv4/uQLlJKvVjWS/Ce7gkzHyJckepgxy
	amsqtOyk4JGaEeGKQ1hSrjpGQDWbY/A0P7K0b0jo5/3HKHzVdvYMiZHSirl9I5qG80VWYk2grJnae
	5MizZdqNED9j3DPIT4xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFLeL-0001hU-7A; Sat, 13 Apr 2019 16:37:05 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFLdw-0001AQ-8p; Sat, 13 Apr 2019 16:36:41 +0000
Received: by mail-wr1-x442.google.com with SMTP id q1so15979862wrp.0;
 Sat, 13 Apr 2019 09:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9AocJvaLHJoa4iYjdAkrd1jMBEY1Q6G0BQqKP8Q3BgM=;
 b=Luudy5lA0Jr2vYj0t56JgKfgDY00UwatGRG1UI1cDJ7n7e8/X1uBfG6YcApvWFVo8V
 2ZwDGVUicsELiTeIADUWV4D4RilQT0Wv3oZs4yV1IikKqgYq3xjyG3ltNM1Tp4knqaIg
 XLZLpLLwhjwK1DjjR81w8qcAFYd/e88AfNu1ZgLDg55BnHP3oFBCu+VfsvAasSOr0djK
 wacAUzg5quJDb3+xJuoSNhYEA47Fj5WkeH4/+rso/yMsKqwFNgUShA60SnnVOfgTKmu2
 Aa/fDBjOREhr/G4zFfhnCCp/CBOlQChEwJuuHILUPMAi7qF/MjwUJ9CilFUo1AmY59jT
 tjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9AocJvaLHJoa4iYjdAkrd1jMBEY1Q6G0BQqKP8Q3BgM=;
 b=T3EqZWEpaC1fugcO9ARF3s5i+ehs+mWCSfFI8WP9+je/70WyZFLWINgIJCiwYySNzy
 JgT2CuP2mCIcTUY75mYdzAQJSdftpnwcLxsAhmNOAo38L0iK/Q0GYtNvA3VtUY6UM8cS
 ulE8yYaFlYUAzGU/tH9f6h6rSIgESKntcyDS0DZ69/qTG9XOxOg0xKALha7kq2cOFcg9
 +QLg90syS7PRSWkd/6j0r+E0wbDMQcN3/QRYW970itQTEdP0EhSwBFzs3zxgvTajGcAi
 hH9fCe4e2h/J5yyRpwutoQLsUFSXAriM79w3PzDazUi0YK2+hWNh8qsQhilRVK4gpCAw
 lu7A==
X-Gm-Message-State: APjAAAWGHVId+AgcF6qGLguvKk2JrUgEgHldHlvu4rG3HjXAjw42pWZL
 ymtBMAywm6euJ1KDfDcrEdCdsBBF
X-Google-Smtp-Source: APXvYqxeR+dM/qboqMgoFunM3kgqRM3vJqoEnr7pd9afz0HJ9zGoF03qrolR2iMoYrFJi40vk2tIiQ==
X-Received: by 2002:a5d:5343:: with SMTP id t3mr38812600wrv.49.1555173398286; 
 Sat, 13 Apr 2019 09:36:38 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C8AD00714E418F6C82D049.dip0.t-ipconnect.de.
 [2003:f1:33c8:ad00:714e:418f:6c82:d049])
 by smtp.googlemail.com with ESMTPSA id j3sm106200069wre.51.2019.04.13.09.36.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 13 Apr 2019 09:36:37 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 2/3] ARM: dts: meson8b: ec100: enable the RTC
Date: Sat, 13 Apr 2019 18:34:22 +0200
Message-Id: <20190413163423.15149-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190413163423.15149-1-martin.blumenstingl@googlemail.com>
References: <20190413163423.15149-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_093640_316390_4F5A5324 
X-CRM114-Status: GOOD (  10.52  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 jianxin.pan@amlogic.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ccaione@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The RTC is always enabled on this board since the battery is already
connected in the factory.
According to the schematics the VCC_RTC regulator (which is either
powered by the internal 3.3V or a battery) is connected to the 0.9V
RTC_VDD input of the SoCs.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b-ec100.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b-ec100.dts b/arch/arm/boot/dts/meson8b-ec100.dts
index 3ca9638fad09..9bf4249cb60d 100644
--- a/arch/arm/boot/dts/meson8b-ec100.dts
+++ b/arch/arm/boot/dts/meson8b-ec100.dts
@@ -88,6 +88,14 @@
 		};
 	};
 
+	rtc32k_xtal: rtc32k-xtal-clk {
+		/* X2 in the schematics */
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		clock-output-names = "RTC32K";
+		#clock-cells = <0>;
+	};
+
 	usb_vbus: regulator-usb-vbus {
 		/*
 		 * Silergy SY6288CCAC-GP 2A Power Distribution Switch.
@@ -347,6 +355,12 @@
 	clock-names = "clkin0";
 };
 
+&rtc {
+	status = "okay";
+	clocks = <&rtc32k_xtal>;
+	vdd-supply = <&vcc_rtc>;
+};
+
 /* exposed through the pin headers labeled "URDUG1" on the top of the PCB */
 &uart_AO {
 	status = "okay";
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
