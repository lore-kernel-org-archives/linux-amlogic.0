Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C17C7115D
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Jun 2025 17:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UBe00oSZOvXm1I7nPXayuYJQd0reuG2D7k6l806i648=; b=zllQM7wFPdoEybShXYJsTPJlo7
	Zhpi4PXWnwKEJf/LYHaNc9j/JD/d0lcxoxZMVVNb1sDnSW65gCx83wJ8jUwOGeOqw+arU4SvPOSX0
	yJRuxviKibrWPfP4FxmOpug+cJkW1Yyvx8V9fopdqyUcy2vnu39NVIgt6oIf9AN9+2RjiohcJEYHF
	Lu90PoFbPql8epV31oGHwbrS2jt9moaPEZbRL0hzNTVy3yK7fr92SBKH+9pijtYWZJJeuDcPLXMLy
	kuoxT/l9pfIYVyWyKQ04PCmdOqLxsgSlQ4gMZ813xhvB//dQho6GblJxZdpFZg6ZwjGTqVnYfaf4p
	TQ1styPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwSL-0000000ApuU-3rst;
	Wed, 18 Jun 2025 17:20:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvCE-0000000AfL7-3Q06
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Jun 2025 15:59:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4D16D5C51AF;
	Wed, 18 Jun 2025 15:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91689C4CEE7;
	Wed, 18 Jun 2025 15:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750262369;
	bh=Wtb8tXk3Nd9IYbRIl8BcSYz5FJ+EhtSHNfMIyCzbAz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HzrhKUIFDPECt7gIRMmvqCTDKzg/kngQ+xraRJ1Mu3OefcR18v8gJ7uYGHr0pgOiF
	 7EMh0xflezt0LLQ63WQnpPaS1ZfKPsMQGVfxFgbxrT0YGYqzeGmCcpwp+eGUze4MQ/
	 910UsRP+2RdyhooqomAJaniuwOsl/SVin8DdynGFitYBSd8lf0fUfM/PMJYHUvzTAE
	 jTD0La3e6CEviozKybSMEZJZC24QJj3pREtWvx8Lvmp53njD7TEHt3uxjpXsptOAZ0
	 D+NLgEqxMbhVq2qCQCviVMhVM5plnItMju6FfW7G/cFBxFApmq0sxtBLTzXygoTnmR
	 EpJfQJJzzUTQQ==
Date: Wed, 18 Jun 2025 16:59:25 +0100
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Sunny Luo <sunny.luo@amlogic.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: spi: Add binding document of Amlogic
 SPISG controller
Message-ID: <20250618-sermon-unluckily-364512d7ee05@spud>
References: <20250617-spisg-v2-0-51a605a84bd5@amlogic.com>
 <20250617-spisg-v2-1-51a605a84bd5@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20250617-spisg-v2-1-51a605a84bd5@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_085930_883693_18131F08 
X-CRM114-Status: UNSURE (   6.34  )
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
Content-Type: multipart/mixed; boundary="===============9156743697791814651=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============9156743697791814651==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j3A6DDGHly87vWDS"
Content-Disposition: inline


--j3A6DDGHly87vWDS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Acked-by: Conor Dooley <conor.dooley@microchip.com>

--j3A6DDGHly87vWDS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFLiXQAKCRB4tDGHoIJi
0vFbAQDkAoiyjJWHA9/lV1bpTRiJToatKdq34ZG1aRKkIaWyugEAwan+KTlmc37u
Db0V7HH6rDbsJ8C4rkutrGQxo2xVpA4=
=gh78
-----END PGP SIGNATURE-----

--j3A6DDGHly87vWDS--


--===============9156743697791814651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============9156743697791814651==--

