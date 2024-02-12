Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007F9C48297
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Feb 2024 18:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lbg2rJrYOQRhiWeMVdxS4mrdPIBEiv/PKxVUDCB0iXg=; b=i9XXU+e8G9UvW/y9jd9ctp/eV4
	3IDqWSARCirQ1aSrQzpBrLPJb0qNky7UsULYCA5fg6iDF+SPhmY8UoQ0seicg7e1UhC2kQJN5y/gh
	ZdEhGnnFxLTXS184sSf6xUhg3Zpj3zR8v056ed/sZL0MNJPor3AVXD5/J0V412dpVIJsjbwTnwNRj
	FCj97LzCCadHBZZur5wsG/ggRuZUiPATm/pHzsfRlj2SGyWUmBjtxzKBhLnI6fyb9Xg84Vi/wQDJX
	efk8u9zO5sKm1b/UX3ANkzIPlhq/MywX/pPpmugM0vJyALSeDLXQmLueDjKMtw1t0WmF9EaFKiRN3
	lSMczrHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZaun-00000006aY5-3PSK;
	Mon, 12 Feb 2024 18:20:25 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZauk-00000006aWn-2WJQ
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Feb 2024 18:20:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D8F50CE12F2;
	Mon, 12 Feb 2024 18:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D893BC433C7;
	Mon, 12 Feb 2024 18:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707762020;
	bh=eOA+rowx7op97f8b4rINXEY4ZpCaJhAsIFok1SJ9buM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ig/GQegq+i10bBou4cvEgotKosmELPf+Vhwz06hJWdkXUI/be1nFrVlJnlekLKU+U
	 78W1uMxbFbBU1wJDt2ltSrmAkAHAePcKFr9arL2foUk52fY51ggnj7uYJ8BM2BBUwg
	 HZcS3JmBZlDG+uPNIa2nhC5/oMyJ2hFUnT9puIiS4KsCI5ClwKJnQr3wcDoyaV9ueH
	 w6o1ghrEIqM74CPI90BKHVEtyZlSEyIjHj7Si2l/Kl/cw0SUSll2f+k5tU0UYbpy/H
	 VtjSr0qbaI4GcO5udpDevvM5mDYkPjht7toY0uSAzt4AyNujWIcUkA9EtYQWAFPcq/
	 hzO9csAwMvzoA==
Date: Mon, 12 Feb 2024 18:20:15 +0000
From: Conor Dooley <conor@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: AML <linux-amlogic@lists.infradead.org>,
	DT <devicetree@vger.kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v2 2/4] dt-bindings: arm: amlogic: add fbx8am binding
Message-ID: <20240212-slaw-handprint-cb3723b9ff53@spud>
References: <77edaf7e-aeb5-4fc0-8b69-85dcddfd5a58@freebox.fr>
 <8a148279-05e1-4f00-87c1-6ed9ed1cb3dd@freebox.fr>
MIME-Version: 1.0
In-Reply-To: <8a148279-05e1-4f00-87c1-6ed9ed1cb3dd@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_102022_838049_05522C58 
X-CRM114-Status: GOOD (  13.15  )
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
Content-Type: multipart/mixed; boundary="===============6120687408999571307=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6120687408999571307==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t3FhBwUNnQyIuKb0"
Content-Disposition: inline


--t3FhBwUNnQyIuKb0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 06:50:50PM +0100, Marc Gonzalez wrote:
> Add binding for the Amlogic Meson G12A-based Freebox Pop (fbx8am).
>=20
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documen=
tation/devicetree/bindings/arm/amlogic.yaml
> index caab7ceeda45a..fce12e44c00af 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> @@ -148,6 +148,7 @@ properties:
>                - amlogic,u200
>                - radxa,zero
>                - seirobotics,sei510
> +              - freebox,fbx8am

I suspect the order here of a - r - s was intentionally, which makes
your addition out of order.

With that fixed,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>            - const: amlogic,g12a
>        - description: Boards with the Amlogic Meson G12B A311D SoC
> --=20
> 2.34.1

--t3FhBwUNnQyIuKb0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcphXwAKCRB4tDGHoIJi
0kIFAP9bYoka4ejTjWs6XhyKypdW2vFvk/G/QwkO2n8lm4TH4gD8DJ/4qNpsPReY
BS9WGV/yfzu7oBb4ZKwxrH8jEgFkqAs=
=born
-----END PGP SIGNATURE-----

--t3FhBwUNnQyIuKb0--


--===============6120687408999571307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6120687408999571307==--

