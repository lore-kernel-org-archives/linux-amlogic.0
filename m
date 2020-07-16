Return-Path: <SRS0=svws=A3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 621BFC433E1
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2020 14:35:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32825206C1
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2020 14:35:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zTIxBPT3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="d5zWQW7K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32825206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RZpoeaW6OJVx1qx+S1xTZOujchPjdxktKdyT/WyGeFo=; b=zTIxBPT3ykhtzmhO9/FjWRQxb
	aoHZdAu01Oua94qgq7Pp4hV9L9s/hHkYOZAFnm8SbStn4BJaPdPia39s1crdp4IQrlcCQ2vsLg0UQ
	WfHmAAvKwewSWey5Pkgi6oh9AiSCjkuQIck38OsZnJ/j9X7cgfLTT6XehwsK46Pp2DDvOFAWTTQ8o
	F5AdXSCyE+gWbe6gDNJcPX76wv6l7Ae2Pap4KqOEgEXkj5Knxz/ipcOBOsHkhHg6LpcfCAmjC5phD
	XHZ7aCO33MqBdO4AU1OhrylK5XjCBo5Cq3+wbJhuduMdYHpvgXKgJDzViAXqTq0fDoduwC/AI/7qt
	E3TRsl1FQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jw4yW-000817-C8; Thu, 16 Jul 2020 14:35:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jw4yT-0007zR-5b; Thu, 16 Jul 2020 14:35:02 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D4C7F206F4;
 Thu, 16 Jul 2020 14:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594910100;
 bh=nxkcrc5P7Qd7poz1LmdDvcMFnguH4wq4okmKRFsmWhw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d5zWQW7KcwQQwGsZLtlihkD9diBPlVE3DBlaRFuftlKxZJ9FVattsI4I5Lc5ENbS6
 68oniVnmgwkk+HemvqlyT3+a+Hh1TY0Gnd7IxVfpyVYoSt8jOuG0WBzyiv3oJVZgbP
 AkJnG3L9x3uLfQ8tI5QQ0QFX+YzK4k1rEXAGhr6k=
Date: Thu, 16 Jul 2020 15:34:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: add the missed kfree() for
 axg_card_add_tdm_loopback
Message-ID: <20200716143450.GB5105@sirena.org.uk>
References: <20200716132558.33932-1-jingxiangfeng@huawei.com>
 <1jzh7zegfw.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1jzh7zegfw.fsf@starbuckisacylon.baylibre.com>
X-Cookie: This login session: $13.99
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_103501_745069_3DBE9E0D 
X-CRM114-Status: GOOD (  11.76  )
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
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com, khilman@baylibre.com,
 tiwai@suse.com, perex@perex.cz, linux-amlogic@lists.infradead.org,
 Jing Xiangfeng <jingxiangfeng@huawei.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4886400206966047145=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============4886400206966047145==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ADZbWkCsHQ7r3kzd"
Content-Disposition: inline


--ADZbWkCsHQ7r3kzd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 16, 2020 at 03:29:39PM +0200, Jerome Brunet wrote:
> On Thu 16 Jul 2020 at 15:25, Jing Xiangfeng <jingxiangfeng@huawei.com> wrote:

> > axg_card_add_tdm_loopback() misses to call kfree() in an error path. Add
> > the missed function call to fix it.
> >
> > Fixes: c84836d7f650 ("ASoC: meson: axg-card: use modern dai_link style")
> > Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>

> Thanks for fixing this.
> Maybe it would be better to use the devm_ variant for the name instead ?

Yes, that should be more robust.

--ADZbWkCsHQ7r3kzd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8QZYkACgkQJNaLcl1U
h9B59Qf/cQ/Ssu6kfNi9QbWnYWdZOWPmbzLXNPPSbdpuW2McJvjhrFAscgfM5b/m
+ShTyHn5oEztIfyoIXlaCPsfmNJRBjLotRdmo8xlZ3FyzgxAE810aNDKwR4uaOnv
lSByiQZOnNa3EhV5P1naQaRf/MLw35gsHixOxQBO3kLkkokx5GpL1F1quQC33N9l
cNu6tviX29PziUhmYNdjr6nhhSsHB4qC7+l6YwQmR3DzEPeVTiW8b1lWsmWL1YQq
fhLlNWrqQSBTs01/EUEmvCHnHZZTZUhJRpIozH8eGjvhvg9YeY1nRj0ggxClpGHh
Dzc0HtU/KTKfLk8zhuQLhLrKBKGvzg==
=gap3
-----END PGP SIGNATURE-----

--ADZbWkCsHQ7r3kzd--


--===============4886400206966047145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============4886400206966047145==--

