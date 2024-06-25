Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1E7EC2BBCA
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jun 2024 14:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zw/FZn7DORraXr9gYK053FtSsKXN+Cuh3zS7GkLrfuw=; b=luyzmgAklt1/y/
	+r85hR41wnse7dKVmiJGefspvsqdpQFX5+RE/hoFGnBvqNNk4EA+h473qXlWlkWg/OVT2eC8NA4C1
	AbxnMo0oSlXiFnyAQzxQABQHfZ2VQL72Fh8yQt8ts+6cGQJBvHT1TfX7V6w2dvo76oc6L97DM9P3l
	B0SdFVzhBi/x4sUXh6Bj0zbQ22JSVYXXxlS5QD3pUXgO+HTRVhANg0Iq+oqUg8EIxlRenNDREd+gB
	mcyBqa//c3vkX2QqcuRCjTC15zstXoxDIL6xDfIlCGa/4K4SpVAYle/kKvwd7EOGYrSJ+9Bgu34Ww
	L9Jm2zpk1hXhlC/SSJPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7VI-00000003Fmq-2C9R;
	Tue, 25 Jun 2024 14:50:40 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7VE-00000003FjB-1J76
	for linux-amlogic@lists.infradead.org;
	Tue, 25 Jun 2024 14:50:37 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a7241b2fe79so366399766b.1
        for <linux-amlogic@lists.infradead.org>; Tue, 25 Jun 2024 07:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719327034; x=1719931834; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNAdTcacMLHiwcp3rwtVy5TsM3diOedzVRX0xlC3b4s=;
        b=pE6BuWNuuZA4SEVU44ip//CykraokctMtZS/Ljjl6GQrceTKNJTbEIUYp3vw3a7z52
         RfCzskRWj6lgUP2NZg2UbB+WA0IRZyRMp7Q+tfbaVEASuy6vVBV7q8XbuvWx/S2lD+QX
         B8dYc+QbnR2slx7tukzozB2Vp8L6axa/85dwR7lbQ5A3fXu6QdAwcQd3ivFAtqVmYWXR
         YPWsdM28/tqAzwqz381yUSMDb8cT0DuH5Rp54FXPuIFWw5epFoIOaEaDYIUxo/VpUWMp
         hVZ1hbugk6fdyIIzzOB0Cev8j4TpkhwHpLPqz6n6q2EHkWuOiZWjCfLxAwXR6hmOoKEt
         F+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719327034; x=1719931834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNAdTcacMLHiwcp3rwtVy5TsM3diOedzVRX0xlC3b4s=;
        b=UKjS9mwTFwoLsdbqoAedtHE1Qr9GhpO+ncHrzuA6iBCDMR9E5VHX/8XOXlbUlsPQy9
         VlO/5Luq3mTLy75GSzpmRg1ny/K6kfMj1hkggmyRTCSyKJp6Gjm4agEwGHs+y7LWQMr5
         LCAV0qPdncY4w/wd6DKJ4BcDtH8Q0sfZkJu2l2ST8P5kmWUphOKdAgerdedl6HleTX0x
         QbhJLVo9f0MricIvqPkkYCPTlnZV0BWyGbunBOE+oXZA9U4gL6JREFRU76IkFn0Remzh
         3cVAdJ5doWkU3ZNPWUhpWjiOZIQUqHExBUssOxSD62TjuUFn7SVBAOFjdaquNTeigBaO
         D/VA==
X-Forwarded-Encrypted: i=1; AJvYcCV3JiBnq1Adov5kTbEXfGz50aEUqNzh0dCgbM9q8PUKumMhA/oBt01LNHzlO8hI4TGdNV5d0ehneqE2ElGdx8/Q/zQZaP2AtJsNwFuqBYHZfU8=
X-Gm-Message-State: AOJu0Yz4eq9im4id080kEIOw9J9DZTtOZ3woRr3wY3l3oLSHrfpKIhvx
	yXLlQrTQqACZN7X6mY9l4DVVfZy66LYIiKd3D0xALsGXm1rir8H1vppNhlV8HZw=
X-Google-Smtp-Source: AGHT+IEAx+7PNBsfh1PecChpyxyxGCwBCHXZraE/xlVLiq1yJ87mv2cTQeKVv1iemDFLo464qB8MVw==
X-Received: by 2002:a17:907:a649:b0:a72:8135:2d4f with SMTP id a640c23a62f3a-a7281352e3cmr12762066b.48.1719327034140;
        Tue, 25 Jun 2024 07:50:34 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:b30c:4c5e:f49e:ab33])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a724162f037sm355945066b.194.2024.06.25.07.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 07:50:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] arm64: dts: amlogic: add power domain to hdmitx
Date: Tue, 25 Jun 2024 16:50:15 +0200
Message-ID: <20240625145017.1003346-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240625145017.1003346-1-jbrunet@baylibre.com>
References: <20240625145017.1003346-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_075036_400671_DE3DAB53 
X-CRM114-Status: GOOD (  11.19  )
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

HDMI Tx needs HDMI Tx memory power domain turned on. This power domain is
handled under the VPU power domain.

The HDMI Tx currently works because it is enabling the PD by directly
poking the power controller register. It is should not do that but properly
use the power domain controller.

Fix this by adding the power domain to HDMI Tx.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12.dtsi  | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 1 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 1 +
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi  | 4 ++++
 4 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
index e732df3f3114..664912d1beaa 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12.dtsi
@@ -363,6 +363,10 @@ &ethmac {
 	power-domains = <&pwrc PWRC_G12A_ETH_ID>;
 };
 
+&hdmi_tx {
+	power-domains = <&pwrc PWRC_G12A_VPU_ID>;
+};
+
 &vpu {
 	power-domains = <&pwrc PWRC_G12A_VPU_ID>;
 };
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 12ef6e81c8bd..d8a386c31914 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -315,6 +315,7 @@ &hdmi_tx {
 		 <&clkc CLKID_CLK81>,
 		 <&clkc CLKID_GCLK_VENCI_INT0>;
 	clock-names = "isfr", "iahb", "venci";
+	power-domains = <&pwrc PWRC_GXBB_VPU_ID>;
 };
 
 &sysctrl {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 17bcfa4702e1..82386feb5177 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -327,6 +327,7 @@ &hdmi_tx {
 		 <&clkc CLKID_CLK81>,
 		 <&clkc CLKID_GCLK_VENCI_INT0>;
 	clock-names = "isfr", "iahb", "venci";
+	power-domains = <&pwrc PWRC_GXBB_VPU_ID>;
 };
 
 &sysctrl {
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index cd0046c0fe72..c76dcb0158a7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -514,6 +514,10 @@ &gpio_intc {
 		     "amlogic,meson-gpio-intc";
 };
 
+&hdmi_tx {
+	power-domains = <&pwrc PWRC_SM1_VPU_ID>;
+};
+
 &pcie {
 	power-domains = <&pwrc PWRC_SM1_PCIE_ID>;
 };
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
