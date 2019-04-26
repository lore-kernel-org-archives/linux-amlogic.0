Return-Path: <SRS0=lPQy=S4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A10C43219
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Apr 2019 15:25:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 331AD2077B
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Apr 2019 15:25:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PrQkmPTw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="he5FOjor"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 331AD2077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MHFojbLGA8MoX9x5JiiZTw3Kbk7GZDu9NhpWGmnqwdc=; b=PrQkmPTwRmzaSpNUf+382UtI2
	8ffjrgWpVzvikX5OpKfnE4uaZiHdLQdQBKx/Eb4JrQpUsSXjXPuWJiPWLUHwkt9XMVSBgCZ/vy6dh
	+G1FUEaU6ixf0bIZen/1BkxYAmbjiPIVs89mtvKdN4Vceqy8CPbPzM9f8ZUK02U03F+/5OwHVF5PA
	CaahVccZot5UV2n13URsRrVWlpP4K6Nk5nO/pfefXERbkXEF6CrthzETKj2YNeDPWk410Exmj2je1
	JsbPDCSeJ68rgZJITymY8FcAU/aD5RY1eNvxfax7e4RsFa+Sv3EsZJH0a9IbzD/laHsf0REXRkcol
	eAMy/m3tw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hK2in-0000JM-H8; Fri, 26 Apr 2019 15:25:05 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hK2ik-0008E8-QP
 for linux-amlogic@lists.infradead.org; Fri, 26 Apr 2019 15:25:04 +0000
Received: by mail-wr1-x442.google.com with SMTP id a9so4984907wrp.6
 for <linux-amlogic@lists.infradead.org>; Fri, 26 Apr 2019 08:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LHk6Q7YVWro0HUIwZ6DubgfOSDCLAqHqjxmCbViazvQ=;
 b=he5FOjorgS1idJxlhNzp+WG+1REcrUiXaSQ9CeLaTJ3wlwoxpVMxuMgeL3T1FP2gr7
 9zXZ7/0IQPgw0lhZ4nGPoE/thVE/yKQOEu+peeYWmSARgLPkXXSjE5ijcAKwf92i+7mq
 XGllPVkC7xru/Vrdxa/PAJkPeQ2fyVjI7+TcFikCFhuBdJKwl7xw8eTd2k/5E+F8IQGw
 E4bNcOH5zm25WHOP6uSPcbVgn/EIiK/8An0CjXPXPUmTxcmb5OhtxgRoxyfxalAdP3pv
 pm7CWsZrRM2sAqhCkH71YiTA719qLDHCGC/XD4PHuvRkEALV54CdhyA5vk2EwRLp2vSN
 zoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LHk6Q7YVWro0HUIwZ6DubgfOSDCLAqHqjxmCbViazvQ=;
 b=Sdjles8irBg+I3D3VCor7Hm7BCHhHXDH80rLmw8qfX/qt+BmqjBgt/1CaEU/wo2HDG
 cBxLHizHSFtqKS8W+5Uj16xNc+BN+7kKmhP54/50IXMPXCuGWvx6z4Yf/0Wslm3iJZts
 /1YifYlEvMK1DGjNv4tSXZmiJzttjjJSN8NqGmC15/FD7RKBop+9uGO3pH3i8uwqNWvE
 TZhESbuJG77Fh2uDjMIe9xNuxETmaGhGCjJPBgvFB30WYepuzgdMthvw1SaVwH4aJdJJ
 cbatF3YOBaPTdZm8RcbVlkKXle/DNGtLtmOvD3dJGock/87hMntwlzdeQkRd2JauuMzU
 7mfw==
X-Gm-Message-State: APjAAAWLjbQU9QB6aOOGuhMv7vJVUE5Vrg5yoG/7CGbXQexXkpclHxyV
 mGL0vzhAb1BZd0IQs5oO7D8=
X-Google-Smtp-Source: APXvYqyp1DKWPlVfJP5wbH9fMkpIdFUeSNKQnoZvKHNQauSTPUCke5IKj6zopVxQPeAgg8DknDRFrA==
X-Received: by 2002:adf:e711:: with SMTP id c17mr15670199wrm.57.1556292300623; 
 Fri, 26 Apr 2019 08:25:00 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
 by smtp.gmail.com with ESMTPSA id h9sm18683735wmb.5.2019.04.26.08.24.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 26 Apr 2019 08:24:59 -0700 (PDT)
Date: Fri, 26 Apr 2019 17:24:58 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: Remove CLK_IS_BASIC clk flag
Message-ID: <20190426152458.GC19559@ulmo>
References: <20190425181447.60726-1-sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20190425181447.60726-1-sboyd@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190426_082502_873905_BD8E510F 
X-CRM114-Status: GOOD (  13.02  )
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
Cc: linux-pwm@vger.kernel.org, James Hogan <jhogan@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
 Tero Kristo <t-kristo@ti.com>, Paul Burton <paul.burton@mips.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Type: multipart/mixed; boundary="===============2150582996089671033=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============2150582996089671033==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XMCwj5IQnwKtuyBG"
Content-Disposition: inline


--XMCwj5IQnwKtuyBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 25, 2019 at 11:14:47AM -0700, Stephen Boyd wrote:
> This flag was historically used to indicate that a clk is a "basic" type
> of clk like a mux, divider, gate, etc. This never turned out to be very
> useful though because it was hard to cleanly split "basic" clks from
> other clks in a system. This one flag was a way for type introspection
> and it just didn't scale. If anything, it was used by the TI clk driver
> to indicate that a clk_hw wasn't contained in the SoC specific clk
> structure. We can get rid of this define now that TI is finding those
> clks a different way.
>=20
> Cc: Tero Kristo <t-kristo@ti.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Paul Burton <paul.burton@mips.com>
> Cc: James Hogan <jhogan@kernel.org>
> Cc: <linux-mips@vger.kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: <linux-pwm@vger.kernel.org>
> Cc: <linux-amlogic@lists.infradead.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---
>  arch/mips/alchemy/common/clock.c     | 2 +-
>  drivers/clk/clk-composite.c          | 2 +-
>  drivers/clk/clk-divider.c            | 2 +-
>  drivers/clk/clk-fixed-factor.c       | 2 +-
>  drivers/clk/clk-fixed-rate.c         | 2 +-
>  drivers/clk/clk-fractional-divider.c | 2 +-
>  drivers/clk/clk-gate.c               | 2 +-
>  drivers/clk/clk-gpio.c               | 2 +-
>  drivers/clk/clk-mux.c                | 2 +-
>  drivers/clk/clk-pwm.c                | 2 +-
>  drivers/clk/clk.c                    | 1 -
>  drivers/clk/mmp/clk-gate.c           | 2 +-
>  drivers/pwm/pwm-meson.c              | 2 +-
>  include/linux/clk-provider.h         | 2 +-
>  14 files changed, 13 insertions(+), 14 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--XMCwj5IQnwKtuyBG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzDIsoACgkQ3SOs138+
s6EeYw/+ODtlfFBeX5N8+RMkQjbVCHXWEOdXzaRchdA6FG2OsXcE4sKemUaRndwq
39u//Gfd7+FzbRx1KozJynxMh4X4SZgkz8amg9E5KBMjxviapvni7zPs0iM4DCxU
QaD9lX+z7SHTjAmGO2Uc9WwOzGn7hKiawSaaWt3feFeycPQ19yz/oK9OT/gMtVh9
23fYY03Ct7m9jp7q9xfM6/03IO6QzA3ygvStbpHw06rQWVVO94z4RCziJKXEqwRE
zgqW+2tRCeBH6lx2wi6PHbPYpVvKCV/tGMFwjhDcfKgkWaCq/A3iGyJprnALkJV9
alCoVZ9RaxddQaxGo+nYI7Tf65j+jKsEZNDFO/rLL7uAsojJdI5SntyKJjZNJU/P
oELMbraTQV/YJD+CfuzDzCnX+hQ6HxD49TcP2G3hPPYFwfJPNXjTMxztThFghdcU
zUxEewHp36MCmxrCbB62AlySj013FdvXQPRWsbCK8WoPdAlS9RrDc7Fkq4rIcKvq
7qAdfSYKyRQDAAp62gjDQJLkGlolGAKGR6vxJTcm7PaH7hfSY87rQLTxbqaZvB4/
Be/PnMpG+OvwbGpMX6syEMcHVRoJwbJ3YP97GlPfFyQe8lj8gOumdN072Pe1LjsM
7wC7CgOqybPOzXwmDIXOTQkoVhJAYuxdmfxK3u31WbVhbQKBX34=
=IL2D
-----END PGP SIGNATURE-----

--XMCwj5IQnwKtuyBG--


--===============2150582996089671033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============2150582996089671033==--

