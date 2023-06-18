Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF5BEB64DA
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Jun 2023 19:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yc8D/MGdhM0u5T2el7RxIhJkW3Hj48ck8DFkTnipr0s=; b=H8QoGRzePx7SKvTB5D0lXL956u
	lMmWqmjrMEA4q0Qpv0M5J7rU13J5SNT4NrYo9c67qWN28Tc55AT1AziVrK5Qq3WOPdl1XYRn1gKIX
	+d1HLdDdd1ZMuREDvHmMr1TLS8MUrWGbzxvRZ0KLZYl59QgRoM0OCLdrJS8b6gZO+51DaAE8XUNUq
	j9zpWSawSpVn6+ZhNQdgvhcf/TJxAU38D7OxJr8Youclco5G51+mhd/TUxkcG/xWK5B+kZKd7lV/x
	rNYZ8Q6rAkJ3RqVanRLcFp1z43z3cJ1pVwEqkYTW4KNuCDo0fjyBzILjONMECdg3oPjQMJVfWzsA2
	pi7Y9FeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAxsQ-006Yqt-1I;
	Sun, 18 Jun 2023 19:15:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAxsN-006YqD-2R;
	Sun, 18 Jun 2023 19:15:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AF2406068B;
	Sun, 18 Jun 2023 19:15:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80BE7C433C8;
	Sun, 18 Jun 2023 19:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687115748;
	bh=1O2hpd2p0ZnWkUw7q8Y9HtFfDVuFZLuKIBpyIFN1XIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NcqmPzxU6IqT/PhcVtgmGU+sz/k4DnglYnNpsFIOhs0DXQazEgcB48h8C4azKmREa
	 hdDLUjKL/zWuvDxxDx8ktEvgGGji4KEE83M67HCUT1ofj32lVzLjLUdBkWWUBomz/o
	 JAKfMnM60aoyFj0sGYhkwvqRyeorNLK56KKcbXj5yxxjGI7gGMyiP1QeaUL0fryzkl
	 pyej3ndHeOGRYMpyfd8hGirgQWp4IdKvYq83Nze8K9pKAd4osCHxmUKF4bjEVCeX2J
	 VxA48zjWo6cl9JZcI2G4W4/Ob3c7wEBiUpcBkz4Y6ix76DqFhEweDA+zwo8zXcJksA
	 bspkFOg4HRKGg==
Date: Sun, 18 Jun 2023 20:15:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Lucas Tanure <tanure@linux.com>
Cc: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nick <nick@khadas.com>, Artem <art@khadas.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 5/6] tty: serial: meson: Added T7 SOC compatibility
Message-ID: <20230618-pavestone-atrophy-017a464a1dbb@spud>
References: <20230615182938.18487-1-tanure@linux.com>
 <20230615182938.18487-6-tanure@linux.com>
 <ZIufK7uK0ZrsVTZ3@ofant>
 <CAJX_Q+3_UME4xigEU+_dXrdLi+YkL0+TC-Y552LBcuTii4=V5w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJX_Q+3_UME4xigEU+_dXrdLi+YkL0+TC-Y552LBcuTii4=V5w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230618_121551_893356_CA699FE2 
X-CRM114-Status: GOOD (  25.57  )
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
Content-Type: multipart/mixed; boundary="===============2747303952673182107=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2747303952673182107==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CrX7CiUT711LxfDS"
Content-Disposition: inline


--CrX7CiUT711LxfDS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 18, 2023 at 06:40:12PM +0100, Lucas Tanure wrote:
> On Fri, Jun 16, 2023 at 12:31=E2=80=AFAM Yixun Lan <dlan@gentoo.org> wrot=
e:
> >
> > Hi Lucas:
> >
> > On 19:29 Thu 15 Jun     , Lucas Tanure wrote:
> > > Make UART driver compatible with T7 SOC UART.
> > >
> > > Signed-off-by: Lucas Tanure <tanure@linux.com>
> > > ---
> > >  drivers/tty/serial/meson_uart.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/mes=
on_uart.c
> > > index 2501db5a7aaf..0208f9a6ba7e 100644
> > > --- a/drivers/tty/serial/meson_uart.c
> > > +++ b/drivers/tty/serial/meson_uart.c
> > > @@ -796,6 +796,10 @@ static const struct of_device_id meson_uart_dt_m=
atch[] =3D {
> > >               .compatible =3D "amlogic,meson-s4-uart",
> > >               .data =3D (void *)&meson_g12a_uart_data,
> > >       },
> > > +     {
> > > +             .compatible =3D "amlogic,meson-t7-uart",
> > > +             .data =3D (void *)&meson_g12a_uart_data,
> > I think you are trying to follow previous s4 scheme - to introduce a new
> > compatible string, while I think it's not necessary or even wrong, this=
 will just
> > make the dt_match_list longer but without obvious benefits..
> >
> > as Conor already raised this question in previous dt-binding patch[4/6],
> > how about just using 'amlogic,meson-g12a-uart' which is the first compa=
tible
> > introduced.
> >
> > if people agree, we could also drop 'amlogic,meson-s4-uart' since it us=
e same
> > compatible data as gl12a, anyway it should be separated into another pa=
tch..

> Yes, I am dropping this patch and using s4 and g12a compatible lines.

If you drop the "amlogic,meson-s4-uart" from here it will break
backwards compatibility, because the binding permits
"amlogic,meson-s4-uart" in isolation. Please do not make that change.

When you introduce the new compatible for the t7, it can fall back to
the s4 (or g12a), doesn't really matter, but the existing one for the s4
should not be touched.

Cheers,
Conor.

--CrX7CiUT711LxfDS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZI9X3gAKCRB4tDGHoIJi
0qfqAQClhHK7sWjkb2YXNJ8lYDgSgt3RJ0S64L/6Faq3siZA9gD+LFwCuKva6h98
86uGxsdPFwp5DjlE3ksYwSFHxWRUOQk=
=YyUX
-----END PGP SIGNATURE-----

--CrX7CiUT711LxfDS--


--===============2747303952673182107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2747303952673182107==--

