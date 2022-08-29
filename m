Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C47ECAAD4
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Aug 2022 07:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QpcbBGvsxzKKqktkQfLECSc5Jj+bggU73GQ1Kec3aSg=; b=D5jglKJQ9xoU7d
	TAphdmVEUHX6I+91OFLIZK4vodAVKWz1hBhkMZmqilP6eOVpD9fyDq6zbewBhx4OQbpbIzgc6VSBR
	6coIbsE77xGJOgnzVySVGIYuXHdrBNab4BTyLqOOfYBjH/ES8SYqlUCTLDoBE+Jbchg66h9SAD9ps
	g5+0gvZ4Jm2uBhN5SHGPl5MLIrPwykM/hB/KT68z6OpgBadIrHnZNbQ3k0T72gdguLn5sFb0ff0Hf
	Jl6l4lZpPehkWAy4O2iPgm8m0Kl257Hl0V+YkE/AUm/q+GIqapAqXEs1VYalK+hjUw1F13UAfuHt3
	XwUjero1MnvM4E2tgVGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZLL-005i2u-6U; Mon, 29 Aug 2022 07:37:59 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZLB-005hxF-HC
	for linux-amlogic@lists.infradead.org; Mon, 29 Aug 2022 07:37:51 +0000
Received: by mail-wr1-x431.google.com with SMTP id b16so1419284wru.7
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Aug 2022 00:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc;
        bh=+fbBJpjweTxtrpaemmI7sIkQ6Sy+9kLAlKv43FckmIY=;
        b=fmMdnJx+WQ+Z3njiw5t3BAtuvLQ3NfVvqy1wgE5oFx2prkuUStdfziC9552FHJkbRi
         i7diJ4orZXGRqtm9LeHjatNV529OTouhsJ8a/nfofevzD0DjKZRpedV5pfoeAz9my6J1
         3Ib2a07cGy9mbdbxnog9Lt4DXKcRwdx5M+CfPVXtDHD9g0jsInvSFRIIXqB2MonAfUya
         Yl2xAXBXw2/1ZESNoqjiMdJfpriyvujKBvi9RGPudihxsnMbgAh7iCRMk6i2v8nywRfU
         71PAxNZgm0ASq34oo0hE3vfMKmvEehP6YdFDWoinjlZx0J0igl0VoaEa3FGSSlS7pK4P
         3MWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=+fbBJpjweTxtrpaemmI7sIkQ6Sy+9kLAlKv43FckmIY=;
        b=KQxejjaEGkFgYcC7wVeJNVcnXCaxz40Aw/OHS1yyNJjsw1+EvIxuxodhZxVb0KDB92
         i4ETr+j9kEr9DtUE9oK4tvphBIeMrsG5/x/rHbA2AXZN/TYsIbRTBmoZw5ilP4ihWNLA
         XMm5XROd57Q41kOJ9nglqrq5zYP+DbY7Ox/3ydr17kygjM3QakgJqTtCdc7gZrCmu6Kv
         PbwIbUwcJQL/zdsWc5XZbmYQLtfHVXO5VSpnqGoBJFCU1WtZChPNhMk9OIPYxIVySqet
         yVpI70gYWZ1NMaNoBWyvmPOtuDmc38Hei6EWDvSU3qId4dKqz0nI7Rh+RkkU5RRl2skT
         5Nuw==
X-Gm-Message-State: ACgBeo0k1DjGN8nSUSf1EmpKPyej4+Y/OJEZA+iFMyis7Jy6HN9pYdEd
	Ao38nrQAVgVUMPmQPe2hSQI/hg==
X-Google-Smtp-Source: AA6agR4F0xlWwqohy0BsvgDGvxnVGo1nrnWOeamG1bEdIhyl2rf9fFn/PFBMi+1NguMrismYJ5xlCA==
X-Received: by 2002:adf:f6cb:0:b0:220:7859:7bf with SMTP id y11-20020adff6cb000000b00220785907bfmr5264222wrp.683.1661758668266;
        Mon, 29 Aug 2022 00:37:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:6124:6b74:2847:d37b? ([2a01:e0a:982:cbb0:6124:6b74:2847:d37b])
        by smtp.gmail.com with ESMTPSA id v16-20020a5d6790000000b0021f0c0c62d1sm6255297wru.13.2022.08.29.00.37.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 00:37:47 -0700 (PDT)
Message-ID: <c949f3cd-b3f4-5c51-0bc8-7d46c1e26809@baylibre.com>
Date: Mon, 29 Aug 2022 09:37:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/2] arm64: dts: meson-sm1-sei610: Remove
 'enable-active-low'
Content-Language: en-US
To: Fabio Estevam <festevam@denx.de>, martin.blumenstingl@googlemail.com
Cc: linux-arm-kernel@lists.infradead.org, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org
References: <20220827203813.1742715-1-festevam@denx.de>
 <20220827203813.1742715-2-festevam@denx.de>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220827203813.1742715-2-festevam@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_003749_636631_B6EC7473 
X-CRM114-Status: GOOD (  14.70  )
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

On 27/08/2022 22:38, Fabio Estevam wrote:
> The 'enable-active-low' property is not a valid one.
> 
> Only 'enable-active-high' is valid, and when this property is absent
> the gpio regulator will act as active low by default.
> 
> Remove the invalid 'enable-active-low' property.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Changes since v1:
> - Put linux-amlogic on Cc and added Martin's Reviewed-by tag.
> 
>   arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> index 603337ca5608..9068a334ea57 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
> @@ -171,7 +171,6 @@ vddao_3v3_t: regulator-vddao_3v3_t {
>   		regulator-max-microvolt = <3300000>;
>   		vin-supply = <&vddao_3v3>;
>   		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
> -		enable-active-low;
>   		regulator-always-on;
>   	};
>   

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
