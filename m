Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7158C04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 17:59:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E194208CA
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 17:59:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XyLpTUif";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="TlKlSZ39"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E194208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KymJ4Nqul2UrdzK8Sf7sFGyx8xJJjpAwO/I/42gWjUA=; b=XyLpTUifX2uOTN
	m1q41edI6aF7CH7RZuyeDwxViDG/lJyobxq6uy8UDgGPkVTtcVF+2jE34jFDVW7JXe173lpIXQZmU
	tDOI8fqtQwN8FzhiaCx0M1QoXSM6HXrW3zT9+Bm+uPQ4X3Qq8a1WXSdN0mQpssPxWB5jvXI/q+GU3
	aq9RS2pE8LKiXejg6i1r9x4oRi+ZMev+nQjgcJflLTGyC+kw7VMGKJRLrJvVSbF5GsxzdUHYX9osQ
	6YCFmHKWVe+Sz9Pa0rE76OvlPg7S9mvG0HdJv+SbZF6oJT0X1izY56MIaZaBPJkiUNPtXBCwrCxZJ
	5Le0qmTprtbGG9rw2AxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVJuF-0006lg-Cu; Mon, 27 May 2019 17:59:31 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVJuC-0006lL-RD; Mon, 27 May 2019 17:59:30 +0000
Received: by mail-oi1-x242.google.com with SMTP id w9so12406490oic.9;
 Mon, 27 May 2019 10:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EJGfKoNTtpHONAVVUy19xvP3ls9YinFzlhtPvuaaZVE=;
 b=TlKlSZ398+uKs8zrRJn+n5ZCxMASWZOWoRpwb/v1xRubZfj4EfH4TbS1Im4gJ3BxlW
 RS/MfkHzp0Y0zDIu44W/ZwMUbHjuC8TeawiGy6x1dpyNpKF2ltyoxFXHfYZnpTZU9H2z
 EI2jcg7Iifru4vK1s0ED8+JY1Jf5l4rGEy4C82b6A9p/x6iNPchqKyEAKBBKzPxzJaD0
 dxmaZai1MYO5bpF2MznXexA1FneahbyAbk3l07g+TvKj02TnsMkf4kGzJh7R2h0LdS/x
 gK0adkSqtjqbTC08gpj96V+YKrIs7pTOvpKH2ukDKFKcbII7X1bPmNzLp6aQWMFgQk9/
 0GWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EJGfKoNTtpHONAVVUy19xvP3ls9YinFzlhtPvuaaZVE=;
 b=hKNZu+rYAEXnrd35RHgHgHYPoXkYMFKzFA7AWSq0GreC9HReLao2/JkIM7BOI5X4zx
 xpYf4M+W4D4/p1KcrqBDliFeC/xR0vrV/HOPTjd1wbi+naWtudM3mYsr6sxpCy/RnA9M
 YzUh36Dye/TUYNJ5mzUGeNRzk/8j9H+EwYNEmBkGFeW5Ybj2/ltWjZ63+2Y1Zo+JLZlp
 sqNFn0LU70A3bFguR1+u7Vrf4J5c1yhjwPJWsfqAHITBGRcfy3QpzVlTiNyvLUqJ+aPl
 9tyfqVF7pyLTrdlo7jrcw2BEseYb1o8jyp7jAqoLLn7otpbFWxLwFDsG9uVPnjV+h656
 AQrQ==
X-Gm-Message-State: APjAAAW1Y6v1W2eqFz4cplcCtuOKf7Ul8/NZetk74wTFGSQNffj9V6qe
 3CWlb8jC3qro7z8Y+tVmMKL73aoCAsTnzQqgPNY=
X-Google-Smtp-Source: APXvYqyztf2KYxq0XQAdm49QKiZVOTLlyp/9w5kkaygaCobcIDARngGgN8JL9uLHbk6VK7SzwYqlTkjQZchECqhZCkY=
X-Received: by 2002:aca:3545:: with SMTP id c66mr110836oia.129.1558979967712; 
 Mon, 27 May 2019 10:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190527125059.32010-1-narmstrong@baylibre.com>
In-Reply-To: <20190527125059.32010-1-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 May 2019 19:59:16 +0200
Message-ID: <CAFBinCBJO3J1wG1wa6X26VT6yGT_c_1XHOPiPpMRZGW8KKxopg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: meson: g12a: Add hwrng node
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_105928_901962_90B03DEF 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, May 27, 2019 at 2:51 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The Amlogic G12A has the hwrng module at the end of an unknown
> "EFUSE" bus.
>
> The hwrng is not enabled on the vendor G12A DTs, but is enabled on
> next generation SM1 SoC family sharing the exact same memory mapping.
>
> Let's add the "EFUSE" bus and the hwrng node.
>
> This hwrng has been checked with the rng-tools rngtest FIPS tool :
> rngtest: starting FIPS tests...
> rngtest: bits received from input: 1630240032
> rngtest: FIPS 140-2 successes: 81436
> rngtest: FIPS 140-2 failures: 76
> rngtest: FIPS 140-2(2001-10-10) Monobit: 10
> rngtest: FIPS 140-2(2001-10-10) Poker: 6
> rngtest: FIPS 140-2(2001-10-10) Runs: 26
> rngtest: FIPS 140-2(2001-10-10) Long run: 34
> rngtest: FIPS 140-2(2001-10-10) Continuous run: 0
> rngtest: input channel speed: (min=3.784; avg=5687.521; max=19073.486)Mibits/s
> rngtest: FIPS tests speed: (min=47.684; avg=52.348; max=52.835)Mibits/s
> rngtest: Program run time: 30000987 microseconds
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
