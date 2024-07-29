Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F20C3DA4A
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2024 15:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSZRZ7o8G7PZ1juV9d0+qF2W//1c0xzhlM+A1tCdTkc=; b=RBTEk0b1Zadks4DH8nRoRq+0X8
	XdFKGN2ve/6UAJXw4QKjSw1OTOmG1X1c5jF2OjzOvx74Dl68spAHVG2nTwNk/1qdFXlnu0f8pYplP
	8FocblBK725s3B90OBlArQAj+1CE+7IqwW8Hvk2fwcK9DSxnsgYR+c1gWqrhBv8MaMEnuGD0Y9y4L
	l94RG4iSW6NJbOWbJx8sJz5hUf15yA9PtoAPKSsmNcBxVA/CHqswou4lLZsrw1jWfR5AXald+t+L8
	N9pHLUpmfYTQ114wJM5bjGm9aLI+IIbuIXGnlgPbIx6J7PNYViTZnphMowZhxP4Ufx52DqVinryvO
	ov62QbXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYSJ9-0000000BrOf-0hu4;
	Mon, 29 Jul 2024 15:29:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYSJ5-0000000BrN7-2vZg;
	Mon, 29 Jul 2024 15:29:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DBF1661B13;
	Mon, 29 Jul 2024 15:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81E4BC32786;
	Mon, 29 Jul 2024 15:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722266942;
	bh=HqkjoguZvqsKPeQskLKsPhwwJrvtg3CvezSRwjNzBws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O835ec6eJaDgRRqJR5TsUi/ibb7o8jjFGVntcxx6cOdHy75Fs1xm48CJFucmRnZFf
	 HG93JYpoIqtCTzqlpM7SBwg4++uhVy5YCk0hpzkoz6yOv4spu4kYGTS5mHk2p5UzUW
	 svG2EtDnLTM1oS2HeikUj9xQPzjmoDejAmDkLKgh6SMeCJ1FMzN9zL8umauPy9NVcp
	 +dX/cdEn84vpOylMy5wXer0T/L6YgucTgJ7wfpTkuqZkr5pFZTkpIKdhdrYiZkDd5i
	 0viI2rnol21t6NduTcBa6nVQe9F058PEwbQqtKpAc1FbnUPwyFIObVhVhm3yFpaYAX
	 oXG+XE19kyIYA==
Date: Mon, 29 Jul 2024 16:28:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Arseniy Krasnov <avkrasnov@salutedevices.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@sberdevices.ru, oxffffaa@gmail.com
Subject: Re: [PATCH v1] ASoC: meson: axg-fifo: set option to use raw spinlock
Message-ID: <7dfdade5-3a57-4883-bfac-067c50ec0ffb@sirena.org.uk>
References: <20240729131652.3012327-1-avkrasnov@salutedevices.com>
 <1ja5i0wags.fsf@starbuckisacylon.baylibre.com>
 <2b16b95e-196e-4d8a-98c3-3be568cdd18a@sirena.org.uk>
 <1j5xsow839.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
In-Reply-To: <1j5xsow839.fsf@starbuckisacylon.baylibre.com>
X-Cookie: List was current at time of printing.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_082903_830420_F1CD71D5 
X-CRM114-Status: GOOD (  15.71  )
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
Content-Type: multipart/mixed; boundary="===============3796835228260293111=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============3796835228260293111==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RyUOgkh7sxl4UhKN"
Content-Disposition: inline


--RyUOgkh7sxl4UhKN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 29, 2024 at 05:06:50PM +0200, Jerome Brunet wrote:
> On Mon 29 Jul 2024 at 15:44, Mark Brown <broonie@kernel.org> wrote:

> > I don't recall this coming up much TBH.  It may be that people just set
> > raw spinlocks when they need it, or that there's not many people using
> > relevant devices with RT kernels.

> I have not been playing much with RT TBH, but AFAIK, with RT irq
> handlers are threaded unless IRQF_NO_THREAD is set. In this case,
> something preemptible in the handler should not be a problem.

> The axg-fifo drivers do not have IRQF_NO_THREAD so something is a bit
> unclear here.

Yeah, it's definitely likely to happen all the time for people using RT
with relevant devices.  I'm not sure I have a good sense of if it's
likely to be a nasty surprise to switch raw spinlocks on by default when
it's currently controllable, I'd expect it'll generally be fine but it's
possibly a bit rude to any users that don't use interrupts...

--RyUOgkh7sxl4UhKN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmantTgACgkQJNaLcl1U
h9C44Af9HvsmmLk0VmGmh8xg7Qy0Az4bExNuz32UcirchZh1/10ZgzU4P5Z9JMdF
vpHcBjvsrLKNbqzxKAgQEBwkF0DoasgukZsKqYtM+7egDiXPN6KKvM0Uq1f2ZkNY
EhJatJ5UkZHE0Jku8I0eRLkaGi8ERu23A/HkUDa/jZ65v2iUMMxeoFh/D2MxpKU5
VXbuPlITsDbMqXMqfNfUBCT/h1jnSTWPI2bZ/WYky5GEUMfeN9ur4hEkIa+H+qBV
nvMo2aV08EjX0tZ+ZjRmt11xAXhg7CC/2y9/7gqzlZailMmIlrdtL+7fr0DTkIe8
VNsHlUV0/kkcM6F7UijIgO5lQ8Z4nw==
=Q7xF
-----END PGP SIGNATURE-----

--RyUOgkh7sxl4UhKN--


--===============3796835228260293111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============3796835228260293111==--

