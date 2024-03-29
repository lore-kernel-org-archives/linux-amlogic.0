Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA306CD11DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2024 13:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SMvkqlmCTO9hn6C4/igxdkZDy1grgy/vNucqNZRDFys=; b=v0dMaz/KFdo3xhcb0WMVyWk3Cs
	QP1G8lGB5M8CV66YbwnwVvaIMXoplUUCRNuuVPUKLcxDdwKSA9lN3MrwavYabpiSnN91bLkXrl/uB
	oCkF+ms5ZdYqKz8A56r+5ndFQPwSXPzu7TtX1yuZIPvCovE+F1PHRx0aMyRl1oWbRrD/n0vOb2Wi8
	pxDikid+EcVWHUGraJuNPGwxOjmy1/O6iv1w3f3bTHwU7huByyLdfxpjtqQhkHcdcTLQaKdN9Ooio
	rnyJn1kjKj9PYbk/CyB95AciCBVCJgnknFW+Vi6LX+Y8lLkq5Soh+44uqfXBtFwFe3lTSR7HEw2L8
	F2Y4209g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBuA-00000000Y8d-2GXe;
	Fri, 29 Mar 2024 13:04:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqAqh-00000000FTN-14sC;
	Fri, 29 Mar 2024 11:56:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1711713403; x=1743249403;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zxYrkuVAUpLl4Z7Yj1bEeeQLX+DhAjPrTYcGONUQg80=;
  b=YI3RM1nkZvNjdbkTxbdtgHXxawOAR3DLnxz+kExl3UyUcK/tE1h2QDK9
   HbCpjfhzeNVZ77wIrPZq3GJ0jb/7VgnILiYXGOkPvHNzsivM0YuK+T4hC
   Mt/nfzOxzvbH13XcEGklz8A3tBowBy6o9ADe0EePd+JlHdF5KxRTr2kz8
   K0e04U1Ja/JVp32mrHa/oAXOEwoKS2tGRGGOK9WnMK2Na96NboJYjij8f
   KmCXM1CAFLSblSGLL2D8OZYB3XP0K0+ZfUa4F8590uFcFRqSYBzQ31S8D
   CEt5WGTd97USmoBp2D2R1lkqLs20neMl7r4AihOAiVobJ9ECN52PTKU9b
   Q==;
X-CSE-ConnectionGUID: KGRIKYohQPW4WiVaONZ8Dw==
X-CSE-MsgGUID: myZA0OyZQzaL9Pl/CMrcMQ==
X-IronPort-AV: E=Sophos;i="6.07,164,1708412400"; 
   d="asc'?scan'208";a="18595909"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Mar 2024 04:56:37 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Mar 2024 04:56:16 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 29 Mar 2024 04:56:13 -0700
Date: Fri, 29 Mar 2024 11:55:25 +0000
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
Subject: Re: [PATCH v6 17/23] dt-bindings: crypto: meson: remove clk and
 second interrupt line for GXL
Message-ID: <20240329-dotted-illusive-9f0593805a05@wendy>
References: <20240326153219.2915080-1-avromanov@salutedevices.com>
 <20240326153219.2915080-18-avromanov@salutedevices.com>
 <20240326-obscurity-angriness-d7bb48bc9eaa@spud>
 <20240329111424.i2zp2coznqpnibk4@cab-wsm-0029881>
MIME-Version: 1.0
In-Reply-To: <20240329111424.i2zp2coznqpnibk4@cab-wsm-0029881>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_045643_388057_06D23BC1 
X-CRM114-Status: GOOD (  15.60  )
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
Content-Type: multipart/mixed; boundary="===============3338712774169380281=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============3338712774169380281==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OWDxAKnoP5FbCqUI"
Content-Disposition: inline

--OWDxAKnoP5FbCqUI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 11:14:29AM +0000, Alexey Romanov wrote:
> Hi Conor,
>=20
> On Tue, Mar 26, 2024 at 06:09:37PM +0000, Conor Dooley wrote:
> > On Tue, Mar 26, 2024 at 06:32:13PM +0300, Alexey Romanov wrote:
> > > GXL crypto IP uses DMA engine, which doesn't require clk input
> > > and second interrupt line.
> > >=20
> > > Fixes: c4a0457eb858 ("ARM64: dts: amlogic: adds crypto hardware node")
> >=20
> > How does this fix a commit that only modifies a dts? The commit cited
> > here should be a dt-bindings commit.
>=20
> Yep, my bad. Will fix it in next series.
>=20
> >=20
> > However, your commit message says "require" but you do more than remove
> > these as required, you remove them entirely. What am I missing?
>=20
> Crypto HW isn't connected to clk / 2nd interrput line, so we must remove
> them from dt. I will reformulate commit message.

Yeah, please do. Be clear about the hardware not actually having these
things. And hopefully Corentin can chime in as to why he thought it did.


--OWDxAKnoP5FbCqUI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgasLQAKCRB4tDGHoIJi
0nngAPsFHgCeAZUB7PIObsvIZP/P+DvGPq/PYOyGwboFETQrjAEAtkASonmxY4qS
yt5TD7EbgaRPDqo9W4bjTUgkIn49Xws=
=MGQH
-----END PGP SIGNATURE-----

--OWDxAKnoP5FbCqUI--


--===============3338712774169380281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3338712774169380281==--

