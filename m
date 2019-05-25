Return-Path: <SRS0=XJ9a=TZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8ED4C07542
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 May 2019 19:02:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC5862085A
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 May 2019 19:02:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i7Aj6HEM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="athd6wnv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC5862085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BZMcQISYHC8Q9W8/VJMaIq/ONChQf0hG4MzF9C4VJvQ=; b=i7Aj6HEMVyL1GB
	gfchGfTY8sgO1++VBGwqMrvRLIh1o/cQbqzYkdoK7n6PRgq6TSrcNU21sr5FpLTbidbGinFdPe4bw
	DrqOZJbQ5Fa+eH2RYa8AipLxLNjaDnJQde+PGjlQdXJ6sXAawNU1XdiTdEV4cARpYGcWO7CkZf3tH
	iFgzbeZJmvM07q7c45N6cE8GrNs5FpIrGDdsH+N+ZKObU9WX8p5fOICSAKhnFOF+AvEMv0IN2Eznx
	vE6sIJugACJ4G2zGyLJykCeVun9C4zeQo9TP3oi/nWOq4mV5x7plUJp66JRYyVzRyE6txE5d95vMt
	4H6UZFQgNPB0TBwI306w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUbwS-0002MT-O2; Sat, 25 May 2019 19:02:52 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUbvr-0001WV-MI; Sat, 25 May 2019 19:02:17 +0000
Received: by mail-wr1-x443.google.com with SMTP id b18so12985391wrq.12;
 Sat, 25 May 2019 12:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wwuYv3aJc+Jn6CC+ws46Y8JvxBizBD22MAUJcAPoAWs=;
 b=athd6wnvzMFvUabNQ5m23SBnvwwo2uiQkJ3YFUL8HHiVgS4lEYg6Ehj1l7FuqSYAIy
 o98L0uICFvssWTZYMTW/Doe9uC+xur1WNzSrjeEQHUmG/d1v6jTGYFink/Xl3TR3U/iw
 lF4ZleVNnzs6AlkJGWSjMCpo+YG+U8pxgBmuwel5k8rVrgRYmyv9DJ34SRLmcXKksFUk
 fmr+ka5pylHD/8r+x1yyl6fzKXZa9r/E6bZ7L/CmXtMj2mUjtNP5Sa9Jtu0v3EwyqW4H
 dTCjunvDz/QeyqxwI+vYuE3dXHKPWRhTnPJ1pYBkwrAumt7SwU00e3qP6qEpAahTC5qS
 h9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wwuYv3aJc+Jn6CC+ws46Y8JvxBizBD22MAUJcAPoAWs=;
 b=omK2Gp3q/uK30MK8bjaDNAI2ms8qChw3baLP70N/23Mx4dnj9eKtkJLFVH7uBVZuHt
 1X4MKW+l5+HwrtxB3AZ6zaDgDIqRBjYQ1ctZEpmvgoIKm2kjAEd7FP4KPNngXofFxB6a
 2auHI80h8VllW26mOrrNxKd+nzeYPCpKrRcZQuL4DZ7Q17+oGLn0EJ3aMeFNIntfSCqx
 G6HTq0VWr3zUzBFO+CFdA3pI/iy0vwlxRAZA0rnZsc3ebC901OkQB06Y/hQotvxE1kY9
 DYOq3d1dHwTktF+gZSAaG6nbXVu3jl/JbwFc2iDAyNu6+xpLL/yujoU8qnfZtWzlUCOs
 12ag==
X-Gm-Message-State: APjAAAVplElzHHJdsm18Nlx8HOwI+woXn8LJ3/X06eHKn99it/cFLKjX
 LgzWtVz9mxcHx/4sgXM9Ej2Ksm6k
X-Google-Smtp-Source: APXvYqy52Xb3yRcwFLGBRb8J5DjY31vTTOpWN18I1HEqnnydCPU1mcr8g4nguQ6yCFdL8ZnffvoBmA==
X-Received: by 2002:adf:9c8e:: with SMTP id d14mr15880942wre.215.1558810934037; 
 Sat, 25 May 2019 12:02:14 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA4007CB8841254CD64FD.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:7cb8:8412:54cd:64fd])
 by smtp.googlemail.com with ESMTPSA id f2sm6870426wme.12.2019.05.25.12.02.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 25 May 2019 12:02:13 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 4/4] ARM: dts: meson8b: mxq: add the VDDEE regulator
Date: Sat, 25 May 2019 21:02:04 +0200
Message-Id: <20190525190204.7897-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190525190204.7897-1-martin.blumenstingl@googlemail.com>
References: <20190525190204.7897-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190525_120215_724458_C26C3044 
X-CRM114-Status: GOOD (  12.50  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The VDDEE regulator is basically a copy of the VCCK regulator. VDDEE
supplies for example the Mali GPU and is controlled by PWM_D instead of
PWM_C.

Add the VDDEE PWM regulator and make it the supply of the Mali GPU.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b-mxq.dts | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b-mxq.dts b/arch/arm/boot/dts/meson8b-mxq.dts
index 07f1cc513f8a..8f7a02c1e27b 100644
--- a/arch/arm/boot/dts/meson8b-mxq.dts
+++ b/arch/arm/boot/dts/meson8b-mxq.dts
@@ -116,6 +116,22 @@
 		regulator-boot-on;
 		regulator-always-on;
 	};
+
+	vddee: regulator-vddee {
+		compatible = "pwm-regulator";
+
+		regulator-name = "VDDEE";
+		regulator-min-microvolt = <860000>;
+		regulator-max-microvolt = <1140000>;
+
+		vin-supply = <&vcc_5v>;
+
+		pwms = <&pwm_cd 1 1148 0>;
+		pwm-dutycycle-range = <100 0>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
 };
 
 &cpu0 {
@@ -151,6 +167,10 @@
 	};
 };
 
+&mali {
+	mali-supply = <&vddee>;
+};
+
 &saradc {
 	status = "okay";
 	vref-supply = <&vcc_1v8>;
@@ -182,10 +202,10 @@
 
 &pwm_cd {
 	status = "okay";
-	pinctrl-0 = <&pwm_c1_pins>;
+	pinctrl-0 = <&pwm_c1_pins>, <&pwm_d_pins>;
 	pinctrl-names = "default";
-	clocks = <&clkc CLKID_XTAL>;
-	clock-names = "clkin0";
+	clocks = <&clkc CLKID_XTAL>, <&clkc CLKID_XTAL>;
+	clock-names = "clkin0", "clkin1";
 };
 
 &uart_AO {
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
