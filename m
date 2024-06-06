Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937E2C27C54
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 16:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7ELOIQ32t8Hyft0j9D3w00b6JUF2KOaC+2uiDGBybA=; b=zUns92EzfgqGwMHMPt/uENg8nD
	mrz1c+VV5+v1QMrIU60CSPuNn0HsTLwR9T7e6KBQgEbwidkX783aHJvOX7tLNV4mdS1uUs5mLJ+kc
	c8HNMDRX6V61qzyqvq6PO35pCQ83c3ImJ83hIqs4SCVZBEBcd5UqO7k9qjdKU8VLQnTV032x9zQ0b
	/UQD0g/+bvcHp9I/8CDRX5d2YL/jrFbiWXXKhH4mwGJOhS42/qZBAFiSv074IiaJQBwbu/a+6JqvS
	6AZ/a/K5ZrY0+Qqe9dGxs6eh1XSLexiU/AI9Ex330EyQllYbphWZI1ybS0IMxt65hQ4yGVcD1r9V5
	vN69R7ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFFrj-0000000AUXO-0107;
	Thu, 06 Jun 2024 16:21:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFFrf-0000000AUWW-3lK0;
	Thu, 06 Jun 2024 16:21:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0937161D00;
	Thu,  6 Jun 2024 16:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0329C2BD10;
	Thu,  6 Jun 2024 16:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717690882;
	bh=+cmAf72y5POah1NpyyIb4Lau7qS9oZS21wkpmv9qEio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gjRM0ku0J4KTQzi8bnmdF4nh3fgQBiRVmMiPam9o3ejint+L4c0q7ununjAgk8Lym
	 qFfM7+zacqjN82o6SRXDkw/ZTwta9T0HkrrAWuHNNECd5Wv+UXC8IU0KwA3/0wjn2/
	 jJjeAxMsf7L9YkouHseADh/t4ErYOXXXoJdl6fiFc5F4VYuvoytGkNv8gAHyskB10L
	 mwZVzNO+zbEGaYKmOi7LLs2ocQscSJl2H28zFsraATh6Vc0cEcmo/Dp9Elr3nEaUIY
	 RjiK99djJws1H8/p9p7aqcXZLWizgRe9qEINeoJuZWOZrLDx5n9NOK0NMCDUi/NmPZ
	 hcz2vOBmZOCjg==
Date: Thu, 6 Jun 2024 17:21:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: iio: adc: amlogic,meson-saradc: add
 optional power-domains
Message-ID: <20240606-clothing-deceit-910ad6aebe1e@spud>
References: <20240605-topic-amlogic-upstream-bindings-fixes-power-domains-sardac-v1-1-40a8de6baa59@linaro.org>
 <20240605-abdomen-starch-4fd4d7ead431@spud>
 <1a82eeb8-bb95-4fad-acce-798ba0cda170@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1a82eeb8-bb95-4fad-acce-798ba0cda170@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_092124_110393_2FE1545C 
X-CRM114-Status: GOOD (  14.39  )
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
Content-Type: multipart/mixed; boundary="===============8501351994255090317=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8501351994255090317==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a9tWOetrfT4l+L95"
Content-Disposition: inline


--a9tWOetrfT4l+L95
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2024 at 09:54:22AM +0200, Neil Armstrong wrote:
> On 05/06/2024 18:58, Conor Dooley wrote:
> > On Wed, Jun 05, 2024 at 11:37:08AM +0200, Neil Armstrong wrote:
> > > On newer SoCs, the SAR ADC hardware can require a power-domain to ope=
rate,
> > > add it as optional.
> >=20
> > What about the older socs that don't have power domains, the property is
> > now usable there?
>=20
> Old SoCs doesn't necessarily have an associated power domain, or was hand=
led
> by firmware, does it harm if we make it optional for older ones as well ?

I mean, really all of these devices have a power domain, even if the DT
doesn't describe one as it's hardly gonna work without power, so the
commit message just seems odd to me. I don't care enough to ask for a
new commit message though.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--a9tWOetrfT4l+L95
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmHh/QAKCRB4tDGHoIJi
0hMxAQDME6Isi1Om+F82DIFxdun87ci2FJHShbHxkeQrVZuWVQD/Qbui0InQz1Yk
zESnI+lhIsrcHkaUvZVxuHm8MfgsDwU=
=EZ+g
-----END PGP SIGNATURE-----

--a9tWOetrfT4l+L95--


--===============8501351994255090317==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8501351994255090317==--

