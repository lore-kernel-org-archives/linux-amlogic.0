Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0204EB64D8
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Jun 2023 08:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqWU+ry2vwXsbH4gao7BckUtqVtEi5Qo6kQNj0rwwKg=; b=ArqbZSXjVnDHpVIz+UN2ENalDQ
	tH0ScQ7FyAL8jSEp9MdJuN2jLbQZa8Y+BeUDITbBWBJySNoD5WcPUIA3DNdpuwuv34vZLYXf0YAlk
	iTQvDDciSDi4LtTiKLehafDpjQj40sHUA0aEl8soV7bMGdTvmptsyJRWlMrT2qJpKUu2dzQj8XRR/
	FEoeMUWHuAiAjCr4X98ZRayEWn9+ZvvFgxKsrZCEhJPantDDiFo4+LUG7uyHe4ga1huxuQJZ+sM0o
	AdFUfzrST/biKBNB7sHD4XA0OhVmr2KhzU4DKuuqinJwl509D4LYh68zGkdl/Viglyc3J7Y+Pyb8K
	N5HHu02A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCFN7-00HN1t-2u;
	Thu, 22 Jun 2023 08:08:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCFN5-00HN1I-2o;
	Thu, 22 Jun 2023 08:08:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eOMoYg8B7rD9505WWdAJV/sdeiub+JMwqnPF13z//dY=; b=jBWN/ql89xIvwVdklDb6yDST6S
	LMCTxvFEY6Fkxxeh3o9aq3mb0VulnXv2sL9qAVasOTXg5skuYG6UmhGA269d2lFB96ElQO0cCQqiy
	NDJ6Rkfs3emHJt6Ilaq0iViZjajL3V9vMn3BrLzboCGcaffLwGLe8eTnxJEfx5Cs9CG/u1HFgCTvk
	eOsmpjF6Sk7vmQma31MgNVPBky1Sv1iTqw6bzXex/wMWaQxeCwh6tnQU1Vvb3FgkCn6Sle5mXMUgi
	iCn/SyvN77giP1PZUfiRoSToUherYxL3izj5LBzfRH99xCr4vclqyg33a2v+N1ulbA8krUSqqAQCX
	JS78/wZQ==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCEUt-000zC1-0I;
	Thu, 22 Jun 2023 07:12:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687417971; x=1718953971;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iiKG2Nc97I/QEfTHupxvuEuFIeC9zZ8TZ7uChT3UV6k=;
  b=KgnWFkxuPhGHoOjHwvKn8Js2xSSAkjNb85SElkrORFhPLzWMagF+hiu6
   EmEe1tSNniA6nYbyNf1rOCRRqPkdgb1kBRo5jvZD+dqw5RskSooMYybkl
   0YjhLdJ/GRaAcK11eJcHt3zOnfiGsfaDavVUTIW8Mr3zujoNm30TlFAws
   Nq4rkU6f+M3Ep3smF6Xnsk54cQbBtH1TY3nOtRu2MDVhptJQu8NsESxc1
   we+RASAH/NIcKUi6MkjfHeMViSy845Y19qg5Mrm/Iy85bT/61x8b0Krvg
   vz+kRuLlvOsQRl4vY3u3MvV3kmOosBFATUfCwbhtWUIU++6kcdMXczcA6
   g==;
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; 
   d="asc'?scan'208";a="231524607"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Jun 2023 00:12:29 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 22 Jun 2023 00:12:28 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 22 Jun 2023 00:12:26 -0700
Date: Thu, 22 Jun 2023 08:11:59 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Lucas Tanure <tanure@linux.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, Nick <nick@khadas.com>, Artem
	<art@khadas.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for T7
Message-ID: <20230622-hardhat-elitism-26f0d0df204f@wendy>
References: <20230621133215.109254-1-tanure@linux.com>
 <20230621133215.109254-3-tanure@linux.com>
 <20f25e98-d02e-f914-c4e7-72bb9ddb1ae5@linaro.org>
 <20230621-uncaring-impeding-15cfbe8e0e7c@spud>
 <CAJX_Q+342dx9S4C2C814uQgOj_QR3EBKhETH9eVZOm7PtzFAVQ@mail.gmail.com>
 <e4c993e1-8409-1ec0-c1b2-175603052e46@linaro.org>
 <CAJX_Q+09WLqmnWwOL7QESEuDzwZvVVzbtg9Upd5j2LOAYs=vmA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJX_Q+09WLqmnWwOL7QESEuDzwZvVVzbtg9Upd5j2LOAYs=vmA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_081251_760626_A47A3FBA 
X-CRM114-Status: GOOD (  34.74  )
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
Content-Type: multipart/mixed; boundary="===============4153142386570059516=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============4153142386570059516==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7wAwkGZijd5j48sc"
Content-Disposition: inline

--7wAwkGZijd5j48sc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 22, 2023 at 07:43:31AM +0100, Lucas Tanure wrote:
> On Thu, Jun 22, 2023 at 7:05=E2=80=AFAM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> > On 22/06/2023 07:32, Lucas Tanure wrote:
> > > On Wed, Jun 21, 2023 at 7:12=E2=80=AFPM Conor Dooley <conor@kernel.or=
g> wrote:
> > >> On Wed, Jun 21, 2023 at 03:53:04PM +0200, Krzysztof Kozlowski wrote:
> > >>> On 21/06/2023 15:32, Lucas Tanure wrote:
> > >>>> Amlogic T7 SoCs uses the same UART controller as S4 SoCs and G12A.
> > >>>> There is no need for an extra compatible line in the driver, but
> > >>>> add T7 compatible line for documentation.
> > >>>>
> > >>>> Signed-off-by: Lucas Tanure <tanure@linux.com>
> > >>>> ---
> > >>>>  .../devicetree/bindings/serial/amlogic,meson-uart.yaml          |=
 2 ++
> > >>>>  1 file changed, 2 insertions(+)
> > >>>>
> > >>>> diff --git a/Documentation/devicetree/bindings/serial/amlogic,meso=
n-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.y=
aml
> > >>>> index 01ec45b3b406..860ab58d87b0 100644
> > >>>> --- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.=
yaml
> > >>>> +++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.=
yaml
> > >>>> @@ -33,6 +33,7 @@ properties:
> > >>>>                - amlogic,meson8b-uart
> > >>>>                - amlogic,meson-gx-uart
> > >>>>                - amlogic,meson-s4-uart
> > >>>> +              - amlogic,meson-t7-uart
> > >>>>            - const: amlogic,meson-ao-uart
> > >>>>        - description: Always-on power domain UART controller on G1=
2A SoCs
> > >>>>          items:
> > >>>> @@ -46,6 +47,7 @@ properties:
> > >>>>            - amlogic,meson8b-uart
> > >>>>            - amlogic,meson-gx-uart
> > >>>>            - amlogic,meson-s4-uart
> > >>>> +          - amlogic,meson-t7-uart
> > >>>
> > >>> It does not look like you tested the DTS against bindings. Please r=
un
> > >>> `make dtbs_check` (see
> > >>> Documentation/devicetree/bindings/writing-schema.rst or
> > >>> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetr=
ee-sources-with-the-devicetree-schema/
> > >>> for instructions).
> > >>
> > >> Check back on the previous version, I should've posted an untested
> > >> version of what you need to add.
> > > I saw that, but adding a S4 doesn't make sense to me. And you didn't
> > > show the entire change, so I can't understand what you want there.
> >
> > For sure you need something which does not trigger errors. If you claim
> > adding S4 as fallback does not make sense, then why did you use it?
> > Sending a code which is clearly incorrect does not make sense.
> >
> Sorry, I think we are talking about different things. It does not make
> sense to me to add an S4 line in the documentation when it is already
> there. So I could not understand or make sense of the patch Conor sent
> in reply to my V2.

That is just how it works. You need to spell out exactly which
combinations are permitted. The current entry for s4 says that s4 is
only permitted in isolation.
Since you are adding "amlogic,meson-t7-uart", "amlogic,meson-s4-uart"
you need to explicitly allow that combination. You'll notice if you look
at the file that the gx uart appears more than once.

Given the g12a was the most recently added compatible, it might make
sense to follow the pattern that it had set, given the thing your
original patch copied the match data from was the g12a. That change to
the dt-binding would look like:
diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.ya=
ml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index 01ec45b3b406..eae11e87b88a 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -50,6 +50,13 @@ properties:
         items:
           - const: amlogic,meson-g12a-uart
           - const: amlogic,meson-gx-uart
+      - description:
+          Everything-Else power domain UART controller on G12A compatible =
SoCs
+        items:
+          - enum:
+              - amlogic,meson-t7-uart
+          - const: amlogic,meson-g12a-uart
+          - const: amlogic,meson-gx-uart
=20
   reg:
     maxItems: 1

/I/ don't really care whether you do that, or do the s4 version of it,
but following the most recent pattern might make more sense. When I
suggested s4, it was because I only looked at the driver patch rather
than the code itself.

> Krzysztof, I will check again with dtbs_check and re-send.

Cheers,
Conor.

--7wAwkGZijd5j48sc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJP0OgAKCRB4tDGHoIJi
0q6WAP9XGs4Pi8Gamw+GyApCv+GY203fgy/Z6D7WVqAyiPyfAgD9FcOdHANKxIe9
0wdzlANzNI58TqJ+gy5bdFdmXmcuPAA=
=Fm11
-----END PGP SIGNATURE-----

--7wAwkGZijd5j48sc--


--===============4153142386570059516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4153142386570059516==--

