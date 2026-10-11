Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E066CA9EC7
	for <linux-amlogic@archiver.kernel.org>; Sun, 11 Oct 2026 21:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcMSpjUIK9uLlPR+L30kvpRCe5Mb5bWwLd4LOPNrIF0=; b=TkpbxnPdae86dURYhOVVTTpKcu
	7/t+J1Hk1pseBQ1k/H1OPArJYc/B97eqhe4YbMkspmM1sMVhfCyHkjf8tsgzdrrA60lxcEHpoGgGt
	/OcKz0kp6GWlHtvV68ShfVGf2hJP5aCOoIhpedynptv2nwXdMDYjdlghdp25iAV3YmjwnWKNevzpl
	SXVp+sMTXCYdqFoYJEzCD2oTwNqNphmAIT5zJVUIYm5T0ZwzRa2VPHkf36MIdbtEfLxa92U4g+bUO
	jVujayHWRhN5RtiKhpTmRBZkCDBenJ0u+D1oSDam4xgEjg9VeDWcFEIKw5l4fm+jqNQalQfSBpYp+
	YIEffzcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG0rq-00000009PsU-28wE;
	Sun, 11 Oct 2026 21:14:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG0rp-00000009PsJ-07g5;
	Sun, 11 Oct 2026 21:14:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D93CD602A8;
	Sun, 11 Oct 2026 21:13:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743761F0089B;
	Sun, 11 Oct 2026 21:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791753239;
	bh=cB64+7GIL/QejhQmJX5UmgahZ1S8lTXRVFKShlbGWQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y9R0nBApfEq3cFVA+VsinEcrUSzp6c6bkadfZbfDy1QEQ5rg5OoIhCrczxqxVS8kT
	 2HCmsO3+W/T1abh2B3I65X7x5vUzr6/euVpLz62Vk52UmSYp3MrIvnlOMVrfn8H8DG
	 MpMCa6Zs5ebzHvIYHcvddVChPsaMdWP/v7H2s8fzOx0wSu9M1w5a/ugCmIJ9EgQ/nh
	 UphV13z3PHvIvffykWUVXTGisHUO9e8mRsmH3fY+RSHQKkQCWY35rny4nZbSsQaCUz
	 FQL35cVSIfc3jQjVf9AmhNE73CU/WhMWFD8xNuZHj+izqQ3ViEg18rZ7Q2dL7efhbW
	 GBotapyIPL2RQ==
Date: Sun, 11 Oct 2026 22:13:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Lucas Tanure <tanure@linux.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: net: amlogic,meson-dwmac: list the
 compatible combinations
Message-ID: <20261011-starship-foyer-1105c1b35e31@spud>
References: <20261010105900.247342-1-tanure@linux.com>
 <20261010105900.247342-2-tanure@linux.com>
 <CAFBinCAejxmeeHyDy+vMSg6dBm+9prhEo9qZ7FAsiWNB1W-HXw@mail.gmail.com>
 <CAJX_Q+3JLn6oTt8qTPM-muKsY9JbTEMwqRvbamZ3vqg_Yymsmg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJX_Q+3JLn6oTt8qTPM-muKsY9JbTEMwqRvbamZ3vqg_Yymsmg@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============9220962876255431438=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============9220962876255431438==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Li4Qmgdoe6LbIUh+"
Content-Disposition: inline

--Li4Qmgdoe6LbIUh+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 03:16:18PM +0100, Lucas Tanure wrote:
> On Sat, Oct 10, 2026 at 11:04=E2=80=AFPM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > Hi Lucas and Conor,
> >
> > On Sat, Oct 10, 2026 at 12:59=E2=80=AFPM Lucas Tanure <tanure@linux.com=
> wrote:
> > [...]
> > > +          - enum:
> > > +              - amlogic,meson8b-dwmac
> > > +              - amlogic,meson-gxbb-dwmac
> > > +              - amlogic,meson-axg-dwmac
> > > +              - amlogic,meson-g12a-dwmac
> > > +          - const: snps,dwmac-3.70a
> > > +          - const: snps,dwmac
> > > +      - items:
> > > +          - enum:
> > > +              - amlogic,meson6-dwmac
> > > +              - amlogic,meson8m2-dwmac
> > Meson8m2 dwmac reports: User ID: 0x10, Synopsys ID: 0x37
> > In case it helps I can submit a patch to change the Meson8m2 .dtsi to
> > use "amlogic,meson8m2-dwmac", "snps,dwmac-3.70a", "snps,dwmac" - then
> > we could move it here too.
> > That leaves only Meson6 with a single fallback compatible. I don't
> > have any Meson6 boards, so it'll have to stay that way.
> Hi,
>=20
> Fine by me. But I think it is best to wait for this series to be merged.

In the second sentence, you're referring to the dts patch I assume?
IMO, you should submit a new version of this with the 8m2 moved to the
other enum and Martin can submit the dts patch now, since the current
binding permits using dwmac-3.70a, no need to wait for this to be
merged.

--Li4Qmgdoe6LbIUh+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasv8EQAKCRB4tDGHoIJi
0j98AP4rQ60xf6QZIR+UVdVPmdSR8xm6GMzsKTW5wwCVZq8gLAEAyM8L5JCUZzmE
aBhkxeWELj13jV1WIQV+eunZ4dUaYgU=
=+0qV
-----END PGP SIGNATURE-----

--Li4Qmgdoe6LbIUh+--


--===============9220962876255431438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============9220962876255431438==--

