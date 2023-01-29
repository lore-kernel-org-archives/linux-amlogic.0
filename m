Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4E6C05027
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Jan 2023 21:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kvl1vCyzwOw+n4V3tMMTSRcLZe5m8TZJBhnQZL2WiJA=; b=JGMlqHF6ux2JGn
	UiBQhp1BFMGnYOnW+a15XbRoxvEIu0pSKNkbPulBqbwL5tYEqVF3azHJgKNTgis6v24VfgAL+Erdr
	c3ezW6FQXZODMpoQKcplAmvmCOgZ9xAHb8RVsXFgp1WEJ0Um3c/zDcjdp36jXEypyJueUyUDYvT7V
	39DA6SIuepXeM/HroyazQrMpSWVi1cm3DNNEGeOLv+BF6RbIBdsqzGNGwVvcfiO/KBEL++uYwlEJw
	14y6vO3LNuwSazDh5TTWi4hP4rbqKc9NXDpjrVOb2iI2f4TsXDjCz+wzm4M0ZWaroGPgLMbkaHfXz
	6T3Oa7IhmN2wPdTiYGpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMFBv-001uUo-44; Sun, 29 Jan 2023 21:26:23 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMFBj-001uTc-J5; Sun, 29 Jan 2023 21:26:13 +0000
Received: by mail-qv1-xf29.google.com with SMTP id i12so7753313qvs.2;
        Sun, 29 Jan 2023 13:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R+r5oWkcynWYgf6TrWUFBbgZPP925TAZRGhYeApXIos=;
        b=TODJo6tvZAiA3If5Qd5RPqZ3AfjHSEDACjuzxV9aGVNfNt/n2DG5rZP9fZTufoWxyO
         c3A9+ytFzygidz15K/tk7rEamQJnTB2FXMwUUmwf3o0P/qZeyaC+8r4PRyMAzvcCrSK9
         yHNH0+u0ugEtO74TdHq9jMRfmj18VlCU2u8dlXZRmWa0ibjpU8mxpZqzJO5a40Ns5ZgU
         yUxeYUqLdrXuWu4E2aAuLI+RdypfWL4Y0ohzuvlCWjWsrsR8a4qFKCljlff0x/Usfbq/
         kg+clBC0LxjiX8r+rnwea2N/K1MYily+d7L1DGgOzyyePj9i6nfmOylTR3VBF5lsI6uV
         Xs2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R+r5oWkcynWYgf6TrWUFBbgZPP925TAZRGhYeApXIos=;
        b=DYVKldRN26d7ObICs8LsOQkEYKArl0VTKy19CPmJUPQslBV2B3eqSwwVEUsbirCxig
         l3m2WXc5aorg76KkiMMzm5bIw67AXFVBXmC5i6qSNox7zCZKzHUI0aZWZ/IOpfiPqItq
         mgPOWDwkdxHs+EVyyT5Iibkq2vJ+I/zKz4tWOgIlzddoZGsh4ZXp69+nNBw3PeBXvrJK
         TW6Xi5IfRk+6tw2AbfixQDdQnyuL7e4+ezdHzFaN6SbCTK+cGzgzdC9EO6aFuTszA04U
         Lkc0eqFG2+fufyAjdaehH5hqs4Sdr7fCCG4ck6mZ7DefsHFJyflMmIuJYbAmJnjlURZe
         H7Jg==
X-Gm-Message-State: AO0yUKUtU/MFbNwU1ghIxgqP/lnav1yEQ8Xj3UCycjyQKInSDRCqr3Hu
	SfVAIbo/7UXDd1tz/YgLR42wckapt9qrrRkPH1A=
X-Google-Smtp-Source: AK7set/hDwAEIAnJPugzpkbNIMt6/2wCZgBGxHBdvkjSr0gEYM8NjutI4pzZ7M4BPGW2CVN4XbTn5+vgubNcChjm3mc=
X-Received: by 2002:a0c:fe07:0:b0:53b:c24d:d224 with SMTP id
 x7-20020a0cfe07000000b0053bc24dd224mr132949qvr.56.1675027570017; Sun, 29 Jan
 2023 13:26:10 -0800 (PST)
MIME-Version: 1.0
References: <20230129022615.379711-1-cphealy@gmail.com> <76e0aeea-2c15-528e-da21-4ad1f9281a13@gmail.com>
In-Reply-To: <76e0aeea-2c15-528e-da21-4ad1f9281a13@gmail.com>
From: Chris Healy <cphealy@gmail.com>
Date: Sun, 29 Jan 2023 13:25:59 -0800
Message-ID: <CAFXsbZo-dHvNyxLHLP2+55S=iTzDV3TUKb9=7O88yFRYW80HZw@mail.gmail.com>
Subject: Re: [PATCH 1/1] net: phy: meson-gxl: Add generic dummy stubs for MMD
 register access
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: andrew@lunn.ch, linux@armlinux.org.uk, davem@davemloft.net, 
	neil.armstrong@linaro.org, khilman@baylibre.com, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, jeremy.wang@amlogic.com, 
	Chris Healy <healych@amazon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230129_132611_691838_AE9F61E7 
X-CRM114-Status: GOOD (  23.46  )
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

On Sun, Jan 29, 2023 at 2:26 AM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> On 29.01.2023 03:26, Chris Healy wrote:
> > From: Chris Healy <healych@amazon.com>
> >
> Hi Chris,
>
> > The Meson G12A Internal PHY does not support standard IEEE MMD extended
> > register access, therefore add generic dummy stubs to fail the read and
> > write MMD calls. This is necessary to prevent the core PHY code from
> > erroneously believing that EEE is supported by this PHY even though this
> > PHY does not support EEE, as MMD register access returns all FFFFs.
> >
> > Signed-off-by: Chris Healy <healych@amazon.com>
> > ---
> >  drivers/net/phy/meson-gxl.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
> > index c49062ad72c6..5e41658b1e2f 100644
> > --- a/drivers/net/phy/meson-gxl.c
> > +++ b/drivers/net/phy/meson-gxl.c
> > @@ -271,6 +271,8 @@ static struct phy_driver meson_gxl_phy[] = {
> >               .handle_interrupt = meson_gxl_handle_interrupt,
> >               .suspend        = genphy_suspend,
> >               .resume         = genphy_resume,
> > +             .read_mmd       = genphy_read_mmd_unsupported,
> > +             .write_mmd      = genphy_write_mmd_unsupported,
> >       },
> >  };
> >
>
> thanks for catching this. The same issue we may have for the GXL-internal PHY.
> Did you check this?

I do not have HW with GXL-internal PHY so I cannot test it and don't
feel comfortable making the change for that PHY ID without someone
providing the necessary feedback.  If someone can confirm the same all
FFFFs with the MMD registers, I'd be happy to add the read/write MMD
callbacks for that PHY in v2.

>
> One result of the issue is the invalid ethtool --show-eee output given below.
> Therefore the patch should go to stable, please annotate it as [PATCH net].
>
> Fixes tag should be:
> 5c3407abb338 ("net: phy: meson-gxl: add g12a support")

Yep, looking at the ethtool --show-eee output is what got me looking
at this in the first place.  I was hoping to enable EEE... ;-)

I'll add the fixes tag in v2.

>
>
> EEE settings for eth0:
>         EEE status: enabled - active
>         Tx LPI: 1000000 (us)
>         Supported EEE link modes:  100baseT/Full
>                                    1000baseT/Full
>                                    10000baseT/Full
>                                    1000baseKX/Full
>                                    10000baseKX4/Full
>                                    10000baseKR/Full
>         Advertised EEE link modes:  100baseT/Full
>                                     1000baseT/Full
>                                     10000baseT/Full
>                                     1000baseKX/Full
>                                     10000baseKX4/Full
>                                     10000baseKR/Full
>         Link partner advertised EEE link modes:  100baseT/Full
>                                                  1000baseT/Full
>                                                  10000baseT/Full
>                                                  1000baseKX/Full
>                                                  10000baseKX4/Full
>                                                  10000baseKR/Full
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
