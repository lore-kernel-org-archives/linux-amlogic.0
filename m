Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017FFCD3442
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 May 2026 17:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWjaM1I9FobO19knIii2OapQq08OS+DEGFH1Jnap8Ss=; b=wHdNqBArXUK9/COxHhBULI0BJc
	U4vWtQW7EkyioCb8SwVWjgY/9LPQ2ih4l5cShOXnyEEw3VbK6ikHGvV+d7VeOh+5Y1aqKLFJtrPA+
	BbkvPnQaXcqLWCChnU1Ew9NjX8K2L4xD1RtYbxPBXL89yL0z1dHmbb7qb0yDI91b6D1aQFxOjxt/8
	B3dhOq07CRk25YGVlTNrxlPtjcWVPtBYweo3rKPcZ0NQ2q8Bw4zSh9rxCN3R/IX+u+9e9YtJOm74F
	mZOH0Z28sp4QFWjHU0SFWcJL5wSX1VoLkdfOM2yJnBJoQ0Nr2XchAnp4N+w5WZP8dbP5RFhnjbWSf
	f8v8acnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL2Ss-00000004TT7-2AvI;
	Thu, 07 May 2026 17:24:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL2Sq-00000004TRA-3E57;
	Thu, 07 May 2026 17:24:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 373E06024D;
	Thu,  7 May 2026 17:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F400C2BCB2;
	Thu,  7 May 2026 17:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778174683;
	bh=P2uFCtkUNsia+m6fpAEh1XqkuX3NtaugGNibOKloo4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CpwAj9kc8UHoERSQHR0XSVqory3ohRb6FqTA8C81qrIvv/U+4tAaRBmUd5plpauW6
	 O2+JfcJ/rrfXrnYcdDnCt4nXNbQ7v8EyO5n7h3FzT2LaOIxaF7axtWgiCEMU+q6X3A
	 S+SXGhN92RGwwBvB1L4ZrstRVtXNn95gG9/V78z9EnqRy/Bkbjcn9Fbb7RhN/K1eUs
	 LPu0e+wfwM7aZMG9k9BAxL/mgkZkFnHfloGEYsd48Oj1b3Pct2pPAN9xwN8aMIBJbH
	 ZAIPpiwJixuexPRRoCx0FKTdHCo8iikc2sMAFS8fY6VLthtXyBd5rRsqg/1CTTB/sd
	 TsYOru+1Mv6yw==
Date: Thu, 7 May 2026 18:24:39 +0100
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 compatible string for A9
Message-ID: <20260507-juice-helpless-b04e31e10778@spud>
References: <20260507-a9-pinctrl-v2-0-49774feff2ef@amlogic.com>
 <20260507-a9-pinctrl-v2-1-49774feff2ef@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20260507-a9-pinctrl-v2-1-49774feff2ef@amlogic.com>
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
Content-Type: multipart/mixed; boundary="===============7014333791645555260=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============7014333791645555260==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hcasBY/b5pRydqvZ"
Content-Disposition: inline


--hcasBY/b5pRydqvZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--hcasBY/b5pRydqvZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCafzK1wAKCRB4tDGHoIJi
0lmTAPj2IuWZOzkdHyd1WG3b7KQWEm0yZDOhSvUgbOssnp7HAQCGYO2izgbTLuuW
g6S0C7Z2i/91Jf5RCru9LETDYWvfCw==
=CbFS
-----END PGP SIGNATURE-----

--hcasBY/b5pRydqvZ--


--===============7014333791645555260==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============7014333791645555260==--

