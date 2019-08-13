Return-Path: <SRS0=/wkT=WJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BAB4C32750
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Aug 2019 22:47:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1D182063F
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Aug 2019 22:47:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MRiNkSbI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PUyS4b/F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1D182063F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IuN/hy27ZPisVYDm/CrEkM5bKKZ7RlV/yz9+up+p/AQ=; b=MRiNkSbIZVkcpM
	8/OnKfV+WSEi66Vx/h7BOXg4RjWGhutr9KgXIj4hmA1DsA1o3sW0NOffszHCq5CkDeyXnc3HP9LW6
	NelDi9BkV7KS1AQ5+9tRACf1BKxVil8SnX7qv0Hvq9wUwtt2j137Nj07t0X7kDHI/xSAkh9yReF3i
	8P26ajQGP95sE7Q1ArhNud98wFHRdHEju93kVaeABu/7tX1H+64u9vwvlaPvQTUFLujmjfrdcCMZn
	XDyNAVCUe2ngLPRTBQRzd4XB/NNKPWiH7ziK4W7T7RrmBS0hEN5ud8lSdPE82r6xhBtxUKGRhJkMN
	R/ViQDDVBaxwpTYrGKfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxfZL-0001TA-Sk; Tue, 13 Aug 2019 22:47:07 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxfZI-0001Sp-HV
 for linux-amlogic@lists.infradead.org; Tue, 13 Aug 2019 22:47:06 +0000
Received: by mail-pl1-x641.google.com with SMTP id z3so3053569pln.6
 for <linux-amlogic@lists.infradead.org>; Tue, 13 Aug 2019 15:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=lnELElCp25c3elzOUtT6fd3MWvvcRjHI//J6PTec55U=;
 b=PUyS4b/F2bjUD9SeUPmMBqxOZencdu75yhwcGDL9fZHZJtPbfeu7+WHUSmgq5rl+zV
 W8Fx1svTrKMLtbmIkkWdz6ve7eWlaqOcfOTZ7VW8uOw+ecKFwWDUU13aAILlAhF4mfxk
 zfcZDGqcDmZKBYO/qz840thjbdJh9P0WCgBX57oIcSvNgsWdzFKXPmpwOn0VJ5K/vIHk
 vHe1UVmxPgnw5jAKdPIGLXqZkbjM7qVF6WCflZZfGZpUaYGGn3SP/JuTJGtrGjjlstJx
 6mZJueC5Vkvs1iYAk5CV7PU+fnTiAnL3EOZLt20AZDiW8HIWDebTvQ/2uW4VURuZiENC
 CYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=lnELElCp25c3elzOUtT6fd3MWvvcRjHI//J6PTec55U=;
 b=G3Q+nX8RH5FV1OWtrOPapY0+Foc0mPl0GCB7gsn3xIuR9vkeyEPHsFiFkdshH7g4XO
 Fi4/BE5muNdIGm8iohbw444piqid6NtT2MxRPkcXfSVqjybTHe/z7dHPesa1Y0s6rzYE
 NiEwH2Pniu6v+bn/bz5Ue+K0rgdZjvw0jbU17Jw+8O9YXQsAP5uo8mM8kCMzweS+0gdJ
 oG69VSd6X35TEsAL3Dje39tO9b96f/hx0T+ackr7Ctuq0fhyQo2UErTPmwrFT9ED4df2
 oD/Az8jZC1IMn7Z5Cd7aAn9LDYP3aKiKDbxjzXsyDSxcCA/+vl8FpDxApevrDAzp2Lje
 4GQA==
X-Gm-Message-State: APjAAAXxAzUldOvcPUHgwL7cmXgzefW9mvJAyW77QtQAwGKdUU4kk6GC
 g0pSxXCgSMcdBGuHMbP7f3lImA==
X-Google-Smtp-Source: APXvYqy+S4h+puhWyP2gn5ryNpu0ORqreUXXIT1wCMaeytv2kH9iUoBkiN0ZKE//jejuy/qWkNmsOg==
X-Received: by 2002:a17:902:3103:: with SMTP id
 w3mr40437718plb.84.1565736422387; 
 Tue, 13 Aug 2019 15:47:02 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:35:cf9b:bad:702c])
 by smtp.gmail.com with ESMTPSA id e13sm13556690pfl.130.2019.08.13.15.47.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 13 Aug 2019 15:47:01 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH/RFT] soc: amlogic: meson-gx-pwrc-vpu: switch to clk_bulk
In-Reply-To: <20190809230904.28747-1-khilman@baylibre.com>
References: <20190809230904.28747-1-khilman@baylibre.com>
Date: Tue, 13 Aug 2019 15:47:01 -0700
Message-ID: <7hlfvwy97e.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_154704_608250_0DFF8761 
X-CRM114-Status: GOOD (  17.03  )
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
Cc: linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

Kevin Hilman <khilman@baylibre.com> writes:

> Instead of expecting a specific number of clocks with specific clock
> names, switch to using the bulk clock API.
>
> This is a first step towards generalizing this driver to work with
> other domains.
>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
> Boot tested on meson-g12a-sei510 and verified that framebuffer console
> comes up and still works.
>
>  drivers/soc/amlogic/meson-gx-pwrc-vpu.c | 41 ++++++-------------------
>  1 file changed, 10 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> index 511b6856225d..5f6519f43a31 100644
> --- a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> +++ b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
> @@ -34,8 +34,8 @@ struct meson_gx_pwrc_vpu {
>  	struct regmap *regmap_ao;
>  	struct regmap *regmap_hhi;
>  	struct reset_control *rstc;
> -	struct clk *vpu_clk;
> -	struct clk *vapb_clk;
> +	struct clk_bulk_data *clks;
> +	int num_clks;
>  };
>  
>  static inline
> @@ -76,8 +76,7 @@ static int meson_gx_pwrc_vpu_power_off(struct generic_pm_domain *genpd)
>  
>  	msleep(20);
>  
> -	clk_disable_unprepare(pd->vpu_clk);
> -	clk_disable_unprepare(pd->vapb_clk);
> +	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);

Note the original turn-off order here is VPU then VAPB...

>  	return 0;
>  }
> @@ -119,25 +118,14 @@ static int meson_g12a_pwrc_vpu_power_off(struct generic_pm_domain *genpd)
>  
>  	msleep(20);
>  
> -	clk_disable_unprepare(pd->vpu_clk);
> -	clk_disable_unprepare(pd->vapb_clk);
> +	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);

... and the origianl turn-on ordr is also VPU then VAPB.

Using the clock bulk API, the new turn-on order will be the order they
clocks appear in DT.  The turn-off order will be the reverse of that.

That seems right to me, but it is a change in behavior from the current
code.

Did you set the enable and disable ordering the same for any specific
reason?  Any reason to thing reversing the disable order is going to
cause any issues?

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
