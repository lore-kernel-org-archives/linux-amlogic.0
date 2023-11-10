Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12BDC05021
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Nov 2023 18:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9FbxBYFt8Rbv8Aztg0iP43Js7rvFqbqOVQzR+4dW8Y=; b=jHTWgrA1eDiVXpMSl9yU9my0Cj
	QmENuMutK8rXfTyp24UUXCB2uH4xrsP5y/qAhvLRrb99JzTVtw+lcEN6BwobD3j9s5kKtAYWEeo4G
	NXLHSH1om2pdYWZH11QUrJ9bRcTWhQOEGyzf4J0N+kF78beWd7Htkq4S3MaFgDhaLfu0RbWNSQgB2
	JepKzfV1Fvl5+wCM44+Jn3RmacF8XWmtyICPM33LxjHrOpYFJFjkDV5jvoP/dH77rVcQAEQbkeMCH
	UwJxZEcvLDthr4aDCKWuMB8Y4Pw7YwzWFrafhUo+nPklcn8xdGl3ZoQardEEnV2jq8zghlz0Qonep
	PLRDXQgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1WDh-009EcY-2O;
	Fri, 10 Nov 2023 18:27:05 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1WDe-009EbT-26;
	Fri, 10 Nov 2023 18:27:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7CB5DB823EB;
	Fri, 10 Nov 2023 18:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D368C433B6;
	Fri, 10 Nov 2023 18:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699640817;
	bh=//+1dDG48RxoB34op9WnKpQOYu+pia2AtdgY57qSGLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W8WYCXUex+ppIwdfM0LjitjhzijK6TZXEcSwIebEgQ3GOAO7UnVlxsupaq2VoYLC4
	 Yh4W3b4VHx4k/zUGzSAZjnA12cuftE6C1Q8t6t7obYTYbI++iZG772pN/nRQm4D3IL
	 5EZcp501bBGcNE3RIEsVmkN/Xt9POxz2bhJlDh7JuGUZAblW+XJv5k+K0Cs7BTrpY3
	 GOKcUWNvNzlDkGRLbDrJ+7MtbejwoY2RLY+OQkgp8oq3Evh+5V1EUSQ1F51ukSc+xw
	 qm3FEyYaBPHHWZ7N3Av1SWXOZrHgnLGmOfT2lh+uV/MRKQtqeY4jLvZwlXlLoiqNk9
	 PfCie3iJEbl/g==
Date: Fri, 10 Nov 2023 18:26:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Nicolas Belin <nbelin@baylibre.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v8 02/12] dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl:
 add example covering meson-axg-hhi-sysctrl
Message-ID: <20231110-mascot-dollhouse-83f691dfa1ce@roley>
References: <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-0-81e4aeeda193@linaro.org>
 <20231109-amlogic-v6-4-upstream-dsi-ccf-vim3-v8-2-81e4aeeda193@linaro.org>
 <20231109-dictator-hedging-94b0dec505b5@spud>
 <046062f4-e415-4c3f-a05d-81bef9857649@linaro.org>
MIME-Version: 1.0
In-Reply-To: <046062f4-e415-4c3f-a05d-81bef9857649@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_102702_824186_7EBF0CCA 
X-CRM114-Status: GOOD (  12.39  )
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
Content-Type: multipart/mixed; boundary="===============1698114704244292991=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============1698114704244292991==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5w/g2E24/WOxYVxa"
Content-Disposition: inline


--5w/g2E24/WOxYVxa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 10, 2023 at 08:50:58AM +0100, Neil Armstrong wrote:
> On 09/11/2023 18:34, Conor Dooley wrote:
> > On Thu, Nov 09, 2023 at 10:00:03AM +0100, Neil Armstrong wrote:
> > > Add a thirst example covering the meson-axg-hhi-sysctrl variant and m=
ore
> >=20
> > What on earth is a thirst example? Some sort of "hysterical raisins"
> > type of thing?
> >=20
> > My confusion about that word aside,
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Indeed, I'll fix this bad typo :-)

TBH, I thought it was intentional!

--5w/g2E24/WOxYVxa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZU514wAKCRB4tDGHoIJi
0sAoAQD6Sj0Me4v2FpLbfFQZfZK67SGa5V4LFec/ta5m+t6KBQEA6elLz7R9xNnC
0qtqNVWQEY1i0Kf4yBRSUOGQOB6qJAA=
=LCNw
-----END PGP SIGNATURE-----

--5w/g2E24/WOxYVxa--


--===============1698114704244292991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============1698114704244292991==--

