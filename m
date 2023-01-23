Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46FCC05027
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 21:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bLTCYgE5Sd7tk0QquW/isXgK0M19tHxRC4hywmZIYMo=; b=PceK/LBE7LJktX
	orx5Vhqibm5UPi40lu2Ap3uEwoN+V/4Dn+cN0cr8GwB+EgD5ozBOKTCUPaw8YedOz3EcGAhrHkIIR
	8BVboOoB07X6QiiH4NvPMj+MldRxZHwqmHG9qK9r4lCWL1gPgqHunAw6dt46H1L410dw14ouCIgi9
	HaTj0KpQ6A7ZvSvB9euL3Hmx9kye9kkDSNoDqtlc1b9yt+9CfbkUWFav3iNutiP1z47GN8HbNGifj
	RGe8LzqhShWxwd286OXkhL+XFaJezvsLqANHHLaPSBKca4+bb71YUy5LoJ26wbOmwTEO1Nubeyp3b
	zzxJ6V59IOn+oESlsijQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK4PO-001WGN-5X; Mon, 23 Jan 2023 21:31:18 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK4PA-001WCS-Pr; Mon, 23 Jan 2023 21:31:07 +0000
Received: by mail-ed1-x52e.google.com with SMTP id v30so16226684edb.9;
        Mon, 23 Jan 2023 13:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tGy0L8FYKqoa2JKT2+lRKom4fwae0WN7DTnvx0E4Uzc=;
        b=g3yJTOA2nZO0Dnf/q+WUQ17ab7h55P+/OqcdQBpFGQp6h3UtMIeFE9zmNJLc3X9fj6
         C590kHQzH+fsVFJW1mzraHaBRoZJCUAZBsrQliiapxjd7tgxsgSnDf5HWyCJFssUI5nX
         pbu3jwxkuA5AFPM5TcOj7frMlzIiJzWuyqCXuxAT8YrYSc39/yiwYut3kURTI0yeaf/g
         faXzt2kIsdCyDiqHcDLixXZHcwQI9AXfa0x4cdMe9RR5qWnbuZuII5E17z/OzMP1jCde
         baofBmX/duEWiPMyw8LfDVnM8qzLepwnPkNtLQgYsm8oA/4Vk1CFJryPS2QsxeiCOhAz
         rO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tGy0L8FYKqoa2JKT2+lRKom4fwae0WN7DTnvx0E4Uzc=;
        b=1VgCaECvWgNvV/S6jp2POoa5SsklD51V8zh0AR8ak0vHkzOQqKd1bwi2RRu8N0DFW8
         6Wnj3BKmE/LZ7vyF6JvIZdNqJCH6HZLkgeMc9XNdgVZ7vRnbwQfCUlliP/4vHlbhu7px
         iOpf0tRSzDbVa9m9NpbIdEnMJ6oNrrk8fdyOI/jfJxU3Upup4Y1F+tBa3pQylusYc6y0
         MyhbY0ScYFx5WIJTN6LWwFUKFJcr3cm5SK0s4hg78pe6GZL/Uj6ftBF7bh1C7DGbdvUc
         7JWxaeOTeDRSj7F9KX0/hVEBmmo+yhOgP8Dd3P4WJ+xYOIn4wMnmvX41tsq9fyp0Z3dA
         nsuw==
X-Gm-Message-State: AFqh2komZXLXsZvlY3tSJe/K7UbGLhHh9KZc8YQfVjC66VQN5QkQ2gGc
	Yw3ebH7oizSaV9OuPRZWR1Y=
X-Google-Smtp-Source: AMrXdXtDrtFMC+Krfg/TfV027iJVS6WEimm/PnKTdIxeQra5m4weBTCn+UTAXPU83PrQ9lDliTU/zg==
X-Received: by 2002:a05:6402:401d:b0:49b:5a1c:9cb5 with SMTP id d29-20020a056402401d00b0049b5a1c9cb5mr29220354eda.16.1674509462545;
        Mon, 23 Jan 2023 13:31:02 -0800 (PST)
Received: from ?IPV6:2a01:c23:bc5b:9400:dc4c:6fb7:47b2:beb7? (dynamic-2a01-0c23-bc5b-9400-dc4c-6fb7-47b2-beb7.c23.pool.telefonica.de. [2a01:c23:bc5b:9400:dc4c:6fb7:47b2:beb7])
        by smtp.googlemail.com with ESMTPSA id u10-20020aa7db8a000000b00487b73912c2sm230560edt.12.2023.01.23.13.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 13:31:02 -0800 (PST)
Message-ID: <0fab069e-dc03-783e-e4f9-d49f96669328@gmail.com>
Date: Mon, 23 Jan 2023 22:23:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH 1/8] arm64: dts: meson-gx: Remove invalid pwm compatible
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
In-Reply-To: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_133104_882629_CDCAC500 
X-CRM114-Status: UNSURE (   9.77  )
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

amlogic,meson-gx-pwm isn't a valid compatible string, so remove it.
See drivers/pwm/pwm-meson.c.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index a79a35e84..75d35dcfe 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -328,14 +328,14 @@ i2c_A: i2c@8500 {
 			};
 
 			pwm_ab: pwm@8550 {
-				compatible = "amlogic,meson-gx-pwm", "amlogic,meson-gxbb-pwm";
+				compatible = "amlogic,meson-gxbb-pwm";
 				reg = <0x0 0x08550 0x0 0x10>;
 				#pwm-cells = <3>;
 				status = "disabled";
 			};
 
 			pwm_cd: pwm@8650 {
-				compatible = "amlogic,meson-gx-pwm", "amlogic,meson-gxbb-pwm";
+				compatible = "amlogic,meson-gxbb-pwm";
 				reg = <0x0 0x08650 0x0 0x10>;
 				#pwm-cells = <3>;
 				status = "disabled";
@@ -350,7 +350,7 @@ saradc: adc@8680 {
 			};
 
 			pwm_ef: pwm@86c0 {
-				compatible = "amlogic,meson-gx-pwm", "amlogic,meson-gxbb-pwm";
+				compatible = "amlogic,meson-gxbb-pwm";
 				reg = <0x0 0x086c0 0x0 0x10>;
 				#pwm-cells = <3>;
 				status = "disabled";
@@ -497,7 +497,7 @@ i2c_AO: i2c@500 {
 			};
 
 			pwm_AO_ab: pwm@550 {
-				compatible = "amlogic,meson-gx-ao-pwm", "amlogic,meson-gxbb-ao-pwm";
+				compatible = "amlogic,meson-gxbb-ao-pwm";
 				reg = <0x0 0x00550 0x0 0x10>;
 				#pwm-cells = <3>;
 				status = "disabled";
-- 
2.39.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
