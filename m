Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6837C05027
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 21:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:References:Cc:To:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H/sAErqk3UPUZyWIp8xPhdhymsdx26l3Hez5l7uFLXU=; b=qDT5vLV7DvIVWY
	lJJzkUj5CfqC9wmnafDsouF6eKEme7cPZ+ZmAKoeIjSJGofuOucPwwRxCWdh0FZiM/WIhlIQEJDpa
	LacXWy0rEBjcC9VY72hbNNVKDhjq57k771XXrLcLBAFlZ4YfhElY7YK9fyMLtDrJfCdEi3VgZOtLw
	dJGjeEphEbMCgNQe0S6rciv6zfGZow8W3qiQdVCWmwfnoOpeZ/i5+ulBd47nIU+Xa49jsP37Bv8Ue
	aak2GuMI8I63OVBQwRStATYpPBvB2Tb7CpT1aq5BoGZPDQ2eamdGymVoOJVoT8yEGkssGx9Gw2DpX
	00G7oOGMJGENz5y2cP8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK4PY-001WJU-HR; Mon, 23 Jan 2023 21:31:28 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK4PC-001WCm-Pk; Mon, 23 Jan 2023 21:31:08 +0000
Received: by mail-ed1-x532.google.com with SMTP id x36so16176669ede.13;
        Mon, 23 Jan 2023 13:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:references:cc:to:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Az6/+eS6ijz6i/CMKCOR2HNf4utXJX9P0GxQzD5Ytps=;
        b=BR34zr7979WtSxuJfQQmHhscCCpGpa4wPeRndQwBkQf1VMoF+o36ZcPm8SB67r8Iau
         OlRhq8rzcHbAgK4GsQ0khz1LmHmM5fdLW/03hzQjHmSGXTTGxvadi2faCaI6RTs4NOJN
         UTsrTFgx4/+2MIXmcbagLLCCtIES4Q2P57BgUi6XW1GUyJMm+xQmjW1tvauwtms1RlhF
         zDdPmb1JGtdbtZ9B1kNQFJ7dfS2wwwpGIpbkSpoT/1UlS3NjLfx3/V8tI3AFRXFLFtDI
         bXvNTw4kGgPOH3sR6UiEIv1ldSZ6bUq0AO2K0Qw27LLovvjOX6AWtZFIAEZTnnC4zoTl
         Hcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:references:cc:to:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Az6/+eS6ijz6i/CMKCOR2HNf4utXJX9P0GxQzD5Ytps=;
        b=alrF6r7naXGNnPhiV2aPTuv+CE1SIb8bBJAjRlr+mSklTdGdPM/fnweL0ZwzrzwtPE
         kAlF8fk0BaPYe9ZZnZ7JZIGdq+V2Y3XYO4Fkp8tSrvupSprYz3zP2yG5g9w3DJviiqN8
         yuINwoh4qCW5IcVIKMAXDMs/2GIeeAWuO0M0nYl8XuetBfeokljjSBdd6jV+5Bcr2Ejr
         zfBbanFDlCUE0+80pCpMVX7RWqypaK0lAC4JQjzQsB8MWk+WFLsXv7xAnjLVEQ3c4EqC
         r4RaTfsjh0r8K3+3wK9doimXyOr1NhTmuK077LbhkhAM3pJdFd2K5VEUoBVcXUHBtqyy
         esqA==
X-Gm-Message-State: AFqh2krPhCq12B6ccFwrl4rViEF+gH76JkAEGRcrF2BRDNTIs7+D1SoP
	AJw7gyk7dNK+GV+4DQ37+GGivi1Es5I=
X-Google-Smtp-Source: AMrXdXvBhhFAnlGDpShjqyTOqXfCsXipvqGMLgY5DjYtYmmrUoMO9uh7PEYOVRplnKyaHNRjwS9RZQ==
X-Received: by 2002:a05:6402:388c:b0:49a:6a2:6f2f with SMTP id fd12-20020a056402388c00b0049a06a26f2fmr31501205edb.4.1674509464518;
        Mon, 23 Jan 2023 13:31:04 -0800 (PST)
Received: from ?IPV6:2a01:c23:bc5b:9400:dc4c:6fb7:47b2:beb7? (dynamic-2a01-0c23-bc5b-9400-dc4c-6fb7-47b2-beb7.c23.pool.telefonica.de. [2a01:c23:bc5b:9400:dc4c:6fb7:47b2:beb7])
        by smtp.googlemail.com with ESMTPSA id u16-20020aa7d550000000b004873927780bsm228573edr.20.2023.01.23.13.31.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 13:31:04 -0800 (PST)
Message-ID: <55c53e8d-6b30-51bf-edf6-b5b67887bd0a@gmail.com>
Date: Mon, 23 Jan 2023 22:24:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
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
Subject: [PATCH 2/8] arm64: dts: amlogic: Fix non-compliant SD/SDIO node names
In-Reply-To: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_133106_860002_0D3D5F94 
X-CRM114-Status: GOOD (  10.81  )
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

mmc-controller.yaml defines "^mmc(@.*)?$" as node name pattern.
In preparation of adding schema-based validation fix the node name
in two affected files.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 2 +-
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 1648e67af..ed895fb32 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1883,7 +1883,7 @@ apb: bus@ffe00000 {
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xffe00000 0x0 0x200000>;
 
-			sd_emmc_b: sd@5000 {
+			sd_emmc_b: mmc@5000 {
 				compatible = "amlogic,meson-axg-mmc";
 				reg = <0x0 0x5000 0x0 0x800>;
 				interrupts = <GIC_SPI 217 IRQ_TYPE_EDGE_RISING>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 1a931d5c2..80d82f739 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2321,7 +2321,7 @@ uart_A: serial@24000 {
 			};
 		};
 
-		sd_emmc_a: sd@ffe03000 {
+		sd_emmc_a: mmc@ffe03000 {
 			compatible = "amlogic,meson-axg-mmc";
 			reg = <0x0 0xffe03000 0x0 0x800>;
 			interrupts = <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
@@ -2333,7 +2333,7 @@ sd_emmc_a: sd@ffe03000 {
 			resets = <&reset RESET_SD_EMMC_A>;
 		};
 
-		sd_emmc_b: sd@ffe05000 {
+		sd_emmc_b: mmc@ffe05000 {
 			compatible = "amlogic,meson-axg-mmc";
 			reg = <0x0 0xffe05000 0x0 0x800>;
 			interrupts = <GIC_SPI 190 IRQ_TYPE_EDGE_RISING>;
-- 
2.39.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
