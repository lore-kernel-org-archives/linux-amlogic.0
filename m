Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB4FC636D4
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Feb 2023 12:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1D5n8TxIQnaAspY4NS73DcKsga38fmLVAGvNu8tRBQo=; b=ZrjdQ8fGJ0Kl/M
	qTYvFrFToEpX0cWmCREU6/EU13cQRj8KGHYxnqjF2S4AI++qjJV3X1ykAX5sqXvCQvvBELhAt+gg7
	gEx2Hjc0lZs1ZHHiSTmUngthgt+D9rTsSKQ/TtLlNFF3ODJQU6OYlJpE6XIH5OQ/X7nMpSEJDf/Xb
	TnztImJ2Md0g1ZM9wcUBvvobvUsgCq/XuyPapLr5TDwjBgGG0Xc39qg6xu2NJtpE1+6ZuQufaiv6j
	Tno34LbCFebtITGTqaOOuU9l6Lv2rH4seovKJ4iXKi13DYq2UtVAik8b+rImbo2mHisSoGBoJhv7o
	r6mf8o/inEeyBesO03LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHDd-005qaM-QT; Wed, 15 Feb 2023 12:49:05 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSHDb-005qZ8-0O
	for linux-amlogic@lists.infradead.org; Wed, 15 Feb 2023 12:49:04 +0000
Received: by mail-pl1-x633.google.com with SMTP id e12so2603185plh.6
        for <linux-amlogic@lists.infradead.org>; Wed, 15 Feb 2023 04:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1676465341;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zJ4BUazyXS0K48fM6Er+hgNzJxPV4473C9yyzDZurhE=;
        b=DnpL/OJbs517pIJBv7UZkQPXuJR8Z2nfHPQPSGrgVEB3AgGXe2/9z+9pl6fRYuEKQM
         WUXCCVLCc7uOKfu6lT8/n27etN4D1EUA1S5awS7D9NnaxpLT3fHsB8AeSUaNPZTJ+rHF
         3Lq7mJgUAF44j3l1vtS++BCkZTin7RWVvctVr5/ejSMFlBostfi8WmjJFAo8t12fBQvz
         +1ZR7z5r4yy6pchXbNEZ0jeqZiHTPQNQu3omoRURf0W0Jj2VTXTJptKR6ZQNjR+Rwy+K
         qGTKHlG5fWbxis6XjSz4CJzknCwL/XpkLOHr6cinqtsRyEotQXxTotW8jO31FcB1DZvk
         wmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676465341;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zJ4BUazyXS0K48fM6Er+hgNzJxPV4473C9yyzDZurhE=;
        b=7AuxphgQKhP7y/NSSkjCWJDOYloup2FhfvoEfipzVnMWrLiXEHEqbqxyJSi+fRibMY
         75y3eZd+UTwedcqO+d/eMWZyXEh0W8mbYxvSPj+ng4tOJZPuU504bREo3eIoi5/iLgIQ
         7xqk8D2q7KO/5mmzqMcroM0C+1C+9qsvHY0WgcXXVOA+br06h3bcuWSdI/K6pHB195Rc
         7YNrzVeqevVdOVjJT152DiQwh8wvWjxmOA+xz/TZJi5qAmJAYZOTjy0BZfRuUMkdc5xj
         J1VdRCjTgGskMll8YMi6ksfsrCoISqXG54RsZpK8psof3fAi9yhbtt8NF6M2+isBTJOP
         t6lg==
X-Gm-Message-State: AO0yUKVhljtOm4bRgQv+2dX7xYLhxH9a6yExXo1SHmNkW3CLZO/VXgkt
	n1tEVHOjWEgEyX0AjnpCFc100b9Uk7LHdymjNyqGQg==
X-Google-Smtp-Source: AK7set+T7NKsh+QRbmcYjfUFAkz8tVhEKaLuhSPZ8VsL0cW+kM2Wy7wlgaC9MgBB5hg5VOCY6Tga4oo3jt03Pl9STMk=
X-Received: by 2002:a17:903:26d1:b0:199:15c2:99ae with SMTP id
 jg17-20020a17090326d100b0019915c299aemr469271plb.20.1676465341107; Wed, 15
 Feb 2023 04:49:01 -0800 (PST)
MIME-Version: 1.0
References: <15df9ef0-9b73-ca5a-d3cf-0585cd135bc5@gmail.com>
In-Reply-To: <15df9ef0-9b73-ca5a-d3cf-0585cd135bc5@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 15 Feb 2023 13:48:24 +0100
Message-ID: <CAPDyKFroB-TULOeia4OyXBW6rWMs7e3_Fp4Uw878Q8Gt=TDfag@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] mmc: support setting card detect interrupt from
 drivers and use it in meson-gx
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_044903_071430_209B5ACC 
X-CRM114-Status: GOOD (  12.78  )
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

On Tue, 14 Feb 2023 at 22:39, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> On certain platforms like Amlogic Meson gpiod_to_irq() isn't supported
> due to the design of gpio / interrupt controller. Therefore provide an
> option for drivers to pass the card detect interrupt number
> (retrieved e.g. from device tree) to mmc core.
>
> v2:
> - use another mechanism for passing and storing the cd interrupt
> - add patch 2
>
> Heiner Kallweit (3):
>   mmc: core: support setting card detect interrupt from drivers
>   dt-bindings: mmc: meson-gx: support specifying cd interrupt
>   mmc: meson-gx: support platform interrupt as card detect interrupt
>
>  .../bindings/mmc/amlogic,meson-gx-mmc.yaml      |  2 +-
>  drivers/mmc/core/slot-gpio.c                    | 17 ++++++++++++++++-
>  drivers/mmc/host/meson-gx-mmc.c                 |  5 ++++-
>  include/linux/mmc/slot-gpio.h                   |  1 +
>  4 files changed, 22 insertions(+), 3 deletions(-)
>

Applied for next, thanks!

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
