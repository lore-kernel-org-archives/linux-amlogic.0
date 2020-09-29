Return-Path: <SRS0=+WvW=DG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A80F7C4346E
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 10:33:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58CCB207C4
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 10:33:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YuG3Yk2N";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GkV7lnov"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58CCB207C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HsPvauwMVXvlaSFLori9buHj34yUw7XMMC1IJ/gqyU8=; b=YuG3Yk2NGhoFy1zhbVYgx885s
	m68tIIK5eo7NaXOI157czd4lJui7uioS/l0DciM6dHnbUBdo3ODrW9gvDIaIFy+fI32x8KNzqriWP
	0FrMTE9ZygZaUP2Dv5RwwDcrTPIi9YXHoeUnUBslG+NBKWEFFSKaLRy1qQxHmmCuipmg0sg7sw17F
	oHaLDQDz8SRNqAiUzaFIMLsvz8DJGm5y7pJaozaKOfEZRo9/uQ2oqyKQsyMdxJZXqPN/6ZuYUptBA
	99CrxUoshYQKGzG57aOcGAVBg88Q8uYRdB80bIWx2Ats8Zs8MbWKlRaduW3ofCDeu4RY0QuUkg5VR
	5bTdYyFCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNCwy-0008P2-DZ; Tue, 29 Sep 2020 10:33:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNCwv-0008OI-3S; Tue, 29 Sep 2020 10:33:34 +0000
Received: from saruman (91-155-214-30.elisa-laajakaista.fi [91.155.214.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7DE6F207C4;
 Tue, 29 Sep 2020 10:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601375612;
 bh=bAPtax7RD0CoQ/R2rcD84KgfgLQp5cy751IU25Gs3Ko=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=GkV7lnovyXkbNt1b4tRVfvV2m/7Vnokv9MrDEeOfOSERhAPp1pmSIvLy0BaBwQzWj
 3hqCqroFfh5JtdUYNuKelzxVL5HcFaiPpwxFPmS7/WV4VLz/B2M2pfK3WdBxtWT+g8
 o0YhdAdYWFVMf93ZzdRgrc6XrAWUVEJ9GLw8ofxM=
From: Felipe Balbi <balbi@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 kishon@ti.com, martin.blumenstingl@googlemail.com
Subject: Re: [PATCH v2 0/5] usb: dwc-meson-g12a: Add support for USB on S400
 board
In-Reply-To: <5e69947c-8a91-af7f-ed86-996920109e79@baylibre.com>
References: <20200917065949.3476-1-narmstrong@baylibre.com>
 <5e69947c-8a91-af7f-ed86-996920109e79@baylibre.com>
Date: Tue, 29 Sep 2020 13:33:24 +0300
Message-ID: <87eemkan4b.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_063333_207767_0406D1F9 
X-CRM114-Status: GOOD (  10.01  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============3077096257701986700=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--===============3077096257701986700==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Neil Armstrong <narmstrong@baylibre.com> writes:

> Hi Felipe,
>
> Is there anything to change in this serie ?

I've been waiting for Kishon's review of drivers/phy parts. I can take
the rest, but without Kishon's ack, drivers/phy will be left out.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAl9zDXQRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZXiw//chxtvTjBs+jiNPt7tUMjifjIDCHu21fs
u7W2cgENV+fMPM8LHPnWYHqIKR1vb3UtxapUdmDJ3oZKncXUU3KWgJBh50Ge9pCP
JoGi3HTyz9RX/Rixq0RvCAqHOJaUIcckSiWs0R9XVdjUK6fGIeMOULYkMXxBv0ZV
2acywkHbL2/3tEzjo5SyYZymkDF2VtitAqyjo4l5E6QuKG74BiycpFumP7zv5gTp
hbXfNgJ1i0/jkrr7GrMuW5UN2D1q8IDFEl20SICrT4t2+WkN6MpTyio9Hd13xP5w
v3QVP4wi2tmn2KB+Ws5urK8ei8B4mJ/qL0RU7ayg1DCs/YrYYBJZOd3t2xLbewCD
YTnLmmbQglU4MzyV1Ksagiu96jgz015M9qNVvsPQJd+OuLPkj4M3Tgj7lpnBI0gX
3JBf/ckeBrxp6+Z9hUFcxl2Snmi7kyIlwdW9RgTkaZRzVGWZxqsibrOhQooh7lnL
gsh7u7x6yDq4V0XjrcbADfOiRh7STgCaNCiUl37RY/XNijYMBpe4I46QBH0M0O4Q
IP7mYZes99dpVNoW/1PWHbU0lAQkk2rCHCzfctK2Hme3E4btfhdE6VDt19m2+rPL
miLW3nnu6EklacrOOSGxlIu4aldQek5d2OoanvScM8by5lzwsUN2i23BQNkmqvgk
km83ncYBpHQ=
=0oUh
-----END PGP SIGNATURE-----
--=-=-=--


--===============3077096257701986700==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3077096257701986700==--

