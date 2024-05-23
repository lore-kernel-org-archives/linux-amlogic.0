Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C52C25B7C
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 May 2024 14:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5qYmImTynZXJTr7GI29lskorZyLRD/j9bFuo/5btMA=; b=cdSI6fcyFDe20IQzOGdQhTcIQM
	dCSBM/Q3CUHRhXRvqsgpInUE23u13khoJVSt3DauwbePQQ2kW55HKOhKY1i5tDWf6yHiENU7ch3cn
	eSsGtcWRQf8b1gD0RoWnJSdPTuL7bScLif5w54/sf+AExEU6T5tD3bnPR+Y+kTQ1fjswrrdjmHpqM
	3s7g9O796+YBibkWjOLJhAuYve4l9M772KdwAglYzLpgBK+NoT3lggqFBXP3P3h7QKtWR3sNFkMYZ
	Lae3GLqV+oxNZ7Cx3w4/ZLDd5ObT/r8Rn+JYOkxzTf2wr3hYAVb6fPRPPAcbFcm95DOAGAjyRyLyM
	NYx6ngmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA9Zz-00000006VzD-0WN9;
	Thu, 23 May 2024 14:38:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA9Zw-00000006VxR-0SCt;
	Thu, 23 May 2024 14:38:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ACC4D62835;
	Thu, 23 May 2024 14:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F929C2BD10;
	Thu, 23 May 2024 14:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716475078;
	bh=eT+HB+FXqP5lVZyAYj6JKHnhWvk/Ipdw9JdWIe8LzVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iGpvGW6a9yj3gWD7yyTWBWyh+7KuymQfmTC5VLzNGUETDnmwJO+vqyEup2aTcy1x1
	 v5+2jkf19i+w373ThyPSeHO9d0rLYRxZS2d5F53xFNhOr2JrIpZLCEvo9Kr6ZmXv50
	 3NNzg67yDi5QNGL2CJ6n2zsTvzkGIzpIsJaZ1haTVf2WYn9Q6tJ+PbjVHodEdmvjzJ
	 bjPz8XeRxfiznuHWYXGTwqzoNUxuEKq6sWfsOsBFUMvLfatQWrjvTFGYc/+BgVmMEe
	 Ybfm+/G9nXVsI+hCWBOhrluBHhkJUZe2NwH5vucQ75mnIY1Y+3GOXlPI87LCsVuN7A
	 E0tblaqOZHbrA==
Date: Thu, 23 May 2024 15:37:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"clabbe@baylibre.com" <clabbe@baylibre.com>,
	"herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>,
	"jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
	"vadim.fedorenko@linux.dev" <vadim.fedorenko@linux.dev>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v7 17/23] dt-bindings: crypto: meson: remove clk and
 second interrupt line for GXL
Message-ID: <20240523-snowiness-attain-75d415573b5a@spud>
References: <20240411133832.2896463-1-avromanov@salutedevices.com>
 <20240411133832.2896463-18-avromanov@salutedevices.com>
 <20240415-schnapps-plating-eb0895459004@spud>
 <20240506134754.jl633ncne7ct6szo@cab-wsm-0029881>
 <20240506-distrust-famine-6848f75dd3fe@spud>
 <20240523104624.tr5omyxnzxsjkpai@cab-wsm-0029881.sigma.sbrf.ru>
MIME-Version: 1.0
In-Reply-To: <20240523104624.tr5omyxnzxsjkpai@cab-wsm-0029881.sigma.sbrf.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_073800_259269_7141A286 
X-CRM114-Status: GOOD (  22.14  )
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
Content-Type: multipart/mixed; boundary="===============7197628943893305067=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7197628943893305067==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WTOLmlkXxsRP7sN+"
Content-Disposition: inline


--WTOLmlkXxsRP7sN+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2024 at 10:46:35AM +0000, Alexey Romanov wrote:
> Hi Conor,
>=20
> On Mon, May 06, 2024 at 04:47:29PM +0100, Conor Dooley wrote:
> > On Mon, May 06, 2024 at 01:48:01PM +0000, Alexey Romanov wrote:
> > > On Mon, Apr 15, 2024 at 05:43:15PM +0100, Conor Dooley wrote:
> > > > On Thu, Apr 11, 2024 at 04:38:26PM +0300, Alexey Romanov wrote:
> > > > > GXL crypto IP isn't connected to clk and seconnd interrput line,
> > > > > so we must remove them from dt-bindings.
> > > >=20
> > > > How does the device work without a clock?
> > >=20
> > > It's clocked by a common clock, the vendor didn't provide more
> > > information. It doesn't have any special clock domains.
> >=20
> > So the hardware block does have a clock, which, even if it is a clock
> > shared with other hardware blocks, makes your patch incorrect.
> >=20
> > Is the "blkmv" clock the shared clock?
>=20
> I received accurate information from the vendor. Starting from GXL,
> DMA engine is used for crypto HW and clock is hard weired to it (at RTL
> level).

> That's why we have to remove it from device tree, because we can't
> control it anyway.

That's not true, if the clock runs at a fixed frequency it should be
described as a fixed-clock in the devicetree.

--WTOLmlkXxsRP7sN+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZk9UwAAKCRB4tDGHoIJi
0kgCAQCc036MitPTeOOqstfi4ri+q3xgSGemTaQQWCQjlD0qKAD+OwLXN5ySvreg
/MfIpImWvlSDrfrkLnC2nq4oV8AAmQg=
=NYsR
-----END PGP SIGNATURE-----

--WTOLmlkXxsRP7sN+--


--===============7197628943893305067==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7197628943893305067==--

