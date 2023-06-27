Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A55EB64DD
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jun 2023 07:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYOrp2GcLjS4ABBiOWIwE/jNsKaN43Jf8Js3LtQEbk4=; b=hb3/B8MDC/VlP+1i+AeWU+eq+j
	nSz6lZrWOLCdKSswx4xXujlChS8PyVMvWHUPEYWK1Vg1JF+pjg5nOToTHiOdNMB8BM9DyOW9rVB1P
	VeBomfvl9irSQAT0B+evfk5DfRRCfSrBe5lwPJDYqmiEpa3uA5VfkFqa+lk+KfMksxnKSlm3aA5XW
	Pi8uPe+EpmSt9RYPn41NSuxukH0+mI9aFslRnxUSprovyIEg7nl/tC900Hc5mjbmxqXD2lGeFpZol
	W+R/ObzuZaA5moaQENXKwCoE6vcDTaxAgAI3DJpHMJD0qYHWsqSPpNGtGR72P0vy2pRHg5l9ai326
	kjEJ7vIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE35t-00CLRe-0g;
	Tue, 27 Jun 2023 07:26:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE35p-00CLPr-2Y;
	Tue, 27 Jun 2023 07:26:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687850789; x=1719386789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aLczvW7sUK4LxM+v+inLe8on89ihdEZup77Ibi1FUik=;
  b=OeW/Zmfj4cKoKxlEvdw2bkGqijjduRH6NEGu9eIY7Kb4AGpgF4jZwBUQ
   H88y/+3+7YvpLVW9E9qMuyNibtvK/G2uZbWGkhHUaJXk1e8TawZQ20yd/
   wNvPlMssQatMCr0Ln+id/+oGxLlk2wyO1KF9BwdqZ6JmqHpwAd5PFjdPO
   3lOcQ4gqr4Ry/L2oYmaYJuj4rb0igKZsbxj3vxwIMewRpXFDa0ywoyzM6
   YEuDp39HLcWfrT7p1mDbOz1eY32d1T91M3AIdU7zLRtaKoLBojrhoD9j7
   +hDoOaml4jb8g3AcKM2mHgKudLuvag/G7oGKaW9zr0+qBRfEWTTctk9ph
   A==;
X-IronPort-AV: E=Sophos;i="6.01,161,1684825200"; 
   d="asc'?scan'208";a="217800925"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jun 2023 00:26:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 27 Jun 2023 00:26:28 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 27 Jun 2023 00:26:26 -0700
Date: Tue, 27 Jun 2023 08:25:58 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Xianwei Zhao <xianwei.zhao@amlogic.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: add support for T7 based Amlogic AN400
Message-ID: <20230627-pledge-recapture-7b17cc1c3c20@wendy>
References: <20230626095223.721011-1-xianwei.zhao@amlogic.com>
 <20230626095223.721011-3-xianwei.zhao@amlogic.com>
 <9b49e979-4a24-f628-88c4-fd53f53d46e4@linaro.org>
MIME-Version: 1.0
In-Reply-To: <9b49e979-4a24-f628-88c4-fd53f53d46e4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_002629_900416_0EDD478B 
X-CRM114-Status: GOOD (  10.45  )
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
Content-Type: multipart/mixed; boundary="===============2879137230564282768=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============2879137230564282768==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cIrvvHlrPAOZayil"
Content-Disposition: inline

--cIrvvHlrPAOZayil
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 26, 2023 at 05:41:05PM +0200, Krzysztof Kozlowski wrote:
> On 26/06/2023 11:52, Xianwei Zhao wrote:
> > +
> > +		apb4: bus@fe000000 {
> > +			compatible =3D "simple-bus";
> > +			reg =3D <0x0 0xfe000000 0x0 0x480000>;
> > +			#address-cells =3D <2>;
> > +			#size-cells =3D <2>;
> > +			ranges =3D <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
> > +
> > +			uart_a: serial@78000 {
> > +				compatible =3D "amlogic,meson-s4-uart",
> > +					     "amlogic,meson-ao-uart";
> > +				reg =3D <0x0 0x78000 0x0 0x18>;
> > +				interrupts =3D <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
> > +				status =3D "disabled";
>=20
> Please, don't put status in the middle of properties...

The serial entry is also missing the soc specific compatible (and
removal of the always-on uart) that was discussed in Lucas Tanure's
series.

--cIrvvHlrPAOZayil
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJqPBgAKCRB4tDGHoIJi
0lUYAQC15qMz0HEe5JtsuiOxiuOPkE7/jHHCIlO8J/hc+XCrCwD/exX4JGWZbAjU
AiyF6DU5r0BztLX/SlsSjJ4IIW54cgs=
=FvQO
-----END PGP SIGNATURE-----

--cIrvvHlrPAOZayil--


--===============2879137230564282768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2879137230564282768==--

