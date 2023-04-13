Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B42FC77B61
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Apr 2023 09:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r5GTGMCyUJE3j4pHANZIJEhAK+oYl1E2GHB2ukbxRXk=; b=L8cLGHmUQOWeUB4qeZVypJXUNZ
	99xUjeC39/z9oYZ2gvbxohQDHa5jJgAPoxjlysphOTHutgzhsbZ7Rim1h/nbrF22ViOP9+XoJkV/W
	McPqfh4YylC5PJo4RHVnEVJpb7qTZx/1TqZ42OltHqi1wnQbkW20cuNwjBZFf+DfWsLKZATHm9TAN
	PUr+6ZGmuMQrDMdC8rQD5kEP1UHC9DGtJkcN/4R3pq3Fyjs/KAyDoGGVAEFNkCIe5HUKkkxaq6e71
	0LpTc6dOeuQNSvIUJerxXFEphiboY8tmWoigOTPuz0wtZEddDFK8OdWUxHFjMfIGmsIh859jE7SLc
	wj1rAQZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmt1M-005Y8U-0l;
	Thu, 13 Apr 2023 09:13:36 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmt1G-005Y72-1Y;
	Thu, 13 Apr 2023 09:13:33 +0000
Received: by mail-wm1-x335.google.com with SMTP id d8-20020a05600c3ac800b003ee6e324b19so7623687wms.1;
        Thu, 13 Apr 2023 02:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681377208; x=1683969208;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PE5vTEL7E8P1zVsVjnu4l049FaIVCSgsce7iMS5wYo=;
        b=aluH8fC3W9eGsPUYb2LM4wkwmi98R96J31nWixQzfv8t0WQFyfXNO3vnupmmW6Uhig
         AKei/SmgO/tZolkFxv8MY6QVNTHXKcVQQDael3AcM//2KsMLVSHZt2aYWvxfh+QF9NWH
         A7U1B8vHiwAYw+KwEUM15VdgU54t+mz9E8KoxcoOwgnEdHmBZBCkL/Iz0cr7L7u1T6HE
         +4CLAGqgxH3ES21VG6SDYb2/EQDOpdjII6sSmSbbkKpSXZTVfzKdWwayKR/pLOgS2YZS
         sAfj+P1PpTacuxGTePgB2arqjECwMCoZGYsKrgZwnjdePLyFhioNfedEOhD+YA3QFu2Q
         aOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681377208; x=1683969208;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PE5vTEL7E8P1zVsVjnu4l049FaIVCSgsce7iMS5wYo=;
        b=Iu1bR5qQ8SJNdHfGW59zbOjdXUKwA9bDtzmBL0ZylXAlSV/NFpBTfV9OcNnEWm6Q2H
         msiNFxVKjLNumejtSv9FWcEjbdgYQTjmTgNW9P58B/Zhye9HKRdaWY9yFm4hZ8Brg9iH
         kcQ0wzdUj6kPYVBhR/HXPqvC3UwKKtDJcIzgJyN2Bia+siviPvq2cU7o7KuOoTWR7ol7
         2nmKBWaOGCCGHylRl2PRpj6D7IQRb1fAFoatkQcy4A6soDBVJZXzrPeXgulwlA0ewdik
         9y1PHUzM3h8E34yShxZ57bMk1CumVFdDApmOqJyNR+fJ86odO4MXcnlimVhLuwvtAryv
         WSFA==
X-Gm-Message-State: AAQBX9cq+F5yMHqyj1xo8zYKDPsM4EPGqjyKxenXMQDPYznGWfCe9Xo6
	eX7KV9E3LupE+nXUg6NtXh0=
X-Google-Smtp-Source: AKy350b/VHvKiJPvaShg0z14CliEy1L2m0k16FmmSbuZvbcffbhf/gBX/6b4Pyl2LWtpasJ5krIkNw==
X-Received: by 2002:a1c:7c15:0:b0:3ee:1acd:b039 with SMTP id x21-20020a1c7c15000000b003ee1acdb039mr1282321wmc.34.1681377208102;
        Thu, 13 Apr 2023 02:13:28 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id q23-20020a7bce97000000b003e203681b26sm1258853wmj.29.2023.04.13.02.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 02:13:27 -0700 (PDT)
Date: Thu, 13 Apr 2023 11:13:26 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v2 4/4] pwm: meson: make full use of common clock
 framework
Message-ID: <ZDfHtvZawSWWGTRP@orome>
References: <0f087629-810d-f0e0-bf0b-05ca5defc16d@gmail.com>
 <05e3b9de-ee38-97b6-7f39-5b6f7de1674f@gmail.com>
 <CAFBinCAdXE+3VrPJAoik_0TFW6TsB0033s+fTYUTNehPrn=PZg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFBinCAdXE+3VrPJAoik_0TFW6TsB0033s+fTYUTNehPrn=PZg@mail.gmail.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_021330_518982_F0231FC7 
X-CRM114-Status: GOOD (  14.94  )
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
Content-Type: multipart/mixed; boundary="===============2666567944480590348=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2666567944480590348==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AfN6U5Lk+axIGN3J"
Content-Disposition: inline


--AfN6U5Lk+axIGN3J
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 11, 2023 at 09:48:46PM +0200, Martin Blumenstingl wrote:
> On Tue, Apr 11, 2023 at 9:26=E2=80=AFPM Heiner Kallweit <hkallweit1@gmail=
=2Ecom> wrote:
> [...]
> > +               init.name =3D name;
> > +               init.ops =3D &clk_gate_ops;
> > +               init.flags =3D CLK_SET_RATE_PARENT;
> As much as I don't want it: I think we need CLK_IGNORE_UNUSED here as wel=
l :-(
> On GXBB, GXL and GXM SoCs the board design typically uses PWM
> regulators (like the boards using 32-bit SoCs as well as newer boards
> using G12A or later SoCs).
> This means: if we enable that PWM controller and one of the channels
> is firmware managed and the other isn't then we can end up disabling
> the clock - taking away VCCK (which supplies the CPU) or VDDEE (which
> supplies GPU and various other components).
> I'd be happy if there are other suggestions around this though.

What exactly does "firmware managed" mean? Typically we describe all
supplies in DT to avoid these kinds of workarounds. If VCCK and/or VDDEE
are PWM-controlled regulators that should never be turned off, can they
not simply be added to device tree and marked as "always-on"? That would
propagate to the PWM and make sure the corresponding clock remains
enabled.

Thierry

--AfN6U5Lk+axIGN3J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQ3x7UACgkQ3SOs138+
s6EBdhAAljp7Lr0PxfWyQ82h5k8GfQ/FKW8dR8JGyDEf6YXn4iIV/ewq/8o9WzjE
M8tmZnekwmw2pZ0Lw7zOk+sX1N2RBovBd4NxnFNHSfKw8v1Iw/vj3SVZC2aD+a1I
sAKLOvIrMNJvQSWwz2U6TcLYSKud5T42eN8Pw1QZu3kXr24tXhFWp7hpQ0YvuQCq
oSFb6u4bta924aE16ziVZRA68edFA6K+DTDnstKh1Vrgs/KIGgPstBzScQ3uMTjg
jTKMgaaHNp0T0WXuWEITZoH1pweJ5/sXvIRCC9TDZ1ZGIHniV2KcU3st163h5qLO
TwrkkXSYz0DzBQRmP4YJgSR5gUXZ1jeHgka0LNSTLy+NVhm5mfwzN4lV9J8TOxTx
N5EVrgqjDzx1wCwjb3Dj9tfm9LJBQI7YfFo1SNoM1jyBVrviVO5hikxwdWxfCgtW
eo/CjUmRxOaZBSEFOM3OKkOBiizCaexo7rGIdi3pgk12vPVgQSaKrMackJHMZYSd
u1N9Wfc3/vddOKzErQ5JDCGLgupYiZa0aSxz0DHVGIKFjKFuq/hoUi0ty6mnOuuH
HTdGhtWmS/s5AjBxXQyVf0wUNjbU8J1fxNPajOjJDdgCmHgc9LPIl25BDOiUg9PX
/ji55f15wMB4KzXDBPbD24tbGbRaBJK7wxCXuopMum4TBCAniAw=
=FwfH
-----END PGP SIGNATURE-----

--AfN6U5Lk+axIGN3J--


--===============2666567944480590348==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2666567944480590348==--

