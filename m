Return-Path: <SRS0=t7Bi=WE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1223C433FF
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 19:47:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7079F2184E
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 19:47:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hFV+KaLu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="OpC2gncS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7079F2184E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eKB4uMyu76wjANd+LGg9UnLDc9Y41XaQspADRcb3DrQ=; b=hFV+KaLuUIoAqr
	PsrMEhUhV7BEQSf+eBu6LVtSdMGPBi7RN2weq4LmoXjlrnkSYi0LDCQ7Bzt7z0aMUhcNnqu7TJnzu
	OrJF9vZU6vsrjhmxfazfuiyFXvkEzGTciag/2H7xiRaHQ1PtB7ctCi6DQ418iBp8/TiqgS8DJoDh9
	eDc2q9zaT3buskIffOOy7pTRSJuEvsAFr9mkWOrAH0bastreO0e51jJcIcKjzXw5HFAtWa0zhVOAA
	t2UktdzF423qRgUet//6VUEVW4c49nTvB4pLN/qm0vjTU8FJUbir69JBPSXHDtukLD4oRJWdBXLE9
	0h2OU5ZyFemdVmqWsYaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvoO7-0002xz-8l; Thu, 08 Aug 2019 19:47:51 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvoO4-0002x5-7m; Thu, 08 Aug 2019 19:47:49 +0000
Received: by mail-ot1-x342.google.com with SMTP id j11so23020538otp.10;
 Thu, 08 Aug 2019 12:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fVsgaqUQ+TY2x5x7j3h0EJIjp1dyKYtAS/dTFHwFE4Q=;
 b=OpC2gncSoouwEVr7BnFdYNGd+LTHxiJVVLiZJqUASJhCoGnH7dth65A7q3cNhqzbaR
 pFGqq1Rvb1KcpsNFycH3tgSzHrHKMhleLnfVvqcyAQEKvIXtUPBMw2RLnJ7wsYwEaJ5E
 yFi56IdDPTVsWQpc/jaUbb2QY+sA0j32RCCUgsvHocyOyswM51qD1lPxs8a15pOav2Vg
 Uuk6GL3du0HTsrRV9oaaDjUPtyNNRKIYLoSLXls/+1ZSRgtGHWJLqnap/u5EQfPfsA8z
 ml9FIlnAiDzEokQGAeydeUOI8nz4l8lKhbmdO4H4lzO5iDYpQzzc8wh3lHuKDySsu+fO
 ZFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fVsgaqUQ+TY2x5x7j3h0EJIjp1dyKYtAS/dTFHwFE4Q=;
 b=eS6GaT3Bf8HNP6eCkjv6MaJsqeAyG//iWU2c8/YeH/EVmBtZmGALfvK5eaSeYbYfcc
 VnNssSfjSEjwITai3Vn+KfAcSxbSSFXxRnBwrEJY/GMXvrwY+2gLWvTCfirGO7hhqQEK
 nMAjgCZFSHnycS6dpSVK24jgaihppgC4uCyh7mjaEXx5up4oye02XjQhwpok7346shF6
 AozoQ3t9oMtTYvin+6g2qqgkKwGAuzQMfCSIlD62S0L2V37kYVTtWd5SMLqAhMkytp3l
 fKCaXhvEe8AauVYDMfckoy1YgrvpoweK5GFYq91taI+4UQFMojtzP8pFk/vc+Ky93+M8
 9MPg==
X-Gm-Message-State: APjAAAWLZD791+pq/v749LKTGmHd6vPfCieLibHAjSlb8B4XkIwYWMKp
 krR4E9oeIhiNjVllAtsSRcrw1M3oWV6aDDjeMSU=
X-Google-Smtp-Source: APXvYqwB+udbmGy6ZFtRl3z5o6an+2PDm6oq7fHTtN2/gSnu1r5f4Cu204e9wczn6Do0L2d8lFmaDEqcIHEGVEjwifU=
X-Received: by 2002:aca:d415:: with SMTP id l21mr3860865oig.96.1565293666522; 
 Thu, 08 Aug 2019 12:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190731153529.30159-1-glaroque@baylibre.com>
 <20190731153529.30159-3-glaroque@baylibre.com>
 <CAFBinCDGSJABnS1L1ULueyeXZaV38qrxEA0a12gB-uyRC_TvPQ@mail.gmail.com>
 <14e14cd9-46bd-0d43-654c-6db64397f5c7@baylibre.com>
 <CAFBinCB3ZBPVEJKV2Rfh_w-zWrhoToYdoYE6Wox+JeB-YH+Khw@mail.gmail.com>
 <7hblx0fjkw.fsf@baylibre.com>
In-Reply-To: <7hblx0fjkw.fsf@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 8 Aug 2019 21:47:35 +0200
Message-ID: <CAFBinCBzDM7dpAKwf29UENvHgCEscyUCHdjQwb6Wkz4i2ShJbQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] thermal: amlogic: Add thermal driver to support
 G12 SoCs
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190808_124748_303962_595D23F0 
X-CRM114-Status: GOOD (  27.95  )
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 guillaume La Roque <glaroque@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Kevin,

On Thu, Aug 8, 2019 at 4:59 AM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>
> > Hi Guillaume,
> >
> > On Mon, Aug 5, 2019 at 2:48 PM guillaume La Roque <glaroque@baylibre.com> wrote:
> >>
> >> Hi Martin,
> >>
> >> again thanks for your review.
> > you're welcome - thank you for working on the driver :-)
> >
> > [...]
> >> > The IP block has more functionality, which may be added to this driver
> >> > in the future:
> >> > - reading up to 16 stored temperature samples
> >>
> >> it's not working, you can verify it if you check the regmap define in the driver. in fact temp is only write in one register, it's confirmed by amlogic.
> > I missed that - so please skip this part
> >
> > [...]
> >> >> +config AMLOGIC_THERMAL
> >> > we typically use "MESON" in the Kconfig symbols:
> >> > $ grep -c AMLOGIC .config
> >> > 1
> >> > $ grep -c MESON .config
> >> > 33
> >> >
> >> > I also wonder if we should add G12 or G12A so we don't conflict with
> >> > upcoming thermal sensors with a different design (assuming that this
> >> > will be a thing).
> >> > for example we already have three different USB2 PHY drivers
> >> >
> >> > [...]
> >>
> >> i check with Neil and for new family it's better to use Amlogic instead of meson.
> > can you please share the considerations behind this decision?
> > if new drivers should use AMLOGIC_* Kconfig symbols instead of MESON_*
> > then we all should know about it
> >
> >> i don't add G12 because we already know it's same sensors for SM1 SoC family [0].
> > my idea behind this was to avoid conflicts in the future
> > in case of the thermal driver we may be fine with using a generic name
> > assuming that Amlogic will not switch to a new IP block in the next
> > years
> > I'm not saying you have to change the name - I'm bringing this up so
> > you can decide for yourself based on examples from the past
> >
> > here are a few examples:
> > - when Kevin upstreamed the MMC driver for GX he decided to use
> > MMC_MESON_GX for the Kconfig symbol name. it turns out that this is
> > smart because there are at least two other MMC controller IPs on the
> > 32-bit SoCs. due to him including GX in the name the drivers are easy
> > to differentiate (MMC_MESON_MX_SDIO and MMC_MESON_MX_SDHC being the
> > other ones, while the latter is not upstream yet)
> > - when Carlo upstreamed the eFuse driver he decided to use MESON_EFUSE
> > for the Kconfig symbol name. I found out much later that the 32-bit
> > SoCs use a different IP (or at least direct register access instead of
> > going through Secure Monitor). the driver for the 32-bit SoCs now uses
> > MESON_MX_EFUSE. if you don't know which driver applies where then it's
> > easy to mix up MESON_EFUSE and MESON_MX_EFUSE
> > - when Jerome upstreamed the ALSA driver for AXG (which is also used
> > on G12A and G12B) he decided to use the SND_MESON_AXG_* prefix for the
> > Kconfig symbol names. in my opinion this was a good choice because GXM
> > and everything earlier (including the 32-bit SoCs) use a different
> > audio IP block. we won't have a Kconfig symbol name clash when a
> > driver for the "older" SoCs is upstreamed
> > - (there are more examples, Meson8b USB PHY driver, Meson8b DWMAC
> > glue, ... - just like there's many examples where the IP block is
> > mostly compatible with older generations: SAR ADC, RNG, SPI, ...)
>
> While these are all good examples, you can see it can go both ways, so
> there's really no way know up front what is the "right" way.  We only
> know after the fact.  Unfortunately, we simply have no visibility into
> future chips and where IP blocks may be shared or not (there are other
> examples where vendors add a new version of an IP *and* keep the old
> version. ;)
>
> Even having worked inside a (different) SoC vendor and having some
> knowledge about what IPs are shared, it's difficult to get this right.
right. The fact that it'll be the IP block in SM1 will be backwards
compatible (or even the same) means that it has a longer life-span
than some of the USB PHY IP.
so I'm fine either way


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
