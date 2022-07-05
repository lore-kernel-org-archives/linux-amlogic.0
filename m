Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD81C43334
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Jul 2022 07:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uhZtyQUslAIRjErY7QqjPGHsSg/8vFlhB6RzxpRQdFY=; b=OgyHcNHcY0/QA/
	zjCpBr793TkcVlxbYsOttIqc6APXQUTwUzTgDLtlkCEDu2pTne2mwY4ytpNVcoZGyBYkelsQ2NNE6
	ZES/DCrbk5aNRnvGeaFrQ2g/5RCbS/KZEl6C0D7UCeNaBZFxBTX7heHoMjKuu16PSh5iiLR91orHy
	gYTmuM/TEPxNO4Rk+pC6+3Xo4ju9UN/4jS0uVv/YX4JaYHA31grUoziWDJCQulWJZGGW+EJVp5UEn
	l/4MTD3P6s+f4RhRlexnKWuC9ZckEgyeiQ1eiay1ygXVUzougWy5QmaYhoN+Pd5+ma1nTCFW/sV8w
	OK1CkP7g7lJsWh8WuiNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8csq-00FXtx-3t; Tue, 05 Jul 2022 07:22:08 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8csc-00FXMR-Ae
	for linux-amlogic@lists.infradead.org; Tue, 05 Jul 2022 07:21:55 +0000
Received: by mail-wr1-x42a.google.com with SMTP id f2so10818536wrr.6
        for <linux-amlogic@lists.infradead.org>; Tue, 05 Jul 2022 00:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:cc:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=jup5yi9H7xUYGePSxxyktmglyW6uLEzBdr9VBRZBloA=;
        b=LzyC1BslQcQDLwEh59d9Kfgx2N20Ze+0hRqNNCPsWakeskMfJdQfZpxWmWtA34cHFT
         xgCbDp7n8a0oIe1/vz3FeCy7qd2GKvBrFEX5HnGSTOq894MfppO6OOXFxL50ATudJ0ea
         tH+jsB5hb0v8JAIY4Rsu5CU+G+t1QEmxZcWmjjq24GmMTpjESFqyUWsldy7IJplbglH/
         ti0+hHwePBRCkv5Or5A+COl332Bv+lcii5owVjP+aoAZACzXkasK1qn1yTg/dQC92eow
         oSM6DubSDEGR6PpxG6rZqbXCngI43E7+/GP1u1ILKaDV5vj7DiM7BnrlteJAEG0kTz8h
         tOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:cc:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=jup5yi9H7xUYGePSxxyktmglyW6uLEzBdr9VBRZBloA=;
        b=ZM2GzzSRVMXJxXxxACZNng6UA/KIW5Hmg0hTHaJcEgRehj9igOYBXSTfcS5Ahf0ZwP
         pjg3HaIX/2yM0vK7kArQWF3uBZdE0pJq/FPPBNm6CvHHJhqrACRWfMBeB5EpwEnBSJ/y
         9kRn7oSBB0/FV9aH/dBeG19fUNbEB0Roa11DgaylcTx3ggbIQ8q7cH7QDAHE1SoEzWmi
         beexBaXpoKNapWUhTihg/e/DTY+KAIWHSLnuWII8WMS9Pkb5xcdHO4pnJgZkD9EfWoYw
         SsFnxTOdiMP0ZYOUmIhzRTc6fP/Dk6nN4XIeMfGHKLREAxXsnzUn1ohU7c9MOcLN5PLn
         /S0A==
X-Gm-Message-State: AJIora/V0sa//dXDMhGzN8sL3xWf+q0isVLmcXPGwrOFsyzxUwMu5QOu
	p81e4DX0WXT+8YC38h9HDZ05uA==
X-Google-Smtp-Source: AGRyM1smRihRT50fdOIiQfU+V8EUtDDGx/W73L/08nARMlYF5jSo5SQ5+guiRsMa9ttFJ2BN1YUJJQ==
X-Received: by 2002:a5d:598e:0:b0:21d:37df:3f2e with SMTP id n14-20020a5d598e000000b0021d37df3f2emr25254699wri.451.1657005710509;
        Tue, 05 Jul 2022 00:21:50 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:3c4f:78be:dc90:14f9? ([2001:861:44c0:66c0:3c4f:78be:dc90:14f9])
        by smtp.gmail.com with ESMTPSA id r16-20020a05600c35d000b003a0375c4f73sm22157331wmq.44.2022.07.05.00.21.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 00:21:50 -0700 (PDT)
Message-ID: <e2746084-ee88-7dc6-afd5-0d0dca4723c4@baylibre.com>
Date: Tue, 5 Jul 2022 09:21:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] phy: amlogic: phy-meson-axg-mipi-pcie-analog: Hold
 reference returned by of_get_parent()
Content-Language: en-US
To: Liang He <windhl@126.com>, kishon@ti.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-phy@lists.infradead.org
References: <20220705021526.281441-1-windhl@126.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220705021526.281441-1-windhl@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_002154_438553_82C8876C 
X-CRM114-Status: GOOD (  16.19  )
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

+ linux-amlogic, linux-arm-kernel, linux-kernel

On 05/07/2022 04:15, Liang He wrote:
> We should hold the reference returned by of_get_parent() and use it
> to call of_node_put() for reference balance.
> 
> Fixes: 8eff8b4e22d9 ("phy: amlogic: phy-meson-axg-mipi-pcie-analog: add support for MIPI DSI analog")
> Signed-off-by: Liang He <windhl@126.com>
> ---
>   drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
> index 1027ece6ca12..a3e1108b736d 100644
> --- a/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
> +++ b/drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
> @@ -197,7 +197,7 @@ static int phy_axg_mipi_pcie_analog_probe(struct platform_device *pdev)
>   	struct phy_provider *phy;
>   	struct device *dev = &pdev->dev;
>   	struct phy_axg_mipi_pcie_analog_priv *priv;
> -	struct device_node *np = dev->of_node;
> +	struct device_node *np = dev->of_node, *parent_np;
>   	struct regmap *map;
>   	int ret;
>   
> @@ -206,7 +206,9 @@ static int phy_axg_mipi_pcie_analog_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	/* Get the hhi system controller node */
> -	map = syscon_node_to_regmap(of_get_parent(dev->of_node));
> +	parent_np = of_get_parent(dev->of_node);
> +	map = syscon_node_to_regmap(parent_np);
> +	of_node_put(parent_np);
>   	if (IS_ERR(map)) {
>   		dev_err(dev,
>   			"failed to get HHI regmap\n");


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
