Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A425606A329
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2026 11:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ug1UDZtC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=BxJLcAZp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wCzogPR73Gn6GVanIRV5SAlLlDN/7lD2mLaqhnhXY7k=; b=ug1UDZtC4A5KwRJE16aS2tC+Hp
	VUGaColUZHsl5n0kH6lQIRlN1IT3qbh2kfrbMNX5SIXZTWLmDA3TjZ+sfLCHWR99RJzaOzKLc5MXy
	ktvKsbx/vqDbsQnG18abB7anBd8hIo+WbzH7GWhC2uXtDgzW1eFW1p6fZog1L7C7buxRxbhDYqhE5
	YE1e+dYXbQo5xqmQt3BOWfiHbUgXm+scdOzsn8r7LK6E7J3nyXjCcwfZFKc8ZPC9z0ZwXRS7en2KF
	4rUPMdt8RrzoJlI2JV9T31HFOD/RaAV+NcwLz72tTUmSS/b55yHdR5+EzR9GdGPmPmknVMdCIqsMX
	zVjcuGEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNzD-000000092nD-1CiJ;
	Thu, 29 Oct 2026 11:07:59 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNzA-000000092lY-2Vvi
	for linux-amlogic@lists.infradead.org;
	Thu, 29 Oct 2026 11:07:58 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-48df54150dfso1116997f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 29 Oct 2026 04:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793272074; x=1793876874; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zpV8BOzWQIVCU32MdQbmtk3u7cepQKA+eLljtF6aqaE=;
        b=BxJLcAZpg1LffD8uUoXWC1rCMaSoqlYqt9MYZwk8GC67hptULEyMe/dV6Hd7qzy0Fe
         w9Nsg5LNSH/1WucbjpDAWJDPim8COMp+bxqYZze50v8CL/2xGXNESN4LSDwpNt+ix6Xg
         vcaoySbNjOT/+m/mNRxzfqR/IpNuOGhc0zJ6C5zHdQKsq2L8yCbaH6T7zoVLG8KzUKv5
         PsYWhEgfekTbdsm4SKfGFme/3egfmAEO9Zx/rG75vo96KvpESvA0ZQLqsDV9G3NCPDDA
         Eqy11j2exhfAEwaC2/nzTTFUIw9vfAnHkayDnh/lqfb17Pq3F+0XXQkHtDNUm0x8Jvrz
         hWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793272074; x=1793876874;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zpV8BOzWQIVCU32MdQbmtk3u7cepQKA+eLljtF6aqaE=;
        b=cbXwqN3G8WTt7P6aMANv6WpUgijJ6yX7M0On72TavHx/GVAU6rFqM5awmwcerAonWK
         UGsuqXuo4fjpvJwTagzl6DuOqXBI1qbu01ehr1mw0n22EccPPbi7loX1Ojc3K3exjkmf
         loPimcLvf+7pFA6KarDIOBlxIvp3O6//r8dAhum+hF02+kcSCmW5WKBWIgraH58gpZBo
         2CHZvmQ0xsXS7fsoUibiFfncBZODqmzDBUz8Dyrm8fjY1xUsAAOJXTnlGae1o+xz6WVp
         LAe2SYmQtSZdn3b20wC6W3Ln/mtNsD25Bzb6mYxzp5D8pynXR8+HOx8nzMBXO7I/fHvh
         Yj1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzyepWxXJqk9UIuzOnyPiprWsJIhECKZCQ7ZvLjS0sjstLh1x1evWexEtMSwqKAHGt55mcdwjuo0G/QjYXC@lists.infradead.org
X-Gm-Message-State: AFq9FYLmrucNf8z0sWPewBykOylOJ1WQs41+crguXbRH/i+jUuB4nfEH
	RJERCOOz5Gw8l9nj1wF96KqAT5Y28kJcD2pEPoS0VSSaeVuL/zchGX9O547bhFVb/A7+5r/j5T2
	5CLacjjY=
X-Gm-Gg: AYBFou1GNzg3q4GuHY/+xKngSN7zEvudude2oTwoLCBt2InbHmSRIi96f+GLcMyQv3O
	KPWeYS/l0XdR0OfTwhgNnrkFVb8uW07FPtQuIgZTsieyvL//Uq0av3f2Af/t0qQnsyb4tFgQW4+
	rb12duY4KLBzrhKkC4luP2FXVyRl4rYOlvOEBk2LSuRjHNRELxH84rUfYliz09tk7HwunL7zPpP
	dKqxfoeMSEuWAVnu26ktI0OZ2EgYQAg234hmJRoZyBJsrHeDHhY0mlhS8BKBO/2z3YLdHfZvfK6
	BJ7wG1Y/QB+kZZv1LZmv54NJdLw3o+1vgDrNfDBjK4g+KBAuvm80h6f+Rg5sPD4L+rxxypp/GBa
	41nYEpo59sJ5g2upMGO/TTQXzD6zafBYCXPcaP/DI46nQ2Mm90MmtoyCNVt6kpq/uibrNwMXJxF
	AwybOGOwgDu54bMfj/3+iaBKGX1L4TtQZ55x2ktwYWesefdbO0qciEngrwVKPDTM7uM2CGSzejW
	yzKq0l2KcrjVvFIUAME/607rIIv6EL1OnyX6mxpOpp6j1ba8rNNr3OH5EieQUWoN5QEhypDpT9R
	GkOmtslQtX0auXxZW5mzN0ONAQaF1GIBo1i6L00OJENsOInT
X-Received: by 2002:a05:6000:4308:b0:48e:6f:a9c1 with SMTP id ffacd0b85a97d-48e5d5d2236mr12412698f8f.54.1793272073992;
        Thu, 29 Oct 2026 04:07:53 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3555sm33268688f8f.42.2026.10.29.04.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 04:07:53 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] clk: meson: add the missing HDMI divider /4 alias
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261026-upstream-clk-regmap-ro-divider-v1-1-c8216b0fb93a@baylibre.com>
References: <20261026-upstream-clk-regmap-ro-divider-v1-0-c8216b0fb93a@baylibre.com>
 <20261026-upstream-clk-regmap-ro-divider-v1-1-c8216b0fb93a@baylibre.com>
Date: Thu, 29 Oct 2026 12:07:46 +0100
Message-Id: <179327206664.1865333.17830809789470255011.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2092; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=4F+x0mrkRCPBzUwfIYOdv4hLerpsS1UqxVbKSxM7h1U=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFmPNTnULtr1sD2x1TcLbJ/GWLeN7YqGAJtxb777L4/Ov
 vuGuW87SlkYxLgYZMUUWWq4q8XfSWp9mTVd5zbMHFYmkCEMXJwCMBHnD4wMXbJWG3ZvXC29x8C+
 7mFf0TlH34MzVNe8Fv616pd6ZZj2RkaGh8sWl4hsXrPjhRvHxGi+1Kgzid8VAmrqlSMl/v0r433
 NAQA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_040756_682656_906FFEEA 
X-CRM114-Status: GOOD (  17.99  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> On GXL and G12A, HDMI PLL divider values 2 and 3 both select /4, but
> only value 2 is listed in the tables. Reading value 3 therefore gives
> an unknown divisor and an incorrect clock rate.
> 
> Add value 3 to both tables. This also avoids a division by zero when
> the read-only rate-rounding helper uses the value read from hardware.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  drivers/clk/meson/g12a.c | 3 ++-
>  drivers/clk/meson/gxbb.c | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index d0d4c7b6dc82..b23b9514fa91 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -779,12 +779,13 @@ static struct clk_regmap g12a_hdmi_pll_dco = {
>  
>  /*
>   * G12/SM1 hdmi OD dividers are POWER_OF_TWO dividers but limited to /4.
> - * A divider value of 3 should map to /8 but instead map /4 so ignore it.
> + * Divider values 2 and 3 both select /4.
>   */
>  static const struct clk_div_table g12a_hdmi_pll_od_div_table[] = {
>  	{ .val = 0, .div = 1 },
>  	{ .val = 1, .div = 2 },
>  	{ .val = 2, .div = 4 },
> +	{ .val = 3, .div = 4 },
>  	{ /* sentinel */ }
>  };
>  
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index 7a7b104182ff..8cb6404c0efd 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -350,12 +350,13 @@ static struct clk_regmap gxbb_hdmi_pll = {
>  
>  /*
>   * GXL hdmi OD dividers are POWER_OF_TWO dividers but limited to /4.
> - * A divider value of 3 should map to /8 but instead map /4 so ignore it.
> + * Divider values 2 and 3 both select /4.
>   */
>  static const struct clk_div_table gxl_hdmi_pll_od_div_table[] = {
>  	{ .val = 0, .div = 1 },
>  	{ .val = 1, .div = 2 },
>  	{ .val = 2, .div = 4 },
> +	{ .val = 3, .div = 4 },
>  	{ /* sentinel */ }
>  };
>  

Could you split the 2 changes so you can add an approriate fixes tag
on them ?

A part from this

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
