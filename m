Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB27D6A221
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Nov 2024 20:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E4AWpfKo06vEXFS6dUIalWJNliaq5qNWuPjLGzkOs/4=; b=GpCjw5aZ6gnNWtIOF1AqJkGPey
	K6mwMlYdHL0WpNP6rPPMNylfgZDBEIaN74z8Ei3BWkTdJ72L+lF6l/JVR1VNcmUkXA+wC4LMo6xgV
	CkQ0zUtv1+c0m7IJjiQrNAaw/ZeeYStqbyX+kX3niUQVgy8P+xU3gvQSdMQ9RvFL3kDbf2ic78g3z
	0POH4gyLJ6eJTV6Tan5nZmVvI6/N8gCZ0r5o/3s1n2Zb4Z03SMTjyRHh5gUuQ6H7ML8NhlOKTpcDC
	teXhlZmELnessvDFehugbXOjP0MX9ApOQugNDTwLUzxWr0NR/nzzIk8AcfM2C+o4snvxnSdn8BTW/
	Sxd45SfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgDO-00000000ijU-47Dq;
	Thu, 14 Nov 2024 20:13:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgDM-00000000iib-25YV;
	Thu, 14 Nov 2024 20:13:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9FB525C4D33;
	Thu, 14 Nov 2024 20:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1D6CC4CECD;
	Thu, 14 Nov 2024 20:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731615195;
	bh=km/eEsWSrKWhwTGSdpfnPapg/ccwqeJd2W0uboQT3Ik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=luW8tAlntLOADt4NhTwlSuS+DjwgJJmoxXUZCfmke7+Q689FsPQRF4tsc9GlmIIBZ
	 WtmcM3EmH+VAj0pgkFW6iNb9NFFxMmBwh5ruJAerpH+iHiHEqRvlzcl8diAgoAALoh
	 KW3Ae69yJU4xuB8HA7nfnR6ysXfTt27HCJy9pIAV+0ThuYsdu1DTLg92kcw/iFBBwA
	 9FenclQfTbh6sq6ktWPGuxf/HOKYikd0zYzMhTbN7h7SwN785DCAx26SBp/cChzMSL
	 QyJdlvaIyTBeOOfN2PaaVNoZq7vwHUsr/FG1C/rzARiyRZWDbkbegbIfZGQQY3g+7E
	 F+ic/JacQ5yYA==
Date: Thu, 14 Nov 2024 20:13:10 +0000
From: Conor Dooley <conor@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 2/3] dt-bindings: clock: axg-audio: document A1 SoC
 audio clock controller driver
Message-ID: <20241114-zoom-wanted-7dfda7d36f6b@spud>
References: <20241112230443.1406460-1-jan.dakinevich@salutedevices.com>
 <20241112230443.1406460-3-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
In-Reply-To: <20241112230443.1406460-3-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_121316_590609_E3C89608 
X-CRM114-Status: UNSURE (   7.32  )
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
Content-Type: multipart/mixed; boundary="===============7166229803815385572=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7166229803815385572==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="K9ZM2+nYnJZ83qMp"
Content-Disposition: inline


--K9ZM2+nYnJZ83qMp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 02:04:42AM +0300, Jan Dakinevich wrote:
> Add device tree bindings for A1 SoC audio clock and reset controllers.
>=20
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--K9ZM2+nYnJZ83qMp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZzZZ1gAKCRB4tDGHoIJi
0l/FAP432TheokBBb1mXfuGWT800uk2Ed6s9mOkVQncD9I71xQEAur/YW7sxvZL5
me+5Anm5adO3g2uYoZ1Rsp/Lyny2Ags=
=KugJ
-----END PGP SIGNATURE-----

--K9ZM2+nYnJZ83qMp--


--===============7166229803815385572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7166229803815385572==--

