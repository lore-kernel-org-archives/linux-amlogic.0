Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE65CD6E60
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jun 2026 15:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9z7q4BSZZC1iU7IDJgImtU5hV5YG4yUqs8CuL35vIVM=; b=veyu8l7ChfB/BfAT1JPeaHdgkw
	exMkp1MnTMi81Yel7Kk66injxojrfrNUjkzQQVwuovtAuJh5vLWCZDYG498GuiQ44M8G5NOiNt4a5
	JryrAHooi2t8Bn52TqW16iqFfV0g8U/TurNHKZSy42bWcYp0jKPAazZILFMBGbqNX4CXrKU/Q+8z3
	TVBn7w9XuSVwY2KrwyZhLhBkcGAMEYmFlZkHhD65Bt+5i6XP9ePsW9CbTFQcUta2lc5kq04vkatV9
	iGHSJJcDAKX/NoYCleV+Z/t+agzxk4qwkfbF/M0X3J/o/+sD0xDyFmfY6FTRi05vpOBu83G7EyNo7
	El4OfDNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnsz-0000000FT6U-0WV7;
	Wed, 03 Jun 2026 15:52:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnst-0000000FT68-3720;
	Wed, 03 Jun 2026 15:52:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E7BC60126;
	Wed,  3 Jun 2026 15:51:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8D931F00893;
	Wed,  3 Jun 2026 15:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780501918;
	bh=UYQCy62/XeJkjWEE4NKpocL+cxTPaphso0jv+Gl4KNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aO2DyS6qeNl6/06jRhz8Wq2s1LSS+9qyKwJqenZxXwgnc4l3YA+XYr33pEd7YyPcS
	 BjbHLYhf2TuAmNdeVWob7jx+YDinP1ZYZhHupOM+sqvN8r9ogtoBkY11hKkvQ19la0
	 Fh0icfuoU+c2H507oQt91EYpQIq1nmRsAk+dVu+bDTHNrAWVYFdx3zlEqj0rWH30nF
	 i4aKIXRaUa92Y83AVJOrWlG8I0cTSHCnaOFAB/LKoPtUwwl/8IahxXT+ZvIr2iIRKi
	 49Q20KJikmvmNzvzL7ffj8YdFXVc+qB9zqthuESLYkm9L/8GaLSNwj93y9biUmqnBI
	 xaxP2CfWWYggA==
Date: Wed, 3 Jun 2026 16:51:53 +0100
From: Conor Dooley <conor@kernel.org>
To: jian.hu@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: Add Amlogic A9 AO clock
 controller
Message-ID: <20260603-battle-cofounder-e61dbe47d738@spud>
References: <20260603-a9_aoclk-v2-0-f47ea616ee78@amlogic.com>
 <20260603-a9_aoclk-v2-1-f47ea616ee78@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20260603-a9_aoclk-v2-1-f47ea616ee78@amlogic.com>
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
Content-Type: multipart/mixed; boundary="===============8415402987446113461=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8415402987446113461==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KH2UgLPfdPMIqcoS"
Content-Disposition: inline


--KH2UgLPfdPMIqcoS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--KH2UgLPfdPMIqcoS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBNmQAKCRB4tDGHoIJi
0rzTAP96xbvAsmSRrQkjabFTx14yBLGyTdPq6O1/rx3e3lLp2QD+Ju+r2qcHP4mh
0EqjKT+MOMru1z0FBEQj1fzd8pDrIAs=
=ozLc
-----END PGP SIGNATURE-----

--KH2UgLPfdPMIqcoS--


--===============8415402987446113461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8415402987446113461==--

