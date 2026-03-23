Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2ADEF483E7
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Mar 2026 19:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rvcowJ/KDEFzDPoH62X1t5in0oav3b61BX6TM03dD6c=; b=XNbmZ0uUprFfELNJeTtDOQiGgY
	KFQJW4rpRCCfU6gl5vw0kpxJSie90oe3KOuRMLKMQRnIY7mA82lZ0FY4nm6tJRqqw58JXYAa/w0rc
	6+9L2HMqaNdoIKvluM8ngTlDQTqiJxZ7RlgGXGA0O/Hyhe3exevIfg+sp3bmHJpum3lt7ZkfL3lXF
	XZIy1M7jlsATUJFdHP5Y/9CKkCleWa9Ah1peUpx+3OgNiLHNrdT+vtzozP9opTZadIsz9Ze5kUKZM
	z90xizDJX85ZOCjAMxTuiF3jGSC4iotusjeINy8XjIhuY1+CyhKpOglWlXcEa8AOMmQhswOao24Tc
	+duedp9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4l6k-0000000HSo3-3ZFy;
	Mon, 23 Mar 2026 19:38:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4l6j-0000000HSnC-28SB;
	Mon, 23 Mar 2026 19:38:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 86D5C600CB;
	Mon, 23 Mar 2026 19:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CFE6C2BCB0;
	Mon, 23 Mar 2026 19:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774294716;
	bh=zjx39ilZrLD9eegnvZBoM728RyH1At0AzI9UWm21L4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SZgJ219eSO1BluKKrE0/F78/wIPyFIUlg3b1vY41BTYDdRyXHEdZg8+eiRHHgY9UX
	 VgmNCe6IBbjAHJ6zs3NPZENOLtDPeIKm3EKFsnc+y9bRDhFkpCaGvoXhqXdy5pGS2W
	 2g5gcwt53jQe6NjG1itfP1o0k+1ADBg7PGZZXLwgMs+OF3XclYBRjwfsSSu15888iT
	 F5Ew36jMz6PAm54ZE/qr8+gXSld5EYHDxbzhTh3wv76epi+Q2fEpLzkQYqS3GvRVo3
	 QXdnRXu3XuHjnPygiDXkY5FPUFM+ZGO0Ed2Enkzxvf9DNn9t65+YDJjMAYPkvltcPq
	 1Wj/giAuEfTew==
Date: Mon, 23 Mar 2026 19:38:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	van Spriel <arend@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v3 2/9] dt-bindings: mmc: amlogic: Add compatible for T7
 mmc
Message-ID: <20260323-unlikable-crinkle-cc31999aad5a@spud>
References: <20260323-add-emmc-t7-vim4-v3-0-5159d90a984c@aliel.fr>
 <20260323-add-emmc-t7-vim4-v3-2-5159d90a984c@aliel.fr>
MIME-Version: 1.0
In-Reply-To: <20260323-add-emmc-t7-vim4-v3-2-5159d90a984c@aliel.fr>
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
Content-Type: multipart/mixed; boundary="===============3307470075020001657=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3307470075020001657==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l1GQQw0YeXOQe55v"
Content-Disposition: inline


--l1GQQw0YeXOQe55v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--l1GQQw0YeXOQe55v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCacGWtgAKCRB4tDGHoIJi
0tYqAQCrWwcbdjUSvcfyVvddjQQ9LY+4jSz9SafZfg0an6LaGgD+JMXZKODbZhL5
cE/+52VOplJVr6pGlNoUkQdovcgiVwE=
=r7oK
-----END PGP SIGNATURE-----

--l1GQQw0YeXOQe55v--


--===============3307470075020001657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3307470075020001657==--

