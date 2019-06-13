Return-Path: <SRS0=0Q1W=UM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E958EC31E45
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 19:44:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C232420B7C
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 19:44:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q8p0P08E";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GXPxPEvK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C232420B7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uVYp0Ih/TwjLOlaLDKtBbD5bQkL5e8XZq/eKtEL4duk=; b=Q8p0P08EAhrQaR
	gOOEISajvSkYBQvaLDNAJqan07zPbnUV3MMqZxYtdzDC7yZxFAGWCf5NPgQE557S4fl2U4/1mG/bv
	1V+PP5gV32o6GvlG9LiCoruBfk0gkkvgXiqHqLbVKTtkxFW+tEfvYOY46jW7EiahUukPXxGCbnWJF
	LmIPW/fTiA2v7olMG8SEVqMZ8IHmMpjpvsgMNT9stPSr2wVdADotNpalgximj8AWIqQV3chjh9iyJ
	YYZcqR33ydJnNHyeGeuGegUxlFpkzm1FDN60KjKq2NHpopK9WudSybyEDrKfYdTjlDlQUDE1foxng
	yPZjuSoC9NL+8Z9MMf8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbVdX-0006ZG-NG; Thu, 13 Jun 2019 19:43:51 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbVdN-0006O8-5K
 for linux-amlogic@lists.infradead.org; Thu, 13 Jun 2019 19:43:42 +0000
Received: by mail-pg1-x543.google.com with SMTP id 20so101670pgr.4
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Jun 2019 12:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=KW0Z4bu+Gf02siC8Ql384namK/DDKjE4PFjCJrNDUjg=;
 b=GXPxPEvK72RwpcZiLiyRReXtw1Wjc/AGegiT4k7TB6D4NOH32vHiL2klJ7WDzrKRLd
 yFNZGhHmTM+M2WsPXWENW0p6HPCAxffoF+NtziVfVxZ0MC2CeUOhhl5EzPSryEoaJSZp
 tSZS0Qdx35I+q3Lhl5eqYLv+HsqBHwKCf2a1IjyByC2+Po9PcBx8fEvyNg7sgkl8HY3a
 LwkNJJPbz5V/n9zNDbIpO9nOAlLsTI9s/43jiCBHmB3wBjGgMv1kVQEpwCDddh3EZiIV
 /nG6WrLkpGvvwZMECY31KU9ciO/o58PjtWDXXPmtlUSlL0hhpMJ692W16K7a/tIjUv9B
 MrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=KW0Z4bu+Gf02siC8Ql384namK/DDKjE4PFjCJrNDUjg=;
 b=Sw1MELkOUD5wHJm+qmUKCN08OfGUL4DTB8jQXYoYZa4MlFNzQz3w1QURh0awY+DTdQ
 FkqI4mhoieDFkd/VT4+Tf1m9pzw+vFI/9PhBJeepRfB1yjgcUEKrJlHuXlvp5+3edk9A
 MBuJZnsVTQRZR9wTCs9Bk0g9xAx6vTQW1yO9StYmuIBsmhbCRrn7ITOqtoQ+fZr4Bjm4
 SWLT8TyNOKRT3jBTsg5fHifbulUIWWEsShvPdTGLEYQabd0WxloqNIJccI24DpxJIUmm
 K/ohMs0bcTbFArCg0z0DowD3oBLWOWZTaauh+9AMHI73DPNnQ5KdxsUnT+Xz0QHU2FZS
 AVhA==
X-Gm-Message-State: APjAAAXiDSmhdxJTZnX0IYZmwOYooqDlK5Aj+SHrRppXD4fS2hwEyvju
 tqJPD4iTvD3X8pra6Fr9xA2/Pw==
X-Google-Smtp-Source: APXvYqxSYHqNZdqTSfRe1FzHStMnfFh8RI/pkpNSFr1I9FxUSOwyYqc3IxV80z5rXApnfUIRc0w0zQ==
X-Received: by 2002:a63:610d:: with SMTP id v13mr31667742pgb.341.1560455017658; 
 Thu, 13 Jun 2019 12:43:37 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id g71sm602255pgc.41.2019.06.13.12.43.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Jun 2019 12:43:37 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 0/4] ARM: dts: meson8b: add VDDEE / mali-supply
In-Reply-To: <CAFBinCAVqBxiRz+Fw5D+8XEPTxP13O35OhSD0pEzKjFcGK1H=A@mail.gmail.com>
References: <20190525190204.7897-1-martin.blumenstingl@googlemail.com>
 <7htvcv3dhh.fsf@baylibre.com>
 <CAFBinCAVqBxiRz+Fw5D+8XEPTxP13O35OhSD0pEzKjFcGK1H=A@mail.gmail.com>
Date: Thu, 13 Jun 2019 12:43:36 -0700
Message-ID: <7hd0jh46fr.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190613_124341_204924_1EAE6B45 
X-CRM114-Status: GOOD (  15.10  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> On Wed, Jun 12, 2019 at 1:32 AM Kevin Hilman <khilman@baylibre.com> wrote:
>>
>> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>>
>> > EC-100 and Odroid-C1 use a "copy" of the VCCK regulator as "VDDEE"
>> > regulator. VDDEE supplies the Mali GPU and various other bits within
>> > the SoC.
>> >
>> > The VDDEE regulator is not exclusive to the Mali GPU so it must not
>> > change it's voltage. The GPU OPP table has a fixed voltage for all
>> > frequencies of 1.10V. This matches with what u-boot sets on my EC-100
>> > and Odroid-C1.
>> >
>> > Dependencies:
>> > - compile time: patch #4 depends on my other patch "ARM: meson8b-mxq:
>> >   better support for the TRONFY MXQ" from [0]
>> > - runtime: we don't want the kernel to change the output of the VDDEE
>> >   regulator to the maximum value. Thus the PWM driver has to be able
>> >   to read the PWM period and duty cycle from u-boot. This is supported
>> >   with my series called "pwm-meson: cleanups and improvements" from [1]
>>
>> Just FYI... unless I hear otherwise, I'll wait for the PWM cleanups to
>> land before queuing this series.
>
> I'm happy with that because I'm not sure what will happen *without*
> the PWM improvements

OK, then I'll rely on you to ping (or resend) on this series to remind
me when the PWM stuff has landed.

Thanks,

Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
