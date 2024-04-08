Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413C8C67861
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2024 17:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVN4cnlv/28hVS9NI8RdN27iUWjlEfQVrGa3mVaz2ek=; b=ahFOwU/iSXX75KRXJzIwGM0p5C
	Uqt5qHn3h1WAgSyLcrWuOrW5DI5tnw37An46PpIObrQOYm7Hb4iRZzdoRi1LFpkF8Rzj1EjYD2nV3
	YuyU3LBW9VjAeobQ+VO7NwAHX644zhuRCkXHOwQsZxAP7f9i+7dHyvZV/SQrJTrgfnhr/NVDt6R28
	uMfAdSvkSeNJJAm9RIHN71gZg6gNhgV1dLedTObN9RYYGgbXjr5hnef/++x7mkOQWb8eBXOT62iuH
	hIDtO04IkQeWUHqAiu+JbZtWyjtOZAFP8CLB2GlhaPpVcynwaPCYC6+/LH6pk/ZnUnv7mDjOg93Zw
	3EBskNFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtsRc-0000000GIHH-3Iq1;
	Mon, 08 Apr 2024 17:06:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtsRR-0000000GICC-1k5h;
	Mon, 08 Apr 2024 17:05:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C1B0861336;
	Mon,  8 Apr 2024 17:05:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58149C43394;
	Mon,  8 Apr 2024 17:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712595956;
	bh=N9mKisc7kUAlfuj0tQyymnxAGu/44U+CyciFpi92qvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aQnKFwi/w1g3wdmNyQhIpuGFLXcUmr6oVZhG5pX06fCYUXGm42RPdOs3fIkTm9FJB
	 2oWpOlmpHd61jYuTxH90FtJvYt2ZY6GnJSYtMdrmmabJopcveQ/0QGAG4VSlDOUtiH
	 LTfRD+HKuLVDiQw13H2BdUbBVReV3ZojEeh4pY9ANGnzQBH9XkXBUcU0Ai1NiAnrmK
	 S7o2O5Dmj4vZuM9KoflqlL7b2KJ0tnAzevtzQQiAX2qmJr9Lq7gvjeK6/EhbJ3OuR0
	 87+IkiYe6wLYBwKmriNOgCo8r3he9usNatFiYjMwDmDxzczxwgTS4jlARt4FgKmTPX
	 28Jy7Df7xi3vg==
Date: Mon, 8 Apr 2024 18:05:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH v2 1/5] clk: meson: axg: move reset controller's code
 to separate module
Message-ID: <20240408-numerator-escargot-a642507a598e@spud>
References: <20240328010831.884487-1-jan.dakinevich@salutedevices.com>
 <20240328010831.884487-2-jan.dakinevich@salutedevices.com>
 <1j7chfiz8e.fsf@starbuckisacylon.baylibre.com>
 <e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org>
 <f01cdd910ab35316b8012795f73fd2b34c8e6f8e.camel@pengutronix.de>
 <13617b7a892424d2b024c725505a6f4f.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <13617b7a892424d2b024c725505a6f4f.sboyd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_100557_743892_2ACFEE6E 
X-CRM114-Status: GOOD (  35.97  )
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
Content-Type: multipart/mixed; boundary="===============3490903544981395000=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3490903544981395000==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NSVO+VttCpAhjGMi"
Content-Disposition: inline


--NSVO+VttCpAhjGMi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 08, 2024 at 02:52:37AM -0700, Stephen Boyd wrote:
> Quoting Philipp Zabel (2024-04-08 01:21:47)
> > On So, 2024-04-07 at 19:39 -0700, Stephen Boyd wrote:
> > > Quoting Jerome Brunet (2024-04-02 07:52:38)
> > > >=20
> > > > On Thu 28 Mar 2024 at 04:08, Jan Dakinevich <jan.dakinevich@saluted=
evices.com> wrote:
> > > >=20
> > > > > This code will by reused by A1 SoC.
> > > >=20
> > > > Could expand a bit please ?
> > > >=20
> > > > >=20
> > > > > Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> > > >=20
> > > > In general, I like the idea.
> > > >=20
> > > > We do have a couple a reset registers lost in middle of clocks and =
this
> > > > change makes it possible to re-use the code instead duplicating it.
> > > >=20
> > > > The exported function would be used by audio clock controllers, but=
 the
> > > > module created would be purely about reset.
> > > >=20
> > > > One may wonder how it ended up in the clock tree, especially since =
the
> > > > kernel as a reset tree too.
> > > >=20
> > > > I'm not sure if this should move to the reset framework or if it wo=
uld
> > > > be an unnecessary churn. Stephen, Philipp, do you have an opinion on
> > > > this ?
> > > >=20
> > >=20
> > > I'd prefer it be made into an auxiliary device and the driver put in
> > > drivers/reset/ so we can keep reset code in the reset directory.
> >=20
> > Seconded, the clk-mpfs/reset-mpfs and clk-starfive-jh7110-sys/reset-
> > starfive-jh7110 drivers are examples of this.
> >=20
> > > The auxiliary device creation function can also be in the
> > > drivers/reset/ directory so that the clk driver calls some function
> > > to create and register the device.
> >=20
> > I'm undecided about this, do you think mpfs_reset_controller_register()
> > and jh7110_reset_controller_register() should rather live with the
> > reset aux drivers in drivers/reset/ ?
>=20
> Yes, and also mpfs_reset_read() and friends. We should pass the base
> iomem pointer and parent device to mpfs_reset_adev_alloc() instead and
> then move all that code into drivers/reset with some header file
> exported function to call. That way the clk driver hands over the data
> without having to implement half the implementation.

I'll todo list that :)

--NSVO+VttCpAhjGMi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZhQj7wAKCRB4tDGHoIJi
0gFIAQD54FHoGcK4A8nGbf3dqzWlaU2n5wMolumXHO/fSI4UwwEAk8OApAyTnQ1X
FyTcLhrKypXfSlUop6vr4TG64K+fwgY=
=6FkH
-----END PGP SIGNATURE-----

--NSVO+VttCpAhjGMi--


--===============3490903544981395000==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3490903544981395000==--

