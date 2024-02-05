Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02738C48292
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Feb 2024 17:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t2+NHwL5W/V8SkX9kwlZIIIyB3f4ASPDOj3iKEvqhig=; b=4DaozrWA4yw2xo
	KhqrO1HcyY42c0soW/FAT4cVYqLQ6ZaFGEsoNgPgeFkaCvQoc9qmuol41EiCaGbVjTTx+T0RwbaQ5
	exK3Qxq617S17rcv8nlj5FzgwWIKVrqzaW8hnuhjd5prPaEO6mc+Ft/ukjsgvV5zs+VCiF3j/scew
	h3Aha4jRv07o0m8mDspadEBAx8YWTjzxcHRG4nWqMrJkXgIbUVKtc2lyFPSgZ29K0gqWaeB8Wq6il
	f+QxqEODBR+bjoDV0AczOyuIdmjWeijEuV1l4hjCUbKZ3FLVs9EgR1lueK2sTEsNPJ0s7W5Wwv4VK
	fL5hH3VXzGxTQ9XjSW7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2dz-0000000471X-2dvp;
	Mon, 05 Feb 2024 17:20:31 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2dv-000000046zH-2Fvd;
	Mon, 05 Feb 2024 17:20:28 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d944e8f367so36327815ad.0;
        Mon, 05 Feb 2024 09:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707153626; x=1707758426; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnDfdiBxUJ7B1xjtLpqJ3avr3LVR1mRIgOV+jI5F51c=;
        b=D2rxDCm7sHTWqa6+JQYGULvnclYBycpOfQ4Y5KlDUQvpEFpI6ND/UMjS2FiK5WtUnS
         BJfN0VDGjbrG3MV4QKmCevyrU4LeUKj0fEcwcCf5I2u/+wyYSZShEIF8fvxVUZAm9usB
         lTpPmIE/brSIcsJqzkQIqa6elfAZKc58aFMshKmN+J+xCktb0Cgkmg6eheBQXi9PjAYD
         Ed4Sy07OX7yuIbKkaV987Wwtm1aYfi8weu1GhXklxOEX6uAHmW5wD6rsVw3M8GhyF2/2
         SDoBhjLJMcTT3HoRyX14T3p8RP443oVOMudNkS1973G3X9ze8KSpsZHBNFkjaIcIn5EF
         HlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707153626; x=1707758426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SnDfdiBxUJ7B1xjtLpqJ3avr3LVR1mRIgOV+jI5F51c=;
        b=EsiKQcm19Hth8IMd9xD0AeKMlz9X73ewSyDZiAtsm8FXe+HweDQEZ6xGQiiS+k6BgP
         Ow4GscFq9c6Iz3J86/Kqq8yM73LNm8YQ3J9E2W0WKaonwWLOtHhDSkpO5q7F1XR5Thy+
         TgjoY7LZt23IpK/di2kFghq9NuF6N0QhFIoJah0uZR0RreM4zfWs5rGACk+TwgT1fcNq
         48MH+Kt4nPnbgTS23pjI41JZdqO+bhLMc0+/kkMKz1LuoZXD8BS6qrhnhYWFl4sBT/U+
         SYwupKc2gCcULIGMpHlF9um6PhTfTrTIxYwFK3ML/bI4MzXAcVwQCuAm1ArWJnK5fFqg
         IgrA==
X-Gm-Message-State: AOJu0Yyeop8/0yOPA6lOOflvPtUtLaN4EwaF5yv5iC4DnAgCxnOuZD+F
	QqnWFDd57zUZ4JxY2CSJvFQ4Wfx6q7tTXH63vfYCt2QWhpFO8ol9
X-Google-Smtp-Source: AGHT+IEF6AzcPzjWBjxbTGCLdvr9YdSdC01kCPkAJv7K7CUcIAheuwkTV2bLVUSbdhTX0UF5mfBmNA==
X-Received: by 2002:a17:902:eb53:b0:1d9:6009:c23d with SMTP id i19-20020a170902eb5300b001d96009c23dmr127754pli.54.1707153626453;
        Mon, 05 Feb 2024 09:20:26 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU1elTh9SN9v38NWSf1rePgCvyzfn4m3+8JVqdjjh6w7OZ6L0CGN1+JXZrPiCubQSIt1FC+FebLlf7otoIHL3l3/COk0aMmn1hDP2lr1uBiyARxiTxr8t6gkk4e9zJFIZdJhE6Ydm9OGYHAIm3Fi8Rwhi/on81QuDIyh5LIdF7lVEPd0qsY/ePDkDp2mBfn20JIQ1ojwUSMeUoBZqT7u5v8MTkeH0Gd38K8oMMcXiP3UJb9OcZIqME/TRBuKLSjIV8YZ2NY/2rVcG8sVE+Urt0w492I16BJWdu7rkYtgSBzb8X+T+uJnk1FbCfH4xw3f+qliQz6OZPdr/lutNmekGYOEOhEPavZnNmBoKrf8IVRB8Npvr6dqrAAcWij4EGdFoD9R7jY2irgrY8q1+Y/kGa0WsgmsQRBxll+ctUw9/Gb2jPPLOR1dBEUEAB5i6M0YFtL/g3V
Received: from localhost.localdomain ([113.30.217.222])
        by smtp.gmail.com with ESMTPSA id iy15-20020a170903130f00b001d8f3c7fb96sm107518plb.166.2024.02.05.09.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 09:20:25 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Anand Moon <linux.amoon@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCHv1 2/5] arm64: dts: amlogic: Add cache information to the Amlogic SM1 SoC
Date: Mon,  5 Feb 2024 22:49:20 +0530
Message-ID: <20240205171930.968-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240205171930.968-1-linux.amoon@gmail.com>
References: <20240205171930.968-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_092027_600267_B73D17EA 
X-CRM114-Status: GOOD (  10.94  )
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

As per S905X3 datasheet add missing cache information to the Amlogic
SM1 SoC. ARM Cortex-A55 CPU uses unified L3 cache instead of L2 cache.

- Each Cortex-A55 core has 32KB of L1 instruction cache available and
	32KB of L1 data cache available.
- Along with 512KB Unified L3 cache.

To improve system performance.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Datasheet
[0] https://dn.odroid.com/S905X3/ODROID-C4/Docs/S905X3_Public_Datasheet_Hardkernel.pdf
[1] https://en.wikipedia.org/wiki/ARM_Cortex-A55
---
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 39 ++++++++++++++++++----
 1 file changed, 33 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
index 643f94d9d08e..403443e782e4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1.dtsi
@@ -55,7 +55,13 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
-			next-level-cache = <&l2>;
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l3>;
 			#cooling-cells = <2>;
 		};
 
@@ -64,7 +70,13 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
-			next-level-cache = <&l2>;
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l3>;
 			#cooling-cells = <2>;
 		};
 
@@ -73,7 +85,13 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
-			next-level-cache = <&l2>;
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l3>;
 			#cooling-cells = <2>;
 		};
 
@@ -82,14 +100,23 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
-			next-level-cache = <&l2>;
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l3>;
 			#cooling-cells = <2>;
 		};
 
-		l2: l2-cache0 {
+		l3: l3-cache0 {
 			compatible = "cache";
-			cache-level = <2>;
+			cache-level = <3>;
 			cache-unified;
+			cache-size = <0x7d000>; /* L2. 512 KB */
+			cache-line-size = <64>;
+			cache-sets = <512>;
 		};
 	};
 
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
