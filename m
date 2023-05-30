Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFEFC7EE23
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 May 2023 17:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Ndj6ZgCt8xqYt2Kcd50TwQQoCeiuhKwEQGEmIJAOCc=; b=tJwyE3RPQK6SlJLahESLTRJs9K
	Fcyip5U7N/t3q8+y0nv1QvLlc4dU070r7USvq6/azO4aM5hqyAuVFwktIxYaG4V++xPO2b3jPUdQO
	I1DgGoX8WNqmzCEaBI2WSHEwhYMkKzsTIMmQxoR5x/zSc8bWrf+aXyTyB5Gq6KKFHk5D85ouRMRdB
	MJJv6q6gEuGJOuY++1EHQEWZnusyENw4DvjbDL91rvzHQdwEeDna0DiAScEHjSSxpAzp/GpfodEn2
	xeKaAHw0aSq/lI+d1y7fFQrlqfr5VRghfmi9z8LAqvy8Qz0o7po78GG5nz83HTWF3LYtITkSHBp2G
	Y/8S+Yng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q439e-00Ekcd-2Z;
	Tue, 30 May 2023 17:29:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q439b-00Ekbr-2J;
	Tue, 30 May 2023 17:29:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3696063118;
	Tue, 30 May 2023 17:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CDFCC4339B;
	Tue, 30 May 2023 17:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685467742;
	bh=2bODZqzDsUoTQkh2zMk1nEE+wHElsvjQpmoMsf7f/Qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hHOGYhzLNSVRW2KA0PSbdr+3tO52BK5i2Wf+B9H6AQC08PA1PFm0Bkwly4Xk+Zy6s
	 fpjQGhv3AcA21h6GnNPWiSEPN3pI7J/t9TpNrcOlySMQHRr5sjkbiDF2yt71sn1ClN
	 6FBrIyVa0KMjPrG6KZ6KmrmVvn+o9Il5gH1wEptuV+dQ6LmxKVh80QOdChihjaG2jt
	 2j3mtGq60eXLP8Ralhy/kmZTikzXW7Vt7XQBRLdCD/ol94LsWHuNNhjZf+KyZMBetT
	 cw6lGHcV7QJ9iBnCmUwTCh4/AatytoU1t2wjMpW7vK3IKmvAd2dVDvDTQNXAg0NkfD
	 mWfjQxCFTIQUw==
Date: Tue, 30 May 2023 18:28:55 +0100
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
Subject: Re: [PATCH v5 06/17] dt-bindings: display: add Amlogic MIPI DSI Host
 Controller bindings
Message-ID: <20230530-hankering-trident-9cab74e59591@spud>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-6-56eb7a4d5b8e@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-6-56eb7a4d5b8e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_102903_798903_35FD0802 
X-CRM114-Status: GOOD (  12.22  )
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
Content-Type: multipart/mixed; boundary="===============8974712143513893100=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8974712143513893100==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yUiZQebBLS7labwP"
Content-Disposition: inline


--yUiZQebBLS7labwP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 09:38:07AM +0200, Neil Armstrong wrote:
> The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI
> transceiver (ver 1.21a) with a custom glue managing the IP resets,
> clock and data inputs similar to the DW-HDMI Glue on the same
> Amlogic SoC families.
>=20
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Welp, I was happy with it last time around before Krzysztof took a look,
and the things he pointed out seem to be fixed, so you can have my R-b
back.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--yUiZQebBLS7labwP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHYyVwAKCRB4tDGHoIJi
0mZYAQDW0DCO9lI9BrijwwOdNaACzk5HrgyW4ZHkJfjAmf3d6AD/cQb89WQt5+7E
yfiA12g1wqL5SmEpqaTBIFYHn1cucAo=
=v6gU
-----END PGP SIGNATURE-----

--yUiZQebBLS7labwP--


--===============8974712143513893100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8974712143513893100==--

