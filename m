Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670ACEB64DC
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jun 2023 18:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CrNif2o4AzjyYSgIDDzkKlbwvnlNYSHi2KahxjvoCJY=; b=qsL8y6gJDpZo7+09VD0omps1pK
	smEmQAaynCWT6AOV5fH+Dys3QepZPIUI/t1Ey+9pP7T1ilgQA3AWzWNZlLHyAPMBPO5hvvwY/t2nZ
	giDW3lApxHMQQoeUCSPeLA6ak9/bqA5kkm9o/0i70p3ox3/1YaMAQMeRUq7bjiiSAou2f01HLGeXw
	EJZ2d7sLdwGuMEUQ32PfwI9ERolYMga4oTyoyX/7G3TcUJBX6ThAqBFdvRaeNWD1KpzRIy59Lc2gp
	H2Fhj/4lJJFuK/iv2qWQ+FMP7X09YEua0gVRb4XmIy5VEkMS6KEgjRWUQ5BY34K+YITXnXvJij7U3
	oG4BqYjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFIXl-004Go5-2w;
	Fri, 30 Jun 2023 18:08:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFIXj-004Gmi-2T;
	Fri, 30 Jun 2023 18:08:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 303F5616D7;
	Fri, 30 Jun 2023 18:08:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD727C433C0;
	Fri, 30 Jun 2023 18:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688148506;
	bh=7RgNICGUd57kbxZR+bdP1T3AWfyjL5MDZIC0ZkQs8bA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OHHHqacKZysWHbeof64j+ADM+POnBhML0hQ1kwQA+eigj6h3bmtNG8yZBdtlFOnJL
	 74eJd5B9/flzIVC6UPWbFuVqFLJxS3mY1fT6GTIeOKc1FiLhtbptXAb52tBBzFrbh9
	 iHS9sUtaTVgH4R7mlKBgSEveR/q4KGVXcOkTwDHZJhFMAn7KupSLpKsBFsU0Q9ONuN
	 ukOk2NnBVYOKnbS2BMg9jfoP/TDKeJjrlZGw/YswtDPak35tFynIfFiq4TnI5KUYoh
	 LLnnZQORjLWhelYVIOjo700vN5EJCdrEsBoN4xwVGcDV/KqqcUE5RbMb76oC0Onb30
	 8GLYRenfsW4Qw==
Date: Fri, 30 Jun 2023 19:08:20 +0100
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
Subject: Re: [PATCH v6 1/9] dt-bindings: clk: g12a-clkc: add CTS_ENCL clock
 ids
Message-ID: <20230630-unwashed-gothic-36201c97fa42@spud>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-0-fd2ac9845472@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-1-fd2ac9845472@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v6-1-fd2ac9845472@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_110827_851094_A82BDE11 
X-CRM114-Status: UNSURE (   9.83  )
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
Content-Type: multipart/mixed; boundary="===============3496802308382880905=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3496802308382880905==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QFQMml9cy3EPdzM8"
Content-Disposition: inline


--QFQMml9cy3EPdzM8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 30, 2023 at 06:29:08PM +0200, Neil Armstrong wrote:
> Add new CLK ids for the CTS_ENCL and CTS_ENCL_SEL clocks
> on G12A compatible SoCs.
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--QFQMml9cy3EPdzM8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZJ8aFAAKCRB4tDGHoIJi
0pMdAP470puPbIEhFPzVh9r1odFpTvbwxCMSXUJcJ+ePo6UYXgEAt2GMNyLnDczi
4C+3TomZUq+P+WQKKiLXT9UKwHFlOAQ=
=hMX/
-----END PGP SIGNATURE-----

--QFQMml9cy3EPdzM8--


--===============3496802308382880905==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3496802308382880905==--

