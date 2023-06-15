Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00175EB64D9
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jun 2023 21:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=siGiv5rXipfXMl5fLn4j385sKK5SsdbqTSp6WcH/vHU=; b=27tIeU6gJvqf/fuWKwb+rc/KK2
	ng2ZI6nrllLJuuakMdJ0TZOhcMLnThXN+aKrA9ItRAPZmvfyBe7OYrI9P5jcBrvTU0FcnoHG8iN6x
	DVDAPMCbg598FJ9p49BAIWKT2A/AFChzVml4I5aWMX7CS974nrBdvArhtURRSRGmnY1UA/G1sEnN6
	IgDJZM/qOj0R4iIgUCC4poXR+vvrZ0KThXwzakFF2pILlS+M0uP4HGT4s9SovoSWNq3DXL9sIEG/j
	/sHdNqs/o15AYXiSZJfDrSC0LseRVMmjXay5XikNum3Z8c8mKlnQsG0HN5e0IdbmyZseSC/qJI1NE
	QUUitHKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9uVB-00G8wg-1m;
	Thu, 15 Jun 2023 21:27:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9uV8-00G8wC-1V;
	Thu, 15 Jun 2023 21:27:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 004D26147E;
	Thu, 15 Jun 2023 21:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0EEC433C0;
	Thu, 15 Jun 2023 21:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686864449;
	bh=ALGANjzm6/J+O+DAq+1CLu+C6MVxXzveFqp/gcnBs/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=shOWV/ZcIlSXzE3GxkELJnE1r3QTlb56qQvnvWK3GZJ3qLqZaCQpbRnPQvLV6tWgA
	 V144WtpDzS7XV1Aj19kI2BV0p37sj54S4LGmGPNd3YBeGowkuAUVKDUAm4u2jnvVYz
	 QWCTQQVC7IL4gq+7+Q/bKh5zU7PEnBVbN1t7UWQLwhDUFLANmi3pQ/fGoFWL4DEoNy
	 D00iydhaofJWU+M9JqpmSMsp8FI+uCWnrGsyejxk1/oHardkMktIJjZyxBuBkneNMM
	 XUdz5MrUUWwHGR4NrpaGGqX6UBMjGaqMJjV/IsoGY4QXqFMdTg9uXPeCkfW6erA7Me
	 Y2tadsYFpJ67w==
Date: Thu, 15 Jun 2023 22:27:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Lucas Tanure <tanure@linux.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nick <nick@khadas.com>, Artem <art@khadas.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: arm: amlogic: add Amlogic T7 based
 Khadas VIM4 bindings
Message-ID: <20230615-fog-curdle-9f65083bf566@spud>
References: <20230615182938.18487-1-tanure@linux.com>
 <20230615182938.18487-2-tanure@linux.com>
MIME-Version: 1.0
In-Reply-To: <20230615182938.18487-2-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_142730_545281_FEF67A78 
X-CRM114-Status: GOOD (  15.58  )
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
Content-Type: multipart/mixed; boundary="===============5962210223517734083=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============5962210223517734083==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jXKfiALBf1VGTDyb"
Content-Disposition: inline


--jXKfiALBf1VGTDyb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2023 at 07:29:33PM +0100, Lucas Tanure wrote:
> Add bindings for the Khadas Vim4 board.
>=20
> Signed-off-by: Lucas Tanure <tanure@linux.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documen=
tation/devicetree/bindings/arm/amlogic.yaml
> index 274ee0890312..1091abbae6a2 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> @@ -159,6 +159,13 @@ properties:
>            - const: amlogic,a311d
>            - const: amlogic,g12b
>=20
> +      - description: Boards with the Amlogic Meson t7 A311D2 SoC
> +        items:
> +          - enum:
> +              - khadas,vim4
> +          - const: amlogic,a311d2
> +          - const: amlogic,t7
> +
>        - description: Boards using the BPI-CM4 module with Amlogic Meson =
G12B A311D SoC
>          items:
>            - enum:
> --
> 2.41.0
>=20

--jXKfiALBf1VGTDyb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIuCOwAKCRB4tDGHoIJi
0oe6APdQWustpL6f/fQEXNP9dbgFp0Q3nqdvycHAzuRC4hksAQDpX2HgkB20oGAq
YkU3TZJpHvsHbqasoWfjpTuPk/ClDQ==
=WcwD
-----END PGP SIGNATURE-----

--jXKfiALBf1VGTDyb--


--===============5962210223517734083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============5962210223517734083==--

