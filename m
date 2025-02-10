Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79218C021A4
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Feb 2025 15:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+1Keq1zplp3CXx7tTqoAswse49cDDDjSCGPE0sT5QY=; b=Kc4kdmQbzAdM+Z
	JD0BFErVR643d86Rq8ED9toQXHCFgswxb8TOjWGsrKjYQrn06xwQVdj/JI0AMQk88mqgsCPGGZy0i
	09/j0xP3wZZKmqRSnSfh3OFKDOB9fkk6BaqQ9hcKNHQCGLubCYchkCtLf0h9B+rppU1xBK68Vohuv
	pHmllMzmbo3q8lXHOK3FaB7icXVY6L8mNk3HE3tPULPCzFsinelFDkKobLie8e9ycLMoRw9UOs7lY
	OzPJk9oJgWoUQWKXbMdl+qtLjobGjCWAn6jEBurePYGOkXRf7H0Vib19xRi7MT4VaZN64l2S0kr7W
	Ccbnb/5JSNzHWHYHD0SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thVJ9-00000000EGl-2AXI;
	Mon, 10 Feb 2025 15:02:47 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thVI7-00000000Dxf-2Efn
	for linux-amlogic@lists.infradead.org;
	Mon, 10 Feb 2025 15:01:44 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aaec111762bso1083304166b.2
        for <linux-amlogic@lists.infradead.org>; Mon, 10 Feb 2025 07:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739199702; x=1739804502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Zy3IZpzQXEf48BiX24sRog0zkDKc85etGewBmE/vSM=;
        b=W1aKcmokUpJfMkQUAtDZKl/5q9bz0WASBrv0kwxdIqFXdbtOFszSYtzFq8VQvoxuo1
         GcceGULsrJtFjQNDJtmtn9+9y5iE9tFVWRNTmudZopkcpStpJHUD58rxguwtZzeMSsUY
         vu0xhGQj38VWsTxOTKwc4tFtvWKHXDIv6Q4KLKXRkCsISi4pKN/1LGBvcEytsaK7mCjH
         WhY8tgHqfwfVM6OPH6ZnMdUGoJHX4ZQkJOK5pBZkH+wVRCq+vD92PDjvf2lDkbO3GCB2
         14UIVyPv0SBtGYu7u5Y1k/WneUoeG9qNInF+Dj8uDc7GVpPkNOXxAN2WUyX2gNu1XHXX
         8zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739199702; x=1739804502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Zy3IZpzQXEf48BiX24sRog0zkDKc85etGewBmE/vSM=;
        b=oblDW+o3kWJOEgpjAMuVtq+GY1/rl0jeNr1OLlAHEK11WkmPM0wokUkye7B14lJMv7
         6oR8TXhENX60Ez45GgmmVYKrKURpDb+EjJL9rgUkg59H+aBIN6Hh0UpH2A+ZnYme4hhA
         xFPuzpxp2eYLaqkGkDn2/an36fYcQ4v459IwC5PlIHoek9D5q4PfQ3gpGIKLNxo9Qs7V
         WMxtGvNEUyx8+F4TzFmIBVotzR8Rwv/Q61lYr4SnrohwCQdu7LeK4GJxmd2591zinhFI
         BeAUBIGL5SS/fsjXpCSWRqdQLNI9IWdEZfJ6fOOoAZtWe7ut/dOMYgfNdUrajJKm6kND
         3/Ww==
X-Forwarded-Encrypted: i=1; AJvYcCU1dCjKFS5M6iESW1u7a6GWdm1bVyJvldRxpiRGywiUNUnTuJ7l9zgq6vsYuhDAfThmuALsAnDTyxKUMC5h@lists.infradead.org
X-Gm-Message-State: AOJu0YzegGgHYPqSzrsMNaE0PseZuhK5Zsy1p1idBbaCAsdk8vTUKE21
	QEX+zwNSnk86qM9Md028wc4sNn5oYdukn+LYZgINmwiVMtofUSWeqRlP6c529AM=
X-Gm-Gg: ASbGncuUF5qkLAozPLRkPHZeE0bofmIbunxZQGwM57gnvTDsfVlmpKNUgAs6yZBngRB
	JcgkarpfNeeDZUram8Ci4AWDCSn4U81EhHQRJHtEGqjiNFXnDUOGT311nctiXgeJV0QHwKyOczZ
	UllBgVN1aK+0aHHpq0fBgU3ZTOfik35HC/ZIfotBGcGSaqzL2nhQW59ZiB9WzhXXo8JOU0gaMtS
	YpATaASmXNHhDSf+D6M2ReMNh4qAKqAVdGrTg7KiZ9VbDdP8PLujJX2ZtbfKJGRlPtwvDqumWlY
	pYbuaWNlsFist3XJj2S/JLvAFj20
X-Google-Smtp-Source: AGHT+IEbHPd1oSXP7eD15imjc/jvWXdr6BpOIe7NB5TG+hcbBq9WIktQHOMG5ONOKZqK3lCo6o+VLA==
X-Received: by 2002:a17:906:110c:b0:ab7:c3c9:2ab1 with SMTP id a640c23a62f3a-ab7c3c92cd1mr373031766b.50.1739199699671;
        Mon, 10 Feb 2025 07:01:39 -0800 (PST)
Received: from localhost.localdomain ([151.41.218.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bec717f7sm250400466b.81.2025.02.10.07.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:01:39 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
To: jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org,
	linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH RFC 5/6] arm64: dts: meson-gx: add audin support
Date: Mon, 10 Feb 2025 16:01:28 +0100
Message-Id: <20250210150129.40248-6-vsetti@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210150129.40248-1-vsetti@baylibre.com>
References: <20250210150129.40248-1-vsetti@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_070143_580925_7440DDCA 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
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

Add the AUDIN audio device to the Amlogic GX SoC family DT.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   |  8 +++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 25 +++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 2673f0dbafe7..594d7de606ec 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -304,6 +304,14 @@ aiu: audio-controller@5400 {
 				status = "disabled";
 			};
 
+			audin: audio-input-controller@a000 {
+				compatible = "amlogic,audin";
+				#sound-dai-cells = <1>;
+				sound-name-prefix = "AUDIN";
+				reg = <0x0 0xa000 0x0 0x308>;
+				status = "disabled";
+			};
+
 			uart_A: serial@84c0 {
 				compatible = "amlogic,meson-gx-uart";
 				reg = <0x0 0x84c0 0x0 0x18>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index e2026b7aa03f..2db6916684fc 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -94,6 +94,31 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin {
+	compatible = "amlogic,audin-gxbb", "amlogic,audin";
+	clocks = <&clkc CLKID_AIU_GLUE>,
+		 <&clkc CLKID_I2S_OUT>,
+		 <&clkc CLKID_AOCLK_GATE>,
+		 <&clkc CLKID_CTS_AMCLK>,
+		 <&clkc CLKID_MIXER_IFACE>,
+		 <&clkc CLKID_I2S_SPDIF>,
+		 <&aiu AIU_AOCLK_DIV_GATE>,
+		 <&aiu AIU_AOCLK_BASIC_DIV>,
+		 <&aiu AIU_AOCLK_MORE_DIV>,
+		 <&aiu AIU_LRCLK_DIV>;
+	clock-names = "pclk",
+		      "i2s_pclk",
+		      "i2s_aoclk",
+		      "i2s_mclk",
+		      "i2s_mixer",
+		      "i2s_input_clk",
+		      "i2s_aoclk_div_gate",
+		      "i2s_aoclk_basic_div",
+		      "i2s_aoclk_more_div",
+		      "i2s_lrclk_div";
+	resets = <&reset RESET_AIU>;
+};
+
 &aobus {
 	pinctrl_aobus: pinctrl@14 {
 		compatible = "amlogic,meson-gxbb-aobus-pinctrl";
-- 
2.39.5


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
