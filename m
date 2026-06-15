Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CB7CD98C5
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Jun 2026 16:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igD46Hl4/zphWwRkgcpRvFqRPnJ12B1ib7m8kbLO5yE=; b=4Q70cFdp3f5+Kgw7aTl/sH0Xzh
	1ktJhPqjA7fiQE8AY8YZgf34jasqo2o3f9Rr7dssS+3cCxB4MIHrAciUT1qxNqZ8e28IkNC37kEu/
	d7qdNy+ufyDstiCCTBYOoV6W4m9rjkK6snDYoOMCe7xNRbaR+LolrB1ExpTSpzkIpC5uc3TzY3jgO
	J68mpSaPbIh4dLrOc4W7LTvjZuE1fuvLC46+73PCMXfZXcxDfgjdLrvljjOz7nIeWLvukgzlGyKB3
	D31DrdstvYXPYsSqTt/Ni4/rrIveqAGLTHTGOVwDInr9ecRWrjakK8tLND99Fu30nxfQa912geVym
	BUVQujDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAXi-0000000Ebgr-3pbW;
	Mon, 15 Jun 2026 16:52:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAXi-0000000Ebgh-0QGh;
	Mon, 15 Jun 2026 16:52:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B2BA600AB;
	Mon, 15 Jun 2026 16:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04DC1F000E9;
	Mon, 15 Jun 2026 16:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781542329;
	bh=0oPS+Y1pYLh2LoThtzAEMH5rc8g5VXbsmKl4ASL/bE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BKZ5Tb43YYrUg1ln3/B3cJ9bwglkhABMmJRVElKe62Jz9oCIljLckqtwlCHuV36cb
	 gaKNzgMuQVRwSJKVEqkqTlX0GSp4lKyFxGxurLqgC3o1PZq4NKRu6RQ8tSaq0ZVBkp
	 CFX+gmhcYc/ps8dqk8AxGpRvc2bwWxz/GqhDqgBhVYmdxxMl+CGSRG4xIX3JabxiB6
	 sElsBfK3Zj8uXhf77PRzFIKNnva7m1vLuWjTvUNgj2CcIiCl7T1U3ggApt/vun6mHf
	 TEXE7PX5Zk11K1mUsBF5rDPEU/k3Gdfcn1Tl4zL3DvSXTOdRp6/YvnEe1z12T94ePk
	 aM84bdmQqhTTQ==
Date: Mon, 15 Jun 2026 17:52:04 +0100
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
Subject: Re: [PATCH RFC 1/2] dt-bindings: pinctl: amlogic,pinctrl-a4: Add
 gpio irq property
Message-ID: <20260615-ultra-pagan-84de490070e1@spud>
References: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
 <20260611-gpio-to-irq-v1-1-12201716f23f@amlogic.com>
MIME-Version: 1.0
In-Reply-To: <20260611-gpio-to-irq-v1-1-12201716f23f@amlogic.com>
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
Content-Type: multipart/mixed; boundary="===============8290436529140833156=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============8290436529140833156==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NjemHPfGrfprJAyg"
Content-Disposition: inline


--NjemHPfGrfprJAyg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Given Linus' comments on the cover letter,
pw-bot: changes-requested

Thanks,
Conor.

--NjemHPfGrfprJAyg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajAttAAKCRB4tDGHoIJi
0od8APwK8rXpQw86pv1NXaMpKqdBFRw9Bu135w/2LvMhUYg16QEAofCtWZ2oW1Wc
CZPw5TNiFlXIuEJtG7Dt3Lvo6SMYqwA=
=LwtE
-----END PGP SIGNATURE-----

--NjemHPfGrfprJAyg--


--===============8290436529140833156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============8290436529140833156==--

