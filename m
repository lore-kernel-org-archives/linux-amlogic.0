Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAA6C7EE23
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 May 2023 17:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SgFcqs61339WoNnMD7FMz6IH9kP+26L0ufBWozEgrfI=; b=bF3KaReE+WIRxWm522Wfn/dTDv
	TcBjfbcGEXZlh1wygRorUCrc1PjQ++6NYtBhDaqMphubYGYsz/XZP5X7kbSpfgJOTpm7JsVFVZqo2
	6XVJ9m7EtcP/ENe7HfahM5bm3LrpsyirXaazlB4z9Q6cvomZuSWsfVdYdjTFDYrwxQccE3KnyvxUw
	yz5kj4Kis/5XL+bXoXNNsIlOXPGxgUHJ9VuFt5HxddVlsXxxQ1zIIfKPVeS3o1r8ttDiPxbNOCJGn
	BNEKi+vmaDiCEhhNrQJqnNynfuA0oIGTFAuMf5FgxuXjXYXv8VKKoK/25bk97cE4v2VPiFtTe/up8
	ejVCn6fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q436O-00Ejzf-0a;
	Tue, 30 May 2023 17:25:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q436L-00Ejyg-1j;
	Tue, 30 May 2023 17:25:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CBFDB63121;
	Tue, 30 May 2023 17:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C9DC4339B;
	Tue, 30 May 2023 17:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685467540;
	bh=NOcoyxFR4vwKOMvoF94j9sG6honGQkXkQuK+B+qcPfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rOeYJe09x1NUFUNb0syYwOgfFjHqms1EHdwUGKwXhgEMIgQ65PiaXSLyM39oZe6DZ
	 BplgA+P2uPCx1OtoKe00+Q63mpTRpgWotn85LoI1b7668B4N2jP28NEMC5sMHSrlXX
	 zsc9fF/MUyao/1pIU3vZ2PjeYpw8eviYt0sRtTTYpE19jIKzuSWCTCdG9J2yImV6nk
	 ZFBwkQdKCQJaP7pjbQ3NhZsnkukMp+MgMeeya8jCWkNv1LaEQ5MpXr9id6Agg8K4FU
	 9bCj2vkkiuW+Yt9WndLt56kz3UDB4Dtq1Jspchf9uISY+RyGU8s7pB+/0S+IaVWHaK
	 T9AAofnPcSI8g==
Date: Tue, 30 May 2023 18:25:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	"Lukas F. Hartmann" <lukas@mntre.com>,
	Nicolas Belin <nbelin@baylibre.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v5 03/17] dt-bindings: clk: g12a-clkc: add VCLK2_SEL and
 CTS_ENCL clock ids
Message-ID: <20230530-outfit-stifling-f5ba6dfbc47b@spud>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-3-56eb7a4d5b8e@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-3-56eb7a4d5b8e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_102541_614770_5BB42B3C 
X-CRM114-Status: GOOD (  10.32  )
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
Content-Type: multipart/mixed; boundary="===============1000702900468176058=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1000702900468176058==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fpY+fROroRfh6jEX"
Content-Disposition: inline


--fpY+fROroRfh6jEX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 09:38:04AM +0200, Neil Armstrong wrote:
> Add new CLK ids for the VCLK2_SEL, CTS_ENCL and CTS_ENCL_SEL clocks
> on G12A compatible SoCs.
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--fpY+fROroRfh6jEX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHYxjQAKCRB4tDGHoIJi
0mb1AP4yTzCwn7nVWyhFGK+s0DVp1sxicllf/G5S0d1/5MB4kAEA6Il4QAMrzg7h
VyBrvc9UPsHwiJaLjqMpz4nthWyUNQQ=
=veg3
-----END PGP SIGNATURE-----

--fpY+fROroRfh6jEX--


--===============1000702900468176058==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1000702900468176058==--

