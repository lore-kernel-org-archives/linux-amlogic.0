Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350D3C2BA18
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2024 08:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FkXTQQsS0e8KH9s7Lxgprx4MeopxvQOmpKSgvnxqosA=; b=F2GkxriowWRXtlDs3zyap7BZL1
	VSQ60fnMrHIOjQzBp3i5c1L5VNBGa6DixcTI3J9pFuFkTjiuuVHF7nCeQXYl8JVARj+2KCdEOgHaz
	iCB8tchGZLb9BHug7hfF9ArWQ+DAr9h7zivo/gx4jrKXt8FpEqVbPPtj4CO9bFibES0lQZLjRmiRa
	1f57BLBLeoImhXSJrK7AdQGnRyXjossf1DDMFh1TNwu832U0p8+66fyIfUk6giDz80LiJly9pMBMp
	h2ekgBoB5k372BdbQlJWdTtEPh+BEUcdPcYu/RABMgs8UJkaYY6YgX88AzFuBbsic+goGhi5ziH6h
	CTveVAPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKD18-000000047Pu-25W6;
	Thu, 20 Jun 2024 08:19:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKD15-000000047PH-1P5N;
	Thu, 20 Jun 2024 08:19:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718871575; x=1750407575;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ogti5RvgXrKJYpGa8r9DIIr/6eDafdzHtCOOnJYD6Aw=;
  b=atDzVursyxszgsYqtUoCNg5ydZJchUEaei8IdMWbizSJwbEmzwoF46QM
   4XfKl3FLqEkWxbIRB2DgvUlADhwYM5JpvegmZHH22E6V+27B0Z7nEQAI7
   YSBzK1apYMpskEUjl2hKiKRrX+hTPW3wPhQTHaoHQ0EVI/d8iAACs++Ul
   R9xlniNB2mW+BmVz58X+H2RPTGQnahieHL3WNGp+Z6m7VQcdR2F5E/xRd
   cvwXsVpUFPJNpusb16Ye5q8HnF584LZ+Iu3ub9BRWkcQ2JI8cJvT3g55q
   UX1az/mn+vOBhPqs3ppTZfUNp5l6VKd7lIF4vbvaZtL0R5bGU7mjKG8AK
   g==;
X-CSE-ConnectionGUID: TJufhWwaQoyNOaHETkFUAg==
X-CSE-MsgGUID: VcPZEXqWQmmibClzYtLFKA==
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="asc'?scan'208";a="28908925"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Jun 2024 01:19:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 20 Jun 2024 01:18:32 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 20 Jun 2024 01:18:29 -0700
Date: Thu, 20 Jun 2024 09:18:11 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor@kernel.org>
CC: Viacheslav <adeep@lexina.in>, Rob Herring <robh@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v5 3/4] dt-bindings: arm: amlogic:
 amlogic,meson-gx-ao-secure: add secure-monitor property
Message-ID: <20240620-sprinkled-manor-cce42d587578@wendy>
References: <20240610084032.3096614-1-adeep@lexina.in>
 <20240610084032.3096614-4-adeep@lexina.in>
 <20240610-dropout-compress-6d6a9b749524@spud>
 <4866f6d4-2e3c-40c7-a8cb-ba4e422ffef6@lexina.in>
 <20240611-undying-earthy-00236ac251aa@spud>
 <20240613164244.GA1999034-robh@kernel.org>
 <c0d18fef-be65-461e-948f-c25e757199a5@lexina.in>
 <20240617-sulfate-posture-1619f1cdf090@spud>
MIME-Version: 1.0
In-Reply-To: <20240617-sulfate-posture-1619f1cdf090@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_011935_440215_6A4C6F81 
X-CRM114-Status: GOOD (  37.25  )
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
Content-Type: multipart/mixed; boundary="===============4181825670006459029=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============4181825670006459029==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZQkocubyAqYBA3MR"
Content-Disposition: inline

--ZQkocubyAqYBA3MR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 05:57:53PM +0100, Conor Dooley wrote:
> On Mon, Jun 17, 2024 at 11:21:30AM +0300, Viacheslav wrote:
> > Thanks for review.
> >=20
> > 13/06/2024 19.42, Rob Herring wrote:
> > > On Tue, Jun 11, 2024 at 07:07:28PM +0100, Conor Dooley wrote:
> > > > On Tue, Jun 11, 2024 at 01:25:11PM +0300, Viacheslav wrote:
> > > > > Hi!
> > > > >=20
> > > > > 10/06/2024 19.08, Conor Dooley wrote:
> > > > > > On Mon, Jun 10, 2024 at 11:39:49AM +0300, Viacheslav Bocharov w=
rote:
> > > > > > > Add secure-monitor property to schema for meson-gx-socinfo-sm=
 driver.
> > > > > >=20
> > > > > > "bindings are for hardware, not drivers". Why purpose does the =
"secure
> > > > > > monitor" serve that the secure firmware needs a reference to it?
> > > > >=20
> > > > > This driver is an extension to the meson-gx-socinfo driver: it su=
pplements
> > > > > information obtained from the register with information from the
> > > > > SM_GET_CHIP_ID secure monitor call. Due to the specifics of the m=
odule
> > > > > loading order, we cannot do away with meson-gx-socinfo, as it is =
used for
> > > > > platform identification in some drivers. Therefore, the extended =
information
> > > > > is formatted as a separate driver, which is loaded after the secu=
re-monitor
> > > > > driver.
> > > >=20
> > > > Please stop talking about drivers, this is a binding which is about
> > > > hardware. Please provide, in your next version, a commit message th=
at
> > > > justifies adding this property without talking about driver probing
> > > > order etc, and instead focuses on what service the "secure monitor"
> > > > provides etc.
> > >=20
> > > To put it another way, how many secure monitors does 1 system have?
> >=20
> > One per system in current device tree.
>=20
> One per system, or one is currently described per system, but more might
> be added later?
>=20
> > > What do you do if the property is not present? You didn't make it
> > > required which is good because that would be an ABI break.
> >=20
> > We need an indication of the ability to use the secure-monitor to obtain
> > additional information within the soc driver. It seemed to me that usin=
g an
> > explicit reference to the secure-monitor is the best choice.
> >=20
> > >=20
> > > You only need a link in DT if there are different possible providers =
or
> > > some per consumer information to describe (e.g. an interrupt number or
> > > clock ID). You don't have the latter and likely there is only 1 possi=
ble
> > > provider.
> >=20
> > Would replacing the reference to sm with an option, for example,
> > use-secure-monitor =3D <1>; look more appropriate in this case?
>=20
> Perhaps a silly question, but (provided there's only one per system, why
> can't the secure-monitor driver expose a function that you can call to get
> a reference to the system-monitor? I did something similar before with
> a call to in mpfs_sys_controller_get() mpfs_rng_probe(). Granted,
> mpfs-rng is probed from software so it's slightly different to your
> case, but the principle is the same and it's not unheard of for code in
> drivers/soc to expose interfaces to other drivers like this. You can
> just call a function like that, and know whether there's a secure
> monitor, without having to retrofit a DT property.

Another thing, without having a driver expose an API, is calling
of_find_compatible_node() to find the node. That also doesn't require
retrofitting properties.

--ZQkocubyAqYBA3MR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnPlwwAKCRB4tDGHoIJi
0r0uAP0XyqVo9SKftA8ejE3Fu+0lCIC+uQhySWm9eWN0WAAtvQD+POqtfbe5hEQx
p0IbGE65UCeaR18GC+u0dYXgSIES5ws=
=G8k+
-----END PGP SIGNATURE-----

--ZQkocubyAqYBA3MR--


--===============4181825670006459029==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4181825670006459029==--

