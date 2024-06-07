Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD93C27C53
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2024 16:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VLypqLn8kuWRMGKErW9t4uR4K33tJj4tLbGqQ15qLkI=; b=ykg1kKTyxhQLzz4GAC5RFLcs12
	k7Yakb2AA1IMpgePT3WdasmQLnOJAoj7ot5OHfiFhSmng6WctcX9BJurERI0WnRMAjOXEh8v/0LqL
	jOOLEKV+77RYrzD3QiHaoQaTcQvqR32MD81D2lLxLMJmKaZTTK8kxlpCrCESBzMYBUU5JQ9xepyg0
	3trTNMadUjlVm+2UydxeY1R8FI1gLubT4mptGzS+Sni3pVnVuyv3mIjoXa6yz8X0/XsquMdsWC1sX
	KL7FgP15lraDbIVDlFMjIKoiPqVgmf+l2l9FbhuiyGuZMSZOhQD7gBrNQsyRqqED08TSWqTueIyDI
	8l8qKycQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFcHM-0000000EsSl-3yaA;
	Fri, 07 Jun 2024 16:17:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFb7r-0000000Eb7o-0wA8;
	Fri, 07 Jun 2024 15:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4gR8xxsDzn89AEBZY9bCk38wSrFhLDr+8xtncFpD6Ok=; b=dyE8T9pcaTyJRbW9lBJov+tgT6
	iGja7qkt0UM7Ob5p2vB3Ma61hpWU1YfaPfHHDPcZv4Vhfs6r4B0ly2cV4kcCfKS27fAzlAU772Dyu
	2/5aMs6YZtqahcZLDv+SQWSdszGWRq23TOYLfD79w7pCQDW2QOENjYIDUnoYzsBHD604kwY68UJI9
	oN/dUrWG1t8+MnCoTB9DQ7JeC8kY38ycIzTRmFvzJn2UBoUbH1cnilxOihDc+Sa4zcief0a+4Pib0
	LFm0hfDudAsafh8fKS2XFJ9J0+B/zqFJsfGK3Tx/Hw2Bukx2ccJN8s6SzfTDXmTFbPhZUjEzeBKOf
	CIWcQ4SA==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFb7o-00000006KzG-0YC3;
	Fri, 07 Jun 2024 15:03:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 89AD0CE1D9C;
	Fri,  7 Jun 2024 15:03:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B82AC2BBFC;
	Fri,  7 Jun 2024 15:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717772599;
	bh=4gR8xxsDzn89AEBZY9bCk38wSrFhLDr+8xtncFpD6Ok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fu9exxX+roB9Uu+dO21iVZwiT9RXi2Xm2APsNYQVWfSOQUpW347vV20/HOesIN8nr
	 gUxXZkfix2bjLhBymZDwETKE6xSdYTcpN+aPxNKOL0ymRRs3NClK2AWVvwES2ZXXd5
	 TSYwH7SwlmBtjDdBiQnJABvsZnNhlbZHD/r1wofzEXS5JASXO9CUob59fc5bNKFVrv
	 H+LHf1o64yEGLpOzIe/hm/W8CUDEAwG0ihFgbTVdzaVxxU0WICCmhNvsohrATeOomV
	 Hr+MNtcVT1ZRgcG4EkE+P6zbUez83MoZL7erDBguYktJc4vuph3/nZI3MlqZXcNHNe
	 EvXXZXJ9kgHaw==
Date: Fri, 7 Jun 2024 16:03:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Viacheslav Bocharov <adeep@lexina.in>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: amlogic: add binding for
 JetHome JetHub D2
Message-ID: <20240607-flatfoot-endurance-934bb299c6e4@spud>
References: <20240607145148.2246990-1-adeep@lexina.in>
 <20240607145148.2246990-2-adeep@lexina.in>
MIME-Version: 1.0
In-Reply-To: <20240607145148.2246990-2-adeep@lexina.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_160328_430442_949B53DB 
X-CRM114-Status: UNSURE (   7.19  )
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
Content-Type: multipart/mixed; boundary="===============8154688740087001048=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8154688740087001048==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0EFJB7UY3eHZb3HP"
Content-Disposition: inline


--0EFJB7UY3eHZb3HP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 07, 2024 at 05:50:03PM +0300, Viacheslav Bocharov wrote:
> JetHome JetHub D2 is a home automation controller, based on
> Amlogic S905X3 SoC
>=20
> Signed-off-by: Viacheslav Bocharov <adeep@lexina.in>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--0EFJB7UY3eHZb3HP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmMhMwAKCRB4tDGHoIJi
0kABAP4zhbmujaFMgWvXg11gfLRm75AooEjghwdLWFJok+IQAwEAqYc6WFBpNXx+
8WzQ08DCs3rKN8W5v5fzYs9vukKmPAk=
=OswS
-----END PGP SIGNATURE-----

--0EFJB7UY3eHZb3HP--


--===============8154688740087001048==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8154688740087001048==--

