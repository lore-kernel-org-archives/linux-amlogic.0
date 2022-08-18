Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FBDC00140
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Aug 2022 06:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2P2knSLi3Xiil9JxxMN0I6eONAWcRtR8b+R2uM5oIs=; b=L+ihwVEQkNtgIpn4HtnWdetUzh
	YtFgGOnnMJ0NoT03+5FMtC6hSnYbLDwtdGlhxIbw8fkiXmyjP+ybsJ/y/Ot1bchDK+9Jkz3BdB479
	qi96S6lFOf7ZZEZSLP+R36pnGQ9J5vSydyTl8JfoLxgixz4zqZm2IBrbG3s2zh16gdGkeYLQlW6yu
	OWpcOn+kJmTaQQJu6EmEfE2t9gkWvnwcoXzzkBIiSrAwGZK1ZKnrGG6b9mXmspSGJqwZdZqwLhLbv
	XQpAWI8qUgCe3Ugi2q2s4zUm0iI+IJTpd3vTfjhYDxM2jhg78JKQ6jYHRJbUN+qRa5NbTd3ct8eml
	EoAOQEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOZGz-00HGeT-Fi; Thu, 18 Aug 2022 06:44:57 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOZGn-00HGWH-HU
	for linux-amlogic@lists.infradead.org; Thu, 18 Aug 2022 06:44:47 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1E3D23FBA1
	for <linux-amlogic@lists.infradead.org>; Thu, 18 Aug 2022 06:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1660805077;
	bh=DlhFnIdUMBOYUKK8lBE6v5auDBKzAT3PWLok7Bl69AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=eMtKW3kTgalQY8n3mooqUkeSBkUYCTTrFYbM4h8PBUPzj9nC+EOjaVAtseeNxuB4f
	 7XNxAU5zAQhUxYopBPoClloH0oRQlf9FGexRYgQBXrW4XTDpFwXtKOWZebsman1tc0
	 hGXY2+Rn67XE3mrUITY8dNatoeMHyqZ6jCZHCAaSz+czSKRH89oeqivnxFw3IWbTRc
	 ebsYhZns4vg6EcV+vitDu7qp1GJCdSTfBR4KrHkp+Zp4ItjmMFCuYhN9YgdaKnlkBn
	 qZqLfAYzb+WtuJ8k5AmsY95jOqJC6v1S2MBCQuEWW6146p5kBD2OlQlvw2whb/4xb2
	 6cPBxgoiMQhhQ==
Received: by mail-ed1-f70.google.com with SMTP id m18-20020a056402511200b0043d601a8035so384547edd.20
        for <linux-amlogic@lists.infradead.org>; Wed, 17 Aug 2022 23:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:organization:references:in-reply-to:message-id:subject
         :cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=DlhFnIdUMBOYUKK8lBE6v5auDBKzAT3PWLok7Bl69AQ=;
        b=7BdHb/AdvWd9tipMH82+o4GTe9oPTMXOuzs11aBZDd8GeehTsrUr3igTCFAoGlGxBv
         d79+m/PbOKRyvK/MBnmAI6QZBzcslKf43i1ZUZqFVF8WhVPXIehl8crHrvReAysUmygF
         0lFI6zqQRhfUPgm6ehVKv6ImA5DsZeiaFNDYchGsTh3IePK2aa0w+/veSJjXBtQlDzSt
         bAuCjf5Djg1caAZ4JX3Egk3hUWSFg3Om/27q6D8hrBnKuEYwvU3uFZqvmgX+6/1O9HPP
         G9K51Z1yRkiZMD0rGQNToIm83LflRbY9uYehgo4dm1oXqdEBuJjZD0mdceEaOSTiWrZB
         pP7Q==
X-Gm-Message-State: ACgBeo0xvpMmGhnm9EzLK9b8zdASw4GFKXOCA+3H6JQJ8R6wWD9Ii1XR
	jgbgO3HfUtUv5A+xvguc8SuijECJUEVXxxOuY63bkxXKPCnrHpxW4U9b4N1gn7wF2hi4tns4jb5
	Z26DgzTpwNX3LYP7inQNmHzuioHxcji12QpUl+YSNM64lT2VA
X-Received: by 2002:aa7:d508:0:b0:445:dd73:4f6f with SMTP id y8-20020aa7d508000000b00445dd734f6fmr1100784edq.231.1660805075171;
        Wed, 17 Aug 2022 23:44:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6ZAU7Kf5zJnIs7zdYVrqU4dSuauM0GuoeE5k0wyJ9b5fwFVy3N4F7Qic0fUtdAg9Mt31Q0pA==
X-Received: by 2002:aa7:d508:0:b0:445:dd73:4f6f with SMTP id y8-20020aa7d508000000b00445dd734f6fmr1100767edq.231.1660805074928;
        Wed, 17 Aug 2022 23:44:34 -0700 (PDT)
Received: from smeagol ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id 2-20020a170906300200b00721d8e5bf0bsm399793ejz.6.2022.08.17.23.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 23:44:33 -0700 (PDT)
Date: Thu, 18 Aug 2022 08:44:30 +0200
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: meson: vdec: Add MODULE_FIRMWARE macro
Message-ID: <20220818084430.0ca10b30@smeagol>
In-Reply-To: <04115bee-5ddb-701f-ad18-d2c846155816@baylibre.com>
References: <20220817140539.150013-1-juerg.haefliger@canonical.com>
	<04115bee-5ddb-701f-ad18-d2c846155816@baylibre.com>
Organization: Canonical Ltd
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_234445_771747_09F6221F 
X-CRM114-Status: GOOD (  17.64  )
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
Content-Type: multipart/mixed; boundary="===============4520005980026547368=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============4520005980026547368==
Content-Type: multipart/signed; boundary="Sig_/NRjcrFgnzwojt7mVFj1UxFl";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/NRjcrFgnzwojt7mVFj1UxFl
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 17 Aug 2022 18:08:19 +0200
Neil Armstrong <narmstrong@baylibre.com> wrote:

> On 17/08/2022 16:05, Juerg Haefliger wrote:
> > The meson-vdec module loads firmware so add MODULE_FIRMWARE macros to
> > provide that information via modinfo.
> >=20
> > Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> > ---
> >   .../staging/media/meson/vdec/vdec_platform.c  | 20 +++++++++++++++++++
> >   1 file changed, 20 insertions(+)
> >=20
> > diff --git a/drivers/staging/media/meson/vdec/vdec_platform.c b/drivers=
/staging/media/meson/vdec/vdec_platform.c
> > index 88c9d72e1c83..c7750d4be848 100644
> > --- a/drivers/staging/media/meson/vdec/vdec_platform.c
> > +++ b/drivers/staging/media/meson/vdec/vdec_platform.c
> > @@ -280,3 +280,23 @@ const struct vdec_platform vdec_platform_sm1 =3D {
> >   	.num_formats =3D ARRAY_SIZE(vdec_formats_sm1),
> >   	.revision =3D VDEC_REVISION_SM1,
> >   };
> > +
> > +MODULE_FIRMWARE("meson/vdec/g12a_h264.bin");
> > +MODULE_FIRMWARE("meson/vdec/g12a_h264.bin"); =20
>=20
> Duplicate

Oh this is embarrassing :-(


> > +MODULE_FIRMWARE("meson/vdec/g12a_vp9.bin");
> > +MODULE_FIRMWARE("meson/vdec/gxbb_h264.bin");
> > +MODULE_FIRMWARE("meson/vdec/gxl_h264.bin");
> > +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> > +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> > +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> > +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> > +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> > +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> > +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> > +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> > +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin");
> > +MODULE_FIRMWARE("meson/vdec/gxl_mpeg12.bin"); =20
>=20
> DDDDDDDuplicate
>=20
> > +MODULE_FIRMWARE("meson/vdec/gxl_vp9.bin");
> > +MODULE_FIRMWARE("meson/vdec/gxl_vp9.bin"); =20
>=20
> Duplicate
>=20
> > +MODULE_FIRMWARE("meson/vdec/gxm_h264.bin");
> > +MODULE_FIRMWARE("meson/vdec/sm1_vp9_mmu.bin"); =20
>=20
> With the duplicate entries removed, please add my:
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Will do. Thanks for the review.

...Juerg


--Sig_/NRjcrFgnzwojt7mVFj1UxFl
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEhZfU96IuprviLdeLD9OLCQumQrcFAmL9388ACgkQD9OLCQum
QrdG7Q/9FwPE/3/kGYBq248tkz8znw0beqrk7fc04SQdThTNb+Nm8x+4ozI/vs7r
ybj+Pysjebw37NTrhjZCXGisHt02zs9D0yZmN2bkoHOvP/2ADhrlfI2x6Bmb7VZo
Tmd1EXUHSBI9mJEA3Po0grFqq/I4Pz9ntVHMKrxUdCd/0iEKHHnSb8l4Zo6upq1s
cBYpAvHi393MGpgI91gqHv3QowE/IpNFLhxt3/hgFUxi8BiUsOJBetO7c+kBIBHi
YqqUvTd4seKYzctWYGdbB94EW15mMALypsQMsR28UKwCcd1aC0dmV4r/o99sCajP
Xxyb0Ud9t/j6wXdR1hnU//bkOvOtOjDEgRKHVunfKALOFq8XleCW+2ZSEQGWqZXG
kDJeLs6RyKBZPWWn/IvY9tmVv79iPcODEYXSdW7BKzj9p5Syqaf+3cAB/Td4wlNV
O+/NFPbS4FrsMV3r+0OgR9+N9IfyFUutlZosW56uzHKbaq2pOvcLUBLdYY73jsn2
r8M+chwvKhdL2fG4nZR/a18/Vot5c3CaUQ0arMLEZBxzI4joAHYcgzId0ICztk75
zmZB+rrpvOsUgseQhcQV5xcJ5zmS2sV/EAfWROXnl1OWU1tW3OXAcn8gOgz4KBsY
v5WXJcCjdolJhr/7p67181WQavdvxW/4B8lOq1xFp3l+FKHbnU4=
=3reT
-----END PGP SIGNATURE-----

--Sig_/NRjcrFgnzwojt7mVFj1UxFl--


--===============4520005980026547368==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4520005980026547368==--

