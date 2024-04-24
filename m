Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5732C4345F
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Apr 2024 12:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8NOw87mUmcAwtE587I6sm5TbUB2+KxTw7DTcnE0s8xw=; b=4qN/SeJ5sCH76xIy+9Lr38Xe+Z
	aH9XcaLfzs3HLe5Ha4wlmPHb0Czx44XgNF7usyAoylY2d/RpaHafQ3Y8/Wx2+4s+JFvVDLmxbrcxx
	ApbbkMmAaYeLsHD9Ol87ZD3OKm3kwf9kOgrRfkjX2kYDOJL2VTkSZLZ+O2hRrAV+EeMt1BB8b1LOm
	MaHt/niDu8cTF0hotJ0e+VzAmoK6FxYeXlqu1AO6/kpCMdGsgG+pUd+YqYmDy/x5lGKTxtelGCedo
	vl3G9QWp5iR6EWzg6nvKcqslFtWqJa4wbBQtaLu8q/9DAl1neLQhlXuVcqBk0H909TGcf9NxzssWQ
	uihOu/zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzbQB-0000000409t-05zJ;
	Wed, 24 Apr 2024 12:08:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzbQ8-0000000409P-01Zi;
	Wed, 24 Apr 2024 12:08:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 41F2860E26;
	Wed, 24 Apr 2024 12:08:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF6BC113CE;
	Wed, 24 Apr 2024 12:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713960494;
	bh=XIDRIdvM6seDLp5rS9urHwiVla14vdnVG5FbNeLWF9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DdnEjJzjaMwTbabFNNrhDkLC6z+lrldg8wq05SR18LT/OPdT+SBJv18zIMYA5oQoh
	 8bqLo0v2AUKxk2Xf6hxwemSumoEw7mTEi6gDi4dsOpBhgv5ruNuI+Z5P5fvCu1BXgd
	 FRzVQpfR4F4krOtS0TIXQ2LTJhWDMmNTYC1wiyaADjzjZHTYPmS53Rwe9D2GjLQjIa
	 owmB5lI8GfRTrovkXwakF/TxkeNHNVp+UZHAMkFMgJ91rZLo0FIbIxGNup+DEtSk1f
	 e8yO/0jXDCe0jMwH9d14bJDYJ+ENpU8ziiGkCL8rpq+Oq4G0o3HCJ306GBrTWVMnPL
	 HrOnskZccep1w==
Date: Wed, 24 Apr 2024 13:08:09 +0100
From: Conor Dooley <conor@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: George Stark <gnstark@salutedevices.com>,
	u.kleine-koenig@pengutronix.de, neil.armstrong@linaro.org,
	khilman@baylibre.com, martin.blumenstingl@googlemail.com,
	thierry.reding@gmail.com, hkallweit1@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@salutedevices.com,
	Dmitry Rokosov <ddrokosov@salutedevices.com>
Subject: Re: [PATCH 1/2] dt-bindings: pwm: amlogic: Add new bindings for
 meson A1 pwm
Message-ID: <20240424-word-scoring-830983094ff5@spud>
References: <20240423161006.2522351-1-gnstark@salutedevices.com>
 <20240423161006.2522351-2-gnstark@salutedevices.com>
 <20240423-wildcard-smoking-90b50f00da50@spud>
 <1jr0ewezvc.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1jr0ewezvc.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_050816_220979_E53F0886 
X-CRM114-Status: GOOD (  18.93  )
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
Content-Type: multipart/mixed; boundary="===============8474931067438326839=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8474931067438326839==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="47Y2FJ9ZWeX1qYH+"
Content-Disposition: inline


--47Y2FJ9ZWeX1qYH+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2024 at 07:44:35PM +0200, Jerome Brunet wrote:
>=20
> On Tue 23 Apr 2024 at 17:56, Conor Dooley <conor@kernel.org> wrote:
>=20
> > [[PGP Signed Part:Undecided]]
> > On Tue, Apr 23, 2024 at 07:10:05PM +0300, George Stark wrote:
> >> The chip has 3 dual channel PWM modules AB, CD, EF.
> >>=20
> >> Signed-off-by: George Stark <gnstark@salutedevices.com>
> >> Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> >
> > a would sort before s.
> >
> > With the re-order,
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >
> > Thanks,
> > Conor.
> >
> >> ---
> >>  Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>=20
> >> diff --git a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml b/=
Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> >> index 1d71d4f8f328..ef6daf1760ff 100644
> >> --- a/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> >> +++ b/Documentation/devicetree/bindings/pwm/pwm-amlogic.yaml
> >> @@ -37,6 +37,7 @@ properties:
> >>        - enum:
> >>            - amlogic,meson8-pwm-v2
> >>            - amlogic,meson-s4-pwm
> >> +          - amlogic,meson-a1-pwm
>=20
> AFAICT, the a1 interface is exactly as the s4 interface.
> So a1 should list s4 as a fallback and the driver should match on the s4.

Crap, I should have checked. Please make use of the fallback :)

--47Y2FJ9ZWeX1qYH+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZij2KQAKCRB4tDGHoIJi
0gnuAP0b+BgwJoXOj4siqxBf/5EczpoJGS7AHdX0u3bkL+a90gEA0jrhT5vIgfb0
hE7m80/W2o2Z0D7i7qG2yePTa/lmwAA=
=2KkJ
-----END PGP SIGNATURE-----

--47Y2FJ9ZWeX1qYH+--


--===============8474931067438326839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8474931067438326839==--

