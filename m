Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04793C27C55
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2024 16:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWCk9gGXIsvLr6k/+2G/B17Wkvl/BXbF4CMvi7oks6k=; b=WH54RxnviSQXhJKbLipJwlJNe4
	G71DRMYGrXdLZ66yFvnXyXawKS6T0bUwjVhrMkPBcVjlLoCKxY/HXWcUH+Sm2CWlky9qPPwmFmGyc
	HG6wkZHDsrtmrcdUDpiYcId4eaPLn+VyzzDjZb5PlYp2lh0RBVd27DfsTkMXVjkZM4AwaG4EquFL+
	r5iFspW9t3Ir7St8TPQyArITtZYOeZt3JoIwdxZ9BUKTSZQIBkwR4RC6Oa4wJCBVVeKoq8TQrlMM0
	DAFWJhAUkSTstaXenq+bHvoQpi6jl/JLwpHOKTMFIiYI5MjgokfcR3N6wIpLAisXdgNxlw95btQht
	FxIxtZtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGhZ9-00000005ivZ-0dNP;
	Mon, 10 Jun 2024 16:08:15 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGhZ7-00000005iux-0e4Q;
	Mon, 10 Jun 2024 16:08:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 40612CE169C;
	Mon, 10 Jun 2024 16:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC714C2BBFC;
	Mon, 10 Jun 2024 16:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718035690;
	bh=mZTNkAEKgG/q85m1UYU1gPZ6SrEhgB8KcIIymCeQnzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f5tw7dn3YElU45yvBOLhN6f5W0SVV/6xBWUrUwA66/yXflEEBhsBqBXNFnIpigCeo
	 IjBgVRzYgfynaHQTWvZIl9hYCvRpwjSHGdlxu4Y5oBGP1mBPyq+B7fKn5Jh4dtlBnV
	 ekgy1SH2jC4KSGljAFkQEiBTGwR1VWot782NbKg060i8coBosZTzJHHy6F3Uq/kcQd
	 D6nu0g/FAhS48IfxJFqlxwBlroDgHH3cuQDfzIj+TMavRGvAfsAkkMiwuUu09qb4WX
	 cLzuxJdD74AZCyL8hTagUfUbvXSzYYoU98GPFIr2D6QQudTo6H/G8OzpquimiqHBOi
	 42v7qLnCSy5eQ==
Date: Mon, 10 Jun 2024 17:08:05 +0100
From: Conor Dooley <conor@kernel.org>
To: Viacheslav Bocharov <adeep@lexina.in>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/4] dt-bindings: arm: amlogic:
 amlogic,meson-gx-ao-secure: add secure-monitor property
Message-ID: <20240610-dropout-compress-6d6a9b749524@spud>
References: <20240610084032.3096614-1-adeep@lexina.in>
 <20240610084032.3096614-4-adeep@lexina.in>
MIME-Version: 1.0
In-Reply-To: <20240610084032.3096614-4-adeep@lexina.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_090813_393397_8201B23D 
X-CRM114-Status: GOOD (  14.27  )
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
Content-Type: multipart/mixed; boundary="===============0326203523936281792=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============0326203523936281792==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4N+yVIGOhUtFEsY0"
Content-Disposition: inline


--4N+yVIGOhUtFEsY0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2024 at 11:39:49AM +0300, Viacheslav Bocharov wrote:
> Add secure-monitor property to schema for meson-gx-socinfo-sm driver.

"bindings are for hardware, not drivers". Why purpose does the "secure
monitor" serve that the secure firmware needs a reference to it?

Thanks,
Conor.

>=20
> Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>
> ---
>  .../bindings/arm/amlogic/amlogic,meson-gx-ao-secure.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-=
gx-ao-secure.yaml b/Documentation/devicetree/bindings/arm/amlogic/amlogic,m=
eson-gx-ao-secure.yaml
> index 7dff32f373cb..1128a794ec89 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-s=
ecure.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic/amlogic,meson-gx-ao-s=
ecure.yaml
> @@ -32,6 +32,10 @@ properties:
>    reg:
>      maxItems: 1
> =20
> +  secure-monitor:

Missing a vendor prefix.

> +    description: phandle to the secure-monitor node
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
>    amlogic,has-chip-id:
>      description: |
>        A firmware register encodes the SoC type, package and revision
> --=20
> 2.45.2
>=20

--4N+yVIGOhUtFEsY0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmck5QAKCRB4tDGHoIJi
0iydAQD6TLLXFkQ91it+ekcKcRkMfnDbDLyoS4AUCnh1wSh2xQD/RDRupw8OAQo/
Y2gJUImSqXu3pj/lDI8iyrkwkNT8ygk=
=wI0y
-----END PGP SIGNATURE-----

--4N+yVIGOhUtFEsY0--


--===============0326203523936281792==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============0326203523936281792==--

