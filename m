Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A29EC636CC
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Feb 2023 15:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mivd2cZAjrkNvOfUh03WtOdqyVYkpMDe5fuSY2G7zQY=; b=iQNqHEzGVVQqC1
	yXKfASZtj8x1ztxqg2d9vPmZ0Csy2ihu9TnmOnXmd5vyyiqkiOkzkSo7f6stDKUfJD2dDEMY5Y/V7
	FVvepAV8f7yL+4KEcZsJ+gF8vjDVuLXruvXcuQ7EssqSySeGjw86GaujdTw5+lWjbyQwyKkuVtFH9
	bdO6EXXSFxpc4L2/tpy83voQYFDER0CEXA1O8rD0e8UpbtvyrMQA/Fii7rloyif9TwS7UcXgGgS3d
	rbwoZiBKbLz3w7cbNBQj6/PZuPRgihHeMMk4lLjJmB2vbL3VaTgDHpikbIhQfBAKeExem1PZ+klnR
	16VhHZlnNlEGPeFRNW9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPbf-00Cdgm-2j; Tue, 07 Feb 2023 15:10:03 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPa2-00Cchb-SZ
	for linux-amlogic@lists.infradead.org; Tue, 07 Feb 2023 15:08:24 +0000
Received: by mail-wm1-x336.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so13414641wma.1
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Feb 2023 07:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IM6mE5QQJpoqds1gCo8qiNxsAn2F9Tp8VH6d29xrfwI=;
        b=msjrh5RvSQF4TO2MTrbvAdH1SIzX8qirZgDIqT8zPGcCttBfBO2aKJYczm3tLgINYf
         Qm25Gpi4sx6LSXODawg+CUcgeHy1ocbhFJS+XNuRN3oH5Cr1RgIEV4hGyqdYK9tHwE/h
         DjbL6fvtCi0yLcoFQSoDLjNvYN4VfB0V1oKL09Xm3vzldoxc6xnkZnZ5VTZhXVaFaEJz
         0BF2I2V/bIVxRidQWq94ip9VSrx8NF3uIstW8TM3f9W/aUs0HyMLXfORHoOEdBowRlvn
         prNCA+K81bYSgWchPkqiLDkNOZu96hdOhfhnL8wEbmwSL0SHy+EBZdx/6Ovmm3wSNCRU
         Z8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IM6mE5QQJpoqds1gCo8qiNxsAn2F9Tp8VH6d29xrfwI=;
        b=M1KnP3o1Zohsc0+dicKZVIDQBjRw0ZgkTTLeo2jQcTEFDB4PKR5L0MoC5tDTj7H0m1
         DOo0w1vhQzlO8JWw9Lsq3WglwWWchvDb6TXDb9vCtX58TPeh51dmV8vQyVErpukVXMPs
         RYxoysh1PFi8M/fidhuZdc0cLpb5j5I7BlMBk20w4Y8IvvaZK2ngShq1/m0PVDn2JmAG
         3Y4zvgAltADfxHLLVZE9cKPe0+D4mFiMAPQoJTTJcojLIjORLbMmTNA97FzCCvr1FWCH
         9V2g6Da9nf+QdEEN88gzOENS04PwY1tyBZyH6MRtfaMT98aWTCwYjoJAq0r/gCzNXXkv
         l6iA==
X-Gm-Message-State: AO0yUKUWEI3iX9/vbq8gPE+7MOAtoJl3XBGU8FH+KxhzoVBrrvWByYZE
	RZ2SgbjXD9oHQKC/C4/VXGikDg==
X-Google-Smtp-Source: AK7set/JcKh5pGWXFRtFWAidVapjfTFJ5cZn5R7xUcLHFuz1iVF/XQN7UBuy3Tqic1S84xzLspt+Fw==
X-Received: by 2002:a05:600c:502b:b0:3dc:c05:9db6 with SMTP id n43-20020a05600c502b00b003dc0c059db6mr3321667wmr.33.1675782501689;
        Tue, 07 Feb 2023 07:08:21 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j33-20020a05600c1c2100b003db0ad636d1sm22092173wms.28.2023.02.07.07.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 07:08:21 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 07 Feb 2023 16:08:00 +0100
Subject: [PATCH 7/8] arm64: dts: amlogic: meson-sm1: use correct
 enable-gpios
MIME-Version: 1.0
Message-Id: <20230207-b4-amlogic-bindings-fixups-v2-v1-7-93b7e50286e7@linaro.org>
References: <20230207-b4-amlogic-bindings-fixups-v2-v1-0-93b7e50286e7@linaro.org>
In-Reply-To: <20230207-b4-amlogic-bindings-fixups-v2-v1-0-93b7e50286e7@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Christian Hewitt <christianshewitt@gmail.com>, Yuntian Zhang <yt@radxa.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_070823_037251_6E20D27C 
X-CRM114-Status: GOOD (  10.60  )
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

Replace enable-gpio by enable-gpios to match the bindings.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi | 2 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
index e1683e0630b0..17045ff81c69 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi.dtsi
@@ -105,7 +105,7 @@ vddio_c: regulator-vddio_c {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <3300000>;
 
-		enable-gpio = <&gpio_ao GPIOE_2 GPIO_OPEN_DRAIN>;
+		enable-gpios = <&gpio_ao GPIOE_2 GPIO_OPEN_DRAIN>;
 		enable-active-high;
 		regulator-always-on;
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index ddb1b345397f..2fce44939f45 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -48,7 +48,7 @@ tf_io: gpio-regulator-tf_io {
 		regulator-max-microvolt = <3300000>;
 		vin-supply = <&vcc_5v>;
 
-		enable-gpio = <&gpio_ao GPIOE_2 GPIO_OPEN_DRAIN>;
+		enable-gpios = <&gpio_ao GPIOE_2 GPIO_OPEN_DRAIN>;
 		enable-active-high;
 		regulator-always-on;
 

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
