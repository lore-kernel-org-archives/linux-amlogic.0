Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD25CEB64D7
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Jun 2023 18:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2iJ0lD6w3hbGQ3PMwtgT6hixJerYhefqSZFK1lLA6x8=; b=KBSomfpA8ML2qwgd/d0lQQVlkj
	WQJs2/4x5aCujPNgLQQKEYkxpr7q9xptJmvSyNhRg7adpUSfvgW0ukqE94WXHmCkDzlXZEbFAEFm/
	d7j5BTtqu1+LWCwPoR4lSM2XNFnXv4lMweI760wJSNoxUfpbGbqrIiwhKRrTb5QMaG/elwembm79x
	+uu/h7U0Ta3ZOW/3PSzPU4jQ03zW86Y5myMGYUm6XL8ra3rabonnORb+bfba3+iJgN1ZS/STFlwen
	feBa8ZsnmCUalKE62QHcnSPTkdHIbZMenAlHAScBaPJ6pzAxvi5/dE3EyHvCPd81Dd7LXfAwQpMds
	9ERvu8sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC2JF-00FLnQ-2B;
	Wed, 21 Jun 2023 18:12:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC2JC-00FLmo-2s;
	Wed, 21 Jun 2023 18:12:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4359F6167D;
	Wed, 21 Jun 2023 18:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0855C433C9;
	Wed, 21 Jun 2023 18:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687371117;
	bh=9v9goyvtQUiL0Qdj2HtwIciXoTyai42W0bpnzYLHHkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H8nvt6561PKdO78SQ+P57VegX3c96Wp41o6Tq8Tk6RevjXUQWE8bfi3ctVIQFDAMK
	 qc0IjZuN4cp1FKeRaQqXlK9YUnqNhI4XfVUIelqM9yZaem4eSns9Oi49tupElZQfhM
	 BzhaHaF8O9evPM9SBODc072i/R58IDA2rimLsZsAPMv7RHmb5jDSvqN7zsFgdiNwiZ
	 hMHrXaOgDEhBzEhJkgcQTHeOZ+xkQBY50is2I1serBNhBE9UjQg46sNuSlV+4eW0Ly
	 wbXVIaxYS7CT8gVkmPm0IUF8qZ7t9+SQoG30EwdBFw4baw/UnedoyowohvBnfGfGFt
	 xBHppij4HnNZQ==
Date: Wed, 21 Jun 2023 19:11:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lucas Tanure <tanure@linux.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Nick <nick@khadas.com>,
	Artem <art@khadas.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/3] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for T7
Message-ID: <20230621-uncaring-impeding-15cfbe8e0e7c@spud>
References: <20230621133215.109254-1-tanure@linux.com>
 <20230621133215.109254-3-tanure@linux.com>
 <20f25e98-d02e-f914-c4e7-72bb9ddb1ae5@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20f25e98-d02e-f914-c4e7-72bb9ddb1ae5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_111159_102675_ED4B7A81 
X-CRM114-Status: GOOD (  19.81  )
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
Content-Type: multipart/mixed; boundary="===============2565375443658776405=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2565375443658776405==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r8ifSacFha/D1Rvk"
Content-Disposition: inline


--r8ifSacFha/D1Rvk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Lucas,

On Wed, Jun 21, 2023 at 03:53:04PM +0200, Krzysztof Kozlowski wrote:
> On 21/06/2023 15:32, Lucas Tanure wrote:
> > Amlogic T7 SoCs uses the same UART controller as S4 SoCs and G12A.
> > There is no need for an extra compatible line in the driver, but
> > add T7 compatible line for documentation.
> >=20
> > Signed-off-by: Lucas Tanure <tanure@linux.com>
> > ---
> >  .../devicetree/bindings/serial/amlogic,meson-uart.yaml          | 2 ++
> >  1 file changed, 2 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uar=
t.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> > index 01ec45b3b406..860ab58d87b0 100644
> > --- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> > @@ -33,6 +33,7 @@ properties:
> >                - amlogic,meson8b-uart
> >                - amlogic,meson-gx-uart
> >                - amlogic,meson-s4-uart
> > +              - amlogic,meson-t7-uart
> >            - const: amlogic,meson-ao-uart
> >        - description: Always-on power domain UART controller on G12A So=
Cs
> >          items:
> > @@ -46,6 +47,7 @@ properties:
> >            - amlogic,meson8b-uart
> >            - amlogic,meson-gx-uart
> >            - amlogic,meson-s4-uart
> > +          - amlogic,meson-t7-uart
>=20
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sou=
rces-with-the-devicetree-schema/
> for instructions).

Check back on the previous version, I should've posted an untested
version of what you need to add.

Cheers,
Conor.

--r8ifSacFha/D1Rvk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJM9aAAKCRB4tDGHoIJi
0iPmAQCB2/L7TXDqGzhLNnWtm2aGh/w/O0jkMMU06UwMv1mW7wD+IiKLI9x7+bbA
i66ElkRSOzKYf154fLEAit0ALQC0cQY=
=QmUG
-----END PGP SIGNATURE-----

--r8ifSacFha/D1Rvk--


--===============2565375443658776405==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2565375443658776405==--

