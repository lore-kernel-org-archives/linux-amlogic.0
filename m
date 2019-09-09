Return-Path: <SRS0=Cl/A=XE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EEAEC4740A
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2019 17:24:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F6D721924
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2019 17:24:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="POcZATx8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="YHy1qrMk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F6D721924
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mZYqziUa3+4gJuKSeJpj6B8cdYpuJbNihQpXHAtzCXQ=; b=POcZATx8tuCn89
	ZexVwr/USM7b2Dbxq/QGp34/vVKKKa0yYmefOu7naL7QqzXZaGA3s7tV/BF/d+d9EuR8KaOgYC0qj
	S6uNGq6wAL+FHky+RquJczIYkmre+OwmggoU1YzvQRJ8VSM+l459TVPKJPhSmtVup/BeWozlsvhd8
	GDTD/HTs5N5R1aSOiYWz9a0ArjPvO0prAx4pwKe9vuBUutoIeqKZrIupvBd0FKmQAv7MfkhbwkBc5
	alV2PG6yEyhEPWkpC4W5fIDWg2CC+2SgUDDXFrdbuy5thSjNhOb7wyor0ppNnNt3PC0K+nnS16/T0
	ReHYp7esiX52Q3AKGF+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7NP0-00086Q-9Q; Mon, 09 Sep 2019 17:24:34 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7NOy-000862-0T; Mon, 09 Sep 2019 17:24:33 +0000
Received: by mail-ot1-x343.google.com with SMTP id b2so13313641otq.10;
 Mon, 09 Sep 2019 10:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6Wt1hD/MRsQkqqV33+GUQZHencJLKuHpXLwImoJRYqM=;
 b=YHy1qrMkczFFQ67ktlriXxOyE29+Bp3XIJ4JoIRyg3btuchKYh3OUMaKdFI2UjMXQD
 RrRefDltC3kmYcSXFqCYXX8o/i3xwLUGhJKwxrsdjspUD65Ya7wHxSH6XKvx5U4vSRBa
 R+hO9dTTrFgUaQ+8YXuQHV1dOLkj8osB0WquDFeaCIDRWie5SvRJz1hmUQWSbHQpxDvZ
 A16PEZ+me5Sa+F/aHm8nFPxB7n76Bj7m6w4LF8oG92BkZSQ/xLXI8oovo5IF8eUcl5z7
 3QVyGjBIJpEK3RoUqlvuJqdp4nosMcmKI4FVpRdJSOYNH5QgZSq9OSHNmvPBLS/uFN0G
 HJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Wt1hD/MRsQkqqV33+GUQZHencJLKuHpXLwImoJRYqM=;
 b=hzrZwW2bkkMVVijWT5jnixqsx9si+MC4PHUvGsdnv3Nx0Bj6+eL6tv0ztjj/sdNG/c
 CrKsDJTcTpH+k4uoTWX/b5FhW/S3euQoyszdYdRcnhHO0WZ8Td8B9Uan08KtUEn8ikIG
 D4Y4tShFHJvcL7O+LX5XkruoHnX8S00v/XwKp0ueZSu6ssGdCMecqq9poDC6zWz4EZEi
 up9yMyX69z6QWJYy4EBbqZ2rsFezo+Iy2SN+bA/zi6EaaDrHInbacHi1L4EtmWWicYCy
 uZGXS+3XTkfgWXDmd4FrJoDOrJcpyUWmC0OdqO+ntWsRxrU2Wmb0wfaVOqbhanwIC51P
 UWGA==
X-Gm-Message-State: APjAAAWaq0q0lxygE7sIHBxAtfeEL3qw3xnI619jtnzWUiVveaiP9vyo
 g7ruejxKqdN/I1adFbQwrGezafo/uv8uTI8+Ezc=
X-Google-Smtp-Source: APXvYqx/wYKZsFCWHqjgcQBulyAf2hyBig9egcPMosBzQP1ky90Mmva1Ji9X/RYvJZ4uQspim2j2H9duJRW0qz6v1a8=
X-Received: by 2002:a9d:5c0f:: with SMTP id o15mr21270768otk.81.1568049870233; 
 Mon, 09 Sep 2019 10:24:30 -0700 (PDT)
MIME-Version: 1.0
References: <1567667251-33466-1-git-send-email-jianxin.pan@amlogic.com>
 <1567667251-33466-5-git-send-email-jianxin.pan@amlogic.com>
 <CAFBinCBSmW4y-Dz7EkJMV8HOU4k6Z0G-K6T77XnVrHyubaSsdg@mail.gmail.com>
 <be032a85-b60d-f7f0-8404-b27784d809df@amlogic.com>
 <CAFBinCD7gFzOsmZCB8T1KJKVsgL7WMhoEkj3dRzyqwAnjC0CNA@mail.gmail.com>
 <a82336e2-44df-5682-1c86-daf8a8448d30@amlogic.com>
In-Reply-To: <a82336e2-44df-5682-1c86-daf8a8448d30@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 9 Sep 2019 19:24:19 +0200
Message-ID: <CAFBinCAJG4=M3BSXfREGU+iadMPkc7=yt3AdcqA1KAhQx6Wh9w@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: add support for A1 based Amlogic AD401
To: Jianxin Pan <jianxin.pan@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190909_102432_079276_45977A85 
X-CRM114-Status: GOOD (  15.81  )
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Qiufang Dai <qiufang.dai@amlogic.com>, Rob Herring <robh+dt@kernel.org>,
 Jian Hu <jian.hu@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Tao Zeng <tao.zeng@amlogic.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jianxin,

On Mon, Sep 9, 2019 at 2:03 PM Jianxin Pan <jianxin.pan@amlogic.com> wrote:
>
> Hi Martin,
>
> On 2019/9/7 23:02, Martin Blumenstingl wrote:
> > Hi Jianxin,
> >
> > On Fri, Sep 6, 2019 at 7:58 AM Jianxin Pan <jianxin.pan@amlogic.com> wrote:
> > [...]
> >>> also I'm a bit surprised to see no busses (like aobus, cbus, periphs, ...) here
> >>> aren't there any busses defined in the A1 SoC implementation or are
> >>> were you planning to add them later?
> >> Unlike previous series,there is no Cortex-M3 AO CPU in A1, and there is no AO/EE power domain.
> >> Most of the registers are on the apb_32b bus.  aobus, cbus and periphs are not used in A1.
> > OK, thank you for the explanation
> > since you're going to re-send the patch anyways: can you please
> > include the apb_32b bus?
> > all other upstream Amlogic .dts are using the bus definitions, so that
> > will make A1 consistent with the other SoCs
> In A1 (and the later C1), BUS is not mentioned in the memmap and register spec.
> Registers are organized and grouped by functions, and we can not find information about buses from the SoC document.
do you know why the busses are not part of the documentation?

> Maybe it's better to remove bus definitions for these chips.
my understanding is that devicetree describes the hardware
so if there's a bus in hardware (that we know about) then we should
describe it in devicetree

personally I think busses also make the .dts easier to read:
instead of a huge .dts with all nodes on one level it's split into
multiple smaller sub-nodes - thus making it easier to keep track of
"where am I in this file".


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
