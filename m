Return-Path: <SRS0=kh+7=FX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2818C4361B
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Dec 2020 14:27:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D3EE21D95
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Dec 2020 14:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D3EE21D95
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tdzBkBzkgwuNG5QCvZ/qg7BXKh+dAgGomRJbIhRSqAc=; b=yDC9oR7mHaqFrzzV8Q8+LPUC4
	T1abY9m3PB2xeOGIOwP9ct1ByQIvXJvEVFX94CNc/ebbsWr9Fj+Z0sVw5FFWRG06s8LwDzYtB+cGP
	cTRo8X9kTw6dVBdXsi1mw6zNTAVuQeT4iWqPyWhlfqYEUQZQoBA6sFMBzAtkhSknYKyR1HazT4bG4
	QR/v3YDAvDbFM7CfEHpTlg/2U32wzUstaQ0krZsnERlSSL0iGf9Vc/rslMfFOB/bIxJOz/4LoIG64
	Vcl6oBLBkw3DR5Z6FvF64g3+R41iIRZkmj+K0fglR4DDKHZoMaAH+CuoSmw/NyvZDkz8TpVvQEezm
	XYfN9Hw8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqdCL-0006zS-8B; Sat, 19 Dec 2020 14:27:05 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqdCI-0006yy-2e; Sat, 19 Dec 2020 14:27:03 +0000
Received: by mail-ej1-x634.google.com with SMTP id d17so7335411ejy.9;
 Sat, 19 Dec 2020 06:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PJMg4vY77FD72cLzResqMC8J22HpDhYfkvekbDOA8hw=;
 b=OGr9rPKYFmPOCIjFUUpZdaXqb0hPQHTqk2Ejk5SP6B62mJ7ILEn/gYZ9FLIAg/1Jhu
 QwMiLw3+afTFysuyYbXYcL8EsF40dldaYU4+5udTS2aXD5z9znJYAbS0/vKebvCNhVT9
 LQhtzgbPTfBVE8IrSxlHqtMO/HoGvBhYAOKeOJ+tzIxBG7ve0evmN8UNGYPkiuM2zxy9
 qyFSDfRCvvZYER3Xd9EjHtJmkdCw99iSUhE4CzVm02MOP/AWAddSPX0VfbU62XTwetDD
 fsKTFcOhqvqUYAfBkPPnC8fD8/pyGw9dKp9zd5Ov/in2Y1H8tGDN8wdGQO1VHY8MVrCx
 sGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PJMg4vY77FD72cLzResqMC8J22HpDhYfkvekbDOA8hw=;
 b=QrjI4ZfInARjRwNp3zzkinRgbEGTBJoZtuPAKe6FwA2YsAhLK8Fo0uEL7lsfs6S9Hy
 6AgJGGN5QfCQrGKZM39dlvVtD/+bkGDDYLM8GCcVU5znGRHCpCQ77REtZ1wqyuK9iFWj
 N45qwjw3jBAhPI4b+4XvF+ASgtVcdsxzAtuJhwtHVYeks4CDfanXH2FwzoZ/XgVtYaLf
 mrYGp70Hxw6KZQDqDhwlqKGLII5ocxIoP78KcrHlH/gwzR7gMZiTjPkpYMhhouojz6YK
 JiidFwq3KDauKMbPiqqjUWnuBNo5F0KgxzTm9d0Sa0sdfamQG8AYjXp5sZ/WVGVBJMhU
 ZmtQ==
X-Gm-Message-State: AOAM531afNzto0NZqSW/ey4YQgEklw+IRWBLwCr8oelTZirmVmykTnFQ
 aeSKrQpOKd+2wXqLcspsxrEqPreyoq93g+ngP2dP1TiMPhc=
X-Google-Smtp-Source: ABdhPJzHCQAe/WZxH76JhNyP6u/9CtJ78yS9Hefnoixpz1+91CJWSuLXg7X7q3Dm2FNyAmW1/L+E9r9iFQjHUqJ89HA=
X-Received: by 2002:a17:906:6c8b:: with SMTP id
 s11mr8566123ejr.187.1608388020423; 
 Sat, 19 Dec 2020 06:27:00 -0800 (PST)
MIME-Version: 1.0
References: <CGME20201218102245eucas1p1c0e2cb401d9c5c8bb94b5fb740eaa3a4@eucas1p1.samsung.com>
 <20201218102228.16211-1-m.szyprowski@samsung.com>
In-Reply-To: <20201218102228.16211-1-m.szyprowski@samsung.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 19 Dec 2020 15:26:49 +0100
Message-ID: <CAFBinCAFh3yn1+wH0PhCYd9Thza=LG5-s=f7tXOf0RCkaXcE4g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: switch TFLASH_VDD_EN pin to open drain
 on Odroid-C4
To: Marek Szyprowski <m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201219_092702_189935_A5B887D6 
X-CRM114-Status: GOOD (  16.28  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Dongjin Kim <tobetter@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Marek,

thank you for this patch!

On Fri, Dec 18, 2020 at 11:23 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> For the proper reboot Odroid-C4 board requires to switch TFLASH_VDD_EN
> pin to the high impedance mode, otherwise the board is stuck in the
> middle of loading early stages of the bootloader from SD card.
>
> This can be achieved by using the OPEN_DRAIN flag instead if the
I think this should read "instead of ACTIVE_HIGH"

> ACTIVE_HIGH, what will leave the pin in input to achieve high state (pin
> has the pull-up) and solve the issue.
>
> Suggested-by: Neil Armstrong <narmstrong@baylibre.com>
> Fixes: 326e57518b0d ("arm64: dts: meson-sm1: add support for Hardkernel ODROID-C4")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
> Here is a discussion on u-boot's mailing list that inspired this patch:
> https://lists.denx.de/pipermail/u-boot/2020-December/435295.html
I'm used to datasheets not being up-to-date. but now also the
schematics don't seem to match the actual HW? :-(


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
