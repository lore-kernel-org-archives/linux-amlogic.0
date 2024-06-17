Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57123C27C79
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 16:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Qf0JBJ/8MmHFUMKeyc+zvuIy4CyUQIywZdPoX9bc6k=; b=WHAHlX3+HewA1KknaNZqm1Mo0E
	IGAQI5zVcIivFWN86OGyCeManXqY6U7GsAfqaP/pbk7vtM2TxI8ZLwyR6sep/9UQuk1eCVIkOxVDH
	rAr2z6cdrptFbr+yQGiyN60FBPDAgqjajrkcMWxSGuLNWxN6mllKbxT24SSch4Mlm6fMpxTnXJqn0
	BstOMPlbfNYIfjB4UNeFYprTL/UPbRONFD6lFGRTSoxoXV2rJ2Z26ECQgHj/A05ocAASeJft2c+Kw
	TR32nNGygYHjgwpIf/4h55D+WlyZD2xyVH4mgvDeoTNrU/08Xroe7IPI0lDjqZzBkR3RklZgLkq/p
	wEa0NEzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJFgC-0000000BqqG-0Kgi;
	Mon, 17 Jun 2024 16:58:04 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJFg9-0000000BqpO-1qy6;
	Mon, 17 Jun 2024 16:58:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 608A3CE127F;
	Mon, 17 Jun 2024 16:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D28C2BD10;
	Mon, 17 Jun 2024 16:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718643478;
	bh=EYhhFEKPUKJ3A9IrkQKwCZDAWmChwoTv2GvWJZl4HTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ju6HrgnMDQT8HCJ1gUVvsZkxpNmMPkxNK3n1ac+FHNzr28r23Kig+IKENMFY/aoli
	 sCrEBTKypzLwmzOOTIIQ+dJZ1hNc1oWeFMO8ZDC9sIZ1xs5d4o4htq1Hr5BEYXThIr
	 MJUPZNtOOzFe+09X+N9PnxFMDSiqPq5nw/V3EV7PtVk5XCTtgGvm+KUr0/4Ra7GtfR
	 imIYZJIek4IdcKtIEL1CznqlsG6budKqedaqWnzWXO98umXX3H+q/CqeSrRqsyHS3o
	 JuUlB1M/H7vLhAoi3Dh8Qb9g5rFbtITo1p8GxN8KVLUwAV276fyW9cW0u26TaUn7F/
	 EzOjz/socuMBA==
Date: Mon, 17 Jun 2024 17:57:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Viacheslav <adeep@lexina.in>
Cc: Rob Herring <robh@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/4] dt-bindings: arm: amlogic:
 amlogic,meson-gx-ao-secure: add secure-monitor property
Message-ID: <20240617-sulfate-posture-1619f1cdf090@spud>
References: <20240610084032.3096614-1-adeep@lexina.in>
 <20240610084032.3096614-4-adeep@lexina.in>
 <20240610-dropout-compress-6d6a9b749524@spud>
 <4866f6d4-2e3c-40c7-a8cb-ba4e422ffef6@lexina.in>
 <20240611-undying-earthy-00236ac251aa@spud>
 <20240613164244.GA1999034-robh@kernel.org>
 <c0d18fef-be65-461e-948f-c25e757199a5@lexina.in>
MIME-Version: 1.0
In-Reply-To: <c0d18fef-be65-461e-948f-c25e757199a5@lexina.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_095801_971094_6CBBCC30 
X-CRM114-Status: GOOD (  33.64  )
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
Content-Type: multipart/mixed; boundary="===============0781287545241443735=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============0781287545241443735==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NNsmTeGnFTom/65N"
Content-Disposition: inline


--NNsmTeGnFTom/65N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 11:21:30AM +0300, Viacheslav wrote:
> Thanks for review.
>=20
> 13/06/2024 19.42, Rob Herring wrote:
> > On Tue, Jun 11, 2024 at 07:07:28PM +0100, Conor Dooley wrote:
> > > On Tue, Jun 11, 2024 at 01:25:11PM +0300, Viacheslav wrote:
> > > > Hi!
> > > >=20
> > > > 10/06/2024 19.08, Conor Dooley wrote:
> > > > > On Mon, Jun 10, 2024 at 11:39:49AM +0300, Viacheslav Bocharov wro=
te:
> > > > > > Add secure-monitor property to schema for meson-gx-socinfo-sm d=
river.
> > > > >=20
> > > > > "bindings are for hardware, not drivers". Why purpose does the "s=
ecure
> > > > > monitor" serve that the secure firmware needs a reference to it?
> > > >=20
> > > > This driver is an extension to the meson-gx-socinfo driver: it supp=
lements
> > > > information obtained from the register with information from the
> > > > SM_GET_CHIP_ID secure monitor call. Due to the specifics of the mod=
ule
> > > > loading order, we cannot do away with meson-gx-socinfo, as it is us=
ed for
> > > > platform identification in some drivers. Therefore, the extended in=
formation
> > > > is formatted as a separate driver, which is loaded after the secure=
-monitor
> > > > driver.
> > >=20
> > > Please stop talking about drivers, this is a binding which is about
> > > hardware. Please provide, in your next version, a commit message that
> > > justifies adding this property without talking about driver probing
> > > order etc, and instead focuses on what service the "secure monitor"
> > > provides etc.
> >=20
> > To put it another way, how many secure monitors does 1 system have?
>=20
> One per system in current device tree.

One per system, or one is currently described per system, but more might
be added later?

> > What do you do if the property is not present? You didn't make it
> > required which is good because that would be an ABI break.
>=20
> We need an indication of the ability to use the secure-monitor to obtain
> additional information within the soc driver. It seemed to me that using =
an
> explicit reference to the secure-monitor is the best choice.
>=20
> >=20
> > You only need a link in DT if there are different possible providers or
> > some per consumer information to describe (e.g. an interrupt number or
> > clock ID). You don't have the latter and likely there is only 1 possible
> > provider.
>=20
> Would replacing the reference to sm with an option, for example,
> use-secure-monitor =3D <1>; look more appropriate in this case?

Perhaps a silly question, but (provided there's only one per system, why
can't the secure-monitor driver expose a function that you can call to get
a reference to the system-monitor? I did something similar before with
a call to in mpfs_sys_controller_get() mpfs_rng_probe(). Granted,
mpfs-rng is probed from software so it's slightly different to your
case, but the principle is the same and it's not unheard of for code in
drivers/soc to expose interfaces to other drivers like this. You can
just call a function like that, and know whether there's a secure
monitor, without having to retrofit a DT property.

Thanks,
Conor.

--NNsmTeGnFTom/65N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnBrEQAKCRB4tDGHoIJi
0t04AP9IZpDaZr0ZUw5JP/PZ+mfLbOJbqMfSkCUHR55GfiYSjQEAsopLOy9vwxux
yt1njFci5qcGHtd4l6xcHFxdHYq+XQ0=
=0Ywh
-----END PGP SIGNATURE-----

--NNsmTeGnFTom/65N--


--===============0781287545241443735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============0781287545241443735==--

