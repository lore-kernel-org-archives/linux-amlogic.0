Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B64C4345F
	for <linux-amlogic@archiver.kernel.org>; Mon, 22 Apr 2024 15:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Om50Ej2CENvWfoNqUSJD6mYtLYWg25bkwx/stQWUFg4=; b=GyP3q91vD1oJnDrCV/XGChqRfX
	EibpjUpHIRZebkpiCxnbjEJcmAyrr1ZK7UjCyd0d94H0KQ16AY6YPsAVJROypMzr7uOprmdbjEGmX
	AAXNf8Uf05DcpgXxzp6NhI1aAxS1v0/nrqbh6EAGwqIaWn8mcTnb5LKdGS4EihgTDrXlQLFcpUIVw
	F8BPzepOhweJecXc9mUzPwW9du4n3bQyD1AYvHP2qT04Tl6CpI5ReaeOt3QGHpZL5BH3Q5ewlbFX4
	76z8iahXwkJqebAFoH+2P5rFruiDc17Z2OwwkF7VgX0x6dHhUASRRE4/otl50dZG3E9Aesr9+E3B4
	rbKfAlbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryveM-0000000E80j-2LWX;
	Mon, 22 Apr 2024 15:32:10 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryveK-0000000E7zo-0Fsq;
	Mon, 22 Apr 2024 15:32:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 80C6ECE09AB;
	Mon, 22 Apr 2024 15:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF42C113CC;
	Mon, 22 Apr 2024 15:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713799922;
	bh=UvmIfCiITCcdyzxsZMMrgYWKx8FzLEXrnqmTNkMaMaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=te+a3h/gS8fUUis5ddHZ1+T6SNiYNG/yCMPhmrcLcA9c0XNiYlXgTAohCu59EV0uP
	 yDA6i3FchjzUMC0jT0z9muuac/dDSnPlboA7BCsepHnoscx48lVUTH58MKf49rWvsb
	 JH7iLX+uOxmJj2rDwrDKetSxzBEf9cgZVKs9litqnb6A9vOoc1nIsW3SL/2hhfbzar
	 ruOXYQV4JmP52gvKEzWEtY9STxF4ifuFM3DkG4Yis69WXNwSpckTwKfINEW7QjG1ws
	 pqAHyZrqxERLCsVjcbmojT9Zgx4IP6OszxgZKSitE/IVraV5dE+kVDroliMA6NWYXp
	 becZgB7l6n/2g==
Date: Mon, 22 Apr 2024 16:31:57 +0100
From: Conor Dooley <conor@kernel.org>
To: kelvin.zhang@amlogic.com
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Zelong Dong <zelong.dong@amlogic.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: reset: Add Amlogic T7 reset
 controller
Message-ID: <20240422-unbridle-busybody-1ac4abc20843@spud>
References: <20240422-t7-reset-v2-0-cb82271d3296@amlogic.com>
 <20240422-t7-reset-v2-1-cb82271d3296@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20240422-t7-reset-v2-1-cb82271d3296@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_083208_311608_A3E76998 
X-CRM114-Status: UNSURE (   8.57  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============6966307372244783150=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6966307372244783150==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="st57Evgp6eg7VOFY"
Content-Disposition: inline


--st57Evgp6eg7VOFY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 22, 2024 at 07:11:43PM +0800, Kelvin Zhang via B4 Relay wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
>=20
> Add a new compatible for Amlogic T7 reset controller.
>=20
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--st57Evgp6eg7VOFY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZiaC7QAKCRB4tDGHoIJi
0gu7AP9QZ6oXIIzIK8YedKjepYRFL4uNI4BB05WmkRTGeCKSTwD9FitSjjV78XBr
dqFLrp1pz7ps0KLscW8UUSS/Uq9TuQk=
=AVLI
-----END PGP SIGNATURE-----

--st57Evgp6eg7VOFY--


--===============6966307372244783150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6966307372244783150==--

