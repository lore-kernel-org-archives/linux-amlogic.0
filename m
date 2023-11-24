Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541C0C61D97
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Nov 2023 14:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D6kfNTgKRq+XnNq7dPPXYLfKCQ0DyV7ltDmbbMVO2aE=; b=nplDJwtDHLlQkuEY8ItXSqz7rK
	UjZPIFxyH/3dtDI9YvzFaYuI5RYq5wKAO8O2SXNuB1uXErmwJSjGu/PblEx5PlCwLQ1glQz94rNN3
	sa35iS+PbSSHA3dYRS3625TMrsJFHxxqRWAZ9Dq4yT8zagIi9xhgypIDRuEmLYt/SiDWmBfCxcQVf
	XYq+9CPrx4G1tqoF3TXieUtIsofzd8SL7DVzdcvf3IFOWO6HnumOdaza5QriBNzGyr/EeK9pfjROs
	iy37hlP5JIBtmtGsv6LT4oZoWkspfIekmSfzc83sXXowNbbix/t3EXz+JlXF9xavnxhUXtd7PPqG5
	TWuAiV5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6XNW-007RCQ-06;
	Fri, 24 Nov 2023 14:41:58 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6XNR-007R8z-1t;
	Fri, 24 Nov 2023 14:41:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C5119B830EA;
	Fri, 24 Nov 2023 14:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C6B4C433CB;
	Fri, 24 Nov 2023 14:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700836911;
	bh=sN2GV7ooCULXSqP4A45dgDJT99C/q8vC8n4JoqkQwkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tZlkN8TCzfmvQw+zzZzoOpOxWzQXubQmb+3KG6Pfqe6wOFk8DbHTn9r34srQLIBus
	 +o2w6oBIEL2mjiwOjv0VeYMAp5wGtsfFjUkiw33gECaIJG5pcIV325wWOFM7uG03JI
	 I9naTpaw78L/lfvDeYQT4Zg595YZXDZrCdsmCawd7Ej3YHUVAjUnpbQkzjy0iOVapE
	 dzR3++E+TIqzu6LQo1qQxiRLZm1K1w/3o8hYpUzKgtg2TGzQssQQYd11Amp37xOs7a
	 vA4DjYXZ/raNg4NI1JTeWa69+CkHTGEiuTWccZi0yl5rg7GPlGkQF4buv3e58zYSND
	 CbXINWXgZKFGQ==
Date: Fri, 24 Nov 2023 14:41:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Nicolas Belin <nbelin@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Remi Pommarel <repk@triplefau.lt>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v9 04/12] dt-bindings: phy:
 amlogic,g12a-mipi-dphy-analog: drop unneeded reg property and example
Message-ID: <20231124-vowel-reversing-619f7c4e5060@spud>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
 <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-4-95256ed139e6@linaro.org>
 <20231124-felt-tip-everybody-f2a6836e52af@spud>
 <c3a07912-07da-4965-94b8-3c0d8889ddc4@linaro.org>
MIME-Version: 1.0
In-Reply-To: <c3a07912-07da-4965-94b8-3c0d8889ddc4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_064153_895942_DA010C5E 
X-CRM114-Status: GOOD (  21.39  )
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
Content-Type: multipart/mixed; boundary="===============5783360644879754268=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5783360644879754268==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xgsO/76B+uGPTN6M"
Content-Disposition: inline


--xgsO/76B+uGPTN6M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 02:50:58PM +0100, Neil Armstrong wrote:
> Hi Conor,
>=20
> On 24/11/2023 13:36, Conor Dooley wrote:
> > On Fri, Nov 24, 2023 at 09:41:15AM +0100, Neil Armstrong wrote:
> > > The amlogic,g12a-mipi-dphy-analog is a feature of the simple-mfd
> > > amlogic,meson-axg-hhi-sysctrl system control register zone which is an
> > > intermixed registers zone, thus it's very hard to define clear ranges=
 for
> > > each SoC controlled features even if possible.
> > >=20
> > > The amlogic,g12a-mipi-dphy-analog was wrongly documented as an indepe=
ndent
> > > register range, which is not the reality, thus fix the bindings by dr=
opping
> > > the reg property now it's referred from amlogic,meson-gx-hhi-sysctrl.=
yaml
> > > and documented as a subnode of amlogic,meson-axg-hhi-sysctrl.
> > >=20
> > > Also drop the unnecessary example, the top level bindings example sho=
uld
> > > be enough.
> > >=20
> > > Fixes: 76ab79f9726c ("dt-bindings: phy: add Amlogic G12A Analog MIPI =
D-PHY bindings")
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >=20
> > I feel like I left a tag on this one before, but I can't remember.
> > Perhaps I missed the conclusion to the discussion to the discussion with
> > Rob about whether having "reg" was desirable that lead to a tag being
> > dropped?
>=20
> I checked again and nope, not tag, but Rob's question was legitimate and =
I reworded
> and clarified the commit message following your reviews.
> On the other side you suggested a Fixes tag, which I added.
>=20
> The rewording is about why reg doesn't make sense on the nature of the me=
mory
> region and it doesn't make sense here like other similar nodes.

Okay, I thought that I had given you one. Perhaps I forgot to send, or
Rob's message came in between me asking about the Fixes tag & replying
with an Ack. Sorry about that,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--xgsO/76B+uGPTN6M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWC2JwAKCRB4tDGHoIJi
0rfLAQCNolGZjIZg5rXxw9C1OMazRjRDdxd0RzNgb5+TM66JZQD8CbqSE3MjrSJn
SkJrWLo0HrWEEIlIb569LlFJT5w6QQ0=
=UnJl
-----END PGP SIGNATURE-----

--xgsO/76B+uGPTN6M--


--===============5783360644879754268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5783360644879754268==--

