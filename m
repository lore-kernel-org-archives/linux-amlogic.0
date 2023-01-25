Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D90C54E94
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Jan 2023 16:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u7tDpQMP0rc5Fv5zf9OQfDuutKUIbimwu2/06//3k1U=; b=tCvf7XLFC72aQ5
	VItEq2en/09riteasAx/ZOr8RxzStelPGT224bUGP4ZZbdbmLIAhuEN1U6pEol2PdEanCVb4PFilH
	wMQ0fDjre4Wc0WzImgQuxfezJDoMwBcsVKJ6gRRltv+I+XlAbNPS1gp8j13Pa2KFprTFwIHhr8y9j
	9kaESAA5A6tgrlTM9n/RY2xsqld1h16DJrWxSPj0icdGe2eJOAGZR+GJIm0Ca3fY4YbANR1M9Sg8E
	Pasj3OFe1h7dUlQix+lbimoMVS/UCdyAj+jj2t4dBLapdAIk7kDR6lz7kAIHQRRjtc8TEiM/pL5C4
	/tO5kL88WoF94JhosxmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKiv4-0082P1-Dq; Wed, 25 Jan 2023 16:46:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKiv0-0082Lr-0u; Wed, 25 Jan 2023 16:46:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E6E0061226;
	Wed, 25 Jan 2023 16:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E62EC433A8;
	Wed, 25 Jan 2023 16:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674665195;
	bh=xfla28zJBRsWQXlBseFrkXF56zvwRirAY/10+O6Gusg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Dlm6sDlROFpggiDg+SA67d6opXGecZCzhdxg7YeK/ToJXgpYMtPrjPZnPNswbiNQO
	 RU3i9whhAz/orOrH/Z4Xhfgiu7svabkuoqJJVe1CZPd/YtzbF3Sf3JwH5fz+1Lprny
	 IECDs6KubJB6cjehtcbUdoveg5kLh++iTN88G+VafS9z9QzecwVqV/O9lIbT71yZ/O
	 1W2efdb1/nLx8hsKhQWusZmyC+4ymleM7BeWWBXD0PKd5r6CvzX6tK34fPYZWJfhoM
	 HNHspSWjR/GPEKJ/iHfjDgV3Eji7kG6zPNztQO9g2YsyMR8LOqzu+gNxwDKD3FLm5I
	 YmOW1D8PfpcDg==
Received: by mail-vs1-f48.google.com with SMTP id i188so20334540vsi.8;
        Wed, 25 Jan 2023 08:46:35 -0800 (PST)
X-Gm-Message-State: AFqh2kq1Kmjtp58tK2hyQqFiBEZ4N8SsGaNgKyXPZNNvk0xh8FYgUf/2
	68sAYIQzoVqh0WNenFLVcOVsiWQyAPQiJDBEFw==
X-Google-Smtp-Source: AMrXdXukkClxVJmORCFGUtNIYT840ix5e1Pd5Glna3rS2gUNazjUpgsHwDnIQtt7qoedMPCgyP02fjS7IrIEoFB0Z1Y=
X-Received: by 2002:a67:f506:0:b0:3d3:c767:4570 with SMTP id
 u6-20020a67f506000000b003d3c7674570mr4933608vsn.85.1674665194514; Wed, 25 Jan
 2023 08:46:34 -0800 (PST)
MIME-Version: 1.0
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
 <06289641-18b1-320d-6162-7ae176452f31@gmail.com> <167452325371.3118653.16373677195744392136.robh@kernel.org>
 <d8f0a5a9-5a16-1f63-8444-86434ff52e34@gmail.com>
In-Reply-To: <d8f0a5a9-5a16-1f63-8444-86434ff52e34@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 25 Jan 2023 10:46:22 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKgo65fiE8+dzMHNRu3XJ8eBm43w8MoQdCwwm2zvxJeFA@mail.gmail.com>
Message-ID: <CAL_JsqKgo65fiE8+dzMHNRu3XJ8eBm43w8MoQdCwwm2zvxJeFA@mail.gmail.com>
Subject: Re: [PATCH 7/8] dt-bindings: interrupt-controller: Add Amlogic Meson
 GPIO interrupt controller binding
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-pwm@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Jerome Brunet <jbrunet@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-rtc@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alessandro Zummo <a.zummo@towertech.it>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Marc Zyngier <maz@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_084638_196573_C1015835 
X-CRM114-Status: GOOD (  24.23  )
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

On Tue, Jan 24, 2023 at 1:04 AM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> On 24.01.2023 02:22, Rob Herring wrote:
> >
> > On Mon, 23 Jan 2023 22:30:08 +0100, Heiner Kallweit wrote:
> >> Add Amlogic Meson GPIO interrupt controller binding.
> >> Tested with make targets dt_binding_check and dtbs_check.
> >>
> >> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> >> ---
> >>  .../amlogic,meson-gpio-intc.txt               | 38 ----------
> >>  .../amlogic,meson-gpio-intc.yaml              | 72 +++++++++++++++++++
> >>  2 files changed, 72 insertions(+), 38 deletions(-)
> >>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
> >>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.yaml
> >>
> >
> > Running 'make dtbs_check' with the schema in this patch gives the
> > following warnings. Consider if they are expected or the schema is
> > incorrect. These may not be new warnings.
> >
>
> Patch 4 of the series fixes these warnings.

Then you can ignore them.

You did change the binding somewhat and that should be detailed in the
commit message. Granted, the original details on 'compatible' seem to
have a typo and are ambiguous on the order of entries.

> Did you apply the full series?

No, because patchwork doesn't get the full series nor do I see the
full thread when reviewing these bot emails before sending them. If I
see a conversion and warnings that look like the schema should be
fixed rather than the dts files, then you get this email. Though on
further review, dropping 'amlogic,meson-gpio-intc' seems fine given it
is often in the wrong spot (it should be last as it is least
specific).

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
