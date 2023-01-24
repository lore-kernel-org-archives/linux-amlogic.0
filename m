Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D55C38142
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 08:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XBbYZ0TpcrzlEfmnctSG44Hkgnk8hXiRiBstWX02Z8g=; b=t0zwu7dBaR4pZD
	MTeG+Hts90yzavFk551ss+qkqnvPupou9mUxEiTdqW6AAzOWG/S4Xs7mIohV9dAbntuKZdGTPt1Ds
	Ytime7fre8wiOyA9eJI/QbBkxE51R/k8PXDj4yNqzPWtsaP33X/c9LBASV+ELutm9k2IEvJymaiLI
	SU0Morm+fO9QMDb8OoLqXI2i5mXjzs0PGD7CkZQfsdvbM0875vJJ7SSfU30W8sEuEUiNCR7buxdVM
	iXuwSPLrDLbmLD1AbVN4Y5Zy1136HDoifCrPro34uvcqTXRqBiPCOVBlBu3gKD+UydYa4vZ0VJ0Wq
	f8qNVxOiRwDoOTwvz96w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKEZg-002jG6-Kf; Tue, 24 Jan 2023 08:22:36 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKEZU-002jBU-Hz
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 08:22:27 +0000
Received: by mail-wm1-x335.google.com with SMTP id g10so10797864wmo.1
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Jan 2023 00:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9DqS2Jn9nJYNaDy07cme/7hQmGWWsUBjAPPDyYRsn4=;
        b=Vu2rxQhfqYQNgFFNRdKmRY6baqaJ+wwVQzel9USbomB3kstntshg/9LBTQZpk5SPY6
         SDRy0WiL0IpizDWYRT0N2/2Tw1JeWu/YXwMwC8sok/CA/IeuO7BG+6Zol4XtzttTWx5z
         mzP2+6XybKArW3kdhnDz3yYcoa2rZvGJnIZUjiWplWf7HLXCmww+AKipfQ3vWJ1GPsA6
         pt1qrFpjgHqM4VdD8nFt9XdEk7RrYhBC50UqZqkKZ2H0LhH/uCQlm93ENJmEOu/mssSM
         5TsN/fO5/a8Cdc1QexvNUVnfKWlsJCNoGvlpEnxP2OCHrRpWWJ0FL2TGptMEVapD16Cd
         fvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9DqS2Jn9nJYNaDy07cme/7hQmGWWsUBjAPPDyYRsn4=;
        b=cy7959IObXsme4rPaoFMDTEA15CcfO4S8hQmwluRUqVskEV6dQsrYkO6RjzFryEMmo
         SKq6buRCikOzpNlGdC2ER+rMtIP4Yl0joPiQSK1YY7rKplQl71iI5Qd+DnHmOLx89jhF
         liAlgB+pKHDTjRcatwyfUR6P54HIpMfZVp9LCv56qa10xXLeIPePaYEDOwsKj1ezgMCK
         B89ia8V1oDM7dwWwRwrwtc/UjWM2eqckvQjBdIF9cfWaDpINl2gaGNdohCGhgMedGmju
         RkQmSUbmKfafqyo9vGi4qAxbf/Xsdct0w82WX463bmQSs4VG0lZoBSMxSAzUbS24vOuC
         sSxg==
X-Gm-Message-State: AO0yUKXqOogF6uCs3Jewx/ftW7o3eXJMvRdvMZzypau4a8Y79Lw4XDxs
	I7h4qWv6H3n/Rxo0iUG3AJaw8g==
X-Google-Smtp-Source: AK7set9kgsgyREqDkDA4wXQveg9l8CTz4di8q5DI2C+/Ud24R0ZH9g/nee+rfw3tBwzBqjJdZL6CoA==
X-Received: by 2002:a05:600c:4fcb:b0:3dc:1687:9b9a with SMTP id o11-20020a05600c4fcb00b003dc16879b9amr460697wmq.37.1674548535007;
        Tue, 24 Jan 2023 00:22:15 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id h13-20020a05600c2cad00b003cfa622a18asm13870207wmc.3.2023.01.24.00.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 00:22:14 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Alessandro Zummo <a.zummo@towertech.it>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
Subject: Re: (subset) [PATCH 0/8] soc: amlogic: switch bindings to yaml and
 adjust some dtbs's
Message-Id: <167454853388.2972173.6260080234043719240.b4-ty@linaro.org>
Date: Tue, 24 Jan 2023 09:22:13 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_002224_660138_BEE47520 
X-CRM114-Status: GOOD (  13.43  )
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

Hi,

On Mon, 23 Jan 2023 22:22:15 +0100, Heiner Kallweit wrote:
> At first adjust some existing dtbs's so that they pass dtbs_check
> after switching bindings to yaml.
> 
> Then switch further Amlogic Meson bindings to yaml.
> Tested with make targets dt_binding_check and dtbs_check.
> 
> Heiner Kallweit (8):
>   arm64: dts: meson-gx: Remove invalid pwm compatible
>   arm64: dts: amlogic: Fix non-compliant SD/SDIO node names
>   arm64: dts: meson-gx: Set only one compatible string for mmc
>   arm64: dts: amlogic: Remove invalid compatible string
>     amlogic,meson-gpio-intc
>   dt-bindings: rtc: Add Amlogic Meson vrtc controller binding
>   dt-bindings: pwm: Add Amlogic Meson PWM binding
>   dt-bindings: interrupt-controller: Add Amlogic Meson GPIO interrupt
>     controller binding
>   dt-bindings: pinctrl: Add Amlogic Meson pinctrl binding
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/arm64-dt)

[2/8] arm64: dts: amlogic: Fix non-compliant SD/SDIO node names
      https://git.kernel.org/amlogic/c/1be13a5091bf71627aa1a3d35360b039510f42f3

These changes has been applied on the intermediate git tree [1].

The v6.3/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
