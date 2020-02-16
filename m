Return-Path: <SRS0=DmFH=4E=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AAC6C2BA83
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Feb 2020 17:35:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FC952086A
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Feb 2020 17:35:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IMx1HJhY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMejrEl7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FC952086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1WtLQaxu1heulHzM4QR9CRsDp1DEAsoZ8ZwcP0E14vI=; b=IMx1HJhYBP9Iy8
	+KD2jfhduv2nf5QFEPJOozgZoihhC4hF2ADMJFFUZtsBSmjHYHMCe3H6kp1xAjFLJEPJhhpgs3+vr
	h/odZ9DPYOECIuk04G7r5vWEb2U+4NZtvy5EZMdUgXpM5S/GaDXHJhPGqWIVpti0gwQIfiPZDxdmk
	imMEsWy83XteyTx+wauYKrO0O4a0uVHdBHBk6XB91cCCJ3rKyw1y9YsGEwbQ9YBkJKhBbhfHBokm1
	P1+1cpLd4QCjwcZsProc+EgIbHN/cr6gM9vQ6moMHQ0DjR7DmuBwXCZej++W+nDuPhTFTuZRVT1PL
	WfjIuq7HCGaTwKLx/VVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3Npe-0000ho-HH; Sun, 16 Feb 2020 17:35:50 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3Np3-0007qS-SJ; Sun, 16 Feb 2020 17:35:15 +0000
Received: by mail-pl1-x629.google.com with SMTP id y8so5756081pll.13;
 Sun, 16 Feb 2020 09:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JPM2kqx4hlDXSNBDa3izQLbeJ7f1jy1y8czH2Ne/TYs=;
 b=IMejrEl725fqCXBPzYt9wmJUvxnKWr0ybMDAva6F56fobzg5h1czrrqJ32BVqj3Lki
 uF2pqycVRAub8wF470gHyC7O/uukwgYhQwuMlDiJZNwmdEFZTNc22YvxKjwqBNS2h1P5
 TVD0CCcGtcrp63oBFDlzB9MLIt4C62A15uR7Dt5mRklg/IDE4wl9Nu6Gzhj4oZu5oee3
 jPjt2AwjnwZoQuQR0SHvpmwrHjuocsM6cr45QvQiMUgRC0lkbKiAsO+SSdrj49CJhszq
 nWxn1JBEAiZGC1eeeuvWRGANygkQYdVY8FWEaAO9kp16OKk5cn0Jh1WRGjca8BQKrvUK
 0Czg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JPM2kqx4hlDXSNBDa3izQLbeJ7f1jy1y8czH2Ne/TYs=;
 b=Z1WDGZb1Xm1LaQntzmy773z3886S7TnU9FW+vXBfU42JEFUR/4Zyy4/akN5843DQI6
 BVBzWE0JTCl43BQs9ntIORHlW4/fzuq0FxGKXgH+OeIE2IDSx8jPAe5WT9v5v0DpvmcQ
 HB1Q8iciK6Ojp/eZTsf5OBX1Oz+SQqpaAgUb+gNoX2PsKMD7KIh+qy01SRFyqmnK0Jww
 VIul2Eg03/9/vNtqJDUYH0CrXhGqzhfWP/8XlYpE9UFNiyqt2As4Vn4f+Z7zkuAZwiUI
 OssiwbX/CwINzwBqSy1KBRWDkUvzur9rB9lmTtroc6ahOFiyktVlsCnpq+xVrx99cCB4
 tUww==
X-Gm-Message-State: APjAAAXuE3JgoDj3fi0twkbHKctSlc95rUjmCSLsD2b/kQD4onOdY2iE
 zmA7phUt4r04BPFfpKOYs4qOvMeF
X-Google-Smtp-Source: APXvYqwNzqmeVTiT7B3ggj00IH6FrnYaVsK+XBkavG5u0s6WRDvhKYzANPW5j9VnHOG0S/Ue30dTkA==
X-Received: by 2002:a17:902:9a45:: with SMTP id
 x5mr11818858plv.296.1581874507557; 
 Sun, 16 Feb 2020 09:35:07 -0800 (PST)
Received: from localhost.localdomain ([103.51.74.127])
 by smtp.gmail.com with ESMTPSA id a36sm14284724pga.32.2020.02.16.09.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2020 09:35:07 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Subject: [PATCHv1 1/3] arm64: dts: meson: Add missing regulator linked to
 VDDAO_3V3 regulator to FLASH_VDD
Date: Sun, 16 Feb 2020 17:34:44 +0000
Message-Id: <20200216173446.1823-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200216173446.1823-1-linux.amoon@gmail.com>
References: <20200216173446.1823-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200216_093513_941955_347225B8 
X-CRM114-Status: GOOD (  10.66  )
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

As per schematics add missing VDDAO_3V3 power supply to FLASH_VDD
regulator. Also add TFLASH_VDD_EN signal name to gpio pin.

Fixes: c35f6dc5c377 (arm64: dts: meson: Add minimal support for Odroid-N2)
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 0e54c1dc2842..353db3b32cc4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -51,9 +51,12 @@ tflash_vdd: regulator-tflash_vdd {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
+		/* TFLASH_VDD_EN */
 		gpio = <&gpio_ao GPIOAO_8 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 		regulator-always-on;
+		/* U18 FC8731-09VF05NRR */
+		vin-supply = <&vddao_3v3>;
 	};
 
 	tf_io: gpio-regulator-tf_io {
-- 
2.25.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
