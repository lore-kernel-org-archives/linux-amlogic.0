Return-Path: <SRS0=/s/K=YR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B17BCA9EAF
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Oct 2019 19:04:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00BEB2070B
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Oct 2019 19:04:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HZPduu40"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00BEB2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=the-dreams.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ai/T7xQbFSkC8A87l7BH+jbg8QFdSwOov93wgWtx3sk=; b=HZPduu400yJqZ19m+TkfRUiE5
	f/jxtADZGZb+mFemiNO2CuyzW4lOgh6W/ggoXCfuMOuMvum7ph7q4KUHUB5dcPPEtD17QBkmzPCUM
	q9ACSRLnzrBHOkHH1h+XjMVud70fswzY2amTJKziP4tmBB7XPgvC66zbHjbV+CM4svGWa4yRldO/C
	TVdTd2yxWjIytO8gJscV2H6T3bN5VsiP+nGOScqYJKhM9HxyImhVbWhrteV4hngrSFbRuDsv43DDs
	PjfxCJgX+FWOcPP4ImRKwFPOcZBCXz7nbT+HeYWDeYTj+YJTBzbthLF0O1HPg/+Wow0qz6LPCtogR
	zMSOwy7fg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNiP6-0007XR-6A; Thu, 24 Oct 2019 19:04:12 +0000
Received: from sauhun.de ([88.99.104.3] helo=pokefinder.org)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNiP3-0007Wx-2S; Thu, 24 Oct 2019 19:04:10 +0000
Received: from localhost (x4d0bc9de.dyn.telefonica.de [77.11.201.222])
 by pokefinder.org (Postfix) with ESMTPSA id 4C7302C011D;
 Thu, 24 Oct 2019 21:04:08 +0200 (CEST)
Date: Thu, 24 Oct 2019 21:04:07 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] dt-bindings: i2c: meson: convert to yaml
Message-ID: <20191024190407.GG1870@kunai>
References: <20191021140053.9525-1-narmstrong@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20191021140053.9525-1-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_120409_262057_0DEF1A2B 
X-CRM114-Status: UNSURE (   5.41  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Beniamino Galvani <b.galvani@gmail.com>, robh+dt@kernel.org,
 linux-i2c@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4911028081679079750=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4911028081679079750==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="df+09Je9rNq3P+GE"
Content-Disposition: inline


--df+09Je9rNq3P+GE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +maintainers:
> +  - Neil Armstrong <narmstrong@baylibre.com>
> +  - Beniamino Galvani <b.galvani@gmail.com>

I need an ack from Beniamino for this.

Also, do you want to maintain only this file or also the driver? The
latter would be much appreciated, of course!


--df+09Je9rNq3P+GE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2x9aMACgkQFA3kzBSg
KbYdvg/+I66+7PaxoK7MBHF/nRgJqPVDLQhjQDooZshe6FUVx8HXsHSFQDULtRqi
tIw9QoVOtDxrcF+Z+v6XqdOXEZhN1d8pai4kIQqwT1v3xoAcmxIubyws2E8YqCGp
IXaQmA8BY/cDVmPzTlbJwFVGoMWMsNCCAJV4iwJtwAlVUZIrxTsvg768wgdW5LIf
NVhBmLpzL/Hsq5G21rQA2oYk4FNZDCSjFARRTxGRVC05mzqRHTmyM3SMC94HKDS9
i5X37Hxxa/0SlrdE/33pg6mqULeZ87tP8BADAsKpbAuCFQqZ2OrUNbZwn8wajOLE
E4Z4svOFOhXryo7N4T4wWW7wcOAXhybE65YrHFrLcqfTrYaXqc4gKDdOyC0ve5g+
EtYxDjsJe+7YGIl/HDw9/YiGglcCwAYnIKAtVn+RFwtCWvfJWJ+mBQcOj4B/GWl2
zaOhW6y4mAgiFezJg2B6j7BbZKUYI5usECiGU2QCI862/OTicX5nliEO1KYl4XXi
BIPVmSdQSgjT/OqzrzgwsZlhRIzH1ON/aFKI+BaWC4a5vuUmB0vJa8/x5wnDQxNU
RUWY2dmH/3FeBpz2h6lqBfIJZmxYxRopUJyPsXe/rR+11Hgch/zjyt2LOvCWlcP0
sPNMJmBFnW+hFz2fGNdlIlzzOTP3zNX6pJftw2lROMWtn6VhDT8=
=GtGt
-----END PGP SIGNATURE-----

--df+09Je9rNq3P+GE--


--===============4911028081679079750==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4911028081679079750==--

