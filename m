Return-Path: <SRS0=JCZT=UJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 212FAC468C1
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2019 13:51:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB7EF2089E
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jun 2019 13:51:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yus0qFFj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB7EF2089E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CVe+gd2bW7H/trlXUkpCnqkxT73sSEoNPbuov1lpIDw=; b=Yus0qFFj0cG2obu5ruxet/cRO
	GGlZdA28rEYf17JPyOMfstpRsov040yJdoVsh1JkLyLI8C13Njxiyh0UZF/wWZvr7DxyfZb1WVVL4
	YNbqBNtS9VzdDiFdW0wrLh9Wm5qaQhLuQRGE+MPdWE2rLV7/NUbDQZ40Gl2pZWP+flFDMMLcPbkk7
	xSIe5+ohAsx1EZRI505E0qCWdWB82GOdjj/tWYryZDtXfhk0q6pmdGcx3mGRwibv/MZ2YGDW9/8Eq
	BFwzw6ga9Zc/+JPy93j5LMS7w8zHxohF0VMtiFDVQl/sh/VpTf0hUpteywkSID7aS1iXRrU0pg2SW
	w88hPmMbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1haKhs-0001Zx-ES; Mon, 10 Jun 2019 13:51:28 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1haKhp-0001ZH-5G; Mon, 10 Jun 2019 13:51:27 +0000
X-Originating-IP: 90.88.159.246
Received: from localhost (aaubervilliers-681-1-40-246.w90-88.abo.wanadoo.fr
 [90.88.159.246]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 22AD7E0004;
 Mon, 10 Jun 2019 13:51:09 +0000 (UTC)
Date: Mon, 10 Jun 2019 15:51:09 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [RFC next v1 0/5] stmmac: honor the GPIO flags for the PHY reset
 GPIO
Message-ID: <20190610135109.7alkvruvw2jbtwph@flea>
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
 <20190609204510.GB8247@lunn.ch>
 <20190610114700.tymqzzax334ahtz4@flea>
 <CAFBinCCs5pa1QmaV32Dk9rOADKGXXFpZsSK=LUk4CGWMrG5VUQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFBinCCs5pa1QmaV32Dk9rOADKGXXFpZsSK=LUk4CGWMrG5VUQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190610_065125_513195_B4FD9D41 
X-CRM114-Status: GOOD (  18.97  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, alexandre.torgue@st.com,
 bgolaszewski@baylibre.com, netdev@vger.kernel.org, linus.walleij@linaro.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, joabreu@synopsys.com,
 khilman@baylibre.com, peppe.cavallaro@st.com,
 linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4006390583002790815=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4006390583002790815==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hlwqgl7jkkjm4sqs"
Content-Disposition: inline


--hlwqgl7jkkjm4sqs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Martin,

On Mon, Jun 10, 2019 at 02:31:17PM +0200, Martin Blumenstingl wrote:
> On Mon, Jun 10, 2019 at 1:47 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > Hi Andrew,
> >
> > On Sun, Jun 09, 2019 at 10:45:10PM +0200, Andrew Lunn wrote:
> > > > Patch #1 and #4 are minor cleanups which follow the boyscout rule:
> > > > "Always leave the campground cleaner than you found it."
> > >
> > > > I
> > > > am also looking for suggestions how to handle these cross-tree changes
> > > > (patch #2 belongs to the linux-gpio tree, patches #1, 3 and #4 should
> > > > go through the net-next tree. I will re-send patch #5 separately as
> > > > this should go through Kevin's linux-amlogic tree).
> > >
> > > Patches 1 and 4 don't seem to have and dependencies. So i would
> > > suggest splitting them out and submitting them to netdev for merging
> > > independent of the rest.
> >
> > Jumping on the occasion of that series. These properties have been
> > defined to deal with phy reset, while it seems that the PHY core can
> > now handle that pretty easily through generic properties.
> >
> > Wouldn't it make more sense to just move to that generic properties
> > that already deals with the flags properly?
> thank you for bringing this up!
> if anyone else (just like me) doesn't know about it, there are generic
> bindings defined here: [0]
>
> I just tested this on my X96 Max by defining the following properties
> inside the PHY node:
>   reset-delay-us = <10000>;
>   reset-assert-us = <10000>;
>   reset-deassert-us = <10000>;
>   reset-gpios = <&gpio GPIOZ_15 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
>
> that means I don't need any stmmac patches which seems nice.

I'm glad it works for you :)

> instead I can submit a patch to mark the snps,reset-gpio properties in
> the dt-bindings deprecated (and refer to the generic bindings instead)
> what do you think?

I already did as part of the binding reworks I did earlier today:
http://lists.infradead.org/pipermail/linux-arm-kernel/2019-June/658427.html

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--hlwqgl7jkkjm4sqs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXP5gTQAKCRDj7w1vZxhR
xTX2AQDErQs37AlgMjoegkuBtrfya5ARL23dKC2yJPk5bFAPIQEA8brM32gT3g4u
5bbyMYmku0KJTlZo2bHr8P+VKtd70A0=
=Jc07
-----END PGP SIGNATURE-----

--hlwqgl7jkkjm4sqs--


--===============4006390583002790815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4006390583002790815==--

