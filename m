Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F889EB64DC
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jul 2023 16:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6D9J6AOkDFRxYcqmy6S+PrpQOlrG2DdeHvdykuh8TVw=; b=oBzZGJorldxVDiyTRjeR+Zpn0m
	qmQ42pKqh9RV7X12cedfzBQKgabVx8CpGopYK6RmEIIL+EcR52n/hOzk/u5/lrHng0TRU/PMhWlBB
	8IUkrUOhNwhwwZGf2T6Ibvz16vDlCC3A/bSAl2PN75c8CLsXE1f5Ck9ROjWmSnxL59Q9jZz9c4SDP
	wTdI+XxEt2mpZsZz3ausEFYr/rE0J4ZvQyMkwW+nduElWNuuMKwtp+8ig9a2mK3RYuTSp/y+xyDRg
	PsBhIhol+oGGfOqJG16IUKXMQT9p1+NbWeeVE62eqgGQrlX8xayk3ekBGnYTmFZQx5h+ZFuSqwl2a
	i83/p6BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGMY9-00B0yX-1t;
	Mon, 03 Jul 2023 16:37:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGMY7-00B0xZ-0y;
	Mon, 03 Jul 2023 16:37:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C54D260FCD;
	Mon,  3 Jul 2023 16:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D613C433C7;
	Mon,  3 Jul 2023 16:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688402234;
	bh=dQJizNDjV0On5jsPc5SMZQJc24JPH7DwKQhe7eOYpjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OcWUi/sgVANfYuJYeddKHs4lsYxVTJ0o6uA/O/PPLLHo+0ak9l7GoaQht5MusPJYR
	 qZkbgM5K6tXZVEA//tCW+sNb6e4XeUi75ZZGE+ckBKajEQWlaJr76mXD/ah6gyfjMp
	 JNRc41GxrK8ctzMT632DFINJA7OPT+5EXV7NXe/JIwjF7iyFCgVgKaN0dH11AnrncN
	 3uSKBoK7i7Hz4JGO7blvR7PiO/921+0tG89e3oUwKQctLMYQ+r5siGjNyG39h0/crT
	 ll2x84Agc0UDDVR28uEGnFe2Q1NW1yqHbe5Hn+RzNUI8WUOHaPtwGP7JOkxRFObvWn
	 k4lWRsdeMLtrA==
Date: Mon, 3 Jul 2023 17:37:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Leo Yan <leo.yan@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cleanup DTS example whitespaces
Message-ID: <20230703-backwater-shrimp-83c4d7c85566@spud>
References: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_093715_385685_EA9515F5 
X-CRM114-Status: UNSURE (   8.00  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============4123642578394148375=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4123642578394148375==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UiJVV06vbWBe/tbL"
Content-Disposition: inline


--UiJVV06vbWBe/tbL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 02, 2023 at 08:23:08PM +0200, Krzysztof Kozlowski wrote:
> The DTS code coding style expects spaces around '=3D' sign.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--UiJVV06vbWBe/tbL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKL5MwAKCRB4tDGHoIJi
0mVgAQDNt2fzUk6TeyhRtqxRzkVNpebNdDOvWcdu/bIrTUmphAD+MWZmleneV77V
DMKAFWrQs6zsQ6eXYsq712V3/VRwiQg=
=CDKn
-----END PGP SIGNATURE-----

--UiJVV06vbWBe/tbL--


--===============4123642578394148375==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4123642578394148375==--

