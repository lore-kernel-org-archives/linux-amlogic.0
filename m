Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CB3EB64DC
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Jun 2023 19:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=InXGjLPG6ThOIW2nBidBd+8Q9O9TAoIni1IYGQFgxnA=; b=b/uE/zfriDXwM8YWYqw1tD539q
	jip4E9HNTKPMs732HrzVtqJ/axaMSOyuVhjTuubAmNq3EaGT3gWuMq4FN3fnweTnNAfMQAmglCBRP
	moULsgGJbjL6eDX8m4UkuZCk6mV3lxHxMn7Pq5gBkZAaUuSynJEUOsXD0ZJJSG+sxMZ8EgGt+b6JD
	1Bbzis0IKPvYGg3ejaD1oNEiERFcizOB9OVn0ZZHiOxe+Ue2AIQrqEj07F8Lbkq6L8Qu8CqLSXtlz
	BRDgptjvkE8NB5a+N20PO/tIylrA/frmRW1wgp5mEjpNWSJ6d/8My8YziHPgTVgPHy0DtBoDJ79SD
	SjhSwEuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC3GU-00FWCA-0q;
	Wed, 21 Jun 2023 19:13:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC3GR-00FWBT-2r
	for linux-amlogic@lists.infradead.org;
	Wed, 21 Jun 2023 19:13:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 688A1616AA;
	Wed, 21 Jun 2023 19:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DB1BC433C8;
	Wed, 21 Jun 2023 19:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687374790;
	bh=5OJ7PjnlmhDlV9hG0fI5rCj/uuaQFZRsYGwvFMGaNM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oFzVam4xfeCFvgQDEQznaCebTKZ3nPTBCYbYMXvRLSV77FRpOpakatq8LCKg74Lmz
	 DvBaRoY4R6n1mecKBSGKQ5SNlrwq+U1RbecDdD+XFxhm3znt0T9Ydx3lYFl6zUQseF
	 bI1HydeXmY3fi1WDA+mrd5AVOUy6KpfwzqAGn5qYIqU91AlecTc6RvP7Ef8bkP3lBF
	 jB3GMPzr2RnsCEwU9zvWIxXIshleCyIvlYm9XrFrRHkl3iD+HPAqzY5AbE55zJUfZD
	 dkmwuq8yf6Ko/7w11cFXNuzLsRIr5zWpq3l6mCVmZkbhs4kZTmw/L20kWhO0j63h+p
	 YdJnGp/A5A3Pg==
Date: Wed, 21 Jun 2023 20:13:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-crypto@vger.kernel.org, linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: crypto: drop unneeded quotes
Message-ID: <20230621-mongoose-trance-2d0b2bc7c8b2@spud>
References: <20230621064403.9221-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230621064403.9221-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_121311_960234_CB12E6F0 
X-CRM114-Status: GOOD (  11.45  )
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
Content-Type: multipart/mixed; boundary="===============2077076211230900450=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2077076211230900450==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kMX+ppCtr/sMbNir"
Content-Disposition: inline


--kMX+ppCtr/sMbNir
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 21, 2023 at 08:44:03AM +0200, Krzysztof Kozlowski wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--kMX+ppCtr/sMbNir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJNLwgAKCRB4tDGHoIJi
0nT0AP45U0MfyYBuBPROCFXmA1qKilOd/vpoavf+9UeUW+2mfwEA3h4J95HX9zJk
n94VGpFRzO8GMY8MxF4qeY8esYgfDww=
=v52S
-----END PGP SIGNATURE-----

--kMX+ppCtr/sMbNir--


--===============2077076211230900450==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2077076211230900450==--

