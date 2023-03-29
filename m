Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A1FC74A5B
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Mar 2023 19:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iXbFHvaXU2eDv6MbBmWvy55EiLBeggTOJtKn5Ov09nY=; b=a636GnIfMJTi6KQAP8517K2Rr7
	d8NJuQdgW5SWAFSha/FPA7176/7aOBV4Zrsp+rpX6m+das/rfRAK5yT/JOJMJ5YwLIoG7sXF4X+dh
	rInOeHnzg8NyTSZyye7lWAbSP9hdwUWgoCn4cvSiF3mHLkyq7NicXk/Mr3wVyS5lLrHo5Sll5+JRT
	MgGODr4/WfkY47R48uXok7rgOV9RDJhU/5N6+Ci+jx32E6MVzL9N+8vVgkS5yP0UqrR0OcsCfy/A7
	t02XQOZwXTfPaLPXiCq1/XxGyf74dsJlNHSgbTeyuqHHHjpMFF0Jy4s1t/h93ao8bUYyUKGljzWS+
	iu1AGSSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phbUi-001dDU-0b;
	Wed, 29 Mar 2023 19:30:04 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phbUf-001dCe-1t;
	Wed, 29 Mar 2023 19:30:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id AD9DECE2513;
	Wed, 29 Mar 2023 19:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28172C433D2;
	Wed, 29 Mar 2023 19:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680118197;
	bh=SS/jbk54VmrEOwURrr56BUHIiEK0pT0Kcy1MuoBHTI0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kb/n4qAYhIUyOBdzzpNs4ykgQjGEAVdRdGcvbna374EyEQRq4Fms13V8tlObKv9N+
	 JFzO2KXkJ0PYwdK5PL29w1caHjZsa1sUSotKtthT82S4SSUxpWmT3UvgtEIjYHpDKV
	 Q6jtZlKYvi6E2VVLMP02coNICSqLYhw9H6STwTvz8emV18IqzBmNr7Va4EkVF3s7vi
	 +6KiSdGG1+uH5TiOqmptekIU9tDzTHScpEOlcIHN+qG6r2Bu6fxzwcWi4v+qLF9Rxr
	 j9BQuQW48H/FK5Mseig+6cAkA63RpagAms39dCA8i+S6xlz/nVP3XuTw01sKYbwOpI
	 UJN6D3Nhju5zg==
Date: Wed, 29 Mar 2023 21:29:53 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Peter Rosin <peda@axentia.se>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] dt-bindings: i2c: Drop unneeded quotes
Message-ID: <ZCSRsWEXIqcV0xC4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Peter Rosin <peda@axentia.se>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
References: <20230322173530.3971676-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230322173530.3971676-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_123001_968360_CA4A9093 
X-CRM114-Status: GOOD (  10.95  )
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
Content-Type: multipart/mixed; boundary="===============3308676300448678647=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3308676300448678647==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3/7x2pzW7P4Mq4zG"
Content-Disposition: inline


--3/7x2pzW7P4Mq4zG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 22, 2023 at 12:35:29PM -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Applied to for-next, thanks!


--3/7x2pzW7P4Mq4zG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQkka0ACgkQFA3kzBSg
KbZ7QQ//TjhlV9gpnzQf1R+my8YacgB2isHXPlTUphtT1RhFuCtww7h9lGyoh2iz
msnIcykv8xVr+nJ1zkALk9reiZQP7DdXSjVYHsCpd7XZyHXwm4PrfBlhoQi6rkeY
DUDY8mQ5QpFbhG2bbJDFfelYwkc1fwCW/FLew0P7kRudkeb3OVjQq/ABaWVXHZYY
lF1SUIZKC+bsfeoidJ2oA3DcQ+jeML1BV81SZwDJ1TIbaQLRdcx37l+OlMwYLMXA
wOdrZmOH3spf3jWoEEKPH5hO48W4AvMujWAqWiShgcCH8S37g34eXxQ7fUOaQrA5
CupkQ8LBcNbnzLZjsN0nNFZkDYasCLA/aHsAjhhsU+UvR0KWTrp3VOZkQh/YL6Yv
BWG8K2DDl986q2YZWHdyoALr9aK/PkvqcxH+Bsgu5kAOOOBjaSmCG80jIGUz99XF
qwthYFsQbNU0W5D2D1bOCesL0ZXWjYHAob8OD65Jdup6IAcfkFbEsFlhFhtEXurD
QfHepyLM5x4qENtV7M9bGGGaAZwtgW7qYeQgLTKBPQeXy+ZiW10F5t/3y4lfBJ1U
KFLGQankiD98qmHEwQpVxS8sWNUUTIg1XQlGnoOiiZDKd3NEYSj+Ivu2gt2mEkJq
Ra3yRf6q1yETdTaNA2ltFSh0wvup3LOQaEFr84Iq9GXiFPTdNec=
=95C4
-----END PGP SIGNATURE-----

--3/7x2pzW7P4Mq4zG--


--===============3308676300448678647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3308676300448678647==--

