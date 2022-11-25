Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C239C4167B
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Nov 2022 12:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yhe/kEqiwKhhAjHrwyPPYC5x3jNS1HbSTrMwBV0TyY4=; b=YdOxpGedEKKIshSY6LGctMjgY2
	+TwGmrnRMdvHvQGscpcuhxaTxsr8e8UntmoDe3UNKGVBAa6vKRdMPBGQLD8fNxgmdV8vSBZ8/+n6E
	cPlTM7BePBSSRzQJpVGi0qhSIR5bb+1kjhlXn4MOxMW4n+QnrKo767AmBn9kNlfo0hDEq6hrANeMi
	8X6etGlhefzMNEE2Ivpc3mGxnJZh4qBwb9eNW90Kb/KJdsc678JCsi0YgUFSEv7tXYSoXIL4LUyso
	eTOffs04//fzFiR1Y0f6Q0fZOxL7FDCaHI6Z2wBzZfEmRf4H+oLwMtozG34KwuT7ByvAZlESaEQYW
	GORBfecw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyYDv-00GX1u-Eb; Fri, 25 Nov 2022 12:54:31 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyYDc-00GWtg-Qz
	for linux-amlogic@lists.infradead.org; Fri, 25 Nov 2022 12:54:14 +0000
Received: by mail-wm1-x336.google.com with SMTP id 83-20020a1c0256000000b003d03017c6efso5449424wmc.4
        for <linux-amlogic@lists.infradead.org>; Fri, 25 Nov 2022 04:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+L0OH+CqCrtKGjPWmm+w9b2BzfAcQ+LiOOKvg/k27GY=;
        b=wvDY0pWbo6THktZFD4aifCIxFvHXKL7viQcPE/adaQ5CNQZoa9l46JTneVViRi4V7T
         k0ufBv95R6X4aAwvhyQE2YLpaHAJk+qGibfFnH0zfvL3JLrffCfLvVcMj4IROGSh2C1V
         yZ7UTNPpOWRz1ounE6CfNLUoutWq7ACVTXSI5biIYCf+vKbT9JyeKsuYo1789XPxkfY3
         Ci2Ib87jwCrw3S4Eo/4RL3W0IkmAK0t6JRJutc1ari90thY1oYKbfrkBh57TcxlqS0Uw
         /5p4BglUyjLt7Z8CtZZ1V/URUEOz963ya0LmUYU36jTqwRNLNAcc3Mr52dnoW5iTQyfW
         42ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+L0OH+CqCrtKGjPWmm+w9b2BzfAcQ+LiOOKvg/k27GY=;
        b=PXaQCTrjxAcHXFQuI+9sKGKcMcyv1aTf6bSwoDLcEv4AETGWBXTu58uiu6gwMSLoJs
         nnzAB2f7+tPgCsSG9pkRZO099CkoPo5fL8LthL7XpTKB2Fe3F10iqgRlubh1Wo67SskP
         gJXnddrxqH2VzxP5FBSPkPIOlpeqM0d6KIySC6FvpakRK0D/VfWIOEXDWMqLdldF4UCt
         isecQlRI9uA8X7JYKXcNCzJjgRKO7RU86SJSe+N/BlznMD9bI6OLC2WUXGib5JkA/Y0P
         xnp3D48cVCFS0FsNfoqCBQ/xx9XwjB/Ef0Ystn11y6ZJntmqZ5+aZzwJ8fWJlamwqb0s
         AiBw==
X-Gm-Message-State: ANoB5pmb/lNUaywLDNSd2BiTfZGfBdci8Wok9o1Qa/mqLBU6CkNMhnYH
	cfrDWEoCds/iLwF9PNkYXgUQFA==
X-Google-Smtp-Source: AA0mqf6QaUOeyJHGelkdGQQDqg9Cr3tOC9ZY97MzYk83EKyrbG639t0bn4eiUyXQ/Mg/djl5bTpecg==
X-Received: by 2002:a05:600c:5113:b0:3cf:77c0:48ea with SMTP id o19-20020a05600c511300b003cf77c048eamr30706150wms.130.1669380849331;
        Fri, 25 Nov 2022 04:54:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:84a5:7e09:b15:f1fe? ([2a01:e0a:982:cbb0:84a5:7e09:b15:f1fe])
        by smtp.gmail.com with ESMTPSA id m24-20020a05600c3b1800b003cf47556f21sm10620871wms.2.2022.11.25.04.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 04:54:08 -0800 (PST)
Message-ID: <84c685c5-9205-237d-588c-57d33f956325@linaro.org>
Date: Fri, 25 Nov 2022 13:54:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/6] dt-bindings: reset: meson-g12a: Add missing NNA reset
Content-Language: en-US
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
References: <20221125111921.37261-1-tomeu.vizoso@collabora.com>
 <20221125111921.37261-2-tomeu.vizoso@collabora.com>
Organization: Linaro Developer Services
In-Reply-To: <20221125111921.37261-2-tomeu.vizoso@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_045412_881210_9F760A90 
X-CRM114-Status: GOOD (  13.32  )
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

On 25/11/2022 12:19, Tomeu Vizoso wrote:
> Doesn't appear in the TRM I have, but it is used by the downstream
> galcore driver.
> 
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> ---
>   include/dt-bindings/reset/amlogic,meson-g12a-reset.h | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
> index 6d487c5eba2c..45f6b8a951d0 100644
> --- a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
> +++ b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
> @@ -69,7 +69,9 @@
>   #define RESET_PARSER_FETCH		72
>   #define RESET_CTL			73
>   #define RESET_PARSER_TOP		74
> -/*					75-77	*/
> +/*					75	*/
> +#define RESET_NNA			76
> +/*					77	*/
>   #define RESET_DVALIN			78
>   #define RESET_HDMITX			79
>   /*					80-95	*/



Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
