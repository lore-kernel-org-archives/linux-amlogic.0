Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69FFC636CC
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Feb 2023 15:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yKNatjP5ifRFh0mDI+lpz2yUQczQsHSnBQOQ+9i3FBw=; b=N0WP7UbOVMEx/v
	AEkOHxhyNWfT4+hjeaOlCxz9jtMUi+ILs32Gs4nl4bu3HSWWOg/U7hlSuuFmq5GnQYqjxPcZL0eNf
	skQKqdSLww3/FeT3Yv07g38e6Mv42PiC8Ienka839fgYYOsmllCM4r/8JA/wQfM/SVvgG7op5tRec
	kCnLEfRR/JsZ1fXktwibKNWyac6n+9hoPgvFYJDWxIelogW0nARRDRLESjT/93fReF9rRtYAzDWKK
	WZ5HJB2SijGLWWFRg5Y9Vd9SfI112xWuaFOTzrvWh2qdEcT71+vofIMT2mA7c+w6UqpY8Kq/ewGZK
	d30c+7JwYobrp8M1hNwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPb1-00CdGq-30; Tue, 07 Feb 2023 15:09:23 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPa0-00Ccfl-SB
	for linux-amlogic@lists.infradead.org; Tue, 07 Feb 2023 15:08:22 +0000
Received: by mail-wm1-x329.google.com with SMTP id f47-20020a05600c492f00b003dc584a7b7eso13392317wmp.3
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Feb 2023 07:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SdyZ473lVA8OnD87M9JEuHkPDAOV01LT74z6WsPQWzk=;
        b=kLB2UTtw3XnsMVL1Xa8yJdzg3oEv4Md8+s1kYYUq22KV983pPMVUgUdIWkdNmf/7cR
         2+HBvOcxwZ20gbLOttYvkECNrlWwbJPA8+sztM7/VJ//FMVbh9JOBXJApSx9+Z2OPKrF
         7AfKR+vtB+L5F5jiTSL42FN7GdtQrPY063qUZG8nymVVM9alaJksUYd38VlkCz0Hzb9m
         r61STAZBiEOrbL6R3JQ9XHJ67yxL1HbYOd4KyBdL7JAiIEluBE1bUylUKucrDDtE6QRU
         r9WXhCWgRybkaJ/nU9fCv37yOYKsBeq5xO18/d0Z4XIHhaTGCnQARkhvbcDmYQmS12kT
         8JMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SdyZ473lVA8OnD87M9JEuHkPDAOV01LT74z6WsPQWzk=;
        b=dyUDITwpCU7i7m3kvpR4dfgnlnebpgEjQgXo+rOciJQncnh5NoM8bA5lXGHwI8cHka
         8mHMDtoRZ+bxsQFpN99wpTrVT/B0PYci5N5SmcKRH+/EK05TetBd8xwwNukmT1E1dcb1
         Vp0phw4Re+ymJkMm7LhC7kxaEfWAM7J4hjEugCyjdyDNocq+1Z86gHnnChMZaCYTX/l8
         5oYYE7OgV4yv+Ky/ihXAywR+iOeKwyVRqfV+lg0Bv58PcIE9THlOoctxh+IZ26U96W2M
         RcFoJpFB6GiYghasdS5hF8TrmF9e40v5LvAHFDfBW0LN3qdsa/m44ZF4WaDgUh1xL7DH
         VtPA==
X-Gm-Message-State: AO0yUKWd5Lhr/npHqYbV9fOnzrj/pnENuDlzrQ7upMId3FPJso7obWUh
	4OfcEYv04zRwCFmyZNZ6eUc9TQ==
X-Google-Smtp-Source: AK7set9UX4L+q9rkPE0pXHvyXjKRsVlJKGg8FkwHRftV7xqugC9lVDiF5q9EyMvYcfiDS1mqyvu+kw==
X-Received: by 2002:a05:600c:a287:b0:3df:ee64:4814 with SMTP id hu7-20020a05600ca28700b003dfee644814mr3462318wmb.20.1675782499714;
        Tue, 07 Feb 2023 07:08:19 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j33-20020a05600c1c2100b003db0ad636d1sm22092173wms.28.2023.02.07.07.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 07:08:19 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 07 Feb 2023 16:07:58 +0100
Subject: [PATCH 5/8] arm64: dts: amlogic: meson-g12b-odroid-go-ultra:
 rename keypad-gpio pinctrl node
MIME-Version: 1.0
Message-Id: <20230207-b4-amlogic-bindings-fixups-v2-v1-5-93b7e50286e7@linaro.org>
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
X-CRM114-CacheID: sfid-20230207_070821_005968_EBCDEC45 
X-CRM114-Status: UNSURE (   9.91  )
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

Fixes the following bindings check error:
pinctrl@40: keypad-gpio: {...} is not of type 'array'

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
index c8e5a0a42b89..29d642e746d4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts
@@ -620,7 +620,7 @@ &frddr_a {
 };
 
 &periphs_pinctrl {
-	keypad_gpio_pins: keypad-gpio {
+	keypad_gpio_pins: keypad-gpio-state {
 		mux {
 			groups = "GPIOX_0", "GPIOX_1", "GPIOX_2", "GPIOX_3",
 			         "GPIOX_4", "GPIOX_5", "GPIOX_6", "GPIOX_7",

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
