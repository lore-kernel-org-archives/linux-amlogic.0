Return-Path: <SRS0=+WvW=DG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89428C4727F
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 11:38:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4061A208B8
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2020 11:38:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Eiy9JVKd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="hdzI0LjR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4061A208B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hq7BWykolSjY+/ZKW78wwIV1sBkz2dHV9X/ZdlmGgbo=; b=Eiy9JVKdyS+nSJt85Bcwg2/Gt
	qQSCEPJFa2hiG4g5NbV4FNZjQL8xZGA5uyXLZDdmNMet8exbNqeHybc7mL1rUXvL1w+Czs5NEVZPs
	sHUPR+ZwIL/aBRPKuULDWjYA/4QJblcOaEJEh6BLPa4tLAnujl37e6hCDFQInr4jGCSrULVkYWtc8
	LaU8djD0oSTfotCmg5FhgpT/GvUGitIGxt/GfKwjfE0icS7o7NwZypxIX7xL7PypHbtPddjP360mS
	q2f6bL5ssxMGBpUiZx5USbGBaY1WoET8h/nwAERZumRx0AgRtLcQKSnujkTCqL4FYpIPm7qJ9FLyY
	DqnKpih0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNDy4-00038L-O8; Tue, 29 Sep 2020 11:38:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNDy0-000374-HM; Tue, 29 Sep 2020 11:38:46 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6554921924;
 Tue, 29 Sep 2020 11:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601379523;
 bh=a1gSTFeVH3iQKCsomWRRIF1vuKiVS5UiB6voFxEywig=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hdzI0LjRLhiFG0H47FIBQWDcq5DX1OrXKHvX76qVWK0yBh7qixa5RtPKtcE8g49eP
 849mw8WVqgX3AJpUqyOH01WQOeFbrbw/M492DQxRltPOst6YZTph/nyc+VD+s81Egu
 Ct3VdN9U6DSJGkK9104YvlYtXkg0L6SNaTM2JCZ4=
Date: Tue, 29 Sep 2020 12:37:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 00/18] use semicolons rather than commas to separate
 statements
Message-ID: <20200929113745.GB4799@sirena.org.uk>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
 <160132172369.55460.9237357219623604216.b4-ty@kernel.org>
 <b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com>
MIME-Version: 1.0
In-Reply-To: <b1174f9be2ce65f6b5ebefcba0b48e792926abbc.camel@perches.com>
X-Cookie: I left my WALLET in the BATHROOM!!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_073844_656069_D9CB0646 
X-CRM114-Status: GOOD (  16.70  )
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-acpi@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>, David Lechner <david@lechnology.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-block@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Julia Lawall <Julia.Lawall@inria.fr>, linux-crypto@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net
Content-Type: multipart/mixed; boundary="===============6744745016173010454=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6744745016173010454==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0ntfKIWw70PvrIHh"
Content-Disposition: inline


--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 28, 2020 at 05:45:24PM -0700, Joe Perches wrote:
> On Mon, 2020-09-28 at 20:35 +0100, Mark Brown wrote:

> > [1/1] regmap: debugfs: use semicolons rather than commas to separate statements
> >       commit: 7f4a122d0b50b40c64d24a5cf7aafe26dd9487ee

> Rather than replying to the 0/n cover letter to a patch
> series, can you reply to each of the specific patches in
> the patch series you are applying?

> Otherwise, it's a bit difficult to figure out which patches
> you are applying.

Feel free to submit patches to b4.  Ideally things like this wouldn't be
being sent as serieses in the first place, there's no dependencies or
interactions between the patches.

--0ntfKIWw70PvrIHh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl9zHIgACgkQJNaLcl1U
h9AUrQf/V6+K22eTWHbMJo7Z/GUR0aZ8ZbPiLfJjhWnbSq+gQVC1xnbSwQx7hDlv
+AoeDaVjgmnGS3YtW/c1K8e4d2SFvxR89a5I5U/dEtc/j/N/5vnGgwxjLDfN5xUC
lV2F+ftiHGIRzn0ojcUVOj6hEIqnGvkQe17key6Po0TlZuuoZE+eh3mfbajDeYCs
/BJ39skDi0g8xqOY8V8qZAoH/Bowz0xIroEbdg0zbM78UIOi2Fzxl5MSXapN2Cd7
o9QO7lsPCWxberp7ZwIUg6cvYQnjBE4ZZRGsfnzuPRH4fptLRzDSZRJCSW6IqH8s
j8rUaeCv+XQBPjpBvj3FJIUWXyI5QQ==
=kEnh
-----END PGP SIGNATURE-----

--0ntfKIWw70PvrIHh--


--===============6744745016173010454==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6744745016173010454==--

