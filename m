Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E717CD3436
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 May 2026 15:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kaJAJC9X49Dq2TQqOXzo2xK+XMItHTz6BqNfpAOIHXI=; b=4FcfxtddbXBRAmcQZuYSBcRdpq
	hpUTlmiN4oIcshLqNeKf7oD0LQVrPsnZxGcJ5dBDbba+rJbzThBb9kzgEH6kLpMEhkSHzpAYWIS5B
	UC/7ZIj/sFP5VEHo7gMV1tZL31WPAacX+tkzpYtfuMCizmxvA1LmkfEIrDaTvm5HJCuR3tQL7UM9b
	/5yA6B5CzDI0E4pT8eh32WUY+FI7pCUmGWBov0pypnoqyizKq4+UDCjseQRCOXsdJGZU2Dgf2yLRx
	U9kUyWi9Z4G7xoHkzWb3v7Ifcm1YIVKdbtt5/RGtrfmo6t+mmhonq0FpEeGnp0CiIt/cWV+CparPp
	3QUqvBew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMjR-00000006lUi-0UtQ;
	Fri, 08 May 2026 15:03:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMjP-00000006lTf-0KTJ;
	Fri, 08 May 2026 15:03:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C1F3E4333C;
	Fri,  8 May 2026 15:03:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A866C2BCB0;
	Fri,  8 May 2026 15:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778252590;
	bh=NM5ozFdNjhLrCOorefIKlM0r0GV3bwA5Z7mfJpSCFTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WQ4Dt0cYgrEmfgZNytRHShXRSiBtAJ94LPbT20bmRuAlEFS7fx0o0NPzU1r6atvfO
	 v2XvyYmw7DGJPCU3ym0FhuBC7Kxs16kD7juYgyBMvYGVpjegKUkJ/soWBgN51q2fd4
	 yqXRD94yq4SY6sryRPpj+ApMh3gV34t7voX/U+DHTVgi+lHoyus6oiwvrE5EZD+29B
	 8v7akqzLsVh8yOkJUwx/OWUmmBvuwZKLvrWbNpmB96paITHyoSkioVrw1H2g57Kv6d
	 cVXSW0l70FlPcNGUw/yHDST8IFRxEIei1vcirTre2S+YVe/t9alh3cewMgLkP3NfQN
	 TKGsnfeVq3uMw==
Date: Fri, 8 May 2026 16:03:05 +0100
From: Conor Dooley <conor@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Thomas Gleixner <tglx@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: interrupt-controller: Add support for
 Amlogic A9 SoCs
Message-ID: <20260508-barn-stoplight-b51074b42891@spud>
References: <20260508-a9-gpio-irqchip-v1-0-9dc5f3e022e0@amlogic.com>
 <20260508-a9-gpio-irqchip-v1-2-9dc5f3e022e0@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20260508-a9-gpio-irqchip-v1-2-9dc5f3e022e0@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_080311_136098_B94EFC76 
X-CRM114-Status: UNSURE (   6.74  )
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
Content-Type: multipart/mixed; boundary="===============6444866772670955435=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6444866772670955435==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mlnt36XCcXWZcNH3"
Content-Disposition: inline


--mlnt36XCcXWZcNH3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--mlnt36XCcXWZcNH3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaf37KQAKCRB4tDGHoIJi
0nLMAPsFCeq/96IK484wEU77o/cSNulu7ivTsIutSLq8L+VP7AEAsziQTnbLvns0
lUzVz1X7li6jbxx7sUng/Wq33cMfcgk=
=Xg4i
-----END PGP SIGNATURE-----

--mlnt36XCcXWZcNH3--


--===============6444866772670955435==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6444866772670955435==--

