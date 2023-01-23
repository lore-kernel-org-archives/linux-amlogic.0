Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EF6C05027
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 21:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oPQ0auzwe0SJwFgdORt1SZS0ECjwbwZOfpcQy1EooM4=; b=cxrJWACUiqDTJq
	JOKI2UavpUyCpLqQXg6rJE/J6uz90gBt4gj0BqElZwIY07YjygDNzKz/DroCk1AuzWu2H9rradIp2
	IGGtO1Up4b+YTm0Kw7g9eq72yF0fklcUy8wrEIY0n0D2GNHW4AwZxTlRbvZ1hxeRyMbK6BnQiOZpo
	D4Ypl0ubdG7OgN5FuzyM5+Ba4v/1e5hvZsQF1v8uTfSHzH4YPkI4b6j1dYUbWyGC24J6qRTchYGTD
	tJDWXWjP2uItE03ewETk6w7cqKEmbLS7vkuQwQ886rExlUwKU3SBjfO9Enpqa/7LylK1Euv99+NDK
	QmwT2qgvdyd7nxjycAjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK4H4-001UkX-6y; Mon, 23 Jan 2023 21:22:42 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK4Gt-001Uhe-Gj; Mon, 23 Jan 2023 21:22:32 +0000
Received: by mail-ed1-x530.google.com with SMTP id w14so16216136edi.5;
        Mon, 23 Jan 2023 13:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/m9fxwpEbZpN8X/D6lwA+MFLaC8U37ezUMxtxmuH1s=;
        b=nHYnC2veAbsrTjlHDQZR0BhSSYSQHFBMBLaA06XtKf/JcBy5o8Qo7rR09XYFpWbUEQ
         zUOF/c0nEFw/jpxdxY0TfQt3XGGuupq5k+GM3BFNMVNokLyG6Kk1IjtfDSXvHP48ZG13
         jdOgZSqvN3oJXcHwsBtb9UDARHudBrRRed8l6Isn9nuA4nQuuylTDdPnfDcXiZqSEILN
         gWO7GzisBtbyiAwsbduiUw3652oAUhn8vy/MxZKL9AZXx0cbkrVRsYgm9na9wU7vZ5Fs
         WThJGOxnqxCx06877AWz0wv5I7DlCBeQVyGjt7IoWTH2E3KUbvDlkObUuIZjI+xI/qTV
         YVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O/m9fxwpEbZpN8X/D6lwA+MFLaC8U37ezUMxtxmuH1s=;
        b=OTu+CiB+skwm7lMvihxkwsAMmPkk+DpdyQduhSkl7nZc3By59lHy90n8J87Mg9yqw0
         1aqJihfrF24wPaurjQJ/kOpIkHVKvaC92tt7duPk5f8qo6PTkjQ8PuMS8rBO3XDIkKve
         NO0G6N0wmu5YnhLMyEcNJsZIcPCdtHlt7LH3jdk7rp5UrjXpV2lvKFkqgw3pEEPUyJzX
         wWBmvG4q9A+amgbzhWCjfCvAk/uRFIAsGOrxF6XcnkHn/E+AqjbS/4plSVloVT8EO+to
         j7kjn6tgYKwI5Kj+GykV8n2VfXtfhWJT6/saRCinSvktT1SGizIVu8Y2ev7mYaO+L+Bo
         wXpA==
X-Gm-Message-State: AFqh2koXiOZil22IR+DlzHTkoxhP/OtmCBqzkUENrZzJUD2aRfsU23lx
	yUII9TCOSTBx6xSIgLseuYk=
X-Google-Smtp-Source: AMrXdXsecJ0Lmw0T6hteu5NgTW5sF1ad5h25d+1oE8fDr0Fwmliz4MOIjn5MfXF/7fkBbotfYHdm0g==
X-Received: by 2002:a05:6402:5296:b0:49c:3cf4:d9ed with SMTP id en22-20020a056402529600b0049c3cf4d9edmr30260243edb.23.1674508945276;
        Mon, 23 Jan 2023 13:22:25 -0800 (PST)
Received: from ?IPV6:2a01:c23:bc5b:9400:dc4c:6fb7:47b2:beb7? (dynamic-2a01-0c23-bc5b-9400-dc4c-6fb7-47b2-beb7.c23.pool.telefonica.de. [2a01:c23:bc5b:9400:dc4c:6fb7:47b2:beb7])
        by smtp.googlemail.com with ESMTPSA id cm28-20020a0564020c9c00b0049e9fe9abcasm213409edb.44.2023.01.23.13.22.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 13:22:24 -0800 (PST)
Message-ID: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
Date: Mon, 23 Jan 2023 22:22:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
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
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/8] soc: amlogic: switch bindings to yaml and adjust some
 dtbs's
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_132231_583882_76D73799 
X-CRM114-Status: UNSURE (   9.62  )
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

At first adjust some existing dtbs's so that they pass dtbs_check
after switching bindings to yaml.

Then switch further Amlogic Meson bindings to yaml.
Tested with make targets dt_binding_check and dtbs_check.

Heiner Kallweit (8):
  arm64: dts: meson-gx: Remove invalid pwm compatible
  arm64: dts: amlogic: Fix non-compliant SD/SDIO node names
  arm64: dts: meson-gx: Set only one compatible string for mmc
  arm64: dts: amlogic: Remove invalid compatible string
    amlogic,meson-gpio-intc
  dt-bindings: rtc: Add Amlogic Meson vrtc controller binding
  dt-bindings: pwm: Add Amlogic Meson PWM binding
  dt-bindings: interrupt-controller: Add Amlogic Meson GPIO interrupt
    controller binding
  dt-bindings: pinctrl: Add Amlogic Meson pinctrl binding

 .../amlogic,meson-gpio-intc.txt               |  38 ------
 .../amlogic,meson-gpio-intc.yaml              |  72 +++++++++++
 .../pinctrl/amlogic,meson-pinctrl.yaml        | 121 ++++++++++++++++++
 .../bindings/pinctrl/meson,pinctrl.txt        |  94 --------------
 .../devicetree/bindings/pwm/pwm-amlogic.yaml  |  61 +++++++++
 .../devicetree/bindings/pwm/pwm-meson.txt     |  29 -----
 .../bindings/rtc/amlogic,meson-vrtc.yaml      |  50 ++++++++
 .../bindings/rtc/rtc-meson-vrtc.txt           |  22 ----
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |   5 +-
 .../boot/dts/amlogic/meson-g12-common.dtsi    |   7 +-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi     |  15 +--
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi   |   3 +-
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    |   3 +-
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |   3 +-
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi    |   3 +-
 15 files changed, 320 insertions(+), 206 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
 delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-meson.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/amlogic,meson-vrtc.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-meson-vrtc.txt

-- 
2.39.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
