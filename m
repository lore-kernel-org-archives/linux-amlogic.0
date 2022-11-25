Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CEDCC43217
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Nov 2022 23:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Fver7wqTj4plTGq4WkLohDiy3Beo+RJvlRh5bTv2Rc=; b=C8J2Ryr4g+BOaf
	QAggRlEhW90C2/dIkjdRfMiO0gkD50o+Qxxv8pg6RIcTgsr4L41U1Ro6cpozsbKmb0sPAqblZyvUw
	MzrRVO+ntA4xS9+O34f2frw1eVvWIr6XRpZcTwjZCCd4W0qIUHYjQxDNJp0rsPKaH2XrGGLk5b+hx
	qEpbT4/iAlwZDzVwN3ujpRl14wHc0e5VWN4ijPQtpL3yTZUS3FsC/l6jb2xHTa1pnXXFgdGMOybxJ
	xfB7gaWcHctobzAKaf32PRCEVKgbZq2qR6Q6Ru0gXvj7J7BAgoszMY8ov4RWdn/L2pDbDOCiYCbAS
	9UREFVkoOaTp7uTemWgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyiBx-002qXT-QS; Fri, 25 Nov 2022 23:33:09 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyiBv-002qQC-Fc; Fri, 25 Nov 2022 23:33:08 +0000
Received: by mail-ed1-x532.google.com with SMTP id z20so8161586edc.13;
        Fri, 25 Nov 2022 15:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ul41aLivPpoStmBIkSe3PwxjiFmKEfN8civiUwQkxa0=;
        b=TsTP7xsKiWaL4D0DEw5NERyXETDLlo76uN/V9q+MEzuJornm/EOwKNzZhQq73S9955
         o8QCJhKYktAb++vUDJVobm7vqLP487mpTmUv5onvf0U9k7xDb1mZmMMmB4LH9Q0LuHDE
         eN2XwwIwocdxmZgm3YZGIIQt7kbNoQe0LIyIPk7B4vsvRs+vSgqORcDt/P+hjTxKeBtA
         lvPrf+XjMkFNPwZNHHNLysXxG3Nn8CZp9A/B0ZxbbSPuVCbKxpdxpmY3taLw27V4g7uT
         tqa0ulf6ccJUIzp8j7nHUHCqmkMiUcWnbIkpzrx5DON5WiCnhXQv1E52fFDeGGn8I5qE
         dcWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ul41aLivPpoStmBIkSe3PwxjiFmKEfN8civiUwQkxa0=;
        b=bSN03GNHYkxyo18yxdw6Q36hwgZSBZjKGKA0kkAQoM1mx9zDfrGZQowL/Oanrkedxt
         lJ+mGHdwANiQ+6HuC1KsWkuYmBgHZR604bCUHhyENphcGsJR1M7zLnWsdbOivPl14CnJ
         3pc61WEKuqyQM7yNs4b6RReKC5arghs05ZXAr21fTG7hcPoiv9+sf3K7t8r8g9oW1bxb
         Its2CzBvOI2IT0met9j74HHuAMoWeANhheSVP17pOjy1POBv+QIDz/ziicXKA0VZU0Rl
         QEAY1N+JPXTdf7A4Z3vxK23GvhbQo9lfTRHWfZHnsF3cMsqPR+j16f/53xXodyDC6dKG
         kMsw==
X-Gm-Message-State: ANoB5pkKR2apQJ4YcR9OgqaZzjGoNigtv+iaOGzz69Ss6ucmn8G+MI6J
	4FVBEbZjJIJWYMmzQonB5s9w0xvBPqx30lEqk/s=
X-Google-Smtp-Source: AA0mqf5un8E+VJYr8xkakEy/VtUbHh82LR9urvSYcLJYttWK02ci8Lrk7k46XZMqWxXRiTAywc/PrXQ5qe1vMXdN+kw=
X-Received: by 2002:a05:6402:2404:b0:467:67e1:ca61 with SMTP id
 t4-20020a056402240400b0046767e1ca61mr4218659eda.27.1669419186903; Fri, 25 Nov
 2022 15:33:06 -0800 (PST)
MIME-Version: 1.0
References: <20221117-b4-amlogic-bindings-convert-v1-0-3f025599b968@linaro.org>
 <20221117-b4-amlogic-bindings-convert-v1-4-3f025599b968@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v1-4-3f025599b968@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 26 Nov 2022 00:32:55 +0100
Message-ID: <CAFBinCDNqyb+AydSyN19ddJsUMo3RXKVJh=8sZgy3nYEc+vcxQ@mail.gmail.com>
Subject: Re: [PATCH 04/12] dt-bindings: watchdog: convert meson-wdt.txt to dt-schema
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Alessandro Zummo <a.zummo@towertech.it>, 
	Eric Dumazet <edumazet@google.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Kevin Hilman <khilman@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Paolo Abeni <pabeni@redhat.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-media@vger.kernel.org, 
	netdev@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-mmc@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_153307_560274_B5FA4415 
X-CRM114-Status: GOOD (  13.01  )
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

Hi Neil,

On Fri, Nov 18, 2022 at 3:33 PM Neil Armstrong
<neil.armstrong@linaro.org> wrote:
[...]
> +unevaluatedProperties: false
Could you please also add an "interrupts" property?
This watchdog IP can generate an interrupt instead of resetting the
SoC. We don't support this in the driver yet, but still it's w
Somehow the interrupt made it into the .dtsi but not the bindings.

[...]
> -- compatible : depending on the SoC this should be one of:
> -       "amlogic,meson6-wdt" on Meson6 SoCs
> -       "amlogic,meson8-wdt" and "amlogic,meson6-wdt" on Meson8 SoCs
> -       "amlogic,meson8b-wdt" on Meson8b SoCs
> -       "amlogic,meson8m2-wdt" and "amlogic,meson8b-wdt" on Meson8m2 SoCs
The last part did not quite make it into the new schema.
arch/arm/boot/dts/meson8m2.dtsi currently has:
  compatible = "amlogic,meson8m2-wdt", "amlogic,meson8b-wdt";


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
