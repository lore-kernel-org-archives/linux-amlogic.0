Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAE9C3ABBE
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 May 2025 15:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ubwl3jmYfPS02Q4+jBE4hIFTpGByrLMreBMLNtTYb4M=; b=eqTXn1PvO/OUAc/Wb49DAN7AIP
	GIKc7uJFhM5+5pYqeKzf5YgiLbnHj8tQOflonkSwlrUhON6NTu7QG8JdidMGutholc7lDKLnCb4Sl
	a5wVPPIpT7vqx+y3ymymPEiJF/ntE63gFRQn28iTf39wlBkse4EP29xAOcH47eUVLZbTOsSOwCgcs
	U5Ko5r8L9A8Kyxv4wyBK44zvZrOiSK0RUD9O2+ZRa1HN9TNewAEj3iocNg0lnpEKeedzOXfCChIYx
	R9Geo+GGyXFA2UGfaMhCgqKw2fGo6Tz5N+KMFrfuXuf61kYrtd5M6pKLwi9qKNHFWjTI5hArHPeSc
	ZQGtgqmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3Ae-000000018PB-2gpk;
	Thu, 08 May 2025 15:28:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2Zd-00000000zmX-19Hp
	for linux-amlogic@lists.infradead.org;
	Thu, 08 May 2025 14:50:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 042FF43D32;
	Thu,  8 May 2025 14:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12324C4CEE7;
	Thu,  8 May 2025 14:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746715808;
	bh=Fy8C4VUCTqo3ySjqlhBabDqwrzsmZ4nkLoYPReSi/sY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z+M9OZh3xL+Cbfb2Uz0mclgmyDMz0d2cCrjI45KKCaMFeJFYV2ND9fPzfuI7wKpW8
	 RdL6nPCoIgRDfk8gvtSh4eGoNF1kFbPq5cCjJkTAXlb8HHREcON8e1hvUbwciyzyLH
	 uMDTYjuxibaVUghc0nDrvO38ODUN4bS9pp+uokBU6W3uZqPT7lnIuVkjswFzrBCHI0
	 Kfu81tcLA+Bvm14qTgk8hV8snvNse8/eTcgkA4ZxszPXfX8dUBQPHIqyQ4uyYAcDO1
	 VyHkIYs4rPr+gM5vHjnZbaZN+H+5V5J0Me+uNjMN7FuQKMrZQ+gnVYfEze8sofIWQB
	 nOWxokYERitpw==
Date: Thu, 8 May 2025 15:50:04 +0100
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: amlogic,pinctrl-a4: Add missing
 constraint on allowed 'group' node properties
Message-ID: <20250508-friction-alkaline-eb7a13adfd32@spud>
References: <20250507215852.2748420-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250507215852.2748420-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_075009_332684_9AA38020 
X-CRM114-Status: UNSURE (   8.55  )
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
Content-Type: multipart/mixed; boundary="===============4543904661104015680=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4543904661104015680==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8tifkVQIif/uYh2+"
Content-Disposition: inline


--8tifkVQIif/uYh2+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2025 at 04:58:51PM -0500, Rob Herring (Arm) wrote:
> The "^group-[0-9a-z-]+$" nodes schema doesn't constrain the allowed
> properties as the referenced common schemas don't have constraints.
> Add the missing "unevaluatedProperties" constraint.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--8tifkVQIif/uYh2+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzEnAAKCRB4tDGHoIJi
0oVDAQDMi8soyiPVhpBpLfEFuyYCWl4lF9cfYxPAEoX5IXL0bgEAha4WdDsoiQtW
m2PJDug/Jx+98RsDsFgvfNbXOR1KtAQ=
=+VMJ
-----END PGP SIGNATURE-----

--8tifkVQIif/uYh2+--


--===============4543904661104015680==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4543904661104015680==--

