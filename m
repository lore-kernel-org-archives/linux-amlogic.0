Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83C2C00140
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Aug 2022 08:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lPx5DKxXj9Ywe9RaAZU3mDfzga9N5aNBCDUV+Ozr+6A=; b=ZXmbHtX2GWx8f/
	isfheAXKwn9mPvuV4s7b+vwjRKLrcyMJMyQwv6Fp5CzN+mANwvk/b90BLlOitQk21Qt5giCF0OzVb
	E1sdk3KuOD0ngvqb9YkuoexBx5dkYU6PS/71tpY7v34vIl9SeWqfh3KatLxNvKC9y9LjAK5EHdt5c
	Grt1XYS/rG6+jaSdd79mMdCEbc5vCL2u6xGHl5cF8wchyewuyw9oRZj6fnbgWDShvAAcqmbQ4UMct
	NEiN2pHS6UV8L+7C1+cwf0OzeC4pYoBqaTXcl10y/2JJmutRhAb+AOmoLdLHWBbMWbfdzALVD1sju
	1Cjl89Y0CFgfGSlofZqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOavH-000qTd-9f; Thu, 18 Aug 2022 08:30:39 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOav3-000qMg-3C
	for linux-amlogic@lists.infradead.org; Thu, 18 Aug 2022 08:30:27 +0000
Received: by mail-lj1-x22c.google.com with SMTP id s9so1024267ljs.6
        for <linux-amlogic@lists.infradead.org>; Thu, 18 Aug 2022 01:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=qXTt19eF4mwiE0Ime+Awj3mOruDp7C/SRIF6tAJVQDo=;
        b=t7xTMCHGMRGLK+umdFpXOwWkrNzQGqXrBos0quyiAm91vb4vugRXWXDWChF8XhbJxB
         Z45VYXaaZ8B8aKebBHy/CEHVLDE3haCPej78R/834Q1wEXLBO1nz1v9kT291x8t4Jz9g
         wxbdqTkch+nDEdgvqB1VPrP3zh8PF+xzINxshq+4Mwdqpm6sVoyWcolF1+3nif69HhkY
         UcHP9C+h9WvpVGpJFjIhZ2WJQ00SeRm/6JH+vqVADiB9FY0lQFBfFAcqsYm1TVEqtcY8
         Oex1ibpkBYs9UWAumFjN0IRr7fdNetDAX1sBSNgpKHGMj98kpZqJ1w4iYC3cUB58jP3l
         L/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=qXTt19eF4mwiE0Ime+Awj3mOruDp7C/SRIF6tAJVQDo=;
        b=xIBGssSdV5tuiYAOAVGaxmCPzcfuPvhZlqLdZc9DlDBmewEQaiM6R8pKNGSqCkU4z7
         rUT1bEh92VeOyz0YsS+EvNwilur0jlQ2KCXm+ZuRb9mGvHtnXSURs7yr0o/5L9OGaD1n
         XSY262jdOCYGCVw064Y+cmFTXecEiOYtTs7jU6Pcgiaz/gJm3s6TGh5r/5jRiE6/yO8h
         g7nuDc13AtXmb3eSPMF1+mOHSE7p8YPccuMoefDRCC9F1GN2QSd7VMDEMQM4tOjBdYd2
         enL9ygUVBvzVcZMx44w8q1ipMzDV1B/+EwQgAyvSpJg3zt3JagKrK8KMCF0hiU1oKcjM
         KgFQ==
X-Gm-Message-State: ACgBeo3+LdQMzIh3tzXvRepMomcyb/DEp8dFVAGfvtm1I22X/dJXXCjS
	3sh6Mfwl0Tv4bU+DIV1LxdGCsg==
X-Google-Smtp-Source: AA6agR5ruAqqxhSW0Jr0u0T2N6TAA417fghniyaD0s8eQMiBgW9TCyIVBnHWO9ViolQ/0JtLpXNFSw==
X-Received: by 2002:a05:651c:179f:b0:261:83f5:4b5e with SMTP id bn31-20020a05651c179f00b0026183f54b5emr557765ljb.197.1660811422712;
        Thu, 18 Aug 2022 01:30:22 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:53ab:2635:d4f2:d6d5? (d15l54z9nf469l8226z-4.rev.dnainternet.fi. [2001:14bb:ae:539c:53ab:2635:d4f2:d6d5])
        by smtp.gmail.com with ESMTPSA id q129-20020a2e5c87000000b002618e5c2664sm125538ljb.103.2022.08.18.01.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 01:30:22 -0700 (PDT)
Message-ID: <188425fd-8cc7-fb2e-9ee3-ff37937cac54@linaro.org>
Date: Thu, 18 Aug 2022 11:30:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v5 1/4] perf/amlogic: Add support for Amlogic meson G12
 SoC DDR PMU driver
Content-Language: en-US
To: Jiucheng Xu <jiucheng.xu@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chris Healy <cphealy@gmail.com>, kernel test robot <lkp@intel.com>
References: <20220817113423.2088581-1-jiucheng.xu@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220817113423.2088581-1-jiucheng.xu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_013025_189801_8A217E80 
X-CRM114-Status: GOOD (  16.31  )
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

On 17/08/2022 14:34, Jiucheng Xu wrote:
> This patch adds support Amlogic meson G12 series SoC
> DDR bandwidth PMU driver framework and interfaces.
> 
> The PMU not only can monitor the total DDR bandwidth,
> but also the bandwidth which is from individual IP module.
> 
> Example usage:

Thank you for your patch. There is something to discuss/improve.

}
> +
> +static int dmc_g12_irq_handler(struct dmc_info *info,
> +			       struct dmc_counter *counter)
> +{
> +	unsigned int val;
> +	int ret = -EINVAL;
> +
> +	val = readl(info->ddr_reg[0] + DMC_MON_G12_CTRL0);
> +	if (val & DMC_QOS_IRQ) {
> +		dmc_g12_get_counters(info, counter);
> +		/* clear irq flags */
> +		writel(val, info->ddr_reg[0] + DMC_MON_G12_CTRL0);
> +		ret = 0;
> +	}
> +	return ret;
> +}
> +
> +static struct dmc_hw_info g12a_dmc_info = {

This and other ones should be also const.

> +	.enable		= dmc_g12_counter_enable,
> +	.disable	= dmc_g12_counter_disable,
> +	.irq_handler	= dmc_g12_irq_handler,
> +	.get_counters	= dmc_g12_get_counters,
> +	.set_axi_filter	= dmc_g12_set_axi_filter,
> +
> +	.dmc_nr = 1,
> +	.chann_nr = 4,
> +	.capability = 0X7EFF00FF03DF,
> +	.fmt_attr = g12_pmu_format_attrs,
> +};
> +

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
