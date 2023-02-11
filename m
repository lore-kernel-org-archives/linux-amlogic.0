Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8ACC636CC
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Feb 2023 20:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9VCiDyqkVxLeCyhO/hoj58lEpRh+kLhabkjWQeMv08U=; b=DxAk5qyACzvLd3
	77+cHsN4q3TvttzCnd0J8/fKp+qRBlNJTyXgTA8N9LlLBVF/58tmCEXIONqTFztVLPugHNYbhV2GS
	0SebqtdULVd+hA93rdxb2zCgW/+Y4rHPP95lAZOMk17IISf2Ev+GkVO26lhbKd+Wg6tbA4PZlvH3W
	1+ECvvEUwsD8VI19Q6UVlMSPJWIaA03OSM4/g9Wiwy/QR7DwqXgHHoXpbvYBojww7+uXnhhL2RbS7
	RscS+gSJJkneGh/RVDOmi5H6TeIOwJLhWzcG/m1P6ftc/DVLpmEfgGWOWBs4eBDODMN/h6H/YzVQX
	ojB9leKIlSqWr9mO3KYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQw6m-00AFRr-Rl; Sat, 11 Feb 2023 20:04:28 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQw6b-00AFPR-Fp; Sat, 11 Feb 2023 20:04:18 +0000
Received: by mail-ej1-x62f.google.com with SMTP id rp23so23314227ejb.7;
        Sat, 11 Feb 2023 12:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RjjXpGu22f36zsopOwOahgOOSD3GNRdJelEClXp6KLk=;
        b=Wr/lthu3WnMgjFa7C+MuY/PMvXJmIl8jlIQRh3di2Xtzo+LSDs3VOzcUyvNiPi0Rhk
         EQWlR6ZMvZ0Cx7F00jj1sZNWmGfS8TPHGdiSKx1U9swrW7UNpUfhesfSt84OElTM+/+e
         +uwd6WPKOeEqiwBhV4TZE7YhXU64LjNCMQy8ML1ElVrdRlshXmxDTr25DHZBauS82Dr/
         vGuXh8w20KXnw36RfoDpR4hZ6HMc45nfF8N68frpumroLKtX+oYw82SWYNLB4KzqG6zx
         smROF9p7EeTORa9aCY86RFaeruoURD8rb+1XB5eUOtGmNK4p9/1C6XUQeDTYmfhQD8XY
         l4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RjjXpGu22f36zsopOwOahgOOSD3GNRdJelEClXp6KLk=;
        b=TQ3ckbHioyI7s41wowmFuBRtManrJ4vQ3j3ZFxv9lY3Tz90k9jeKReq3DBuA5WwM/7
         TesAtg1MBizcBG8ORr0WpmJpBuyi/Z17NTX1WGm6Y4+Y64lqNkKfk9R8eqZ1KA/nRNuj
         FOoZH9+jcLGC4QmRmACrROxh9qYm6JtuMGklLkLXbcClEys7faYv62alQb+g8+AVbt+C
         bcinTBgDF9RvfHS05974M5/Q1/rwRGe2ep40j/zFy6Yg1FADEHbBLBX3sEub/gWFrUf7
         m9Yp0NGh+twhjAV5WtoyR01oJnhxO+TMm3fPu9l5YhLxhrJFfwfJ1B8Gsr8tcCxwkVyU
         G4tw==
X-Gm-Message-State: AO0yUKXu+xacn2201dmR8I11P3iOk3bAQzZbqsbH6jZZOVVqx6Eu2ZbK
	XaTdq9mu4jH4vjXSC3Kfd/qzVZLcHuS0ozcdVQM=
X-Google-Smtp-Source: AK7set9gfXJ0lTgAC1WCpg7g6zQJ4VvoZQDgnULywOlp0nN6xiARxZfB98oEHqpDAMroivI76f6QHrHYDJD9MsOuSNU=
X-Received: by 2002:a17:906:f9cb:b0:879:e721:9d33 with SMTP id
 lj11-20020a170906f9cb00b00879e7219d33mr2729879ejb.4.1676145855971; Sat, 11
 Feb 2023 12:04:15 -0800 (PST)
MIME-Version: 1.0
References: <20230207-b4-amlogic-bindings-fixups-v2-v1-0-93b7e50286e7@linaro.org>
 <20230207-b4-amlogic-bindings-fixups-v2-v1-5-93b7e50286e7@linaro.org>
In-Reply-To: <20230207-b4-amlogic-bindings-fixups-v2-v1-5-93b7e50286e7@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 11 Feb 2023 21:04:05 +0100
Message-ID: <CAFBinCC1O52eraLJ=GoZVM0fM0zVyqdDrkP3RCjNQ=KaqhByLQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] arm64: dts: amlogic: meson-g12b-odroid-go-ultra:
 rename keypad-gpio pinctrl node
To: Neil Armstrong <neil.armstrong@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_120417_547389_A468C0F5 
X-CRM114-Status: GOOD (  11.14  )
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-amlogic@lists.infradead.org, Yuntian Zhang <yt@radxa.com>, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Feb 7, 2023 at 4:08 PM Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Fixes the following bindings check error:
> pinctrl@40: keypad-gpio: {...} is not of type 'array'
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
>  &periphs_pinctrl {
> -       keypad_gpio_pins: keypad-gpio {
> +       keypad_gpio_pins: keypad-gpio-state {
>                 mux {
>                         groups = "GPIOX_0", "GPIOX_1", "GPIOX_2", "GPIOX_3",
>                                  "GPIOX_4", "GPIOX_5", "GPIOX_6", "GPIOX_7",
I'm wondering whether we make the keys work without having to specify
a pinmux configuration for them separately.
Our pinctrl driver already sets:
   pc->chip.set_config = gpiochip_generic_config;
So you should be able to use the GPIO_PULL_UP flag for these GPIOs in
device-tree instead of specifying bias-pull-up here, for example:
   gpios = <&gpio GPIOX_0 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;

output-disable is managed by the direction of the GPIO anyways.
pinmux_ops.gpio_request_enable is also implemented by our pinctrl driver.

This is not urgent - I am just curious as always :-)


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
