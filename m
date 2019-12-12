Return-Path: <SRS0=UZyj=2C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50FCDC43603
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Dec 2019 06:23:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F71722527
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Dec 2019 06:23:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HaCgYF3K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5SWiyDV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F71722527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3FUGm2+hf2rjGdWRuDmwI1f39ByLjkyZHAEsfcbfnFw=; b=HaCgYF3KAl+KDi
	JgU/IfgULXaA3KlrMxdQ83DK1Gz970QFJmYkOyR7B6vEy6D/6yCFB+jTlI6ENVf5EiZmj2WIjhYdf
	fCH0OxjF1/05m3kiNJVUliarxP/3EulvB7bb4iVkLItV2lpwt46hEx+Rdj8ZM2SGH786Kow4ogBgT
	ta3cbkvKmvUvRBKW3ObbXF9Mdo9Z8iPUv9w9apXQ9I6m+mTOIY5grP4TvlKoXYyVVDVAE47X6LZrl
	f/Cik85Zx0GRazH3Lbe6krwDwLw5JSnIn95sPaDgDjqTMm6dQqgSL+7CcAaGnZ6r0sxAKVjHxcnvS
	lo0zExlzTFe1tcML56PQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifHsm-0001tH-Cc; Thu, 12 Dec 2019 06:23:28 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifHsj-0001sZ-BZ; Thu, 12 Dec 2019 06:23:27 +0000
Received: by mail-io1-xd32.google.com with SMTP id b10so702527iof.11;
 Wed, 11 Dec 2019 22:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v6NmxBZ8vV201dlBtVW07bjKFin+mwj/uirkjZ9u0AY=;
 b=j5SWiyDVBNqZT1PcE6iXH6kE4RXdm62NrmqGIGv09+lSo4LTU5s7rWwFFmSGdpfUNi
 sukpKFsgP7aFXfbDSo7gsCtzYOPCJbv4q4vWY41dBTOabdpeSYTXBy/5+BMQEItJ15Sy
 y09om1CxA57hk3TMln3XC75K+AYNnnV77NfqUChNDt1uXAAZ8M3dDrpgwaDVin3vILWY
 5RhPY8iXSQ6NpUwvysBTC2YAUy5KsFKZcjVT/rzBCfpILNNiqZf0DlCEupx7Mc3WCoUP
 QkifWL5/1ME7tcmUiqm0xDlRvNYzSVtT/CW4k6muK0LK6CZCnxvYuOVBQdpJXln2+9kU
 bFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v6NmxBZ8vV201dlBtVW07bjKFin+mwj/uirkjZ9u0AY=;
 b=q524Mn5tyy+/XZg8sp4YeMrm1/KmZ6WfCIuqewM2mWRXSYQtaTOtdY+HlkcF0Bpu8+
 HNg92pJJvs8IYGX7c56OSFImS24bF0lYCgMf3qVstTw1Wd3rD8QivpUTatm1WtgVYKFm
 mWLbjuGvcv1Q58nc2TghU9DLns5Tz/GICM37QtN0bOJZuT5ZePiK+1ne5tyeuKXnPXhk
 iWuddAuqEJCPIDXutjyCLvJTEbDPzk02GFzCdi5mtov1P/0lTTHGZG+SQ4N2l0XSUgp4
 Z9ontWbZUiyL1Ldp53yUUn/OlqwwBUvyIEcEvFGxf99O6y3l9xDqPgoiPtMnDPvdMGv9
 W+pQ==
X-Gm-Message-State: APjAAAUE0i1Haghd29QJbIPrFg110RMEBIzqS0g3EWNWH0T3B7v1Yzzi
 LK4YdR06zk/BmIGCreBLDoKOzBvpOV8KMSafNTw=
X-Google-Smtp-Source: APXvYqwX8wJ8S7PF+1+fB9M3X5vS3O9OPKaGmpvdWd2oR7M6q2o4l+sGHZnsLdxEECGes2O5N5+2Naz6XZS/VC/A84o=
X-Received: by 2002:a6b:4401:: with SMTP id r1mr1649395ioa.243.1576131803998; 
 Wed, 11 Dec 2019 22:23:23 -0800 (PST)
MIME-Version: 1.0
References: <20191211084112.971-1-linux.amoon@gmail.com>
 <a4610efc-844a-2d43-5db1-cf813102e701@baylibre.com>
 <CANAwSgQOTA0mSvFW5otaCzFPHidhY7VFcrXZHjCD-1XkQpcx3w@mail.gmail.com>
 <20191211095043.3kngq7wh77xvadge@gondor.apana.org.au>
 <CANAwSgR-fT21uBSP747MVkXf2GYqm_6kcne059pX-OegftLSZA@mail.gmail.com>
 <CAKv+Gu8HQ7RY9WSYZrLUR7tNjuybF5sp7xe94VLQpJrDSRg4NA@mail.gmail.com>
 <1229236701.11947072.1576070229564@mail.yahoo.com>
 <CAFBinCAxq-uW+gsmb-8wqxHGXt2W+4w9iD++2fL=FQ7S-RsAkw@mail.gmail.com>
In-Reply-To: <CAFBinCAxq-uW+gsmb-8wqxHGXt2W+4w9iD++2fL=FQ7S-RsAkw@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Thu, 12 Dec 2019 11:53:12 +0530
Message-ID: <CANAwSgR0nrVJKGxO3_Tv6g=1dKgnSJN3VJ0WxAdxGhzhWx1jkg@mail.gmail.com>
Subject: Re: [PATCHv1 0/3] Enable crypto module on Amlogic GXBB SoC platform
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_222325_422926_BB77C42E 
X-CRM114-Status: GOOD (  13.09  )
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
 Herbert Xu <herbert@gondor.apana.org.au>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Corentin Labbe <clabbe@baylibre.com>, Anand Moon <moon.linux@yahoo.com>,
 linux-amlogic@lists.infradead.org, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

On Thu, 12 Dec 2019 at 05:00, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Anand,
>
> On Wed, Dec 11, 2019 at 2:17 PM Anand Moon <moon.linux@yahoo.com> wrote:
> [...]
> > Sorry once again I send my logs too early.
> > I still having some issue with the Hardware glx cryto module.
> I'm surprised to see that you managed to get the GXL crypto driver to
> load at all on GXBB
> as far as I know GXBB uses an older crypto IP block (BLKMV) than GXL
> (and newer SoCs, called "DMA"): [0]
>
> so my understanding is that a new crypto driver is needed for GXBB
> (BLKMV registers) support.
> the 32-bit SoCs use the same BLKMV IP block as far as I can tell, so
> these would also benefit from this other driver.
> (I don't know if anyone is working on a BLKMV crypto driver - all I
> can tell is that I'm not working on one)
>
>
> Martin
>
>
> [0] https://github.com/khadas/linux/blob/195ea69f96d9bddc1386737e89769ff350762aea/drivers/amlogic/crypto/Kconfig

*You are absolutely correct. current crypto GLX driver might not work for GXBB*
Yes new crypto driver is needed for this board. I will try to study on
this feature.

But both S805 and S905 share the same crypto IP block for.sure see below link.
[0]  https://github.com/khadas/linux/blob/195ea69f96d9bddc1386737e89769ff350762aea/Documentation/devicetree/bindings/crypto/aml-crypto.txt#L1-L61

It's not working see the debug logs.
[alarm@alarm ~]$ sudo modprobe tcrypt sec=1 mode=500
[sudo] password for alarm:
[   39.567302] tcrypt:
[   39.567302] testing speed of async ecb(aes) (ecb-aes-gxl) encryption
[   39.570171] tcrypt: test 0 (128 bit key, 16 byte blocks):
[   39.570229] gxl-crypto c8832000.crypto: meson_cipher ecb(aes) 16 1
IV(0) key=16 flow=1
[   41.598687] gxl-crypto c8832000.crypto: DMA timeout for flow 1
[   41.598900] tcrypt: encryption() failed flags=0
[   41.603383] tcrypt: test 0 (192 bit key, 16 byte blocks):
[   41.603424] gxl-crypto c8832000.crypto: meson_cipher ecb(aes) 16 1
IV(0) key=24 flow=0
[   43.646686] gxl-crypto c8832000.crypto: DMA timeout for flow 0
[   43.646900] tcrypt: encryption() failed flags=0
[   43.651378] tcrypt: test 0 (256 bit key, 16 byte blocks):
[   43.651419] gxl-crypto c8832000.crypto: meson_cipher ecb(aes) 16 1
IV(0) key=32 flow=1
[   45.694691] gxl-crypto c8832000.crypto: DMA timeout for flow 1
[   45.694902] tcrypt: encryption() failed flags=0
[   45.699419] tcrypt:
[   45.699419] testing speed of async ecb(aes) (ecb-aes-gxl) decryption
[   45.707838] tcrypt: test 0 (128 bit key, 16 byte blocks):
[   45.707872] gxl-crypto c8832000.crypto: meson_cipher ecb(aes) 16 0
IV(0) key=16 flow=0
[   47.742677] gxl-crypto c8832000.crypto: DMA timeout for flow 0
[   47.742879] tcrypt: decryption() failed flags=0
[   47.747366] tcrypt: test 0 (192 bit key, 16 byte blocks):
[   47.747402] gxl-crypto c8832000.crypto: meson_cipher ecb(aes) 16 0
IV(0) key=24 flow=1
[   49.790684] gxl-crypto c8832000.crypto: DMA timeout for flow 1
[   49.790898] tcrypt: decryption() failed flags=0
[   49.795380] tcrypt: test 0 (256 bit key, 16 byte blocks):
[   49.795420] gxl-crypto c8832000.crypto: meson_cipher ecb(aes) 16 0
IV(0) key=32 flow=0
[   51.838680] gxl-crypto c8832000.crypto: DMA timeout for flow 0
[   51.838894] tcrypt: decryption() failed flags=0
[   51.852005] tcrypt:
[   51.852005] testing speed of async cbc(aes) (cbc-aes-gxl) encryption
[   51.854903] tcrypt: test 0 (128 bit key, 16 byte blocks):
[   51.854941] gxl-crypto c8832000.crypto: meson_cipher cbc(aes) 16 1
IV(16) key=16 flow=1
[   53.886678] gxl-crypto c8832000.crypto: DMA timeout for flow 1
[   53.886882] tcrypt: encryption() failed flags=0
[   53.891385] tcrypt: test 0 (192 bit key, 16 byte blocks):
[   53.891428] gxl-crypto c8832000.crypto: meson_cipher cbc(aes) 16 1
IV(16) key=24 flow=0
[   55.934686] gxl-crypto c8832000.crypto: DMA timeout for flow 0
[   55.934901] tcrypt: encryption() failed flags=0
[   55.939410] tcrypt: test 0 (256 bit key, 16 byte blocks):
[   55.939447] gxl-crypto c8832000.crypto: meson_cipher cbc(aes) 16 1
IV(16) key=32 flow=1
[   57.982684] gxl-crypto c8832000.crypto: DMA timeout for flow 1
[   57.982899] tcrypt: encryption() failed flags=0
[   57.987429] tcrypt:
[   57.987429] testing speed of async cbc(aes) (cbc-aes-gxl) decryption
[   57.995832] tcrypt: test 0 (128 bit key, 16 byte blocks):
[   57.995864] gxl-crypto c8832000.crypto: meson_cipher cbc(aes) 16 0
IV(16) key=16 flow=0
[   60.030680] gxl-crypto c8832000.crypto: DMA timeout for flow 0
[   60.030880] tcrypt: decryption() failed flags=0
[   60.035369] tcrypt: test 0 (192 bit key, 16 byte blocks):
[   60.035406] gxl-crypto c8832000.crypto: meson_cipher cbc(aes) 16 0
IV(16) key=24 flow=1
[   62.078678] gxl-crypto c8832000.crypto: DMA timeout for flow 1
[   62.078888] tcrypt: decryption() failed flags=0
[   62.083377] tcrypt: test 0 (256 bit key, 16 byte blocks):
[   62.083416] gxl-crypto c8832000.crypto: meson_cipher cbc(aes) 16 0
IV(16) key=32 flow=0
[   64.126684] gxl-crypto c8832000.crypto: DMA timeout for flow 0
[   64.126899] tcrypt: decryption() failed flags=0
[   64.143285] tcrypt: failed to load transform for lrw(aes): -2
[   64.155243] tcrypt: failed to load transform for lrw(aes): -2
[   64.167318] tcrypt:

-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
