Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23924C83F12
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Aug 2023 10:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:From:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jzMNhQKIXWNU8fYPyVz3TBTQtO+IKuDBaWnqOyFG3ac=; b=Q/daUeHDs5YHC3
	kzVb5VIrulaAvx5RNIKClJNaaWM96XEgObnC+uAGgZC2mXCcuACVW/oxmA+0fgtHC3CW4HH10AKFO
	mw3bwLJqd0r4fVDCpdPj7rhfYlnQxJKYqD74aefM9aSaJkqmONsYazBBaf6TaKvrhH/NFV8H7TE3W
	xUeFCVsbc6ywNfLoe1ZpGu7zKBBV8HbVseg2XhUV4pkS5Pz5TW/sLg9xken61fO8LgWmEfjPstxuy
	d84BJdviYWRP6TARCR02bH/gBCUYM4zl2wazxBhlln7bCShQZDRYr6SKfBHR6LdMjZZTas8BlZvYf
	dImjQDWJNsgWUKQVpueQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbesJ-00F0a7-0C;
	Thu, 31 Aug 2023 10:26:07 +0000
Received: from mail-4027.protonmail.ch ([185.70.40.27])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbesE-00F0ZM-2t
	for linux-amlogic@lists.infradead.org;
	Thu, 31 Aug 2023 10:26:05 +0000
Date: Thu, 31 Aug 2023 10:25:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1693477559; x=1693736759;
	bh=v1SgijnNSc5kit2PCJSIPerjrDrm3hZq06k3CBpj9oc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=YPjwsahdUGLjaI9QY+70aOxtevPome452d/8ae2NWDX8haCQtGw3riDFLUPNaMdvO
	 Oc/I6un5gtj2y/qgiAsLB0vCOIb5RRLrwlVIJq07THFtesnLIKGCn84synvYhIuSZ7
	 fnY+YyzxJURwlKEmQC3Aj11qTTJj5RzdZ3vDy1ZY2tsONcRoKByozM5gBdvb1rvwgi
	 YRSDcQgnNbFeyEORJaE3utj+12LUgFhCEA54aYHHguU4EgLwhJx3xIssb+Sz41gSK4
	 4iFF+uFS18GrPiGRU+OtJpkCEUs2Wcr6G3vkP9W5tJL+Q/Q2YyybSUDb9RessZK+XW
	 kpAudQq1LoMFQ==
To: neil.armstrong@linaro.org, Simon Glass <sjg@chromium.org>
From: Ferass El Hafidi <vitali64pmemail@protonmail.com>
Subject: Re: [PATCH v2 0/1] meson: Demonstration of using binman to produce the image
Message-ID: <CV6NO816M3FH.30VZXHR4KDM49@flaptop>
In-Reply-To: <d94b0cae-99cc-4f8b-9d0d-52a5858f6e33@linaro.org>
References: <CV61D7ULLVZ0.3OCFZ743L1KSE@flaptop> <CAPnjgZ2iff6F3CFjnjEMUVoX3bO=kv3za4Q45YOcVeZqc96=rw@mail.gmail.com> <d94b0cae-99cc-4f8b-9d0d-52a5858f6e33@linaro.org>
Feedback-ID: 37421466:user:proton
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_032603_109777_C6BC0544 
X-CRM114-Status: GOOD (  16.58  )
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
Cc: u-boot-amlogic@groups.io, u-boot@lists.denx.de, alpernebiyasak@gmail.com, linux-amlogic@lists.infradead.org, mark.kettenis@xs4all.nl
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Simon,

On Thu Aug 31, 2023 at 9:54 AM CEST, neil.armstrong wrote:
> > Thanks for your efforts on this. I look forward to seeing where it ends up.

I hope we can get it to at least boot!

> >> Honestly, in my opinion, including proprietary and poorly-written
> >> Amlogic utilities lacking a proper license, into U-Boot looks like a bad idea.
> >
> > With Binman, we don't really include them in U-Boot; we allow them to
> > be fetched easily so that a complete build can be produced.

Acknowledged.

> > I don't like it either, but for users it is better than doing the
> > build manually.
>
> I'll rather spend time and effort to have a fully-upstream TF-A boot chain
> for Amlogic SoC (when possible) that maintaining support for bulky closed-source
> x86-64 binary only tools. The tools aren't even officially distributed.

I agree with Neil here. I think having U-Boot SPL for Amlogic SoCs, along with 
a unified way to sign it across all SoCs, is more worth the effort than
trying to get poorly-written Amlogic utilities to work, along with a
fully proprietary "Trusted Firmware" (it's not that secure) boot chain.
I also forgot to point out that these tools are x86_64-only, so if you
wanted to compile U-Boot on any other architecture it wouldn't work at
all.

But this RFC patch does show how binman can be used for making all that
complex signing automatically. I appreciate the effort.

>
> Neil
>
> >
> >>
> >> [1]: https://git.vitali64.duckdns.org/misc/u-boot-kii-pro.git/log/?h=wip/spl
> >> [2]: https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tree/plat/amlogic
> >>
> >> Cheers.
> >>
> >
> > Regards,
> > Simon

Cheers.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
