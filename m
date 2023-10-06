Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC5CE81E00
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Oct 2023 14:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jLvProICX4FJwKMDZroEsjL+HTMvWSatfH9W4V8jppY=; b=ToxEuPk9ogyolW
	bWKUPMf3D/nfiSydqCzuAeyrGzpKHRp0kKJnCvpgEuLxEnZ9oDo57HW+1XaVlAXnNYiIzCwbzwjjd
	OX4b+IxZ/OqQm8Q1o0AxGBo3RJs92ppKd4770gRFyKf8ZETXDEWPNqIKUhPcvwImMQfKS9G9jpLFM
	z615K5WVKoEai/nTs7YMzUt9ZC/MXW5oVW93/Qw7npmhE/3R1EQUd/Rfui8psPMDLr8SKwopVGqWM
	vh0xShnL54wNUcEEi8HYuqiA2+HtUheRIoQgnIGNRGRRIAHNK5lA/QfJIFY/KXBmXh/MK7S5wb6bE
	M4PA27cc0+tmqSfZ0IiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qolg0-005yIs-1s;
	Fri, 06 Oct 2023 14:19:36 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qolfw-005yIB-0F
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Oct 2023 14:19:34 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3232be274a0so2062389f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Oct 2023 07:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696601967; x=1697206767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=emLkV2UaIMLS837NeYJskcNbCX7MRqsLLSL/k6u/yn4=;
        b=f5IIBSJJkPYxtlzvSYD5sSFvOGuv0Mp2HN0yeRHNh+V8FZIK/VAPQbtsGK/SSD7fHQ
         ZHUYD0ZLcr7fTmqctatYHu1X1it0qcjH49976dB0o5cr6X1O+8owUJeQgl8r3yN+9xBY
         Idn012RJJNRWp1Z944rylDT1SvgiyDvJ732LwfPA6DTOLbNJ12Jca0Rxrf4EGVa0nQzV
         junzklHLEu0pWOWThrG1i1Ng90Mz1ns1LrdfmH7opeRnkHYMSwHgieOsRqTQiYS6Aji8
         fzePPpbcuxz8UTv/8iyO9uYqZMF89rsi3m56IBX9znTEqba1Ms4Q7vP13uFVIPDL8Irv
         6PQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696601967; x=1697206767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=emLkV2UaIMLS837NeYJskcNbCX7MRqsLLSL/k6u/yn4=;
        b=tDTQ/MAwRvkIL6jVqvQIc8bdfczkEAqqmRW8+d5/2I14H7FdUOTcCv/aOu9mGqgT4S
         8DjsPqWoJBoUKJSRF6QTRUEPd6Pz+wSlhC7weWHIL1aD5GLcYqjuSWNFCuq7CF+zQUjU
         Tr2uHk1yJhUd9ariAi1woyOi/HZ27LlUYLZ8sss1ENVyt99lqNpSXKfM3YIn9+wjgcXt
         dEJFFzB3qVbbU76UkoQjRwrPgqSD8B7oAcojg2cuAcD84Bl6GmdeBsK2M4tF6ouvGDvr
         iEbZGg6mq48w2BE+QtN4HLrXGkGuLgx/p7JmTnJoCrFZfhiMhzR4Lf/esrLyLeqxoRXx
         HZQA==
X-Gm-Message-State: AOJu0YyB4C/XL2QeBJ0MatRsxTkrza6Be+X8k7IDFuRf8+Oq4QX7EYtB
	zLIDqn5VQ6Ucs1m1wNk2QeZhCQ==
X-Google-Smtp-Source: AGHT+IFZtgIuveq5UIaO3n9ZJc/f6XqidNKNy9T9tT5+M1b1k0Awh+6++MuPoXnOPEeWHWdI0KwXcA==
X-Received: by 2002:a5d:4690:0:b0:318:720c:bb3 with SMTP id u16-20020a5d4690000000b00318720c0bb3mr4851212wrq.20.1696601967294;
        Fri, 06 Oct 2023 07:19:27 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:30eb:5a3:102a:599e])
        by smtp.googlemail.com with ESMTPSA id x14-20020a5d54ce000000b0031773a8e5c4sm1778479wrv.37.2023.10.06.07.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 07:19:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Da Xue <da.xue@libretech.co>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH] arm64: dts: amlogic: cottonwood: fix blue/green led inversion
Date: Fri,  6 Oct 2023 16:19:15 +0200
Message-Id: <20231006141915.3623097-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_071932_352330_665BFDAE 
X-CRM114-Status: GOOD (  10.90  )
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

While making the v2, blue and green LED pwms got inverted
This change fixes the problem

Fixes: 9f841514c9c2 ("arm64: dts: amlogic: add libretech cottonwood support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi b/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
index ed826f673349..35e8f5bae990 100644
--- a/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi
@@ -70,7 +70,7 @@ led {
 			function = LED_FUNCTION_ACTIVITY;
 			linux,default-trigger = "heartbeat";
 			max-brightness = <255>;
-			pwms = <&pwm_cd 1 1250 0>;
+			pwms = <&pwm_ab 1 1250 0>;
 			active-low;
 		};
 	};
@@ -83,7 +83,7 @@ led {
 			function = LED_FUNCTION_STATUS;
 			linux,default-trigger = "default-on";
 			max-brightness = <255>;
-			pwms = <&pwm_ab 1 1250 0>;
+			pwms = <&pwm_cd 1 1250 0>;
 			active-low;
 		};
 	};
-- 
2.40.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
