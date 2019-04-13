Return-Path: <SRS0=Clcc=SP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E79AC282DA
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 16:36:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0A4321721
	for <linux-amlogic@archiver.kernel.org>; Sat, 13 Apr 2019 16:36:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LHrfBnol";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="dnjEcHLA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0A4321721
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m7Njr6JbHZnSf3AIdKczYxo7M+G3o2P5v6CwZhIxBjY=; b=LHrfBnol6pfSop
	TMi6MrFCgfUT7Zedju2l08TPru13ZtWtf/ev3wAAoq2Bj76FurPwf4kb8h5cKG5c4tlX6m4F2Tc7D
	WMlSMNKe/BqbjxBbfwt+eY+anWmSljiQviXopXpQHqrrmPO1aNhp2Ivoy1+vlT+RStXLtV/l95q2M
	7YRZgC46aJnpu2Peepyp6drDWmCEcZ0d0u8JSlk0eBFc5Jh3kgB8LRxvCqOTNA0UN7lDq44JsimqD
	9K6l0IGmKkE/IWRX9Nu1oJez/xZw2J31t4Zc+doBR+E6ZTAVZjvBU9d/wsRhMffv9FGMHxZsARfHh
	ig0cxtjF2k9rindcfjzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFLe6-0001PK-T3; Sat, 13 Apr 2019 16:36:50 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFLdv-0001AE-6c; Sat, 13 Apr 2019 16:36:40 +0000
Received: by mail-wr1-x444.google.com with SMTP id w10so15955664wrm.4;
 Sat, 13 Apr 2019 09:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8LOVyhXJLZoTsXDBrD5GMoCBgvmfqnSxKbuKGLv7HJk=;
 b=dnjEcHLAoRyk+cvtQyouH/4TVcKGJ8E71XHOjrXLYiHWei1GzaUXi+eo1Hy/TNux+x
 szPCYHD5Da5Apk+LHOq+P1t1b2P7eS/7wqrjZwXPya3/CwZCBO9rs4JniuVfuWdYzhPn
 tzgh79b1WZ5Hw7vyWJg3clwnIPvHbo8noekifIwRmP78sRiF9Qo06rUgjhmjGVGby9Me
 I7CgyPoFseQPI3+6hhnYzVV71rOUp1xzv2amJrp7N8HygNaxj1Xk3XmE+YzTmJ8cMw6N
 vPYgNo+EuIBNMA922ybWE4aFEZIwu9tvv3/BhAyAlqBDoNf92n5naH2jLfvhgSDKIlSG
 vLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8LOVyhXJLZoTsXDBrD5GMoCBgvmfqnSxKbuKGLv7HJk=;
 b=MV7U+RM+/34EvZ3B1/b05fBrMhrE0J1VUZcIMRqs4FPomCKoxMwiokmHx/fwIaBv4c
 Ug0xCvae2ScybKel/ICZFmXpPUsD5XrrHJszf/fy8sHJja4apqKOxmI0K1PrL4mkZoGw
 9epk/cS2LDiXIrtbz7ZYFp73dYdIZALvfR1lgftg29mQqeGQGZdFyX/IygRR6Urv8jcf
 sr3AUpwaawZTcF2OateANwN3PRehcgG66of7rTv/h2O1QVEqmMMpGDXQgTKCXh7/qHN0
 xaAd5Qr5N1H1VHOJCWbf+mm8kgcNEgNT1PMtuHVuH+Z/RcWRkuatLQkmlugndG+RMszd
 pPEA==
X-Gm-Message-State: APjAAAXvcj8gGetO6cxoKaqaTPX+M/U3Ic86KRaCXsKu/VIMW9GtRALz
 HPPBs0ANIYr2c9KGX9JNH52/+6NN
X-Google-Smtp-Source: APXvYqxVB9hGCkjzanqpxnDdsmMzAp/LEGX/vRQZqbEOxT2DQoMCx84xCb0MHfJBPu09b5PULten3g==
X-Received: by 2002:a5d:4a43:: with SMTP id v3mr19357168wrs.126.1555173397082; 
 Sat, 13 Apr 2019 09:36:37 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C8AD00714E418F6C82D049.dip0.t-ipconnect.de.
 [2003:f1:33c8:ad00:714e:418f:6c82:d049])
 by smtp.googlemail.com with ESMTPSA id j3sm106200069wre.51.2019.04.13.09.36.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 13 Apr 2019 09:36:36 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 1/3] ARM: dts: meson: add support for the RTC
Date: Sat, 13 Apr 2019 18:34:21 +0200
Message-Id: <20190413163423.15149-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190413163423.15149-1-martin.blumenstingl@googlemail.com>
References: <20190413163423.15149-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190413_093639_240625_959FD995 
X-CRM114-Status: GOOD (  11.21  )
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

The 32-bit Meson SoCs have an RTC block in the AO (always on) area. The
RTC requires an external 32.768 kHz oscillator to work properly. Whether
or not this crystal exists depends on the board, so it has to be added
for each board.dts (instead of adding it somewhere in a generic .dtsi).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson.dtsi   | 9 +++++++++
 arch/arm/boot/dts/meson8.dtsi  | 5 +++++
 arch/arm/boot/dts/meson8b.dtsi | 5 +++++
 3 files changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index 6f54a8897574..8841783aceec 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -252,6 +252,15 @@
 				#size-cells = <0>;
 				status = "disabled";
 			};
+
+			rtc: rtc@740 {
+				compatible = "amlogic,meson6-rtc";
+				reg = <0x740 0x14>;
+				interrupts = <GIC_SPI 72 IRQ_TYPE_EDGE_RISING>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				status = "disabled";
+			};
 		};
 
 		usb0: usb@c9040000 {
diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index d2ec4af82cc5..7ef442462ea4 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -541,6 +541,11 @@
 	compatible = "amlogic,meson8-pwm", "amlogic,meson8b-pwm";
 };
 
+&rtc {
+	compatible = "amlogic,meson8-rtc";
+	resets = <&reset RESET_RTC>;
+};
+
 &saradc {
 	compatible = "amlogic,meson8-saradc", "amlogic,meson-saradc";
 	clocks = <&clkc CLKID_XTAL>,
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index df42e48f1cc1..800cd65fc50a 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -510,6 +510,11 @@
 	compatible = "amlogic,meson8b-pwm";
 };
 
+&rtc {
+	compatible = "amlogic,meson8b-rtc";
+	resets = <&reset RESET_RTC>;
+};
+
 &saradc {
 	compatible = "amlogic,meson8b-saradc", "amlogic,meson-saradc";
 	clocks = <&clkc CLKID_XTAL>,
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
