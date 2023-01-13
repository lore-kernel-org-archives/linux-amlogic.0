Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784DDC54EBD
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Jan 2023 07:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Z3c5b56BrnouUiSirDmZza7KjCAl9iQXWqcF9r2tRs=; b=V41x3dBS08hfpJcTxYcgoH0QAV
	CMt5dHPzcBbDLwSOH7infphoS0NmOa/fRMaGVflhPeATCXxWkcxk98KwligObfEG6PAg8bqtBbXuP
	PvEQY/sc/VnjWxQDmXy4a4HUt/FXHBMkts7wQZNEm0vEdMo37sZuvNsppzvr6Z51mHvvfQOf/Kn7v
	IVVysLudG3oPofr/5qVYXLCeSojyiZ8Xe7Q7gO7hYyJPPFQ8iGnjYOf3VqN+MbGUDA8v8lqd/27Pk
	L9Ih4JId7cp/jjZrp/MGt0/lVbPWg5/F+Hhi3YkiAFqo42343XHFa6aWqMQsAvk2OUKgVce1AU0bx
	pCaojC1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGEyS-001405-Dp; Fri, 13 Jan 2023 07:59:40 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGEyE-0013qY-Jw
	for linux-amlogic@lists.infradead.org; Fri, 13 Jan 2023 07:59:28 +0000
Received: by mail-wm1-x32d.google.com with SMTP id o15so14689118wmr.4
        for <linux-amlogic@lists.infradead.org>; Thu, 12 Jan 2023 23:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s2mQx9yog+cpIOriUmStUlrkzbC/FMXSo06Ooi5txRk=;
        b=MYkoMrAO0rfyI3FYmI5avbqb2uKsWodoC2RzK+K1CbWnQXZrjakiUohK3z2GD/8DwC
         p8djuLAxlrepXC3O4Qc8wceRg8xj5uCfaoDb132wNAHCYViCOmcH4qLmOmjkNeqVhYWs
         4UIFHrKTubjVhDRWj8Bk3W0JmSFeUMay3Mr+ViHLH/Gl4NwZFwkVUqaYsI3/0hyLv7P1
         r46m1fdaboMgJwBsvJ68QFoPrS+8ID55r7tHfXsITe5aJa26vLcWy/DH7nepK6TmpikV
         1WWfqAmVJICrlib3fUa56xnCebytbDXLEG/Qywpxi6c+P8H7nsL3OGIhXxqY8EU3Qzuz
         uA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2mQx9yog+cpIOriUmStUlrkzbC/FMXSo06Ooi5txRk=;
        b=Vey7f2TH5cy5K+ITZZdgPbJGomHxKCLhwSqbzxmdmXSfSBkiHgWJUuq3fzM/VThnkE
         LnuzsJXNYmRR4kTZqD5h+cq9FFRdzfhHQ/ERyyrhxL2Lu/SPmaSCOMdnwwmcWwvcs+Fp
         uZFA2pell8yTSGvpPNldgXblz5LMVkHd9wwe+YTOfTcpcFTqUXvt2HWx7H7Stl3oGuyJ
         xSWjU5zYbbuyLmE1Q34MybH2u5CpRH4zhtrMwedI41PaxMTqhterxoZPeYfbann5KCR0
         B9j59zNwBLjGKLZQxAdqPAshWjakWuoP1xtyt5P9qAU0QslC2Z4YQzsnkzCFENfchtCt
         pI4A==
X-Gm-Message-State: AFqh2krYV1G/3QiWHeTX+rR73kF7L8W8CHoTgwNr6Gzyetie90s+yT/E
	Mz9jhwpnHbsdoLxoL+MSjNcJlA==
X-Google-Smtp-Source: AMrXdXuKnfVFVXHoEptfBW40GBPand9TJmqP0o/d8/MwkRJ6rihFwo5wT6oo6wb5qWGbqi9JKkDsuQ==
X-Received: by 2002:a05:600c:c87:b0:3d9:73fb:8aaa with SMTP id fj7-20020a05600c0c8700b003d973fb8aaamr48000823wmb.8.1673596764651;
        Thu, 12 Jan 2023 23:59:24 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8660:aed9:5ce2:6bbb? ([2a01:e0a:982:cbb0:8660:aed9:5ce2:6bbb])
        by smtp.gmail.com with ESMTPSA id iv14-20020a05600c548e00b003b47b80cec3sm33158002wmb.42.2023.01.12.23.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 23:59:24 -0800 (PST)
Message-ID: <9945bb15-f9e4-49a5-9c71-cd1087a91bdd@linaro.org>
Date: Fri, 13 Jan 2023 08:59:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 4/6] arm64: dts: meson-gx: Fix Ethernet MAC address
 unit name
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, Vyacheslav Bocharov <adeep@lexina.in>
References: <20230111211350.1461860-1-martin.blumenstingl@googlemail.com>
 <20230111211350.1461860-5-martin.blumenstingl@googlemail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230111211350.1461860-5-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_235926_730158_E2163D05 
X-CRM114-Status: GOOD (  14.00  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 11/01/2023 22:13, Martin Blumenstingl wrote:
> Unit names should use hyphens instead of underscores to not cause
> warnings.
> 
> Fixes: bfe59f92d306 ("ARM64: dts: amlogic: gxbb: Enable NVMEM")
> Suggested-by: Vyacheslav Bocharov <adeep@lexina.in>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> changes from v1 -> v2:
> - new patch
> 
>   arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> index e3c12e0be99d..f8b115cd6775 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
> @@ -233,7 +233,7 @@ sn: sn@14 {
>   			reg = <0x14 0x10>;
>   		};
>   
> -		eth_mac: eth_mac@34 {
> +		eth_mac: eth-mac@34 {
>   			reg = <0x34 0x10>;
>   		};
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
