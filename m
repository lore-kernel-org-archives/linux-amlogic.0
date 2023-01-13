Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8ACC54EBE
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Jan 2023 07:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2WhHuP3Evwym8SXua907WYtUdWYjmu0MpiwruDqQvIs=; b=hoFbQQ+Mltw4jk0l4AQ1gH6DoP
	MI+vNWulFaJX03aspVQ9X0hj1CxrauN11S2AlSKPhIZl4NjvsrOQg2GJnN7tua78ylzqrNvIup10l
	36BZi/DswfgJiJO9alJxXaTZkqeAERW3FJrOHeckWJSt/7eeglA5Do5sj4Ypg9/1fUwiSbZHiBuiB
	D/ZBrtRhtPNYryyxFontXqmXop3sfhT7wVvaDiTvcNIMfzMVJFNv4ulJQFPSAhkyi/MUc27lGWOHK
	lDAvfNqYM79QwboZw6Ij/c9fjnOhkuVoUeTOr+SSEJOqR1H82q0vCXGWRhYHOs49vxeJhpER2PcoK
	3FpsyTLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGEyR-0013zV-BG; Fri, 13 Jan 2023 07:59:39 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGEy2-0013jD-04
	for linux-amlogic@lists.infradead.org; Fri, 13 Jan 2023 07:59:15 +0000
Received: by mail-wr1-x42d.google.com with SMTP id bk16so20243787wrb.11
        for <linux-amlogic@lists.infradead.org>; Thu, 12 Jan 2023 23:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jvba+bm1uvcwXeIUk9rep+TyHVoE8xZjiX2B8KGVNBM=;
        b=deIrp13k8iDkx1qZbiM6GPK3IRY04a4xEvRyyFdD9MVwpjQIgJB58GWW2vRordZK3u
         duXgFfargj67sG5g/U0wrpxMqfcy8w9wVsGHBQ9/T5wM0Z5nbPscPkiBHK9sJENgU4UE
         LQQKUJm3jhzHA9jS1cIJi/CzUvuBaaY2V+i29V/ddFgzs8QB1JIy8/nctO1eQVzldTub
         Nh80b0UfGkpn7eKTGqUUd8nCcsHPLQrbOGAmZvL60TzXVaHdlCIL/FtrMcr6Bv8unL6T
         bpv8GkzEFISE3UTQ9B+q0+NFL0ML+PtWVSqW9LDLExi8p14N8ULgMIph5lO5OAL7a1v8
         s8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jvba+bm1uvcwXeIUk9rep+TyHVoE8xZjiX2B8KGVNBM=;
        b=kQ58J6TbaDH9h4oXfcG/LZ4UDiTP5WioNoXTd33nVNeLNoufw8W5SdIWiZuhfYneTy
         d3pBjWyAgdMUuwD1BvAYV/q2yg92n4bkaTsxkXUmeqAfBVulqgjx0rJ+HcT9VxYVGapJ
         1bn+n5rY1dw4sVi5hwjIZ/JendAn0EF3MVmk0xIhegNGIlQWlQvcxnZApiTomWU4/fuF
         ckOGjvbQIN8zjHIPCbLOEO0kK/w44hEXXFOn2+uYJQfIFDX4ZuX3L8tRR2JH/ZCGHVdN
         j/w1zglXZlHyp3m3VB/mdnU+EO8lXvWjfQABa4lM0fRR+9Ws9VT/Tirv2ZxMPvRtnDMw
         4gyg==
X-Gm-Message-State: AFqh2kql7F0Vk3ZKR97HvEPQMeqlnQlU2HvyBmXd8zrejwUcUUdfqCoX
	Ho9sv/dwxswFXwl/QasNQuBTkQ==
X-Google-Smtp-Source: AMrXdXvXAdlx4wpgTMkmqS1ZHmdpFmO62gdl7i9fhzy4r7bJEHwMPD5PmjYgpTh3RyvUkCjE5jCOjQ==
X-Received: by 2002:adf:e448:0:b0:2b4:790e:32f3 with SMTP id t8-20020adfe448000000b002b4790e32f3mr19181873wrm.68.1673596751842;
        Thu, 12 Jan 2023 23:59:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8660:aed9:5ce2:6bbb? ([2a01:e0a:982:cbb0:8660:aed9:5ce2:6bbb])
        by smtp.gmail.com with ESMTPSA id bo30-20020a056000069e00b0027a57c1a6fbsm18507611wrb.22.2023.01.12.23.59.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 23:59:11 -0800 (PST)
Message-ID: <a96ca0c8-bd33-038e-2166-f487da09b007@linaro.org>
Date: Fri, 13 Jan 2023 08:59:10 +0100
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
X-CRM114-CacheID: sfid-20230112_235914_058210_B3824446 
X-CRM114-Status: GOOD (  13.92  )
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


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
