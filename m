Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0D4C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 20:28:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE87F20855
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 20:28:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N8QmHKPa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="OX/yUElu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE87F20855
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cOjuOLwKv1XngPm8YYvopZYKodk8hl0VEx4wwu9Y07o=; b=N8QmHKPaf3S7IY
	8cpIaUdMf1+px9xK2lTVjGZQbQ2Q+3EtlKMsdJKf0E8lW6jh/tE3y8Bn/7mUof2ikXyUcZ30qh2vv
	cg5Cb6wGWhO7Y8nXcgUQFw+XBqm8Jx9a3de/i6x1VFbautn3drrQS/yGbiV6QPEKrKCWlF848uzFS
	GUltuz0oSwDWLiFhvAqAgeZ21u8RMOwDzsAy2sGlAgUBlZsAbPhurSE79lFKDUOamdY2fvUY6q66d
	uqJDXIMe7Gtvjw1Vzj1GJ0C6D/QkFVQqmsyZ98hMmeKJxDTbm3DYc0Cmrvn9VEuSxp+3p3ekXETnI
	lRoyrHFesdMAXwLGCRSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkEGe-00064p-6S; Thu, 17 Jan 2019 20:28:00 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkEGa-000649-H4
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 20:27:58 +0000
Received: by mail-ot1-x342.google.com with SMTP id t5so7317848otk.1
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 12:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y/HXYh0cHPauar+ArG9l18TsCCkBugX4KAFs+CO7+MA=;
 b=OX/yUElubG+0ZNGnS/rZOB0Ag7XjykMrFyIwd07ERr/9qL1s0voYMx9KOqMF/yCKFw
 CA/XnPCWBxXOlVNCuQE2bCsM3hQjqvP3u1gYGI5q6sXEP4EWvIDe5w6i+n6bW1qp+s/m
 JcEYsOqzSB2j4/0nM3bb6VoCfa0/+XrVVvSIUjemtq6AJEEra4c0MHndaycGIzcGAWUs
 /9rD8T7cVNVVqO0NEyrJSLLYT10PiTiwRCEbaiY2T0x2In/YF/2xiTExRPN6lqbTukdF
 u7kzd+nKHFX6T3aN24tboK+PWmSlxIVcQyCWtQSpnu/ikijeIpPGVLeTToc4F1cYf7Gw
 YUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y/HXYh0cHPauar+ArG9l18TsCCkBugX4KAFs+CO7+MA=;
 b=Hfh6SdLFysi6M0ZQd4xP46BU2m3cqrzKTCqT+SW6skmI5ypYWloqg35doqhOdXKOOW
 KAbJFna5Z96dXO9X7HnfL2uF36boAQEOwzDSAuzphcXHbKHAXrxKXqB4xGgFLxW1BwEc
 7Ou7klGPHAOZP9a9sidmbaBAea6rDJMBVhyYUoQd6apAk/mwanZk1kM6BwbmFwuV/9gk
 Jszzv9XS23PBX4yIG9DiurE64U1+Gqo9gY4xc5ZcVx93Dp4svZWyEE2/0QNEoKYA5x47
 ikXpDxYJoIpruHiGYx59rswgLNZP4j9lFPXpG/2sbBWmAABKBebOIOSRsS2o5INZMJGt
 OZ8w==
X-Gm-Message-State: AJcUukc81iAVU/PvLAIPmQGocRWNygucpBRNDLHVYnJVKGoS1EOOtm7z
 w4N7XvOuwdx23kv/a5z4j/u/wFAoLXBgQcS3IOs=
X-Google-Smtp-Source: ALg8bN4/VpvMgwlr85nGQ7Y4Gg1u2L9beY6r1DqQczHxOsGQfRf3WxlIAWe730rU2hx4NtG9lzxbJgcUczCzacDg1mc=
X-Received: by 2002:a9d:6a8e:: with SMTP id l14mr9462139otq.348.1547756875094; 
 Thu, 17 Jan 2019 12:27:55 -0800 (PST)
MIME-Version: 1.0
References: <20190116165236.8330-1-jbrunet@baylibre.com>
 <CAFBinCBFge2tir-MXw+ojTxzW+7n9Uf4FzCahrw0MDzAYV2SSg@mail.gmail.com>
 <f7289814e316ad5879848fb8c379db396f615828.camel@baylibre.com>
In-Reply-To: <f7289814e316ad5879848fb8c379db396f615828.camel@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 17 Jan 2019 21:27:44 +0100
Message-ID: <CAFBinCDhryOWHmRKp7GhWp2O+NpJziEgHoUE4HKVitTPDMrrBQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: fix g12a buses
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_122756_562676_E9E2BD3E 
X-CRM114-Status: GOOD (  17.75  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jerome,

On Thu, Jan 17, 2019 at 9:12 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
>
> On Thu, 2019-01-17 at 21:03 +0100, Martin Blumenstingl wrote:
> > Hi Jerome,
> >
> > On Wed, Jan 16, 2019 at 5:52 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > [...]
> > > -               aobus: bus@ff800000 {
> > > -                       compatible = "simple-bus";
> > > -                       reg = <0x0 0xff800000 0x0 0x100000>;
> > are you sure about removing aobus?
> > in your patch "arm64: dts: meson: g12a: add pinctrl support
> > controllers" from [0] you're adding back an "rti" bus at the same
> > memory address, except that it's size is 0x1000 instead of 0x100000
>
> Yes, I'm sure. The fact that the aobus region size is completly made up, for
> all I know, is the reason
>
> >
> > I don't have any G12A datasheet so it's hard for me to ACK / NACK this
> > patch, here are some clues why I'm asking:
> > - GXM's public datasheet lists the "RTI" region at 0xC8100000 -
> > 0xC81FFFFF, we call it "aobus" in our .dtsi
>
> ... RTI region which will appear once i submit the clock controller
I assume you're speaking of G12A and not about GXM:
you already need it for your G12A pinctrl patches, which is why you
add it in: [0]

> Yes GXM (and GXBB, GXL or AXG) has the same made up region with nothing
> matching in the datasheet, but it is bit late fix that now.
looking at the datasheet: it seems that there's only a name mismatch
(aobus in our .dtsi, "rti" in the datasheet)
offset and size correspond with the datasheet

> > - buildroot_openlinux_kernel_4.9_fbdev_20180706/kernel/aml-
> > 4.9/arch/arm64/boot/dts/amlogic/mesong12a.dtsi
> > also uses an aobus node as well as an io_aobus_base sub-node for the
> > codec_io node (the latter is obviously not upstream)
>
> I know, but again, it does not map to anything in the doc, and it has been the
> case for several SoC.
OK, but we had incorrect documentation in the past. did you check this
with someone from Amlogic?

I'm curious because there seem to be two different approaches here:
1) hiubus name and offsets are being fixed within this patch
2) aobus is being dropped here and re-introduced with a different name later on

approach 1) can also be used for the "rti" region (at least in my
opinion, the patch doesn't explain why it can't be done):
rename "aobus" to "rti" and change the size to either 0x1000 or 0xb000
(both values can be found in mesong12a.dtsi from
buildroot_openlinux_kernel_4.9_fbdev_20180706)


Regards
Martin


[0] https://lore.kernel.org/patchwork/patch/1032981/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
