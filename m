Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEF4ECAAD2
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Aug 2022 07:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hyBAt8ZsummgE/v0+yqi/FVhjCLlJli+N/PHxJK6NnM=; b=zI5tLTvRvD3cgd
	6eg4PoCWKey8zdnmSiwEQmTlik+BKag7lP0B3ajv8anIPWAYQfz/KOB9U95Rd+TQctrJLe5d9Nomp
	T0Vrv2eZZVA8E52V/7pfkkV9YHnuLN3qw0w0rm2WM21Q0qZkAJaKrux881pgxOshIpIm4IpA2iD23
	c1QPfC/DRpJ8iQu2/7I4NlTMeJBQPQTYZ/JEOEKRlKHee1r4n3UgS6fZLwPjWCBXIB516t6py7m2E
	Qzs7teAE1weszM172x3qXXhwevS+nU0EwaUt1RAKdSUI/lWFZpOvLgMABog6Y8F7rZLieJ/bVhDCD
	45dMpUOmz8B1fBSuD9Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZLJ-005i1t-Rt; Mon, 29 Aug 2022 07:37:57 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSZL4-005htN-Tp
	for linux-amlogic@lists.infradead.org; Mon, 29 Aug 2022 07:37:45 +0000
Received: by mail-wr1-x431.google.com with SMTP id az27so9039884wrb.6
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Aug 2022 00:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc;
        bh=gfWQ10TclrknFCd+XZM/2+gvyUXHdW+AZrxMDfV0udA=;
        b=g114O13V4iT+/XatqKhKauqRqxZWPh9D2RuWfr+taSHr0l+h7Mtxk5BCTVpjgYE9Pu
         bzZjG4vIRnYLM3ah6VgAzfKDHTdAyWNKkhJP5uQVcz+Kgdgymi8olyaiZ9momW11YlmI
         b4/qWxeIoVcbTW57TIVw5gl2pOJA3IGSunnScCpUxK0uaW5lQXITNngJpYSS/cQWJqOL
         ZSfLR4W76+aNJbOQ+MTgmpcmDfZ5wvbLrqhXoY0klvwpLzvrEDLZRilrBgD7hBQNdtTZ
         hVzQy08vMI4W//wTtt0A4epCzxwEbSN24NaWAHoFBZqfCvoJlN8noLQT/sB83T9uhtMo
         JLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc;
        bh=gfWQ10TclrknFCd+XZM/2+gvyUXHdW+AZrxMDfV0udA=;
        b=Gh7hEFJOXe0Yzgioj23d5Gv70nr1AyMF1ctuQnpKRPrB9NBPZGmEL5bunwa89JxRdE
         zcvEykxVVE74eYmFxiDA8jXQVaCypeCzixPDolF6jSmn8k7sCVOELFjDm+j5HNG7gjmR
         Ob3CippUR7KnxmqneOSIN0K4Xysl5E11Sg3lQcWZnQ3I91BQ4YmL1C+xa+qiHPsWkTGL
         Ox8c+w1YexJByQyKVDaqrPUA/wVJ90RgbfZco1bDBJIxo3gZ8r7fcarUjphxY31kEXD6
         PjAAPMhNsOTshSr0jtql8lkq2brfx1NS/L/Ulu76jsYOdvl9yrz5dGFraHYaoVBRNp1z
         zKuA==
X-Gm-Message-State: ACgBeo3xIi+EbyZhvSEqMslPBa6cQBGrQl/iYosynrg2ym28YJrxXMwG
	VjRzt3iLGWUWhnNbYuxEyTG0RBHWZX8X1Q==
X-Google-Smtp-Source: AA6agR6ptbAawlBZ/q48NOnMKoTSKnmC5sF11LfuYW6ptPAv0GkSrw4r1r5mSWDDJDY7orj4uutihA==
X-Received: by 2002:adf:d1c3:0:b0:225:6f85:b0d8 with SMTP id b3-20020adfd1c3000000b002256f85b0d8mr5388440wrd.81.1661758659171;
        Mon, 29 Aug 2022 00:37:39 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:6124:6b74:2847:d37b? ([2a01:e0a:982:cbb0:6124:6b74:2847:d37b])
        by smtp.gmail.com with ESMTPSA id o7-20020adfeac7000000b00226332f9275sm6225174wrn.22.2022.08.29.00.37.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 00:37:38 -0700 (PDT)
Message-ID: <c6ef3060-3576-602d-25e7-b0a7afbbbb56@baylibre.com>
Date: Mon, 29 Aug 2022 09:37:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/2] arm64: dts: meson-g12a: Remove 'enable-active-low'
Content-Language: en-US
To: Fabio Estevam <festevam@denx.de>, martin.blumenstingl@googlemail.com
Cc: linux-arm-kernel@lists.infradead.org, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org
References: <20220827203813.1742715-1-festevam@denx.de>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220827203813.1742715-1-festevam@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_003742_968573_7AF052A6 
X-CRM114-Status: GOOD (  14.80  )
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
>   arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> index b4e86196e346..b2bb94981838 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
> @@ -111,7 +111,6 @@ vcc_5v: regulator-vcc_5v {
>   		vin-supply = <&dc_in>;
>   
>   		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
> -		enable-active-low;
>   	};
>   
>   	vddao_1v8: regulator-vddao_1v8 {

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
