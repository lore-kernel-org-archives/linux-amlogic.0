Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7EAEB64DA
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Jun 2023 09:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+e1CVYwATFHoEes4CmvJIesP1o0X+tY3LY0IY1r5x8=; b=r/MnaADox7hpd82Lep8p4kg3Rm
	ZlX9FaCe0n1886uLjQDECpvMDroAtOOs3z+dpdPA9asFIWYQXgAKGD/BhcE/CL7PHkNY+ALMb7pSy
	L5hsPkFqcE3AV6HG2PgXr9/9PDT6ppmS3gmNYIbf7C/BWYOv2npkRc87tArutsFvUiXFS+Whk7srZ
	o0AjRbL2lkCNaov0oYLFidnJuDULI/Ceh5twlmufVFUOzKtWWc2hb9JJ4LeW8GlQtw5l8JlTGNkQq
	2xk1C1Drfj9uT3/xHGqaOfWCTFS2NAG3q0pIIwOqrJDykAvddqVJ1oDSqy8Acc33/QC7MTxH/it2v
	69CqsPhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCGbP-00Haqa-2M;
	Thu, 22 Jun 2023 09:27:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCGbN-00HapR-1J;
	Thu, 22 Jun 2023 09:27:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687426061; x=1718962061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=avbGK7S7LV+7nn+z658JKvXE0ojq/Xd4FY7WvcVFmzg=;
  b=aOCIO85MOJzcrZjhq0lXKqSvpYQ1y31Q+PIjTY7DXhV+SnjAe1kyxccS
   TnBzuLUhTgxLpfZVObMF72yL8Yef3IznkOlJsdS14d7NuUAoQzideOE0U
   xkCl1gYNzRzQ5wQm0YwmlpBNUVdtzUjQ3noGIFL4dDfm1GOgGK04Rh6bU
   c/W4pow15W54V08qDdefYxs2clnhm4MB0la6EmHyGRIkeGCT/GDVXh5NG
   Xk8ZZotgyPuwrZd8DCX2Ot+JVbJSyCwhrx0H1kzgeqAxTZGF+Ndij1Ea4
   Rz5Mtfcr+DxW8Y8OOzblr08Exe78zBdIoUv/h7GccT+8U1Ax7mCgPvEue
   g==;
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; 
   d="asc'?scan'208";a="158093292"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Jun 2023 02:27:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 22 Jun 2023 02:26:47 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 22 Jun 2023 02:26:45 -0700
Date: Thu, 22 Jun 2023 10:26:18 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Lucas Tanure <tanure@linux.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Nick <nick@khadas.com>, Artem
	<art@khadas.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v4 2/3] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for T7
Message-ID: <20230622-unsent-willing-574906af5e1a@wendy>
References: <20230622084045.519203-1-tanure@linux.com>
 <20230622084045.519203-3-tanure@linux.com>
MIME-Version: 1.0
In-Reply-To: <20230622084045.519203-3-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_022741_573562_EEA83709 
X-CRM114-Status: GOOD (  15.24  )
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
Content-Type: multipart/mixed; boundary="===============3739664553493227912=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============3739664553493227912==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ddIyo+hP71qlkpK4"
Content-Disposition: inline

--ddIyo+hP71qlkpK4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Lucas,

On Thu, Jun 22, 2023 at 09:40:44AM +0100, Lucas Tanure wrote:
> Amlogic T7 SoCs uses the same UART controller as S4 SoCs and G12A.
> There is no need for an extra compatible line in the driver, but
> add T7 compatible line for documentation.
>=20
> Co-developed-by: Conor Dooley <conor@kernel.org>

You can delete this, I don't need a Co-developed-by tag for review
feedback.

> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>  .../devicetree/bindings/serial/amlogic,meson-uart.yaml      | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.=
yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> index 01ec45b3b406..4ca4673169aa 100644
> --- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> @@ -46,6 +46,12 @@ properties:
>            - amlogic,meson8b-uart
>            - amlogic,meson-gx-uart
>            - amlogic,meson-s4-uart
> +      - description: Everything-Else power domain UART controller on G12=
A compatible SoCs

s/Everything-Else/Always-on/
Otherwise,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Perhaps it can be fixed on application, I don't know how the amlogic
maintainers operate.

Cheers,
Conor.

> +        items:
> +          - enum:
> +              - amlogic,meson-t7-uart
> +          - const: amlogic,meson-g12a-uart
> +          - const: amlogic,meson-ao-uart
>        - description: Everything-Else power domain UART controller on G12=
A SoCs
>          items:
>            - const: amlogic,meson-g12a-uart
> --=20
> 2.41.0
>=20

--ddIyo+hP71qlkpK4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJQTugAKCRB4tDGHoIJi
0lalAQC26MkvYfk+N8oVCKB3gmbONVI77MG2hQKQm4gPBQBMpAEAmhCQCy5FYk2G
fefLgjHl2z94F9oOu9SJ+Zj8fkWhOgg=
=vwt5
-----END PGP SIGNATURE-----

--ddIyo+hP71qlkpK4--


--===============3739664553493227912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3739664553493227912==--

