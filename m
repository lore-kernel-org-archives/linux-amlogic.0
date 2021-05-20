Return-Path: <SRS0=eZXa=KP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23735C433ED
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 May 2021 14:02:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 501C76109F
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 May 2021 14:02:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 501C76109F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ky8gXzwUJtE8jTlsVBMPIW9fYqJq2vY1JZ/HlBGebuU=; b=JYxWiVAOE8aP9LnPlfXnxODgnU
	Q/U2Wp7948e5ZsiDCMJxiVjQmVTuTEKYBNHCzmT7VKWmDU/G1mdJgmIgxdwBYpuCWYZBzXJqmi6BR
	3f0Vf44V/Q3zCpi/VIgBPVURhjHkXub6i0lOnd+/AbsdPtzVlykJRIzj5sisFY0w5HvC6Vz72Igcd
	NBLJVr8CC/D2164HWL++8CToWSqW6KeSSSXRM5yQkJIOJNQCkXvO+GZndXKaLfNVwpZJylBxoXtzy
	XxvusPPtG6YSNOkwiASEF38nwkB1/JZLrsXZgohuYznBeSJR5oJ+OzKsdBQxqLv4xMeNJRvL6asnt
	HPYxkQ5Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljjGD-001LBO-Ro; Thu, 20 May 2021 14:02:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljjGC-001LAk-9h
 for linux-amlogic@desiato.infradead.org; Thu, 20 May 2021 14:02:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=Cz0/1ZOfO54oR2U6DPLhE6s49BLA+WlRGKus2Uz7Bfs=; b=spZRLp09aiDcAHDOWPo/j1rHJk
 R5RVmXquncycDwzSK8khZuEnw+wo2HqBQJM7RwcfERE/xFVJtKnbb3BZL6OUSeOO6u9GQYh7dJR4u
 FRz/8HV9LgogamLGsseYodRFJKIzaNRp5dXphYazArQJheG9NSyHkBO4FVwFcPFkMd1S20cNYBluv
 iV9NMpwFnZtHTZwlXltBpqDA680+J9d9THp+MNdWtDm1fR9n7Ctz+qDyFiLr8xtkerwQ1WKKdiDbk
 xUg872JHyPzrObUQ087f8b4/vgqgAymhaDhR4C+QlIbYgD6MCYTTUvOeYjQlFhm9qCjLa3Bnc7pUa
 yvsMYksA==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljjG8-00GOwf-9C
 for linux-amlogic@lists.infradead.org; Thu, 20 May 2021 14:02:47 +0000
Received: by mail-wr1-x42d.google.com with SMTP id r12so17814394wrp.1
 for <linux-amlogic@lists.infradead.org>; Thu, 20 May 2021 07:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cz0/1ZOfO54oR2U6DPLhE6s49BLA+WlRGKus2Uz7Bfs=;
 b=A4kzq6aK3MU8PNd4Cy6MM9AtUaEz7OChC7pxTVn+dWRwks8+8dKRxsEzgY98KKjuPG
 +DgjsXh5+lw/0IGFjmLkyukjDNCijkCsePiO8AWP1Alz+H9xHlN+pkFYCd+h/lP4Sldw
 NslR9lRh+Lg3OQ5/J1Heyj81CUIsGZ//OEfNc2bvMi64tio1ZZyQl9BeSJHDCr3KG3kK
 qYGlM8ctm4ckmirs53vsz2zB+BOoK201eGbj52PCASR9Iz5Ht0KVkxZr7UJjCZxqBUnv
 NJJlu5TaaV0UTFg2uOkfQFi5/9IYV55JKZwcJAGowg96Z4m3C6uImI3qdGAiJBwfSMll
 aFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Cz0/1ZOfO54oR2U6DPLhE6s49BLA+WlRGKus2Uz7Bfs=;
 b=jbgHz4joX/JOVgQA5joWNO0NY+9EtjGzAXN8N3IfMETAI4D9thEworGe65u3RWkAUu
 omgXsOUXMMwJyGbakV9VMfvORa2fVNgBWO1QyRjxVetam4QuXCVSNcTvu1+ew/VjJyK4
 0NpegOfrM1jJokFni3zheM7IS1w+9twiff/Ukg+Er0xtTYOVn5/gmWdvEazs4Z+NKGcP
 xFerY/BcnOQnbEJWUOQDASFhP6RLuKkN4PXDBMOXSbUUSY7bKMMLk3107rDltoC4TaUQ
 I1dIfQuZiad83U6FmXQ3rgKn5njOjuSPBSzavHFv/KpqnPG0zjCd3S/XaQvD6NySR0c6
 AWKw==
X-Gm-Message-State: AOAM5300Y+G3Ta/9mqAnNVKiXsY6T/Fmv3sjdL7GW6xrJRcDQT2ZAV+G
 trfzQgqHE88q21xhkECwYd1HcON2eSi3pNpn
X-Google-Smtp-Source: ABdhPJwydengR9TjNPw+zXzBcINPg6RpLDjSqmmkEqNHkwp9baP1lWqBIluKFtAJTmEU5jo689Wc7w==
X-Received: by 2002:a5d:4b89:: with SMTP id b9mr4472110wrt.238.1621519362300; 
 Thu, 20 May 2021 07:02:42 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:d88a:b479:b222:83bb?
 ([2a01:e0a:90c:e290:d88a:b479:b222:83bb])
 by smtp.gmail.com with ESMTPSA id s5sm3260428wrw.95.2021.05.20.07.02.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 May 2021 07:02:41 -0700 (PDT)
Subject: Re: [PATCH] clk: meson: g12a: fix gp0 and hifi ranges
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210429090325.60970-1-jbrunet@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <df839588-1ff2-2d7f-4364-2b0d8942d6ef@baylibre.com>
Date: Thu, 20 May 2021 16:02:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210429090325.60970-1-jbrunet@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_070244_355526_BE97269C 
X-CRM114-Status: GOOD (  22.93  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 29/04/2021 11:03, Jerome Brunet wrote:
> While some SoC samples are able to lock with a PLL factor of 55, others
> samples can't. ATM, a minimum of 60 appears to work on all the samples
> I have tried.
> 
> Even with 60, it sometimes takes a long time for the PLL to eventually
> lock. The documentation says that the minimum rate of these PLLs DCO
> should be 3GHz, a factor of 125. Let's use that to be on the safe side.
> 
> With factor range changed, the PLL seems to lock quickly (enough) so far.
> It is still unclear if the range was the only reason for the delay.
> 
> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/g12a.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index b080359b4645..a805bac93c11 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -1603,7 +1603,7 @@ static struct clk_regmap g12b_cpub_clk_trace = {
>  };
>  
>  static const struct pll_mult_range g12a_gp0_pll_mult_range = {
> -	.min = 55,
> +	.min = 125,
>  	.max = 255,
>  };
>  
> 


Sorry for bothering with the DSI stuff, I'll fix this when we are ready to upstream DSI support for G12A.

I had this patch for a while in my integration branches, so:
Acked-by: Neil Armstrong <narmstrong@baylibre.com>


Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
