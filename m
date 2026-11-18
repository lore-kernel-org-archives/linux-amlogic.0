Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65985606A8B4
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Nov 2026 10:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QVATNw+8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=NJjJ1L7J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dSDD3IeH5jyiaMulyOjrvpw7V3odbPtGj3Dx6xnnC18=; b=QVATNw+8nSt2OGeudXZ/9ZzvAu
	ziD8nzusNEXX5PtuwjPUi/62AgbsIe5/bEqniHb7C0a1zkpk4OWIYfUfC8MsjBVhg/SyLbgmcGN+7
	sASSU6SNz+yd/pgx29+LnpucMCAihcf4fMwY1TLIaaX7hqrfD7yKfxRttCsxuiT9WOx53nnyPCy8Y
	haJLlYhc0BhP/qX8hrtKExfUNpqak6acewrLO1fPZ8dg14j3SPRiG6vxoyY5t31GeBaHnDadYrhkg
	PB/ueCF2HeNn6kKt5OHD7+HVDM7WyWb0GzSpGRe9RAUiv6A0lNnmDPUSUcT+Q6fGILCaRywPCilZn
	5v68gIBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcTm-00000008TyT-3d6L;
	Wed, 18 Nov 2026 10:01:26 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcTi-00000008Tu5-04wg
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Nov 2026 10:01:23 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso5853055e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Nov 2026 02:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794996080; x=1795600880; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p06X8vGtfz134mlSxf5ERVl3kJN9ysuKJStbHDgBjXY=;
        b=NJjJ1L7J78sSHX/bYhiyVaUwDzN5+XiioevxuEE+kRVy7mXcPYkTtkNEBlDn1uURKw
         lik4Nbl2j/fZ3Cq4cpSGQhVm1gzFmjrOp2DLHeWtIhLQJheAQu8brUmf4GLXd6Uboa9B
         +4BACrIg8i7e/X2DhAO0c+Q7q7REKjo5uNjlkKsOCLqMHPOD610/OpE7G9GkU8ZqPLq3
         Nvd83cDT9n2PJ7bATwT4cO2SymzwUXP+xC9iDuC6St1pGxGQNhY33gWjNSLL8zLQqe3m
         f4SRaHcx+5ABwlbmTmFhTyK6vpgh0yA6HLrn5DXg7nwoyH7SZG5gBxWp1rVXKwQD3b8l
         mvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996080; x=1795600880;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p06X8vGtfz134mlSxf5ERVl3kJN9ysuKJStbHDgBjXY=;
        b=LQbmXi0LUz7pHHfXfPhnn+ruKeFj2DcgcbWyZdUb4OuPa6dwFO7sHgiEPxO9+afMTs
         3JvRyeIdOzzhe+iwBKNh1lO3DDegVNixSRY11HnFXgmYOuvahQHkhe+OR+TnvMicCk57
         +8Chx51FfDIeyrvuurDK9y1vK1k10exdPnr+SZycAPTOkTpp/vK9QwJGvLTmibIWs8pM
         cBEW7f3bJhiTYF+w3aUAtMVXtNf0yvjgyNTv5upoXXVUPYwfFAAQMrV/94hs16bRKJsc
         2hkMdQUKzXyOp9xCMSR8r+AjhGc3XFiWyaARhxj+/ksKpnRmtoATOAMlsQj6DHyHmTPD
         lMQA==
X-Forwarded-Encrypted: i=1; AL+hErFvJ/8ve3PzqVQzkMd3M+OW0fxr8UP1fZXMIPtLfHxMhZnyzWmhzzl5/tbDGg6z+PnqzKgs1XdwWY4qr/xW@lists.infradead.org
X-Gm-Message-State: APuU4Z+S4fl7ubvfCBZWtlmiFIPpoiuxgT9Z70UZGFMu8ky/vN98M84D
	kauXqwinKjTz+xrbdwtIdXLVvYyoEIkWeKZPoLNqxo9WaPPDsQSXUtFsTXs19HKz01I=
X-Gm-Gg: AYBFou3syB89/NZaGkdVarAnmT7e/ExJQyPRq3ThG3MMO92fkN00EmhX2gJNrH8G4Qo
	qnggPjmkU8cPnYNfLhvmyUQwil3nOu8sEi3wnlthk691ewgVyR+GYkr1bkXhRAUaAJ88Sy5pkMR
	dHWUxXl+EryLSPyB6hdbMRax5WyuJ/n1wTUnrmKifybOViij9hV0/mBbybe8eeJRLzOYnpVgwDL
	/hhfMABW/GD9ZE0ojNnICHZiv2lF8kSAw7/w7oFXl4r7oR4hlN/3RoGeRTnKARy6wyYTuo/VpkG
	U8jKnJgaynFWAcyweZZzZ4Ka6n3VTVWIqc8PcSzvva0vamrcT5lmM/sQGWdQ3jKATf3ocqi3RtS
	opAckdcpADp0VvYodTuEYVAhbFRoQPJOI8CcKQJloGodXCtD7v4TZOEXvKnZzLm/jYK8zMb2WTh
	Qg74/Cm+H7iRnaf5IuwdjmFeRXBydl++Zmm6LjGEZopqY+zICvIxkO07lsCB+7HYLeWZTvCNEZq
	Cr5oU+NW+GNvnglEHyltPJC/KV+HbGv4kDUXAKz0vTyX4MfooU0U6mv7xz9yDYQl1K+JC4wfCrW
	xyVqsKmKfdsyp6zPGc2DdMx1FISaEaiFQGK34NrAhU8VdNYW
X-Received: by 2002:a05:600c:4ecf:b0:4bb:7007:4a5a with SMTP id 5b1f17b1804b1-4bb7da2eaa2mr40922415e9.23.1794996079988;
        Wed, 18 Nov 2026 02:01:19 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b5f1sm3910716f8f.21.2026.11.18.02.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:01:19 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/7] clk: meson: pll: Support active-low resets
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261106-upstream-s7-clk-v1-3-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-3-7d501d62621f@baylibre.com>
Date: Wed, 18 Nov 2026 11:01:12 +0100
Message-Id: <179499607255.413320.553972685734176286.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1563; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Q33DSpltm5vwmAzvC7fHaPbc9BM0xB8WQVVAhH5UiqE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/y3PKLqkKiK4KL9OeNlVYi5vpyrLt++ZICz9b2v0+M
 NKhqSS7o5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABPhO8bwT/ObRNYFFWbhO4dv
 lmje/SC04FFI1KPbrlWh23OnJe9KCGH4H76H4dc1wYz1vUpzPhXvOsXz0cWI/2B2iGTEnGvxN0z
 LOQE=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_020122_081301_8D1AC493 
X-CRM114-Status: GOOD (  16.23  )
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

> The common PLL code assumes that the reset of a PLL is active high. The
> S7 HDMI PLL has an active-low reset, and its lock flag only rises
> reliably when the PLL goes through it.
> 
> Add a flag for PLLs with an active-low reset so this PLL can use the
> common implementation.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  drivers/clk/meson/clk-pll.c | 43 +++++++++++++++++++++++++++++++------------
>  drivers/clk/meson/clk-pll.h |  1 +
>  2 files changed, 32 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 44b33051405f..4ac5e45c1e9b 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -293,13 +293,37 @@ static int meson_clk_pll_wait_lock(struct clk_hw *hw)
>  	return -ETIMEDOUT;
>  }
>  
> +static bool meson_clk_pll_in_reset(struct clk_regmap *clk,
> +				   struct meson_clk_pll_data *pll)
> +{
> +	unsigned int rst;
> +
> +	if (!MESON_PARM_APPLICABLE(&pll->rst))
> +		return false;
> +
> +	rst = meson_parm_read(clk->map, &pll->rst);
> +
> +	return pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW ? !rst : rst;

nitpick: exclusive or ?

> +}
> +
> +static void meson_clk_pll_reset(struct clk_regmap *clk,
> +				struct meson_clk_pll_data *pll, bool reset)
> +{
> +	if (!MESON_PARM_APPLICABLE(&pll->rst))
> +		return;
> +
> +	if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
> +		reset = !reset;

same here.

Apart from that

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
