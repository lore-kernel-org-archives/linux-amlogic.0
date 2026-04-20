Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9135F588E3
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2026 16:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lVYU+hO3R6NZnLrZu4h+1S58n/pTfNNGRJs8GuMLgJA=; b=KkpAzy62rpT33gBM3yTD6Y5wwb
	qUGN0kTWkMzXzPipkvyLxFaEv9OE4Fy1kdX1Aw/fSEez7PeVV6dnLBGIynzhtc40bbDhaeOhA4ZyP
	OVK07uCN7m7ABt2ip8VgiEoIhzuwcQRr4xv76vzeCSc0eWY9qtFIALzn7zymRqAuPusQ2XUMygzKw
	DTRsfkCWsEEgD4tcxXsiPksJ3bOyEjeOs9AW/pWYCwVqMLPhOoTTk7Tf/2ESxRd+0dIDwKz3Pm9pS
	fWSWLcwGdxFDginrzP8YwqCWLmnCjV8XNVAES0KF5QmAxrsai1XJUNFHSUtxQNcq9LkBB2hKaU0vf
	HguTcFow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wErDl-00000007P0X-1ucc;
	Mon, 20 Apr 2026 16:11:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wErDi-00000007Ozz-3TVF;
	Mon, 20 Apr 2026 16:11:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7067F4343F;
	Mon, 20 Apr 2026 16:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7680C19425;
	Mon, 20 Apr 2026 16:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776701494;
	bh=FF6uudnGlPUPvb2FQizL4UweHN3ZaNOrWAjfmCj8T48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZXTUL14uffU2HofT4HKpTFjiGL67NRAWrh5o8/RckQDoTYncj4G1aF/H51j1u8AhA
	 564J3k2ZRziJ0a7rAR+MOFjlJhyJjWqWqUoPfaRZ3DNyLSow6ka1h3KO/r9fEiLuZK
	 dtAsphvKDLYkFnizr/RrnN6YjogSaA9sgSPngrGSlQmEGBfww9hDTRJYfrUw0P8kfI
	 QzKVZF0ieXoXtLZSScbsA3RCHJ6oTh260G5BIELmXjsqcewRTZnYUIQVzqmow1MDHn
	 yyYanQV7e1kRKn2j/qbLDnx1oznGb8I/doqp+2gXcReJZhe4+O19icNabubHuvcrDy
	 id+vXcS87nvsA==
Date: Mon, 20 Apr 2026 17:11:29 +0100
From: Conor Dooley <conor@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	funderscore@postmarketos.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: amlogic: add X98Q compatible
Message-ID: <20260420-mahogany-unscathed-633b67317ad1@spud>
References: <20260420061854.5421-1-christian.koever-draxl@student.uibk.ac.at>
 <20260420061854.5421-2-christian.koever-draxl@student.uibk.ac.at>
MIME-Version: 1.0
In-Reply-To: <20260420061854.5421-2-christian.koever-draxl@student.uibk.ac.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_091134_884999_86E20397 
X-CRM114-Status: GOOD (  14.31  )
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
Content-Type: multipart/mixed; boundary="===============6091558603488655820=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6091558603488655820==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="liOBZr7AzZIB+4ny"
Content-Disposition: inline


--liOBZr7AzZIB+4ny
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 20, 2026 at 08:18:53AM +0200, christian.koever-draxl@student.ui=
bk.ac.at wrote:
> From: Christian Stefan K=F6v=E9r-Draxl <christian.koever-draxl@student.ui=
bk.ac.at>
>=20

Even if a patch is simple, you still need a commit message.

pw-bot: changes-requested

Cheers,
Conor.

> Signed-off-by: Christian Stefan K=F6v=E9r-Draxl <christian.koever-draxl@s=
tudent.uibk.ac.at>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documen=
tation/devicetree/bindings/arm/amlogic.yaml
> index a885278bc4e2..82671d58d1da 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> @@ -254,6 +254,13 @@ properties:
>                - khadas,vim1s
>            - const: amlogic,s905y4
>            - const: amlogic,s4
> +     =20
> +      - description: Boards with the Amlogic Meson S4 S905W2 SoC
> +        items:
> +          - enum:
> +              - amediatech,x98q
> +          - const: amlogic,s905w2
> +          - const: amlogic,s4
> =20
>        - description: Boards with the Amlogic S6 S905X5 SoC
>          items:
> --=20
> 2.53.0
>=20

--liOBZr7AzZIB+4ny
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeZQMQAKCRB4tDGHoIJi
0omFAPoDH5KiAybZREj6lTcK/1DjW034j6NJgBrkPg+Eq2ZqlwEA66+UEajeAGRR
cVCROz2N0TrTtS58/D6XZeC8XmpKRQw=
=gb9O
-----END PGP SIGNATURE-----

--liOBZr7AzZIB+4ny--


--===============6091558603488655820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6091558603488655820==--

