Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFA4C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Mar 2022 08:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WqOhpkyXUAJ1NUvh9CgQL2YgidNzhA9Urkr4m0u4Lnk=; b=0z1ESdPqQFd18B
	ugbRTWjR+ECLZJiXSPP8f0VBmLKwLWVmUe8NBd/phuZZpn2clooPPrIFBCCMM6KLqkY2b9O+tAkzJ
	JNjGvM9lVBT4wojcvu2FxoxJsN2q14MdNfM5piLHaY4c0rwNfx8R4AlrgxPIINkNApeaa9M1FjGND
	xXLHLIcZbXsxK4Ebup5CJaIVsVdPpI8TlydBI8mNKkKR9SCu1FZRD1jWcMJV8ui8R3blxvoUk+0ix
	4GkAWa5FBiAlBChAeLt+3JEJyUIru/RSsi+TP8Vaqkp5rTe0TS/AT7vfmiSczYpyuY5auX6AloTFH
	T1va0PyUHprs1/IhHORA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nR91Q-00GXXS-KV; Mon, 07 Mar 2022 08:47:16 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nR90y-00GXLV-2d
 for linux-amlogic@lists.infradead.org; Mon, 07 Mar 2022 08:46:50 +0000
Received: by mail-wr1-x429.google.com with SMTP id k24so12519532wrd.7
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Mar 2022 00:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WQB8Wj8L2naBf99gAuyw+5VYV82BNeXK+2ElJRbWO5s=;
 b=mFke2k3O5n2KTc+OBpSwEGYxGgXKklKBN1I7HJNehUDSEQDOLPuvhG6WYa4jPUWSaB
 /Qc2aYNubYEebqhM4q80rAJQc0hQeeMehWol8JFOfDp0o4nGAM8wU0ZQYCNevtniMC8/
 E1CwvTwI+JzsusxsubfnfYR3n5efnrFVR/OtCVB+7Zi2UsQOMD706qgJ6u3PJt/5s4+4
 Gp79oyuxv4jdVk78kP58UV3grp76skMsBgymyPcyQy2bTEXRerBgIFcAz8+p/IpPTDNN
 QXzErHXq4OcBWvqJHQm1NARbJHpFftY3LGImleS2tvtr56DIVmVWexf8wt+7GYtV+6rB
 ZgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=WQB8Wj8L2naBf99gAuyw+5VYV82BNeXK+2ElJRbWO5s=;
 b=HOTMspgKBHH9BHIxZejgyYQ/bfEErivlig+fmP9Q0KyCVJxaVqLWzeIDsiuD7lNUQF
 j81oAsNGSRKqnXg4s3VEBTFz93Ha4gIYCdGqBoi+To//CsmhnVnEQbHtH0SPMtZjHbe8
 oIVddJtOZg8blgtIqocClhbTtVSfCv8kXCWTxhrstyc2/cKfmm1vEpGGQ4ni26iv0LmC
 1z26BhlpV6XsZ+JWO3W+QrzsQfDqWrFfsU5CFjhJekjc66KU6l4dxgM+Q3qttiP8gd09
 Faic7CMlbVy1Y0nQ6SrRda8mjmZ7lADV6ru4XWHg89h9/ae4YETfRvrpIvogyB9TSVbI
 nxfw==
X-Gm-Message-State: AOAM533EDARVLeofTmTzP+ibHL0pqMxeF9zl2DFrTzKDHgVGNaFMBE5v
 HVrs5C62htqBlSLykxSsyF1Jgw==
X-Google-Smtp-Source: ABdhPJybKFvjFWhNXd7UECd+xULEdoPrtBag7Uk01fy8gziWwt4F73T11HzmlUw4rbLsGhxf0KElsw==
X-Received: by 2002:a5d:52d2:0:b0:1ef:e22d:18ba with SMTP id
 r18-20020a5d52d2000000b001efe22d18bamr7382573wrv.30.1646642806566; 
 Mon, 07 Mar 2022 00:46:46 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:1451:71b4:fefe:6096?
 ([2001:861:44c0:66c0:1451:71b4:fefe:6096])
 by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b00384b71a50d5sm12647353wme.24.2022.03.07.00.46.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 00:46:46 -0800 (PST)
Message-ID: <72059eeb-dec6-286d-7006-0a1d4d947d4f@baylibre.com>
Date: Mon, 7 Mar 2022 09:46:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] i2c: meson: Fix wrong speed use from probe
Content-Language: en-US
To: Lucas Tanure <tanure@linux.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220301072600.12352-1-tanure@linux.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220301072600.12352-1-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_004648_151017_A980087C 
X-CRM114-Status: GOOD (  19.41  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 01/03/2022 08:26, Lucas Tanure wrote:
> Having meson_i2c_set_clk_div after i2c_add_adapter
> causes issues for client drivers that try to use
> the bus before the requested speed is applied.
> 
> The bus can be used just after i2c_add_adapter, so
> move i2c_add_adapter to the final step as
> meson_i2c_set_clk_div needs to be called before
> the bus is used.
> 
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>   drivers/i2c/busses/i2c-meson.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-meson.c b/drivers/i2c/busses/i2c-meson.c
> index ef73a42577cc..07eb819072c4 100644
> --- a/drivers/i2c/busses/i2c-meson.c
> +++ b/drivers/i2c/busses/i2c-meson.c
> @@ -465,18 +465,18 @@ static int meson_i2c_probe(struct platform_device *pdev)
>   	 */
>   	meson_i2c_set_mask(i2c, REG_CTRL, REG_CTRL_START, 0);
>   
> -	ret = i2c_add_adapter(&i2c->adap);
> -	if (ret < 0) {
> -		clk_disable_unprepare(i2c->clk);
> -		return ret;
> -	}
> -
>   	/* Disable filtering */
>   	meson_i2c_set_mask(i2c, REG_SLAVE_ADDR,
>   			   REG_SLV_SDA_FILTER | REG_SLV_SCL_FILTER, 0);
>   
>   	meson_i2c_set_clk_div(i2c, timings.bus_freq_hz);
>   
> +	ret = i2c_add_adapter(&i2c->adap);
> +	if (ret < 0) {
> +		clk_disable_unprepare(i2c->clk);
> +		return ret;
> +	}
> +
>   	return 0;
>   }
>   

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
