Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93577C001DF
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Jul 2023 14:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=knTYwvtV23pbsDCHGBtsrSDjcgalJPLlw8fX4UEa8wM=; b=tbWS05NvjIECOo
	yX6/FR3tuFG0oPIz3SZRvF2fRQ6PRIO+tUCtT+oYjSzAHtuS393ny7k9NOsGWgidBq++0VtmEu44L
	/dGqawH7h02p9lmyB9OX5w9rxd2UeNzMtOUn5c3gzJ2RYYtTYia3sC9YllwpDOn0KOxweZVMNneK7
	V4Qh1A2Q+qpf1vNk2kV/zS0hT2rDinoSNdG3C0E+Do4mVVc9tbYngnMEK3Kl3Tg/L0El9TXUJ+Cw0
	rx359oibAeGj9BnIXMlOAq0fyYPqwTUHpa84ZK4cHINu5QwLuB9VvVVLliYi6QJIZgKigoVG79LEm
	iZKDgq55m4bBYiJj2zww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOJ0H-007mAn-0J;
	Tue, 25 Jul 2023 14:27:09 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOJ0F-007m9l-10
	for linux-amlogic@lists.infradead.org;
	Tue, 25 Jul 2023 14:27:08 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-992f15c36fcso951928766b.3
        for <linux-amlogic@lists.infradead.org>; Tue, 25 Jul 2023 07:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690295226; x=1690900026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hU8lSjQ6M9yd48ULuSbmUnhhWGLQGOdsfRMZvGDHUYg=;
        b=qtCYt7lSSrdZZ8iQAVofiekLVvwLzUwagNxRSeFzg960F3nJujWU25uL4zNn/svJ43
         KvBY7KqPvhZRA/Og/tInPY0nPEozrpR4/etavmBxkjejRJdO7HuxwMMOl9Mg4/4oJzRu
         izdUVCpDnvIsmGGYfMao9YyEIJ3ftaz9NHcg8tr2zLAZr1inbVBx1QbVZJMQxlaDOwWB
         hEnO4gJABuwF3kouzb8hIaNxEEkpRgcX6H6Gd+5XEVViB0J5ZYaa/hlMS7jEKJfj8tt+
         VizO7MUsM7bAAWLtnFH90JrogdmuG5VoDogTrS4nRbTbWJvAA2tRoXzNxjMDE2aEI1sG
         S/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690295226; x=1690900026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hU8lSjQ6M9yd48ULuSbmUnhhWGLQGOdsfRMZvGDHUYg=;
        b=gLSsAFYvMvrb8O7al6lsm2KO3gigpFj4M4F0c7QNxWyeOnduEYGPMu8MFchuzfb5s0
         E9DfNwcHUz/6T+ca4MISl2/YqSwZx554H3VbiOnykXEGrp/ckYpRdMnDVdQSMdS6pD3S
         OHTFrJBD5t0hovYl0AO7MYTHYlO2CFQLJVu4phl+6towlaZqKPrWbLNUh/l/pH9bzuN1
         uPRboUGRaaz5DFy2qlWIEiI1ra1z5hzxN1Z7ZERLMh9YW0UdiNw52J0weq3Ab1LXPaNi
         acVK92HHImayoaGFfR25hz2Cn8w+hcFQQJSyOmJmvrdVQKzZj46i1U+8b35Eli3TMI2c
         6e5g==
X-Gm-Message-State: ABy/qLYGYH0K2I4VViMLi3eRsA8KmxE/gvkz7N8zqWFNPWnaflm2g2cX
	L7PGTB8vjoL9uVC8tUcA/v/qbg==
X-Google-Smtp-Source: APBJJlHFnc3Sz1DBUjgwnuSooCSHfG5qz85DMBZy79oDPNK7BX03+ekkae7x1UZx4sl9fM+H2KxFXA==
X-Received: by 2002:a17:907:760d:b0:993:e752:1a6a with SMTP id jx13-20020a170907760d00b00993e7521a6amr13195406ejc.21.1690295226116;
        Tue, 25 Jul 2023 07:27:06 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id o22-20020a170906289600b00977c7566ccbsm8201027ejd.164.2023.07.25.07.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 07:27:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: amlogic: meson-g12b-bananapi: switch to enable-gpios
Date: Tue, 25 Jul 2023 16:27:03 +0200
Message-Id: <20230725142703.157547-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_072707_354748_2F6D5B3D 
X-CRM114-Status: GOOD (  10.41  )
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

The recommended name for enable GPIOs property in regulator-gpio is
enable-gpios.  This is also required by bindings:

  meson-g12b-bananapi-cm4-cm4io.dtb: regulator-vddio-c: Unevaluated properties are not allowed ('enable-gpio' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
index 97e522921b06..86adc1423385 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4.dtsi
@@ -56,7 +56,7 @@ vddio_c: regulator-vddio-c {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <3300000>;
 
-		enable-gpio = <&gpio_ao GPIOAO_3 GPIO_OPEN_DRAIN>;
+		enable-gpios = <&gpio_ao GPIOAO_3 GPIO_OPEN_DRAIN>;
 		enable-active-high;
 		regulator-always-on;
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
