Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DADFCD11DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2024 13:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgSkW0F1xv0Km++zXjeVRdg+H4XR1JCucy88JbouUvk=; b=lylQyBCzYNcvQkRT5sxm0YvdXY
	j9NsP7V24lKXFgtgSMaY3Se2lZddMSsrOdAHKvLaRNifIITlU3TFVXwJBi9hdOWQJLOXVvVOFG1RQ
	CXxnteiaPmqEPZCo/41fUiguIubTP5PeoPhFKpOQv5XDTPf26+8TTHQ21ChNCAVr7ZVwEUuSODIUD
	xqpq3J24uzWdKR7D/kfvVna3xOSAZqFDLp1dNiCYUaW78IetxretyduUkatgiI78+Kue6GnvEZK4u
	pc4HR6LFN5d/LsAUiBCdZ5+pZn9Glj8DpSVr2vu67ec7lCODzKjbZmL+86dS4WUyNM+TVCk48ktW2
	S3rC623A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBuG-00000000YCJ-240J;
	Fri, 29 Mar 2024 13:04:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqAtI-00000000FpH-1Faf;
	Fri, 29 Mar 2024 11:59:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1711713564; x=1743249564;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cjbAuMTMXKx++l4J+3XQzM/fFWNxtC8QIqIAOFaIwdU=;
  b=qWYkfdWlqzohp1bMz1GRMTPBGfJrYX+5WzQZqLfEqdIULH1rrBBBKAH1
   MIEsHvZdpAvsPIB9LsII0vENq5VXRlwVBYaE2Ys+XLAVpzs9w0fOioKXM
   7zvD4flFC/CU1ZRcd7zcT5u+w5L6d7HQ4G8e18ifkx9WyI1L18EkkYrFQ
   m/gL12gRyay4l9GiPSLMcnuG7TY1LJIk3HIBavs3TXJIgsV9YlLtVAP78
   98HWk0H5tpkW03lVdlLlOsdpuNf6dTrQAP7kxycHM8QTeEvmCC/7fHEOC
   7IOEAOeyffac4Iy3EAviLgcSa9/rxscOjCwMl/y6qvCR7hAbSjH7wYCpn
   w==;
X-CSE-ConnectionGUID: 21KtTG0/Sp6rKoX3BlJG6Q==
X-CSE-MsgGUID: b8Ho2tThR8+ZKWy5L4u3Cw==
X-IronPort-AV: E=Sophos;i="6.07,164,1708412400"; 
   d="asc'?scan'208";a="18648063"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Mar 2024 04:59:24 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Mar 2024 04:59:14 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 29 Mar 2024 04:59:11 -0700
Date: Fri, 29 Mar 2024 11:58:23 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexey Romanov <avromanov@salutedevices.com>
CC: Conor Dooley <conor@kernel.org>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, "clabbe@baylibre.com" <clabbe@baylibre.com>,
	"herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
	"davem@davemloft.net" <davem@davemloft.net>, "robh+dt@kernel.org"
	<robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "khilman@baylibre.com" <khilman@baylibre.com>,
	"jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
	"vadim.fedorenko@linux.dev" <vadim.fedorenko@linux.dev>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v6 19/23] dt-bindings: crypto: meson: support new SoC's
Message-ID: <20240329-gore-eligible-cfdb8b14aee1@wendy>
References: <20240326153219.2915080-1-avromanov@salutedevices.com>
 <20240326153219.2915080-20-avromanov@salutedevices.com>
 <20240326-boneless-patrol-b1156a4be70b@spud>
 <20240329111601.po33wqdaaqpc54mo@cab-wsm-0029881>
MIME-Version: 1.0
In-Reply-To: <20240329111601.po33wqdaaqpc54mo@cab-wsm-0029881>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_045924_470022_1796A891 
X-CRM114-Status: GOOD (  18.96  )
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
Content-Type: multipart/mixed; boundary="===============2984067807796282454=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============2984067807796282454==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cLRhY+ZqcVb5bqr0"
Content-Disposition: inline

--cLRhY+ZqcVb5bqr0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 11:16:06AM +0000, Alexey Romanov wrote:
> Hello,
>=20
> On Tue, Mar 26, 2024 at 06:04:46PM +0000, Conor Dooley wrote:
> > On Tue, Mar 26, 2024 at 06:32:15PM +0300, Alexey Romanov wrote:
> > > Now crypto module available at G12A/G12B/S4/A1/SM1/AXG.
> > >=20
> > > 1. Add new compatibles:
> > >   - amlogic,g12a-crypto
> > >   - amlogic,axg-crypto
> > >   - amlogic,a1-crypto
> > >   - amlogic,s4-crypto (uses a1-crypto as fallback)
> > >=20
> > > 2. Add power-domains in schema.
> > >=20
> > > Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> > > ---
> > >  .../bindings/crypto/amlogic,gxl-crypto.yaml       | 15 +++++++++++++=
--
> > >  1 file changed, 13 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/crypto/amlogic,gxl-cry=
pto.yaml b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> > > index d3af7b4d5f39..c92edde314aa 100644
> > > --- a/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> > > +++ b/Documentation/devicetree/bindings/crypto/amlogic,gxl-crypto.yaml
> > > @@ -11,8 +11,16 @@ maintainers:
> > > =20
> > >  properties:
> > >    compatible:
> > > -    items:
> > > -      - const: amlogic,gxl-crypto
> > > +    oneOf:
> > > +      - items:
> > > +          - enum:
> > > +              - amlogic,s4-crypto
> > > +          - const: amlogic,a1-crypto
> > > +      - enum:
> > > +          - amlogic,gxl-crypto
> > > +          - amlogic,axg-crypto
> > > +          - amlogic,g12a-crypto
> > > +          - amlogic,a1-crypto
> > > =20
> > >    reg:
> > >      maxItems: 1
> > > @@ -21,6 +29,9 @@ properties:
> > >      items:
> > >        - description: Interrupt for flow 0
> > > =20
> > > +  power-domains:
> > > +    maxItems: 1
> >=20
> > Is power-domains valid for the devices that existed prior to your patch?
>=20
> For existed devices (GXL) power domain doesn't required.

Required or not I'm not interested in, it's whether or not the hardware
has them. The GXL does for the VPU, so it might also have one for the
the crypto. If the crypto is not in a power domain on gxl, please make
power-domains only permitted for SoCs that do have power domains.

Cheers,
Conor.

--cLRhY+ZqcVb5bqr0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgas3wAKCRB4tDGHoIJi
0lGkAQD2mwJjWTODw+WJx1/pSg/1IFxNC/iu7jcQQJv3dICZlgD7B/9l7/6G4ZJS
UhYeDA5Rd/GBnUiUiCGZFY4KwnggVgo=
=rAfb
-----END PGP SIGNATURE-----

--cLRhY+ZqcVb5bqr0--


--===============2984067807796282454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2984067807796282454==--

