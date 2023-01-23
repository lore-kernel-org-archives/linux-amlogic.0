Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257BAC25B50
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 21:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uTKL+6Mp7ShVlPJYP4Ygwin9NjpZg1LsO6r4MVidPhc=; b=jvbLR9z6wn6aoq
	PnzydicH19AAvNJ7nAu3GxTpqmfmFrOoE8WSyIsVHtKj7aAc2qValao7/6Sd8yiiAymq1Wvu5QWk/
	fEr2yiP5ucymNOTjg8waJR/9kaf8MTLBP6aFFIJFqEOzD75Njy91hcs+mcxA7AlhxzAmc425e0UK1
	vS/TRzJ9v0hxML8L9S2hEUkotfXepQBkE7EnUfeSIvObgly/1/ne7otvYrRQyvdJhk77Zq+mGNI5Q
	4ANih0mY0wCnxoFDkAH/b0eHLDOzp5v80+Zud9SFClyTLC4QWHWGzdDbuZunllZS+VTGhuRAkQ5Yr
	c8hQnFHeieyxvrY8Rl1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK4Po-001WPM-FM; Mon, 23 Jan 2023 21:31:44 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK4PF-001WDC-7T; Mon, 23 Jan 2023 21:31:10 +0000
Received: by mail-ej1-x62b.google.com with SMTP id kt14so34131628ejc.3;
        Mon, 23 Jan 2023 13:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fMrJ0puhHaYAGR7cm+2T4ZLMvI2HK00WmCCvIJxL5IA=;
        b=gFPn1gofsTEjfe5fmlsW5Inpoe4DwFbR95+i+S45tZmbAqXCaIjowyMwdc7gtxurxj
         mVQQJqa44VSh6iilow0gQCQ/FYMyt3u+buBnsHB0gX8D3fgT6qLfTmJMId+HaODJgjre
         2JDfNd2yiadPaJ2Kdydvt9vua3v20MXod6AOVxzRWhay3knzW8AwJdK+HZ3eoDhsaAxy
         3afI7s87SbJXTffE+tzx8ZsGdWAI3wvaXNuDGWE3UwsuQEMLp+cWUM2Ug5co5BHaT3tX
         ZfZahSAmxm0Ur/oZAwFfHCb9Q5QTeXjy/47cnd0UoUUd/NYJ4zbgx8i1ktNh9WRmAx46
         x0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fMrJ0puhHaYAGR7cm+2T4ZLMvI2HK00WmCCvIJxL5IA=;
        b=wRqnU/xX0mpf8a/T9cM4o2vP5vCmjEWiEQydUcwtrzd/yvzm+IUuCdYRmaR7N8uHvv
         fnA0Z/u+WCfTpGWfogZfr44XakuDbag58QnFG78UbquSQaC3QFcMPyuZc2ju9KFmSLYj
         WJzV2LGZmDM2l8vWg7FONFpNwaIH9O8TghP+wpXtJelW7sH9IurddhgfVweOXhOvRgU8
         KxOjnfyhi/po2V5OvD3UpxfwaTfb6LqNTaZyoDvIyVGSFIUa/SNkmOEma8k9BVVbyiY9
         LUAzPBojb8xOm0W5+SJhYmvvKrP0upZrB7i9mvMfIn1UIIoQ6sht62wPFeNm9B4yTASX
         hrfw==
X-Gm-Message-State: AFqh2koSmj1m5WckAM4kA7zv/R6ZSgvxFm3wEkrPcAwASnXUoPCj7UZh
	Rs0Y8Hn2wuC3WvgiQeYrl0s=
X-Google-Smtp-Source: AMrXdXsuUDGL/8bnnpTryWjO06y2FoaJUV1fwx1U6RARROXcXxnInatXg6PO9RTMoNTQoqMwU57JHg==
X-Received: by 2002:a17:907:80c7:b0:84c:eca0:5f67 with SMTP id io7-20020a17090780c700b0084ceca05f67mr28344950ejc.54.1674509466752;
        Mon, 23 Jan 2023 13:31:06 -0800 (PST)
Received: from ?IPV6:2a01:c23:bc5b:9400:dc4c:6fb7:47b2:beb7? (dynamic-2a01-0c23-bc5b-9400-dc4c-6fb7-47b2-beb7.c23.pool.telefonica.de. [2a01:c23:bc5b:9400:dc4c:6fb7:47b2:beb7])
        by smtp.googlemail.com with ESMTPSA id kz16-20020a17090777d000b00877961fbaffsm5888982ejc.15.2023.01.23.13.31.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 13:31:06 -0800 (PST)
Message-ID: <25708b33-6f58-bde0-2fa7-089e6d89b552@gmail.com>
Date: Mon, 23 Jan 2023 22:25:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: [PATCH 3/8] arm64: dts: meson-gx: Set only one compatible string for
 mmc
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
X-CRM114-CacheID: sfid-20230123_133109_311000_1A475D30 
X-CRM114-Status: UNSURE (   9.83  )
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

In preparation of schema-based validation use one compatible string only.
Both are aliases anyway.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 75d35dcfe..c0a311da4 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -601,21 +601,21 @@ apb: apb@d0000000 {
 			ranges = <0x0 0x0 0x0 0xd0000000 0x0 0x200000>;
 
 			sd_emmc_a: mmc@70000 {
-				compatible = "amlogic,meson-gx-mmc", "amlogic,meson-gxbb-mmc";
+				compatible = "amlogic,meson-gx-mmc";
 				reg = <0x0 0x70000 0x0 0x800>;
 				interrupts = <GIC_SPI 216 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
 			};
 
 			sd_emmc_b: mmc@72000 {
-				compatible = "amlogic,meson-gx-mmc", "amlogic,meson-gxbb-mmc";
+				compatible = "amlogic,meson-gx-mmc";
 				reg = <0x0 0x72000 0x0 0x800>;
 				interrupts = <GIC_SPI 217 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
 			};
 
 			sd_emmc_c: mmc@74000 {
-				compatible = "amlogic,meson-gx-mmc", "amlogic,meson-gxbb-mmc";
+				compatible = "amlogic,meson-gx-mmc";
 				reg = <0x0 0x74000 0x0 0x800>;
 				interrupts = <GIC_SPI 218 IRQ_TYPE_EDGE_RISING>;
 				status = "disabled";
-- 
2.39.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
