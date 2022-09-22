Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CB2C6FA82
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Sep 2022 09:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TnErCZo61brAbROergMPpKWQrG6OktQE0X1tT9Qa5K0=; b=qzhKFF5vpBCisp
	Un6nT0B5h7mtazqN29uZBJDKo2xIpxiNKlffQbEtg5nukriqLoQtiZ9BVpXpnUlanyIEj4nOHSW8R
	KljEjzJXCYGr29aIEnRR45GTRXWox9w6N4uqL9MVTVCZdxCury7NANG/q00GIP5xzbabzbKx/fpES
	5vWvtvGLtkfsK9U4SVsBli9amBhp3xUe8oHQqIHCiz2JWsk9RJ/3BDH40Y48UEGqZhyRiJiOLidmk
	btA8iR7ANZRbR+7RUd7b+CRN2zPIwNLU8QcelnHpBMBdV/nWdz21BkCx68Vi2QczPmw/h6NJVYsVj
	b+6jMGT4Rq1iZ1OEOY1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obImb-00EXxL-Gv; Thu, 22 Sep 2022 09:46:13 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obIQv-00EQpi-Vv
	for linux-amlogic@lists.infradead.org; Thu, 22 Sep 2022 09:23:51 +0000
Received: by mail-wm1-x329.google.com with SMTP id r3-20020a05600c35c300b003b4b5f6c6bdso917056wmq.2
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Sep 2022 02:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=0oW+9yt7498h+lO2a1DaBWCIJgwtJERfgviB79Lo1Y4=;
        b=HuDw6Ts7eqn9+FpWBXdFfI+MNIEPh+9HPz7+HdbnjkBZfpVoEQddP7F2EOtfZTGjE+
         2LkLxtbLKi5jgOUmsGj0KaYMIgu70XgDZzuO2alqnNNcm1Hub/itYoO87sIpWrD1VXnq
         qb76RFr9VeA6Wb64HlQu2dFTI8ZHJT08fXAmWwnolzgg7Pkp/tcixNdw/NA28sQicNF2
         ICNtwHkZNjh0+CNNvVdagVtAh2DfhJD0s6BmXLxf7pPrvXT+95LCNAfgN92A+2RbqG47
         IPIYuvwGQ5Jr+lORDt7OQeKvUT/7omdB+kAPR90SDmEcrJUpd05yVdK4UEWuXhTTQbb5
         G4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=0oW+9yt7498h+lO2a1DaBWCIJgwtJERfgviB79Lo1Y4=;
        b=Ftk0DBmSlVzwQBlYEFRfgpgeV6mUVuf0rwwR4St78X344bFM3DKJnzvQs1kLBQlV6I
         v/igOHLr6zlB+V8cipDi4JELDYwObzwqFwNpEUeiQ6GWBne/99xPdgrtqhbUyil+ZfSb
         x6BJySKeXSdZvk9jssnwseHV1npqTcZ+d0ChiQ6rWw0tVzFK32FgfKEYon74P0nFIU9Q
         3ohK9xgTAK3MjuvFBKtJ0CNAagk6OzR1/s4eHb+dAeOiqdLRITdZ9BPkmXcijF4CZott
         Xm+P9xR/pcpJe8GHU0mu+G6ZE1fMALSOyvpkyLtGkzz8hld23Y8lyEguPgo6Xc+1xngb
         A3kg==
X-Gm-Message-State: ACrzQf1TOxSx6WWPo1IS/QlW7+lHNe8I0KjL7xCKN5SfHnkHkLP6d6Dw
	pOBNvqvpDgTcUgIj8K56W4h6jA==
X-Google-Smtp-Source: AMsMyM4hzQ6OpNA16zPCO4R6+e1l10Orii3c1e9BAA5rpjZ3q22Jf9I0uZigmmUKMzK54QW8tXXupg==
X-Received: by 2002:a7b:c398:0:b0:3b4:9308:ffee with SMTP id s24-20020a7bc398000000b003b49308ffeemr8947146wmj.51.1663838626144;
        Thu, 22 Sep 2022 02:23:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:6aa5:ee77:c3d6:a9d6? ([2a01:e0a:982:cbb0:6aa5:ee77:c3d6:a9d6])
        by smtp.gmail.com with ESMTPSA id h4-20020a05600c350400b003b491f99a25sm6896559wmq.22.2022.09.22.02.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 02:23:45 -0700 (PDT)
Message-ID: <19f10c64-efec-e2c7-a39d-0f346d6936fa@linaro.org>
Date: Thu, 22 Sep 2022 11:23:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH -next] spi: meson-spicc: make symbol
 'meson_spicc_pow2_clk_ops' static
Content-Language: en-US
To: Wei Yongjun <weiyongjun@huaweicloud.com>, Mark Brown
 <broonie@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 kernel-janitors@vger.kernel.org
References: <20220922040807.1409540-1-weiyongjun@huaweicloud.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220922040807.1409540-1-weiyongjun@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_022350_092611_EF5C0427 
X-CRM114-Status: GOOD (  18.47  )
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

On 22/09/2022 06:08, Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> The sparse tool complains as follows:
> 
> drivers/spi/spi-meson-spicc.c:570:22: warning:
>   symbol 'meson_spicc_pow2_clk_ops' was not declared. Should it be static?
> 
> This symbol is not used outside of spi-meson-spicc.c, so marks it static.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>   drivers/spi/spi-meson-spicc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
> index e4cb52e1fe26..85b4b9b267b1 100644
> --- a/drivers/spi/spi-meson-spicc.c
> +++ b/drivers/spi/spi-meson-spicc.c
> @@ -567,7 +567,7 @@ static int meson_spicc_pow2_set_rate(struct clk_hw *hw, unsigned long rate,
>   	return clk_divider_ops.set_rate(hw, rate, parent_rate);
>   }
>   
> -const struct clk_ops meson_spicc_pow2_clk_ops = {
> +static const struct clk_ops meson_spicc_pow2_clk_ops = {
>   	.recalc_rate = meson_spicc_pow2_recalc_rate,
>   	.determine_rate = meson_spicc_pow2_determine_rate,
>   	.set_rate = meson_spicc_pow2_set_rate,
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
