Return-Path: <SRS0=9NnP=YA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68371ECE58C
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2019 15:53:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 399D720679
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2019 15:53:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KiHkHI4I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFJtBjNc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 399D720679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NGBRtbtrcliOjHbseqAADQNwD0B8vDVg0nkHtMbG7Uo=; b=KiHkHI4I9nGQNq
	ykZPHV+8djxI/iT5Orwj5HpPKfj/h8Km2MS7GIHglYRZCnYctDSBDuJFQqo8hyggepmhsbWEmPy8Z
	JYsDYp4NgC6LalhMIX5ZF5ZKIYBQaQEfkWpj6489rdUlVG8x9iCSTGQtrVCu73PVq0dHpg+mb61yZ
	9Mqm7LqG2YkSpSLs5iD2ClV1nfINIlubhiDDZfuVTLZE/TFOFtd3QxJCUvD1CWGmqJb/zWjcg6W+E
	A8RqsEbf3Es5IvcAx9x73F7erCd0y47XTzNSmPbJZyeEwhKu58KJJ2QF+vTSNPzBEU0x4ykKl24sH
	oqXJ1UHQ8uWxs4SWKyDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHVK3-0007ps-Bk; Mon, 07 Oct 2019 15:53:19 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHVJu-0007hF-BC; Mon, 07 Oct 2019 15:53:12 +0000
Received: by mail-io1-xd44.google.com with SMTP id w12so29580268iol.11;
 Mon, 07 Oct 2019 08:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y0+KKOJG+TisZYwANPRDxoGgI9F6Pi0RrxyV+mcRIhQ=;
 b=jFJtBjNcMzZT/dfV5DNd+SYdyhKORKldayK714j3ON/TvF4lEz54VZg0ohvI4G5pqF
 lAWdRi7RPMXntGegumJYq6RIQrmDTg4porBhN27Lbv7Sk/7cJgqCZaCS2KEFkh/DrEaU
 LG9AUPnMp1r3a8dLLYjdd+V1jld8BVZ4BY6JSnKVz+X5a0nXZfoiM5bwiQsJKqde/8BI
 c6rJAW38SVFX+bvt4NqsXXg8Ra1WppUYCjZnx8ruBLTXBoEM9uhU1ezFtSRJV7TsPrkG
 f5rSu/ObEDrsieCcbZrOtmnVt1Yi4ZHZt2KRd5ih6mqMcCroRAGJqtnXERea7kprkZ4t
 JJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y0+KKOJG+TisZYwANPRDxoGgI9F6Pi0RrxyV+mcRIhQ=;
 b=mz9e15DH9sDS0N+TwTaHC2/WID4sDj5OXrqCcb9Tz6zVd9CKqr4UBMpsUu9/rpOztE
 Q2jllxr4LxqC4uzOwJzb9dDzqmGLCOakvbQijzVM7Vg4tV6zTQ2wbX+hSmDRl3sjSbKc
 zA9WlJS97CeyHu3XnqeAefoDkoEN0rL+wob3+ifRjD7j3dt2f7t4I0whfzcEqtshXOUz
 ljz5tBEaFq9MIFWAILE5eEB8w4NQMF52y2uTjqKsEPjMxA0/ElSQUxPSsysbQUCZhfRA
 /j18ko0tfqQRR+O/FoBKpv6uMAMpaqnljhSk0ODZty/dptcyEWvbfN9TjhQiV0VTFXWv
 OLqQ==
X-Gm-Message-State: APjAAAX/FRUmTQWIXd96ENwsYomHYJKnwJ7lgLSqr1yqma5rsBSn1Jwt
 CQpP5dBy7Zj6duK/JS/hZW4wGREkJ7p0fuEQBbk=
X-Google-Smtp-Source: APXvYqwUmomEUUz3nspO76GFofpEr9Y5lkrzEIBCKloUqkS8g5O/eiwEu29XJ6ktN11Av8YdVnKFAgPHLckXUaGYYDE=
X-Received: by 2002:a02:245:: with SMTP id 66mr2498022jau.30.1570463588898;
 Mon, 07 Oct 2019 08:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20191007131649.1768-1-linux.amoon@gmail.com>
 <20191007131649.1768-6-linux.amoon@gmail.com>
 <74ab98c7-0071-60e9-7613-56d15ad8c0ab@baylibre.com>
In-Reply-To: <74ab98c7-0071-60e9-7613-56d15ad8c0ab@baylibre.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 7 Oct 2019 21:22:56 +0530
Message-ID: <CANAwSgRStPUi=naKOw+E=X-b699DnZ0Q0hYAGrUB8VKtN-fFqQ@mail.gmail.com>
Subject: Re: [RFCv1 5/5] arm64/ARM: configs: Change CONFIG_PWM_MESON from m to
 y
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191007_085310_410592_0D44F6DD 
X-CRM114-Status: GOOD (  19.10  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-amlogic@lists.infradead.org,
 Will Deacon <will@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, 7 Oct 2019 at 19:55, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 07/10/2019 15:16, Anand Moon wrote:
> > Using microSD card we cannot get the mainline kernel to boot
>
> What's the link with microSD card here ?

Well I thought that the PWM failed stop's booting further on linux kernel.
But looking into kernelcli.org it seem to be working fine, but not at my end.
[0] https://storage.kernelci.org/media/master/v5.4-rc1-82-gc0e284ccfeda/arm64/defconfig/gcc-8/lab-baylibre/boot-meson-g12b-odroid-n2.txt

>
> > using mainline u-boot it fails with below logs.
> > Build PWM_MESSON as build-in solve the issue.
> >
> > [    1.569240] meson-gx-mmc ffe05000.sd: Got CD GPIO
> > [    1.599227] pwm-regulator regulator-vddcpu-a: Failed to get PWM: -517
> > [    1.600605] pwm-regulator regulator-vddcpu-b: Failed to get PWM: -517
> > [    1.607166] pwm-regulator regulator-vddcpu-a: Failed to get PWM: -517
> > [    1.613273] pwm-regulator regulator-vddcpu-b: Failed to get PWM: -517
> > [    1.619931] hctosys: unable to open rtc device (rtc0)
> >
> > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> > Odroid N2 Schematics says "GPIOC_6 should not pulled low if GPIOC is not
> > work as SDCARD"
>
> Sorry, what's the link with the PWM build-in, and your case ?
>

Sorry I linked two issues with this commit message.

> This comment is linked to the comment in the datasheet:
> ""
> If GPIOC is not work as SDIO port, please do not pull CARD_DET(GPIOC_6) low when system booting
> up, to avoid romcode trying to boot from SD CARD.
> ""
> Seems pretty explicit for me.
>

Ok I will recheck this at my end.

> > Is their any other approch to help resolve this issue.
> >
> > Boot log failed with cold boot:
> > [0] https://pastebin.com/cEtWq2iX
> > ---
> >  arch/arm64/configs/defconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index c9a867ac32d4..72f6a7dca0d6 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -774,7 +774,7 @@ CONFIG_MPL3115=m
> >  CONFIG_PWM=y
> >  CONFIG_PWM_BCM2835=m
> >  CONFIG_PWM_CROS_EC=m
> > -CONFIG_PWM_MESON=m
> > +CONFIG_PWM_MESON=y
> >  CONFIG_PWM_RCAR=m
> >  CONFIG_PWM_ROCKCHIP=y
> >  CONFIG_PWM_SAMSUNG=y
> >
>
> For these changes without the microSD fail description in the commit log :
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks. I will rephrase this without linking the microSD card, with
better commit message.

Best Regards
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
