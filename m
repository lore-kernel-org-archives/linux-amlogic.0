Return-Path: <SRS0=A4ao=2I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4469AC43603
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 12:58:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07025218AC
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Dec 2019 12:58:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H5hIyNvu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cerno.tech header.i=@cerno.tech header.b="SSl8U52f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gHEDPS3D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07025218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cerno.tech
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Et5lQjtM05daOvjFm3jydzxSUFp8KOGwhD0z60+YJaI=; b=H5hIyNvu1fEO5xQajPg4dpPYB
	xVECIhpSNj/RU9uGRkZjCbgK984HAkxQ5z5NIHQdfy5EiH4x/R1yl9V3FsOyZCtFOavYNFNcP9Pj0
	jyrrFRyMjyfAJtc2F69mZ+32zUr0yYhlB7aqQsLMj4kLBYk2kqR4uSu1GK4POWRgAQJrsE40pcvRc
	asUN5leo7baiaPNUplLOA1HcsPR4kHlc9kXK7jP2vr+UfwDxTa7Rmrg6j39ZCw8vnibAgXrdIt3Km
	LCpf85HUG20JNXet+94jv36bv/SRG1lPB9TXmSmRmkBpskqPUvIXAaQceSDlKkJDClLz/mzyfKI3X
	eCLZ2Yzig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihYtt-0006QP-Ol; Wed, 18 Dec 2019 12:58:01 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihYto-0006LS-4d; Wed, 18 Dec 2019 12:58:00 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2F00F6CB0;
 Wed, 18 Dec 2019 07:57:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 18 Dec 2019 07:57:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=frvGpADLITedq/sG6F8ewcZ3U6K
 M9hdUCVrbvmzN2gI=; b=SSl8U52f5KAoi+pLP9eCdIoDHqsojMT+TPEP43X6GQt
 tjLZtZ5sNWyQ5Y+6sVadQjwodLbeyTkyAUYIkzPsagKhHCJUx7FPfRAIExiPvSYK
 E6LK0oXPoDlH4mbIwgqVQBVO5bSSjXJ9WdPQCMKtrtG7XthOPeqWt5+iyLI06lAf
 HSYjLrCQ320fhhCFlTGubhGY18AgGQi9V+QW3qF+lHKAlthjvwGx1JLczSZGE/h6
 44kkjuB4VGhd8mlGTxOYjBdqoPnypH+/AXojQVkb9fqgypqUfx4VbrSzb8s+kd52
 cqCylUbHNNfmDMMgB/uB0HrcEq2QedFx2XQuiQVgEhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=frvGpA
 DLITedq/sG6F8ewcZ3U6KM9hdUCVrbvmzN2gI=; b=gHEDPS3DOQoyIWF+CI9uhZ
 4C5q4pCME3HKYCY99OPH6VUMRRGcXmvQrR2H45px9vtj2qoEAtLG8FwKIKtNMZWi
 orj8/U/30+sPVPc3aSiazVALG9t6R6ety7SKOOySYMxcbmoqNlLrxeyKSQ0P5NEO
 eFmtPI86/TfRMeampRGWT4q0tQIGoUpNIa4sKjI0Bf75+TqAus2qNv9VQjqNGbQN
 r9aeqGRaWwEgxm82KRokYSbliLeVCQo7Up85g7CHheYUCOGvfg9m5rO1K2kynmBq
 V0Z4FkBGCfPFZV+jcOEgQsY+NguyvkL2gSpfd3jrc68niY378N9GajUSah2j1HBw
 ==
X-ME-Sender: <xms:TiL6XThp7Xp-qBzFtMENMp_AFajDnec-Es1rsgWInFOVS3b10xhFsQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddtledggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuffhomhgrih
 hnpeguvghvihgtvghtrhgvvgdrohhrghdpghhithhhuhgsrdgtohhmpdhhuhdrtghomhen
 ucfkphepledtrdekledrieekrdejieenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:TiL6Xd4iE6xuYSlhXG6sYl-s-q_EqWfiZLcoQT1kv1Gc3IhbmQa9PQ>
 <xmx:TiL6XcLA9smXakFS_IXH8ko3w9DGYVZPqtfizTqKpbeccXzr19OFpQ>
 <xmx:TiL6XRi8KDldoGXgKLdeGUU7Xg7J32g59kXC6DQ0x8LWhLlMW0KyFg>
 <xmx:UCL6XVPLDyYb7At6LBHuEGDVD3Or8j5gPOrxe2YI4-zEDS8CGKhN4w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6AA4F80063;
 Wed, 18 Dec 2019 07:57:50 -0500 (EST)
Date: Wed, 18 Dec 2019 13:57:48 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jian Hu <jian.hu@amlogic.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: clock: meson: add A1 PLL clock
 controller bindings
Message-ID: <20191218125748.xacfkuhfabbtivsk@gilmour.lan>
References: <20191206074052.15557-1-jian.hu@amlogic.com>
 <20191206074052.15557-2-jian.hu@amlogic.com>
 <20191213103856.qo7vlnuk4ajz3vq5@gilmour.lan>
 <ba16b846-1d5f-3d1e-e8e2-420687d11e8a@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <ba16b846-1d5f-3d1e-e8e2-420687d11e8a@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_045756_612733_C1C714A1 
X-CRM114-Status: GOOD (  23.60  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
 Qiufang Dai <qiufang.dai@amlogic.com>, Chandle Zou <chandle.zou@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: multipart/mixed; boundary="===============4706384799310652745=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4706384799310652745==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bbp7a3fcwjlmdl47"
Content-Disposition: inline


--bbp7a3fcwjlmdl47
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 18, 2019 at 04:00:20PM +0800, Jian Hu wrote:
> Hi Maxime
>
> Thanks for your review
>
> On 2019/12/13 18:38, Maxime Ripard wrote:
> > Hi,
> >
> > On Fri, Dec 06, 2019 at 03:40:47PM +0800, Jian Hu wrote:
> > > Add the documentation to support Amlogic A1 PLL clock driver,
> > > and add A1 PLL clock controller bindings.
> > >
> > > Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> > > ---
> > >   .../bindings/clock/amlogic,a1-pll-clkc.yaml   | 59 +++++++++++++++++++
> > >   include/dt-bindings/clock/a1-pll-clkc.h       | 16 +++++
> > >   2 files changed, 75 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> > >   create mode 100644 include/dt-bindings/clock/a1-pll-clkc.h
> > >
> > > diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> > > new file mode 100644
> > > index 000000000000..7feeef5abf1b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> > > @@ -0,0 +1,59 @@
> > > +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> > > +/*
> > > + * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
> > > + */
> > > +%YAML 1.2
> > > +---
> > > +$id: "http://devicetree.org/schemas/clock/amlogic,a1-pll-clkc.yaml#"
> > > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > > +
> > > +title: Amlogic Meson A/C serials PLL Clock Control Unit Device Tree Bindings
> > > +
> > > +maintainers:
> > > +  - Neil Armstrong <narmstrong@baylibre.com>
> > > +  - Jerome Brunet <jbrunet@baylibre.com>
> > > +  - Jian Hu <jian.hu@jian.hu.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    - enum:
> > > +        - amlogic,a1-pll-clkc
> >
> > I'm not sure this works, compatible shouldn't contain a list.
> >
> I refered to
> Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml.
>
> I have used 'dt-doc-validate' tools to check, it will report something wrong
> below.
>
> properties:compatible: [{'enum': ['amlogic,a1-pll-clkc']}] is not of type
> 'object', 'boolean'
>
> Refer to
> https://github.com/robherring/dt-schema/blob/master/example-schema.yaml
>
> I will change it like this:
>
> properties:
>   compatible:
>     oneOf:
>       - enum:
>          - amlogic,a1-pll-clkc
>
> And It has been passed by 'dt-doc-validate' tools.
>
> Is it right?

You can simply do

properties:
  compatible:
    const: amlogic,a1-pll-clkc

> > You can write this like:
> > compatible:
> >    const: amlogic,a1-pll-clkc
> >
> > > +  "#clock-cells":
> > > +    const: 1
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +clocks:
> > > +  minItems: 2
> > > +  maxItems: 2
> >
> > This is redundant, it will be added automatically by the tools ...
> If I remove the minItems, it will pass by dt-doc-validate.
>
> Would please tell how to use dt-schema to generate automatically it?

You don't have to do anything, it's just done at the tools runtime.

Maxime

--bbp7a3fcwjlmdl47
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfoiTAAKCRDj7w1vZxhR
xerFAQDOLKhGK6KP3ibCZZanzPijGZZtzYdosl6gUdzpZnNVngD5ASqg8zZV0ayF
sEdXHgcGOt+HcE9xLntYb/gB3k+t3AY=
=9Edw
-----END PGP SIGNATURE-----

--bbp7a3fcwjlmdl47--


--===============4706384799310652745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4706384799310652745==--

