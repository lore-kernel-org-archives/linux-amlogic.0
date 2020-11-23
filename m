Return-Path: <SRS0=nSpp=E5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A07C388F9
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2020 20:45:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AFB820721
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2020 20:45:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="27xOE0vZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="dI6Y/FEB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AFB820721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n9xSiRn6Tg8VyCy/tKF3uu0s+lzlxloSMFGlyvdRuZk=; b=27xOE0vZoGeX+UkZC8cl7XPdq
	EgbjriCasc/djY/mCg5hSo+nBaAGuZfPHvfuXDJ/9sOXKkPEJhsCpY6bCYDsGz4ltuvYgnZiJ89D5
	3T5rjgjC5LWgGZlVR1YHcS4jxat3hK6qC6Iy+B44PzuEaupM0TjYxWfXEQYz+ksaUz6rpjrhi7pcf
	Z2gb9aMTalA1I9a1hF7SLMB9UU/T1HRqtZ6gHSZH7z8+ZpVCzrsqyBJJr4P2SUnjrHFjibQ47i/3K
	E2AaW3eNQ5KRpT7I6o9zOx7D50cCX+Ix+xaIaNmct8Uv6zMg4N64EPv6048MM69iqF8OeZQaGzomH
	67C6FpZKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khIhu-000781-Tw; Mon, 23 Nov 2020 20:45:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khIdq-0005Il-Kd; Mon, 23 Nov 2020 20:41:32 +0000
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BC74E204FD;
 Mon, 23 Nov 2020 20:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606164053;
 bh=l4oI3EJf9twL417qKLDDDLHkuxNIhLOKXfN3lkF6Kxg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dI6Y/FEBhMomP9yXJDZL18c5N1fJUnSufmLsfsEErCEx1I73uujBVn+VmR2nTBil2
 7st2qM1JoV+aEr2XQJCNbg/JTowpnkJOkAAUW5m9jaxq8C/w1ZUMTqrjWm7inA4kgh
 US9uOR3tP2rC+WdSErFnKjZ9+DgugTP0ToQkJ/y8=
Date: Mon, 23 Nov 2020 20:40:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/4] ASoC: meson: depend on COMMON_CLK to fix compile tests
Message-ID: <20201123204030.GA21709@sirena.org.uk>
References: <20201116175133.402553-1-krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20201116175133.402553-1-krzk@kernel.org>
X-Cookie: Will stain.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_154054_854649_DB4ACA37 
X-CRM114-Status: GOOD (  12.85  )
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
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Olivier Moysan <olivier.moysan@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 kernel test robot <lkp@intel.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: multipart/mixed; boundary="===============2856316639986370325=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2856316639986370325==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Content-Disposition: inline


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 16, 2020 at 06:51:30PM +0100, Krzysztof Kozlowski wrote:
> The Meson SoC sound drivers use Common Clock Framework thus they cannot
> be built on platforms without it (e.g. compile test on MIPS with RALINK
> and SOC_RT305X):

This doesn't apply against current code, please check and resend.

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+8Hj0ACgkQJNaLcl1U
h9BQUQf/Zb+qnudCOxcpsy60ses8As7w+FYZS80ubduXvGWgILbXemT1oMzbNgmK
OBkiqTnFNc6tff+PV8KL223IYl0NE87wbj+TZtPLS2kwcmLzGYN5Nk6tOJ/BqNaL
NZGwQweuvCXNOZgVaqRuCp2am79NZzjniDlGELtbcdX1bnrbKQqrpfl+OQYOXBxs
u/xwWXzpd63eM4B4tN8a4S3TsUzJvuypdWshYHELUV5vsxSCXp1NWiire0N1SPO7
bnkqkZUg10ymAq75x5OE6laeMbsDfwWnS9tRnOJxnN4H8oTMcmzxTQiFD0922P0s
w0Jrqx6xOb9ZoR7U22kR1FHwhkpH8Q==
=Zs8x
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--


--===============2856316639986370325==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2856316639986370325==--

