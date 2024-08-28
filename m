Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B924C5AE5A
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2024 15:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MdVoeAQtHY3iDOjSTBjPkP9FlMs3k9G76xVxx3HrxJA=; b=lI+SBSEMCMOw2xFO+fu/I+Ukes
	6hmAk+K/dkCGzrN6J0MEpL4PW2ZYmtZFlP65k02N9llMdagh0aHtHahccXeLc+8lbi7cbK8TfzDLV
	2se3Hbae8CzcClXjMCgDxuTGBGxT4cxP0GplU5oanx7e0ZGVep0p9vVQzi0YyPrlwlLKdz1pkuDfp
	T/p3+4dl02ZwEFx5kz56H52OzhCizvNC8WzLYu1gbLftr64FNPeBcy6hSlzicIH2eow6qRr93Wzkt
	tMNFe+pfo4QL71kWNpMVqGClDNcijVAKMLBfCcVsGfYaNeGPuvpvcSDSwExGlgqSwgzhBrVlGptfF
	/SZtHxFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjKCg-0000000FrZv-0zpQ;
	Wed, 28 Aug 2024 15:03:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjKCd-0000000FrZM-048Y;
	Wed, 28 Aug 2024 15:03:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 13F40A41598;
	Wed, 28 Aug 2024 15:03:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C16C4CEC2;
	Wed, 28 Aug 2024 15:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724857397;
	bh=Q/FWYBfhq0EfW/PW3pTyaVMwo1NEzGyWM8q4CMuLmmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q6tBH1FFTxkGbyppAXiq3i3jb1A3bP52++rMmbcUB3aCvNcgdndawIqNWY2QAVDLf
	 gs21BbcbPtkPUsphg1ZK4FoZOeueWhmZMJ4Gf3MgNfj8rIQYM6p8BZGR5SPjyn4ZLh
	 n+rWR2BYesFeHSrqo1bewKrLLkKlse67VDaFJuRRzwGQnkvXH4ioG2ttb3TBgBV4lw
	 CLd3ogYNZCI7SYOnjmBOrIzeZhC1H2giUZVN9rPSVq4K95SyOGSrfKFXut+9mgz9aM
	 FliJmZ3gzTZwlXty8Z7v4w26porBNOo/CwCxDCYZ5aJSdNYQ/FcbxAV3P87amqofM/
	 vTIHuWPDTElmw==
Date: Wed, 28 Aug 2024 16:03:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 0/3] ASoC: dt-bindings: amlogic-sound-cards: document
 clocks property
Message-ID: <20240828-brittle-swapping-8b04379725c8@spud>
References: <20240828-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v2-0-58159abf0779@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240828-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v2-0-58159abf0779@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_080319_148858_2F340C44 
X-CRM114-Status: GOOD (  12.78  )
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
Content-Type: multipart/mixed; boundary="===============2322792370458968512=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2322792370458968512==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m2irlymd8u+CRXoQ"
Content-Disposition: inline


--m2irlymd8u+CRXoQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 03:53:53PM +0200, Neil Armstrong wrote:
> Following an off-list discution with Jerome about fixing the following
> DTBs check errors:
>     sound: Unevaluated properties are not allowed ('assigned-clock-parent=
s', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
>         from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-=
sound-card.yaml#
>     sound: Unevaluated properties are not allowed ('assigned-clock-parent=
s', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
>         from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-s=
ound-card.yaml#
>     sound: 'anyOf' conditional failed, one must be fixed:
>         'clocks' is a required property
>         '#clock-cells' is a required property
>         from schema $id: http://devicetree.org/schemas/clock/clock.yaml#
>=20
> It has been agreed documenting the clock in the sound card is a better so=
lution
> than moving them to a random clock controller or consumer node which is n=
ot
> related to the actual meaning of those root frequencies.
>=20
> The patchset adds the clocks proprty to the bindings and finally adds the
> properties to the DT files.
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--m2irlymd8u+CRXoQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZs88MAAKCRB4tDGHoIJi
0mjhAQDnSlMChubzH0189CmvK9fFj4PZMmpTw44594t+DOABhQD/RjBwMvnhYOXP
VRtcQF5BBGyx6BDxa1eaamYHy44Vewo=
=lI7+
-----END PGP SIGNATURE-----

--m2irlymd8u+CRXoQ--


--===============2322792370458968512==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2322792370458968512==--

