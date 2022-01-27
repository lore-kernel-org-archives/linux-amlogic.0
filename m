Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE0AC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jan 2022 12:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=whUDxLYo/Nt8ovOM9gAZcM2h5Fv+4tbpTy+fJH8O6wc=; b=PrZStC3qSW9pmi
	RYgw8wMSBFYzNhJ6URzV1hd9yK7OHA3Ttz7sfrq8j/TiUsE6OgFcD4kyrV8mOxrD4w+Ktx8lXAO95
	mzxMkr2M1nY2Uf7+1xTHZou7AYFvbGHSK+nXIxzL4tQ8JBcoJ9qwcEAMLHRw6uatVrTa46Nag1GyK
	VZpM3wAL/2s1hRwK8R/W+4SL6kRjwPByoD3/MBl2Gw66OZ+0ygyiGvSbVL4UqDsWJOeUQRHzwuFLf
	TaKoTwBiLH0uXybKZVAFgJJ/8KI42UyW9AbfZvGB2JVZk4BcmYu7/SiF1W32IIgpNKOkX4q3HO0zP
	P5Ar3R8FaRUatf0kYKrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD3uy-00Fi36-Hj; Thu, 27 Jan 2022 12:30:24 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD3u7-00Fhk9-NO; Thu, 27 Jan 2022 12:29:33 +0000
Received: by mail-pj1-x102c.google.com with SMTP id r59so2768693pjg.4;
 Thu, 27 Jan 2022 04:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:subject:message-id:mime-version:content-disposition;
 bh=Df2cXxSmkO2s9pXpUhby3GMrF2bLdrg9wsoaVHWzMUM=;
 b=KxK7NE+S+mXEX5orO1iOW14APsGPbD0uhLLhZEAEujZoAdoRFuSL5+OtiBW/p8iUXn
 rLL0aGvQnnjus1pcUBWXbsv/fYvBIe09OdPxE+lxvy9xKgIT9AOxxy5UWkpILqrRZhue
 M6Wh1nEBkYod/he+rrJcJ1kvY4IyIzqafipvwOVV1ZbYD452p3My+cCnTb8cFjr2XSZJ
 WByUXyV6Fsx0iK+QzoMJtwdBvTlPojWdMxqFUGvvYZ9gxJcwqeShATx/9RMoTCnah0hO
 2caYYmiaWJMh4f58DbIMDQqETr3GKS1MTLZ8ydi6SAJSW5mzJPKEN0Be6j63OH4TCUAc
 SZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition;
 bh=Df2cXxSmkO2s9pXpUhby3GMrF2bLdrg9wsoaVHWzMUM=;
 b=Hl/SdtlC75J13imlkGiC2gZ/eBt6d8eHKoHHCz8PKitL1nNR0dyfYUyWzAfcmyyfvm
 TlNc5Sh5JZGWM/5i20FXH2+7ZyTF/TR4L6D1V5wLK2Ho1iY99UD10RSlO6Pjogw1b9V/
 jxq2HxP26Ij+sTmEjaaBDTX61TfJEB9G92PCyKECxt7YdFTe6olz42uZnTzjEVQbxKli
 7ebkRS92UlCKsSsYnixGkZDsI4jeOKhOfv2WZba5/cgluhvYgLupEvblId7ZfjJi1LRQ
 kb1ynf4ak/JtU1lqrRqTfeU0WpcyfWb0iDERnRoGv7+z0QOka56xYxIKxz3nYHCbI5BB
 IgYQ==
X-Gm-Message-State: AOAM53208IZruT5f5yEOCFwFq3w2gqU/zUyV8wxFWvGmIEPlTS7heuHE
 snI9ce2z2h+YOe818K/WSJo=
X-Google-Smtp-Source: ABdhPJznD1M/6u5dCYTUMJ6rp986/OnrrC+fYL9/d2Ofe5ji5hxVaqM6bThe0dH2XZqbbGUw4JvfDA==
X-Received: by 2002:a17:902:d510:: with SMTP id
 b16mr3051347plg.40.1643286570494; 
 Thu, 27 Jan 2022 04:29:30 -0800 (PST)
Received: from anyang ([106.250.177.234])
 by smtp.gmail.com with ESMTPSA id r14sm6260943pjo.39.2022.01.27.04.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 04:29:30 -0800 (PST)
Date: Thu, 27 Jan 2022 21:29:25 +0900
From: Dongjin Kim <tobetter@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson-g12b-odroid-n2: fix typo 'dio2133'
Message-ID: <YfKQJejh0bfGYvof@anyang>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_042931_820647_8F36430A 
X-CRM114-Status: UNSURE (   9.80  )
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

Typo in audio amplifier node, dioo2133 -> dio2133

Signed-off-by: Dongjin Kim <tobetter@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index aa5898a58b89..120f2551a28b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -22,7 +22,7 @@ aliases {
 		spi0 = &spicc0;
 	};
 
-	dioo2133: audio-amplifier-0 {
+	dio2133: audio-amplifier-0 {
 		compatible = "simple-audio-amplifier";
 		enable-gpios = <&gpio_ao GPIOAO_2 GPIO_ACTIVE_HIGH>;
 		VCC-supply = <&vcc_5v>;
@@ -222,7 +222,7 @@ sound {
 		audio-widgets = "Line", "Lineout";
 		audio-aux-devs = <&tdmout_b>, <&tdmout_c>, <&tdmin_a>,
 				 <&tdmin_b>, <&tdmin_c>, <&tdmin_lb>,
-				 <&dioo2133>;
+				 <&dio2133>;
 		audio-routing = "TDMOUT_B IN 0", "FRDDR_A OUT 1",
 				"TDMOUT_B IN 1", "FRDDR_B OUT 1",
 				"TDMOUT_B IN 2", "FRDDR_C OUT 1",
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
