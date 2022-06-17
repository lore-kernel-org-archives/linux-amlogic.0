Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5437C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jun 2022 07:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6HOKloilf9/27INEW5b+E/uma71FSA79/UbFHGqHfI0=; b=V8EURBcpGeZYFs
	doWVG2oguKwU/mbQwEKXFqa6BdsWOKyIhzZQU1F042bnTZKR3or5S4iJXa8E3N16v52NsFxgUyUpJ
	RE0r+gxObPTt1i1kYnd/vs64CSGFguA4w84MIbaJb1qP5cO/9mt38aEc1PeibM67sXCpI6VCDlW0b
	bwp24k+MYVwch/gdgnXdiaj4JoPEiKGpNr0j72a19LIVKVcUIU8YwWLFWrz9Lng03yDzrad1vMBWB
	po+kQYAVghyg+PN5AFNT1Xv8Gx19MhxLycT/wa5pubvrBAzq6mZ9R988iCORvsUvyJ3ANGK28mpia
	SzyqGS8ZJknjXqytv/fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o26fp-0064bv-TR; Fri, 17 Jun 2022 07:45:46 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o26Rq-005yVf-Qo
	for linux-amlogic@lists.infradead.org; Fri, 17 Jun 2022 07:31:20 +0000
Received: by mail-ej1-x633.google.com with SMTP id g25so7107928ejh.9
        for <linux-amlogic@lists.infradead.org>; Fri, 17 Jun 2022 00:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=dCV6qGUI7Cqg9TdhqvU2+ai6zKfvgQ0lGjyyVFexPIU=;
        b=HE7KhYE/xjUlakk27H3lZOjL19q7HyTLJa+vdphCgSnuB+czh4rVByLN78Sj1p+5RQ
         4V8QTQUKTVuiHbxXI2U9QY6RCMYc0SE9qc/8DjOd/RNJh2EeSlQIZvmH4UDYmfpClkrl
         zxOLypIgJzz2CVNok1B3vytvYEoiM+c6yd8QgJaLgL1RGKl6H42d3EGhsIT3QQxedVBT
         /pDJN8p2MXO2g+YjtQasXNEcF/50BTHOazd2Wsicgek5gQPmLhMx5YXmrqLEyhjT3D/o
         4Ws/cOypVK2Z5sotjuPIYRetuiLUSlLrH1Bu6fBSYPxTzUKdoVRUC2jHVFl2RKH8szvS
         Zn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=dCV6qGUI7Cqg9TdhqvU2+ai6zKfvgQ0lGjyyVFexPIU=;
        b=6Gj9z0p2VRxw55M3MOYNG5p7jJlDYZTWwLUbYClqm6cJugsbQDCxVGLCPHMdteOv44
         RaSTD7OQOEJ6z+UU3etEWMDTfmtZ5X9Y4i0tR6+s0szGfAmBEb6D8fEiFaLOFjRjYHsT
         AlTNqobKU0FEzEuQA2LxpGHANzFSInIz6ymCXR57qwMrbpMJxHTA4Fo2iDRnM8mnEQOW
         JPXErHGMDLPDyIB0OYuVLeYyNhk7/7vwCG/j1DV6TMTkyB8efIbpaGxkCDIy5fmLU7q3
         g8nkPd6K1UwphoaYPL7ADswJb0bfhjjpaTNT0927wko1ZzUhC77MXOZ/tv1kb5nWPIq0
         rIaQ==
X-Gm-Message-State: AJIora8Tjn2PdA/LSywy8WMmeOL0RufCK6PNeiWMTQfwzsWc69mvg4Fu
	dBVU7I6E/7yEnmdObNcMCzK1zw==
X-Google-Smtp-Source: AGRyM1tZZKYyQmjR0eXxMRCwbJxX3hwGRDzNXhGufI0x/0CPupOmdiMHa8oj4351VL2iQ1h3Z8vNQg==
X-Received: by 2002:a17:906:74cc:b0:712:381:9c5a with SMTP id z12-20020a17090674cc00b0071203819c5amr7885326ejl.466.1655451076601;
        Fri, 17 Jun 2022 00:31:16 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:d227:8f3c:286a:d9d8? ([2001:861:44c0:66c0:d227:8f3c:286a:d9d8])
        by smtp.gmail.com with ESMTPSA id 7-20020a170906300700b00702d8b37a03sm1852519ejz.17.2022.06.17.00.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 00:31:16 -0700 (PDT)
Message-ID: <54e1434d-e517-9283-3078-7f042c04385b@baylibre.com>
Date: Fri, 17 Jun 2022 09:31:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] soc: amlogic: Fix refcount leak in meson-secure-pwrc.c
Content-Language: en-US
To: Liang He <windhl@126.com>, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220616144915.3988071-1-windhl@126.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220616144915.3988071-1-windhl@126.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_003118_977085_64274AF5 
X-CRM114-Status: GOOD (  14.48  )
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

On 16/06/2022 16:49, Liang He wrote:
> In meson_secure_pwrc_probe(), there is a refcount leak in one fail
> path.
> 
> Signed-off-by: Liang He <windhl@126.com>
Fixes: b3dde5013e13 ("soc: amlogic: Add support for Secure power domains controller")
> ---
>   drivers/soc/amlogic/meson-secure-pwrc.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/amlogic/meson-secure-pwrc.c b/drivers/soc/amlogic/meson-secure-pwrc.c
> index a10a417a87db..e93518763526 100644
> --- a/drivers/soc/amlogic/meson-secure-pwrc.c
> +++ b/drivers/soc/amlogic/meson-secure-pwrc.c
> @@ -152,8 +152,10 @@ static int meson_secure_pwrc_probe(struct platform_device *pdev)
>   	}
>   
>   	pwrc = devm_kzalloc(&pdev->dev, sizeof(*pwrc), GFP_KERNEL);
> -	if (!pwrc)
> +	if (!pwrc) {
> +		of_node_put(sm_np);
>   		return -ENOMEM;
> +	}
>   
>   	pwrc->fw = meson_sm_get(sm_np);
>   	of_node_put(sm_np);


Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
