Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE1BC77B72
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Apr 2023 09:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHNT8Qis3qun9u21CbU77faAbqc2eXli5VmShvGGuV8=; b=fIBKyZGEON88DhIPDt0NBfsH//
	z/f1nB4I5YCvWZkhzrNb1PwYQXVRo6+hIsvSRUipXd5aJAcJ6T3xcxJmXerbv7xuZKSJ9rovl1eSP
	qcULUVo6ZCTAcFs9AfvI3hnYQYD0KS9eKBiHX4fCx52IrDUHM36q15RA/u6BR19kMUCWL6splChJj
	XPCUU/p3eXUTkoU8EB9vFmyo2TMwjeVeCsnL4Its/iXfZ0yDQM/eT0azARIixI0CCBwdZcRAdvVag
	/cROfSh3iDIDKrSnoIMgjql/+mkM4c7mbSp61bH1doeeLkrK3wGfK2yyjXeNBSJLllu+8T5q9Lcof
	pRvKDgIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poL9v-00FYEO-1E;
	Mon, 17 Apr 2023 09:28:27 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poL8w-00FXO2-1L;
	Mon, 17 Apr 2023 09:27:37 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f1763eea08so1281025e9.2;
        Mon, 17 Apr 2023 02:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681723643; x=1684315643;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skr4F3sTXuTG1y8kpEW9y6PuSOyN9BupGiKr5TWOkDY=;
        b=qWFSkMjcj40qUAAl6SEps/M542l+4X+C2iqNfhp2Hm9NHgczgel13Pd5y0bFPMtYo9
         kC/TjlOwIvQgfR/xwjT90OqnflRItpYzWQg3AFUEm6496zd+Lp2T2jdObIaw9sb3T10a
         EX7/wM8AjJXPLKfS9S8ly+/V49pzuvmQIhcDn82iwRRiV9lqhg5bXxAAEnvOY+KxNiGa
         wUQPbGP0YjHEODy283iBtHa7kEOM0UePhZ7vBCt7SIMYnDRodQQWIRCmf3qqI9T/Y97F
         6yegnnPZpUBtNBiCxyhynZ0kvS+ZY5v3ASbHGSn1slrBWaa+neXsHUvtxlk1koIacN7H
         EDTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681723643; x=1684315643;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=skr4F3sTXuTG1y8kpEW9y6PuSOyN9BupGiKr5TWOkDY=;
        b=ivSEAEewVz1miSleVvgaAhEILC0uaJNczsEbYUnlawaN+GFW+YVX1UFwnS5DkkRa2u
         lmBEg2amjPoOGj+E31G3o+8l/8tPyqRsfkSHZNnlElyXculDxJ5BAz8zeEItt/obDXcJ
         gYZOOI9QDNo2ACY5FXaAWYwv6OwSprlYXz0YKlKzWZqDddX+7kn92r/HNNNlufhtlLx6
         WE0PcSb4Zwu4/F5W3CxIbe9fEWq1WMYgyNXo4Tgm7/pBEV42qWkUKlVGGtSEgOGcdft5
         9m2Hyc+ZsuPQhhn6jv+mv9waZjaY+04wuHNqVlDEUwhQC2dwcrEqbarzbhiSg4FHzG1Q
         IZcg==
X-Gm-Message-State: AAQBX9c4OV/DbMvz9RZIcyK6hzVTC8fgPYHvrUV0e/vk+0CHr+espuKF
	bxFx96rojvSfpG0OwkUfYE5yhGl/hoE=
X-Google-Smtp-Source: AKy350b+1l8cy3AQywzBIVAvVcyfLEguCcUrXMWznl2I3n3mvrFNMDiniK+zuJ7a+ruW4FOsjxekaw==
X-Received: by 2002:a5d:6a0c:0:b0:2d2:f3e3:115d with SMTP id m12-20020a5d6a0c000000b002d2f3e3115dmr5352998wru.59.1681723643413;
        Mon, 17 Apr 2023 02:27:23 -0700 (PDT)
Received: from orome (p200300e41f053a00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f05:3a00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id g23-20020a7bc4d7000000b003f17300c7dcsm3313242wmk.48.2023.04.17.02.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 02:27:23 -0700 (PDT)
Date: Mon, 17 Apr 2023 11:27:21 +0200
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
Message-ID: <ZD0Q-fUjMKRrPjXn@orome>
References: <0f087629-810d-f0e0-bf0b-05ca5defc16d@gmail.com>
 <05e3b9de-ee38-97b6-7f39-5b6f7de1674f@gmail.com>
 <CAFBinCAdXE+3VrPJAoik_0TFW6TsB0033s+fTYUTNehPrn=PZg@mail.gmail.com>
 <ZDfHtvZawSWWGTRP@orome>
 <CAFBinCBNA_AWy63P9RwSU98xNJ1-F8KHJWm9Dq1kmrZ7aFbpJw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFBinCBNA_AWy63P9RwSU98xNJ1-F8KHJWm9Dq1kmrZ7aFbpJw@mail.gmail.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_022726_490481_A0133088 
X-CRM114-Status: GOOD (  46.07  )
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
Content-Type: multipart/mixed; boundary="===============2582796574312080466=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2582796574312080466==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NhQe1dIIe6b/8+OF"
Content-Disposition: inline


--NhQe1dIIe6b/8+OF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 14, 2023 at 08:33:28PM +0200, Martin Blumenstingl wrote:
> Hello Thierry and Heiner,
>=20
> On Thu, Apr 13, 2023 at 11:13=E2=80=AFAM Thierry Reding
> <thierry.reding@gmail.com> wrote:
> >
> > On Tue, Apr 11, 2023 at 09:48:46PM +0200, Martin Blumenstingl wrote:
> > > On Tue, Apr 11, 2023 at 9:26=E2=80=AFPM Heiner Kallweit <hkallweit1@g=
mail.com> wrote:
> > > [...]
> > > > +               init.name =3D name;
> > > > +               init.ops =3D &clk_gate_ops;
> > > > +               init.flags =3D CLK_SET_RATE_PARENT;
> > > As much as I don't want it: I think we need CLK_IGNORE_UNUSED here as=
 well :-(
> > > On GXBB, GXL and GXM SoCs the board design typically uses PWM
> > > regulators (like the boards using 32-bit SoCs as well as newer boards
> > > using G12A or later SoCs).
> > > This means: if we enable that PWM controller and one of the channels
> > > is firmware managed and the other isn't then we can end up disabling
> > > the clock - taking away VCCK (which supplies the CPU) or VDDEE (which
> > > supplies GPU and various other components).
> > > I'd be happy if there are other suggestions around this though.
> >
> > What exactly does "firmware managed" mean? Typically we describe all
> > supplies in DT to avoid these kinds of workarounds. If VCCK and/or VDDEE
> > are PWM-controlled regulators that should never be turned off, can they
> > not simply be added to device tree and marked as "always-on"? That would
> > propagate to the PWM and make sure the corresponding clock remains
> > enabled.
> Most Amlogic boards use PWM-controlled regulators. There's three SoC
> generations I know of that are "special" when it comes to managing
> these regulators (and CPU clocks) though.
> Let's start with the simple ones: Meson8/8b/8m2, G12A, G12B, SM1 (and
> I assume newer generations as well): here the PWM regulators are
> managed by Linux.
> Then there's the special cases: GXBB, GXL and GXM which run a SCPI
> firmware for managing the CPU clocks, regulators and suspend.
>=20
> SCPI firmware is running in the "secure world", while Linux is running
> in the "normal world".
> I don't know if there's boards with secure boot that lock Linux out
> from the PWM and CPU clock registers.
> This means: so far we've left any PWM controller settings that relate
> to the regulators up to the SCPI firmware, not messing with any of the
> registers from Linux.
>=20
> My concern is for example with the Khadas VIM2, see it's schematics [0] p=
age 4:
> - PWM_C is used to manage the VDDEE regulator (I suspect that there's
> a typo though and it should be called VDDEE_PWM_C, but the schematics
> state that the signal is called "VDDEE_PWM_D")
> - PWM_D can routed to the GPIO headers
> Now if a user enables &pwm_cd (the PWM controller responsible for
> channel PWM_C and PWM_D) to use PWM_D on the pin header we don't want
> to turn off PWM_C by accident.
> Turning PWM_C off by accident can happen if we register the clock gate
> and don't have a consumer for it. CCF (common clock framework) can
> then just turn off that clock because it's unused. This would lock up
> the board because VDDEE is used for critical functionality on the SoC.
>=20
> Two extra questions from Heiner:
> > I check regarding Thierry's comment and found the vddcpu
> > pwm-regulators described in the DT's. Is your concern that
> > not for all boards the vddcpu pwm-regulator is described in
> > the DT?
> Correct, boards that have the pwm-regulators described in their .dts
> (typically the boards using a Meson8/8b/8m2, G12A, G12B or SM1 SoC)
> are not a problem.
> Only the ones that don't describe the pwm-regulators in their .dts are
> an issue as these are managed by the SCPI firmware.
>=20
> > AFAICS pwm channels are independent. How can switching
> > off the clock for one channel affect the other channel?
> It's not about one channel affecting the other. My thought is that
> CCF's "disabled unused clocks" feature will turn off the clock if it's
> not used. Since SCPI firmware uses it, Linux doesn't know that CCF may
> disable the clock unless CLK_IGNORE_UNUSED is set.
>=20
> I hope this makes sense. If you have any additional questions then
> feel free to ask.

It seems to me like really your only option is to completely hide that
clock from Linux. Even if you use CLK_IGNORE_UNUSED, you could still run
into a situation where the clock gets turned off.

Actually the same is true of the PWM channel. Once the PWM channel is
registered somebody could try and use the sysfs interface to control it.
So even if nothing in the DT makes use of the "reserved" PWM channel,
people could still try to use it, which means that even if the clock
were to remain always on, somebody could modify the period and
destabilize the CPU.

I think reserving specific PWM channels is the only way to safely make
this work. People could still abuse this by patching the DT, but once
you can do that, you can probably do a whole bunch of other things as
well, so if there's no hardware mechanism to prevent access to the PWM
channel, that's about as good as it'll get.

Thierry

--NhQe1dIIe6b/8+OF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQ9EPkACgkQ3SOs138+
s6FavxAAhMNAWa1ktohw9z9+7BdmWdfgzpPoUFg3RWkwJbXvEiBEp6QM+V4PEDpL
60i59O7Bzh6ak775NfQExAeSzTLu66HsP+l+YsfmfxKZZ9zNb2vk9/Abme7whIvi
8mxkq49h9mb+uH3FH8HN2TMdEYW59dHUA0GmiCIMv0GPqPdpocjqlyq2PSP+6B1Z
gY0Wi8GCBRsGTb2ZKEHDpsAAq9NW++0xuY/qdy3lvxvkx5O3aMHptS2J6PLyN34O
SxAl6grzWqWEJNytYcGG62K0YUWWx2tVHPxEkb3JCG89TO9ycTYrniECt+wpj4Eu
N0yB0JgWg8c8iUguz+dCZmOPepy6borye5JIOaTk2GO1g0f+43IvJYI3OPUv/x8t
q2PtihLjQ0r35YMal+DLbYNBFFTohiGwL2ox3HIIYnAEdh2qQVcGlbq/ZTYVe5eC
Ev9ye4BA/1XdwLRpDOxT6wuZGjPZNYeDja4kiZ/tm8P2gxA03UPn0M5pzJ256ITM
bh7gJtxboDcH/xMGcLcBGK/0McO1m8bwOqmq5UlumidaKbj0m4xaeACxW7iu03T9
o04n6y56r6Q9b2CB4AwuNuQvN8tdAegIUptXfwdSnYsxS3Sr3NEWmEq32KreCMy/
uJUmLoSWXqdmedKcx6NgZUled0DH+2rKTlrJkpQpd6s9X7ZJ+hk=
=Wyg5
-----END PGP SIGNATURE-----

--NhQe1dIIe6b/8+OF--


--===============2582796574312080466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2582796574312080466==--

