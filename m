Return-Path: <SRS0=CzRW=4L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F2FC35673
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Feb 2020 23:17:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9954220880
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Feb 2020 23:17:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j4tBvYyZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AKp3byLj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9954220880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lxhFHSOVuiTLD0tikkU83wsR+3XqyR2tc3/OlczV15U=; b=j4tBvYyZzHocRxVB8sLoa5/qR
	r2Ta4C1AnwD7iSVETdBZcCjnqqmolIKiYt6x74Z+qnFnbLevvkUg2VaLbe/clTUbedZiW9sDvUq3a
	P/UwrOOyd/Aq0owNhsKyVaGpN4VNFOacxIj2BFAmSom2AOEZ2g72qza+uZxA5+wsutO/ZlrgB8b6K
	zzU7k0z2T/EhjFlnS9u+c3P1poHMvnCe+dSoDrYOG3Vhww9ixI3EeNOR4czGFuzeATDKvcrPLutYx
	bU7XwP+UtBQmy6KrS0iuKKK+tzHxjRJ03K9DpBqrbwTpWzIEjp50tQeLsYhMtGm8I8gs8w86SyDL9
	BEJxM1Iyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j60Ui-0001dH-Jd; Sun, 23 Feb 2020 23:17:04 +0000
Received: from ozlabs.org ([2401:3900:2:1::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j60Uf-0001cW-DW; Sun, 23 Feb 2020 23:17:03 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48Qh0l2zmzz9sPK;
 Mon, 24 Feb 2020 10:16:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1582499816;
 bh=ZDsuoOV08OG4rWiKXytPH30q7PC/XrARg94GbSYzkBw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AKp3byLjUgGeWJ48kznETWc0Q3R5R+v1q1teBHVmawsNupD3Pe0ucEI5ezfd7pOAy
 PW/mL8pfaMHcX16KOvg6I71vLR4Bieg2nsmUWXZItzr0DqnsomYD7lx/lHov0Ft8fQ
 Hf9+mEEH7uRY8xZKIUCj0bEH679ZzqORtM5yx8UTUHzGIBFxluhGQUmhq4N54emir2
 DaqzTzxbhB0bQqArroPfI+p1d3N/FF3ywJHRFrTAM8fouTZOkblsC/wk0kpn1xMWFG
 BG9VEhQqMOam6UjEzDAKYuuUNUCRK7y1rY9DM21KuhEbv+hcA0Ck6cutVtrQKqe0bu
 jN215DYPbaD8g==
Date: Mon, 24 Feb 2020 10:16:54 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Subject: Re: [PATCH] soc: amlogic: fix compile failure with
 MESON_SECURE_PM_DOMAINS & !MESON_SM
Message-ID: <20200224101654.530f1837@canb.auug.org.au>
In-Reply-To: <20200218092229.0448d266@canb.auug.org.au>
References: <1581955933-69832-1-git-send-email-jianxin.pan@amlogic.com>
 <20200218080743.07e58c6e@canb.auug.org.au>
 <20200218092229.0448d266@canb.auug.org.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200223_151701_658055_5F1352A2 
X-CRM114-Status: GOOD (  14.97  )
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
 Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jian Hu <jian.hu@amlogic.com>,
 Xingyu Chen <xingyu.chen@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: multipart/mixed; boundary="===============6193711976459595286=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============6193711976459595286==
Content-Type: multipart/signed; boundary="Sig_/HRS=wqj=EXtghxVG08E8STH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HRS=wqj=EXtghxVG08E8STH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 18 Feb 2020 09:22:29 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Tue, 18 Feb 2020 08:07:43 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > On Tue, 18 Feb 2020 00:12:13 +0800 Jianxin Pan <jianxin.pan@amlogic.com=
> wrote: =20
> > >
> > > When MESON_SECURE_PM_DOMAINS & !MESON_SM, there will be compile failu=
re:
> > > .../meson-secure-pwrc.o: In function `meson_secure_pwrc_on':
> > > .../meson-secure-pwrc.c:76: undefined reference to `meson_sm_call'
> > >=20
> > > Fix this by adding depends on MESON_SM for MESON_SECURE_PM_DOMAINS.
> > >=20
> > > Fixes: b3dde5013e13 ("soc: amlogic: Add support for Secure power doma=
ins controller")
> > >=20
> > > Reported-by: kbuild test robot <lkp@intel.com>
> > > Reported-by: patchwork-bot+linux-amlogic<patchwork-bot+linux-amlogic@=
kernel.org>
> > > Reported-by: Stephen Rothwell<sfr@canb.auug.org.au>
> > > Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> > > ---
> > >  drivers/soc/amlogic/Kconfig | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)   =20
> >=20
> > I will apply that patch to linux-next today. =20
>=20
> This fixes the build for me.
>=20
> Tested-by: Stephen Rothwell<sfr@canb.auug.org.au>
>=20
> Also, please keep the commit message tags together at the end of the
> commit message i.e. remove the blank line after the Fixes: tag above.
> (see "git interpret-trailers ")

I am still applying this patch ...
--=20
Cheers,
Stephen Rothwell

--Sig_/HRS=wqj=EXtghxVG08E8STH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl5TB+YACgkQAVBC80lX
0Gw1Ygf9FYA4QbsYVulSaeKZSzIU8INOux2IozBcABlP9zBBHobUJpQC28V80fti
ImqOIwDNv+r67DnCKDg64+X5PfPyOySRYssr9sRSWcjwoud1qt2ln0iez9tDMG0t
B7ntUEWmRAFZ0GtBYqSGZw73lldQRod4lD7B1RrxVK36xIVMUo+X/ZWAEbvlQGn1
oWkoVMxhbDK6crqYBKgTfAVSa2QbpNQV++y0fmmfJUMl/8txhSYEhMIrKr+pr4i6
xHLq3w3J4HJXTo/07+1RjlhgVHdO+e3JyLunOA5MA+aW215AjiCXGcSLHX7PD1QM
mtWa7KCNYCHULAxJs6JOuzD+gOMLLg==
=gH3w
-----END PGP SIGNATURE-----

--Sig_/HRS=wqj=EXtghxVG08E8STH--


--===============6193711976459595286==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6193711976459595286==--

