Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BD3606A32D
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 17:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E3Sbhyrl;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FVAFAHzp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EVOvI8En7Md11QQPFcklwhhc6po6ua9yneooct/+XW0=; b=E3SbhyrlpWjXz0UenlEo26rYPl
	YWB4vqRA1cyNegOgB/AVtKSIoiBHMso2ODY3q18+v+r+S4MPrBueoEKiB+1eSW0SLrv3oIZAayIVO
	ZcOjW1HW9I9RD0mqaEV7bwUxUHXCRfqW8KOvqPyVntQofjSew6E6p1UecSjDvG8aQ8flR1fneEJUc
	pn4hJwLj3mQDYwXKzlSPdeAX1HA+r2oELw+5Aq8JntZdWd8faS9lNcRdqj2GJkqt6NpMvbkxVAzp0
	Grw3cYj9J+m/A3eAlYgbP8OdKjYY2QFlRp/nRXbmKAFHD5nU4kEc1vsK9XLPV+Nh6Vh34pE0Yxmc0
	2nqHnumA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNcc-0000000DD8O-3zMQ;
	Fri, 06 Nov 2026 17:21:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPNcc-0000000DD8F-1XOs
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Nov 2026 17:21:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BBC0C601F8;
	Fri,  6 Nov 2026 17:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6A91F008A6;
	Fri,  6 Nov 2026 17:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793985661;
	bh=mlSihzr8pYdtWScxo62ogUk0KfJHGdqcjF1TEJEb7DY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FVAFAHzpuPHwNet8qjtzgoQhyvQ+HIyuWRIzFwjxmR69yiVWDf4Bjk8dDAeod7FDh
	 73BsDPXG/OHWFl5rJs3ZyxF1waQq6nVtAWDwblVgxXXHrKWFB6Y+pCIkpN7K+im3BH
	 btzWs8U0+K74gk6xCgMIRlFKAIyWfiHO29S9elOyGv/ePdZFy5mrb7F2EbIxHwGUKv
	 UkMr/O/8bMsQvnJukcVT35rIUcnvkoFbbHj43+3o4zOnGrSIURLnbdleZmKY8UKUqo
	 YsPYUeASvPXYiX9bXT6kZCl1Ox/QR3NMuTCN0PlcNxfoJsZeTJALRp/bcro9kg0kJ3
	 PP36r2lsRlS5Q==
Date: Fri, 6 Nov 2026 17:20:56 +0000
From: Conor Dooley <conor@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: glaroque@baylibre.com, rafael@kernel.org, daniel.lezcano@kernel.org,
	rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-pm@vger.kernel.org,
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH v2 1/3] dt-bindings: thermal: amlogic: add S4
Message-ID: <20261106-surfacing-catcall-223c1c454b8e@spud>
References: <20261106101913.46664-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106101913.46664-2-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261106101913.46664-2-christian.koever-draxl@student.uibk.ac.at>
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1052072993200048827=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1052072993200048827==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wFxvJZ9ZE23zKehY"
Content-Disposition: inline

--wFxvJZ9ZE23zKehY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 11:19:11AM +0100, christian.koever-draxl@student.ui=
bk.ac.at wrote:
> From: Christian Stefan K=F6v=E9r-Draxl <ckoever@outlook.de>
>=20
> The S4 temperature sensors are the G12A design, but like on T7 their
> calibration value is only available through the secure monitor: the
> ao-secure register used on G12A holds unrelated data on S4. Add a
> compatible for them. As on T7 the sensor index is the argument of the
> secure monitor phandle, so one compatible serves the CPU and the DDR
> sensor. Each sensor has a bus clock gating register access (ts_pll /
> ts_ddr in the S4 peripheral clock controller) besides the functional
> clock, so it takes both, named.

Why can this not use the t7 as a fallback? Driver suggest it can.

>=20
> Signed-off-by: Christian Stefan K=F6v=E9r-Draxl <ckoever@outlook.de>
> ---
>  .../devicetree/bindings/thermal/amlogic,thermal.yaml         | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.ya=
ml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> index e72cb39ac635..66dd572ff44b 100644
> --- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
> @@ -23,6 +23,7 @@ properties:
>            - const: amlogic,g12a-thermal
>        - enum:
>            - amlogic,a1-cpu-thermal
> +          - amlogic,s4-thermal
>            - amlogic,t7-thermal
> =20
>    reg:
> @@ -84,7 +85,9 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: amlogic,t7-thermal
> +            enum:
> +              - amlogic,s4-thermal
> +              - amlogic,t7-thermal
>      then:
>        properties:
>          clocks:
> --=20
> 2.56.0
>=20

--wFxvJZ9ZE23zKehY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau4MeAAKCRB4tDGHoIJi
0qkxAQC/MXuDpuDromjVxEip2g7fLcdreRxIw+GpS5nss/+w8wD+Ig8l8mJmB0PP
rERuia+XhvRrf4GiiJF+FhFho4j97QQ=
=LKGV
-----END PGP SIGNATURE-----

--wFxvJZ9ZE23zKehY--


--===============1052072993200048827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1052072993200048827==--

