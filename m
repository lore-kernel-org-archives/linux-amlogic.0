Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC13EB64D8
	for <linux-amlogic@archiver.kernel.org>; Sun, 18 Jun 2023 19:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8TlBefDE2oqpH8Sz9zHgrzoKvxlLZZF8wsdDfCuOGc=; b=eOtWjm2yFvQa5U9yMQXIG4pTPf
	TD+RpJsLswQcvxV8/1AVAyrdB2zeOCj80Gkwo0Jdggy9PO+yXbvMuF9iFsElkrkBVmh+Vy21M69GS
	vDBdLHsWFNy36KLDZEMk/PiBAf2fXfeVXGqt45rqNcuFeN9x26hboHFANDuSWMXPaU8G2rhBWXm8Z
	3zK+ZDHrqdrcMM8FOToDKJC17Cw2z6uE+GwIbccVz/sL/TGri/hcIhnmTGxQPedoOfSu3O/P9Y077
	rXtyWoniC/nRzZ0drnZ4VYR1b3FvUmoEDlaDGK5BMtuwUq1gtU4c8wjc7lFUjxyClykBun4Nnxq6b
	ukmyKZdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAxug-006Z7e-2W;
	Sun, 18 Jun 2023 19:18:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAxud-006Z74-2Y;
	Sun, 18 Jun 2023 19:18:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ED69460DCF;
	Sun, 18 Jun 2023 19:18:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF233C433C8;
	Sun, 18 Jun 2023 19:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687115890;
	bh=/vS2RnSOJk0DnospOK4BfOYwwbxR6nlM/Q7dvGK/FTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jZFv52WuCzEwuk4QP8lx6cwSDc7mFFmDfvm5z5jr32GHXC0EnkI1AiW5A67RhchT2
	 bEKKFKdX+wys/vD/MVI9c5CPUHKQSwjFexot7zNQ3aC34wSVbXsUpqU+fNBL1VcQmf
	 +omPHhTF1BQNJfR746/ZpPUX3AtzVRo9hRfnQ0kvJa+NOJyyH8cXS8KNuyG8I6CMQw
	 lOcBuxVGanIn5qh91fR6Issb7i5mRLmOLjQMJW9Lb4BI2OR5aI/nRbwg33zRPDa1g6
	 DepmsnuXaXlAtjh9jTDR9y3ZyzuY9R6eznGecH9j5zFFAC6nUv3x5M+zGNGibaX2xH
	 lgQVFyALfxoYw==
Date: Sun, 18 Jun 2023 20:18:04 +0100
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
Subject: Re: [PATCH 4/6] dt-bindings: serial: amlogic, meson-uart: support T7
Message-ID: <20230618-ammonium-scratch-2990eb8c3ac7@spud>
References: <20230615182938.18487-1-tanure@linux.com>
 <20230615182938.18487-5-tanure@linux.com>
 <20230615-mushroom-numeric-3a4c03f2204b@spud>
 <CAJX_Q+2ND=GJEEXdLLpEWoecN5gtZm-1i92pAgi+eQocSRUVqw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJX_Q+2ND=GJEEXdLLpEWoecN5gtZm-1i92pAgi+eQocSRUVqw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230618_121811_915984_D6442224 
X-CRM114-Status: GOOD (  21.91  )
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
Content-Type: multipart/mixed; boundary="===============3071005063262418474=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3071005063262418474==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gLIFy3noUErwq6fk"
Content-Disposition: inline


--gLIFy3noUErwq6fk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 18, 2023 at 06:37:40PM +0100, Lucas Tanure wrote:
> On Thu, Jun 15, 2023 at 10:25=E2=80=AFPM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > On Thu, Jun 15, 2023 at 07:29:36PM +0100, Lucas Tanure wrote:
> > > Add serial bindings support menson T7 SoC family.
> > >
> > > Signed-off-by: Lucas Tanure <tanure@linux.com>
> > > ---
> > >  Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml | 1=
 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-u=
art.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> > > index 01ec45b3b406..01b01f8840ea 100644
> > > --- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> > > +++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> > > @@ -46,6 +46,7 @@ properties:
> > >            - amlogic,meson8b-uart
> > >            - amlogic,meson-gx-uart
> > >            - amlogic,meson-s4-uart
> > > +          - amlogic,meson-t7-uart
> >
> > | diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/mes=
on_uart.c
> > | index 2501db5a7aaf..0208f9a6ba7e 100644
> > | --- a/drivers/tty/serial/meson_uart.c
> > | +++ b/drivers/tty/serial/meson_uart.c
> > | @@ -796,6 +796,10 @@ static const struct of_device_id meson_uart_dt_m=
atch[] =3D {
> > |                 .compatible =3D "amlogic,meson-s4-uart",
> > |                 .data =3D (void *)&meson_g12a_uart_data,
> > |         },
> > | +       {
> > | +               .compatible =3D "amlogic,meson-t7-uart",
> > | +               .data =3D (void *)&meson_g12a_uart_data,
> > | +       },
> > |         { /* sentinel */ },
> > |  };
> > |  MODULE_DEVICE_TABLE(of, meson_uart_dt_match);
> >
> > You're adding another element to this enum, but the driver change
> > implies compatibility with the s4 uart. Should you not set this up with
> > fallback compatibles?
>=20
> I will drop this patch and use the s4 and g12a compatible strings.

You still need to add a compatible for the t7, just let it fall back to
one of the others. Eg:
compatible =3D "amlogic,meson-t7-uart", "amlogic,meson-s4-uart";

Cheers,
Conor.

--gLIFy3noUErwq6fk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZI9YbAAKCRB4tDGHoIJi
0pSJAP4pCeRXWnB2Azet+8vaCW46xvhOyL8mjbZXG+XvzEZAEwD/TE2Nc5oOrKfm
tgEfqnMjGs3egm4P1F5l0K+qluDHmgM=
=1dUJ
-----END PGP SIGNATURE-----

--gLIFy3noUErwq6fk--


--===============3071005063262418474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3071005063262418474==--

