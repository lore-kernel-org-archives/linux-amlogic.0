Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7526CC46467
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Jan 2023 08:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1Q2zXclEfmPGvgD5bcpHKMWd8Fs0JI53pWrCJPHOYA=; b=xvfeMWYHWbEWAtIn3ao9NmrcbG
	l4VT99zVlXGaFqx7URSNQwbQ2TTvkmhS7Xg+Rj4S9Y81ZUQl9jquF90oOWLVgtR638immxkeXX/ax
	IlwWct/zFJf3XAz0ODOUVGwa4JVMAawRghuT3N5nc0NPtjjG+ZMCfjr8XOYA1ikxHSQrrMPgoKo2x
	K3dqtwGvYQH1k+AYjexL1cu/x7sg0MjTkEEtZTHcZMkj1QGzupwqYb2f6ifIPFnkwWbQVjC1tX+WP
	et1LmqHQm/bp3BYS82hjSAQdCcS2Y05/aDe6G/I1SC9/0iEmauC49Rp5nhgY3jGxdNpqc6CzC65Bm
	tZN2/ZHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF9yK-005ngA-W3; Tue, 10 Jan 2023 08:27:05 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF9yF-005nbS-8n
	for linux-amlogic@lists.infradead.org; Tue, 10 Jan 2023 08:27:00 +0000
Received: by mail-wm1-x32c.google.com with SMTP id g19-20020a05600c4ed300b003d9eb1dbc0aso6227271wmq.3
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Jan 2023 00:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wawoO53rvJlk1mkrEk3Mn7XLvK6KEeT6tqX3/48e1U8=;
        b=Pr9agmqsqknAJz4q08X2fSpPXl8kZ8Z5uKdN4Vv71jNwgsf/nNe86VXEyygxPjlS1+
         gh/phTG0PdLsHhZdshqlb5kYaQvTDXCXFwOhBsnXxIcWteCMcYoy5Qfs3SsrxkWLLx3W
         hugOFc5Hcu3lEo7HJkKfdm+xi9R4ToC5ofhUwt8yR7aTMtheBUy8nXzk+YeSc4/MIGmj
         iD/UurKfMlWmDuUgf0tfMLblapSoqUpYumCISSHxfU0vA0+iib6EPvbgXmkBVX5aLl6K
         b+wkefGVbEhaGjydfCcfx2NBpZjUVLA14rAOF6IeuLZdbqp88gk3Nlm2m5/UhHvPAel0
         I72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wawoO53rvJlk1mkrEk3Mn7XLvK6KEeT6tqX3/48e1U8=;
        b=ABHKEgyXF+Q7yqsrl0Efd4x82Azd6iBf3s/DTBzCfOn6EGmTRJSlXhegU0jfTalQss
         7uXjnU831I7VwDbt3x78ULwHNv4kUieFwd9Fiq7WiXHzXWkWbqL9RTqeanaBm8XZGAmM
         hsnpEXLKRf97MK0LLIwc0472OZYKZ97k4koggFrWxqq7/oWYwloxS/WAKem/0D7+xewF
         YSDU05BTm5f0enufC/ZOrY+JbUiHzST7sUS7gd/jvCigGWkl4jHz02PNbPCgUxenW5p4
         QzMUasywQaSOqXVG8P0FzlwnG5d3+TT5QIj4KoNGCQ5UgMdITXyApgT5ljLM66Kd+Lrw
         TM8w==
X-Gm-Message-State: AFqh2kqR73uB7M4hTh5f2jDT/0sODDVDwP97iI8Wc9lBJ0yoPqoqMSjT
	fu40u278VPEd9Y/KxYLeqOkWdg==
X-Google-Smtp-Source: AMrXdXt2gDqizNUTxd+mOomuKh6q+bSdCe2n3FEqcVtnbcChDYNm1xQohVp5HnaiBOhdC0GfD1EAIQ==
X-Received: by 2002:a05:600c:1d23:b0:3d9:fb59:c16b with SMTP id l35-20020a05600c1d2300b003d9fb59c16bmr190317wms.36.1673339212077;
        Tue, 10 Jan 2023 00:26:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:26cc:e5e1:3044:b226? ([2a01:e0a:982:cbb0:26cc:e5e1:3044:b226])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c444a00b003d998412db6sm19917256wmn.28.2023.01.10.00.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 00:26:51 -0800 (PST)
Message-ID: <71924012-8955-92f2-5fcc-4632a01bba29@linaro.org>
Date: Tue, 10 Jan 2023 09:26:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] firmware: meson_sm: stop using 0 as NULL pointer
Content-Language: en-US
To: Miles Chen <miles.chen@mediatek.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230110031242.4917-1-miles.chen@mediatek.com>
Organization: Linaro Developer Services
In-Reply-To: <20230110031242.4917-1-miles.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_002659_327642_D397E266 
X-CRM114-Status: GOOD (  14.07  )
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

On 10/01/2023 04:12, Miles Chen wrote:
> Use NULL for NULL pointer to fix the following sparse warning:
> drivers/firmware/meson/meson_sm.c:85:24: sparse: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> ---
>   drivers/firmware/meson/meson_sm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
> index 77aa5c6398aa..3f5ff9ed668e 100644
> --- a/drivers/firmware/meson/meson_sm.c
> +++ b/drivers/firmware/meson/meson_sm.c
> @@ -82,7 +82,7 @@ static void __iomem *meson_sm_map_shmem(u32 cmd_shmem, unsigned int size)
>   
>   	sm_phy_base = __meson_sm_call(cmd_shmem, 0, 0, 0, 0, 0);
>   	if (!sm_phy_base)
> -		return 0;
> +		return NULL;
>   
>   	return ioremap_cache(sm_phy_base, size);
>   }


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
