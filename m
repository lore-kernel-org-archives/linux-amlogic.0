Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C49C83F2B
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Aug 2023 03:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TfHiquWfBVrxqtXkFkvsaOg3I+dZpT9VuEZMbYejzNA=; b=mnTLwmHPUOlI7J
	8XcX4IPIxdi7PEIl62a/unBgetudT2KwalkL/oRGfthX4YURgtvqosfOqkPk7dFb2AQTC5AL47pdo
	kJBc2jnNGCWGGedkuuyB8u11x9D9+WsJPuU+3Za0+hKqhH12pEO9V2chgTBt78GD+lNsEMilEBR0P
	0QiamXAR5VAznn1pSgM8xG/EATCy8tJT1/Sozd7DyRaaz79t8UGO3u89h7tCJjqfEwY6IeSPQxG78
	JPlwGkPTMbFMb73nPVrE0QjPNMO5e23GVADi9WDj2H+6dMKeTTA6IBciTbNM7sbXvMndAk3rC6fke
	8dLPWo8ph+UQs9KXEx0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbYVn-00EZDd-1t;
	Thu, 31 Aug 2023 03:38:27 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbYVk-00EZCS-1Y
	for linux-amlogic@lists.infradead.org;
	Thu, 31 Aug 2023 03:38:26 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-52bcd4db4e6so371195a12.0
        for <linux-amlogic@lists.infradead.org>; Wed, 30 Aug 2023 20:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693453096; x=1694057896; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+TBDO8JqA8Pf9p0rgCblrIY62nYVu3+o0sUrr3BC2qQ=;
        b=egro8Ee6gFQY6DqAnbqo2+Y+/DoVYR87R2Zmb+deXk0gv0TpkwGWHMRsl3ig/v2krf
         4il2HcGp0f0JBGrqEElQfSfYSUeTSirDckC5zHGRkhU5d7Sr4WbIJ1m9yQJw4Hm3vUdN
         uWIH/xmBRemfMy3dEO0xrGHN0WAgDy9eq7Xv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693453096; x=1694057896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+TBDO8JqA8Pf9p0rgCblrIY62nYVu3+o0sUrr3BC2qQ=;
        b=P1D7JIN5C1ZSkj8zsfcpqxFJ5mTm36+uy9fRNFnXRTboe7PT004lN/BGweXcFhFUZr
         WNVvtNyw7HGN1+mOq6nSiwlViM9+oa30AtPs/xtp2W9S2TGnW5lWX+b7NkwFUaYeH6On
         ynn78MlKYKyLaAZ8+TZ6VHiD49H36lno0poA+GJhqpi0Ss6bWT5ZFcCHX/b8mV/3C0By
         tXucG9HjGFIU+1zCY5W6tKQpqIrdx/zz6fv7+eqwaplLUgpxo6f85GXaNpmdsqC398HL
         aGl9ZO/qa/RhGXwFeTztQGAc820lxNmd6fYh8sZyNijSm0cVCa9jTbL8nvJP5PFMsl1w
         LMtA==
X-Gm-Message-State: AOJu0Yxa4ILxiRJSBSbm6hFuaZ1kitkZEoCqWphTPBQ4CXWzSXOZ5sZW
	kPe5sXFBUEDBgoaVzvj14ol9oKMIe0cuKcozO2rMxg==
X-Google-Smtp-Source: AGHT+IEjFiu62u5N67UVTqm5UbxRyyA+VXGOA+J0tJ8IwfoU8mL918TT7EIDoE5gsrtUg2ftN13ejRtlXTj9gKcJOgY=
X-Received: by 2002:aa7:c657:0:b0:525:6d9e:67c0 with SMTP id
 z23-20020aa7c657000000b005256d9e67c0mr3389762edr.23.1693453096168; Wed, 30
 Aug 2023 20:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <CV61D7ULLVZ0.3OCFZ743L1KSE@flaptop>
In-Reply-To: <CV61D7ULLVZ0.3OCFZ743L1KSE@flaptop>
From: Simon Glass <sjg@chromium.org>
Date: Wed, 30 Aug 2023 21:37:59 -0600
Message-ID: <CAPnjgZ2iff6F3CFjnjEMUVoX3bO=kv3za4Q45YOcVeZqc96=rw@mail.gmail.com>
Subject: Re: [PATCH v2 0/1] meson: Demonstration of using binman to produce
 the image
To: Ferass El Hafidi <vitali64pmemail@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_203824_543126_EFED21FB 
X-CRM114-Status: GOOD (  24.88  )
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
Cc: neil.armstrong@linaro.org, u-boot-amlogic@groups.io, u-boot@lists.denx.de, alpernebiyasak@gmail.com, linux-amlogic@lists.infradead.org, mark.kettenis@xs4all.nl
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Ferass,

On Wed, 30 Aug 2023 at 11:53, Ferass El Hafidi
<vitali64pmemail@protonmail.com> wrote:
>
> Hi Simon,
>
> > So I wonder how best to move this forward so that we can build things
> > using binman and everything works?
>
> It's still not ready yet, but I'm working on porting U-Boot SPL to some
> Amlogic SoCs [1]. I'm currently working on Amlogic S905 boards, but
> eventually I'll work on Amlogic S905X devices too. And speaking of
> signing, Jonas Karlman wrote amlimage, and integrated it into mkimage,
> and I applied his patch to my tree. There's a few things to be aware of
> about Amlogic signing and binaries in general, however.
>
> amlimage was intended for use with U-Boot SPL, which obviously has
> no support for Amlogic's FIP format and as such amlimage will only do as
> little as possible to get the bootROM to load U-Boot SPL. Most of the
> packaging format is handled by BL2. The fact that the signing process is
> completly different across SoC generations makes it difficult to
> implement them all into one single tool (and by which I mean all of it,
> not just signing BL2 for the bootROM to run it, that's mostly the same
> across SoCs). amlimage has been confirmed to work on GXBB (ODROID-C2 and
> the KII Pro set-top box), GXL (librecomputer lepotato), and SM1 (ODROID-C4).
>
> My U-Boot SPL port is still rather incomplete. As of today, it still
> can't boot anything from any storage device. The goal eventually is to
> be able to load upstream TF-A BL31 and U-Boot+linux.
>
> While Amlogic distributes proprietary BL31 binaries upstream Trusted
> Firmware-A has a port for some Amlogic SoCs [2], but as far as I know
> SM1 (which is the SoC generation your ODROID-C4 is using) is still
> unsupported. GXBB, GXL, AXG, and G12A are all supported however, but the
> overall port still lacks some features the proprietary implementation
> has.
>
> As for the SCP firmware (aka. BL30) I'm not aware of any
> reverse-engineering efforts for that.
>

Thanks for your efforts on this. I look forward to seeing where it ends up.

> Honestly, in my opinion, including proprietary and poorly-written
> Amlogic utilities lacking a proper license, into U-Boot looks like a bad idea.

With Binman, we don't really include them in U-Boot; we allow them to
be fetched easily so that a complete build can be produced.

I don't like it either, but for users it is better than doing the
build manually.

>
> [1]: https://git.vitali64.duckdns.org/misc/u-boot-kii-pro.git/log/?h=wip/spl
> [2]: https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tree/plat/amlogic
>
> Cheers.
>

Regards,
Simon

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
