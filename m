Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3009C4332F
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 10:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EmjuUPPbPiM27J8lPKRddaq+eeB4OodLfij8XG39rAE=; b=KqkWYt1zlVjTov
	S4BzVLjQ4JlXHoU19X0fipwSUdoBZRQk711rP8FuBa0p+KKJNK2ildfT+YEBCefVfggv53x60Grji
	2Iv+QrY8cL7XfGBsdgSVS0Nf6GBSFF89quHpQx/wfoh/TL8JxkiiOEMcRrJ716B5pSGqRAcmMNrlV
	pKddPHR4wMBEOJlbYcJeDF2peFfsyJbYf2xxGzthZwvd/8F7fpVQ3YPNnIc45M3KJDmBwAhq7aqiQ
	m8k1bhG7Om0t1Rpm/Gpynxnsq3KFkZczuEJ/msbiO0tD61+opzKl6Cc9rcJ2F0lMvZ6i1qaYVgo8e
	6BFGrCM1mXtC//tvan8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13Tn-00FeAl-QW; Fri, 02 Dec 2022 10:41:15 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13TQ-00FdsK-7b
	for linux-amlogic@lists.infradead.org; Fri, 02 Dec 2022 10:40:53 +0000
Received: by mail-lj1-x236.google.com with SMTP id r8so4943536ljn.8
        for <linux-amlogic@lists.infradead.org>; Fri, 02 Dec 2022 02:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+MXYguyjssptA8DU77l67l2AFn1VS80LiknP4/TOsmc=;
        b=IEJtlvVdwgQCZC8vt/M9I0Kyxqy96Uybos+AsQychnP3fbYugkDJhzyjElPLuGU/d0
         3TmbP6wuyBB/tQTr3fL2/1y5DotifCT+UCxav/w4tWZP4FoNyQGLmHqjn9obnBVLmBGu
         LDTs9KHzTiA+4SWcR51brofVIm8ORVh7YaXp0BceeQULu/OMw8yGbRc2fbOhHzU+KJow
         cdRFBJoMVneUnSarWpNuk9cpPhr3lqhqUl40wp6VEoo+o78WHOSHWAa0+gcyNYQEPnq/
         r+8BJTSyUc6kPLF7prLWPjQEaWAK5izSTxdaT82Y3xxpo8MYfPxQ0uAfCUNNTvkIp16l
         DpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+MXYguyjssptA8DU77l67l2AFn1VS80LiknP4/TOsmc=;
        b=59yq4WSFxqyTJ0aWCEHbMXWCMAJ5/C+2OKnBLUpyltGDDqSKXlxpoivAOfSdcQppOw
         W6rr3MzaGt8fWVPrDx8iHV3xmFqzT1kGHul1qWb50BbxPDIrj4ylIwd9+xDAINNr/ukM
         RCpnGfHUVeTUg85EuUdtbD2whe6HZ6P6BmlnsvYgo4BRCpML5ZJ/OM58UwmWJEkxwICQ
         X/x6ZHOLruh3qPlrRYuZAYximSd/guwxBpAqnuKCNpmZJvAA1JIv2XLc82fxHOUsUCUJ
         dI//t20u4cGjEYScqtOlNj6ul06c39dSi40h8xACJea6lx72kBKZm02WGjT1H4pgQej8
         T+9Q==
X-Gm-Message-State: ANoB5pkeB9VsEzoCpTxw98rfflNru+Goyq4spAbCRn9ykqKaZEfwrZpX
	lGtuEcA/m6+ziqc0TSx1paRpcA==
X-Google-Smtp-Source: AA0mqf6G7NS1s2BlL4nzio2zY8DUUfrHcznNa5otERS9Z2UdUD5OSMEGq62r4PCDY+cYyJuggsMIHw==
X-Received: by 2002:a2e:a806:0:b0:277:4b35:d94a with SMTP id l6-20020a2ea806000000b002774b35d94amr14436143ljq.21.1669977648518;
        Fri, 02 Dec 2022 02:40:48 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f7-20020a05651c02c700b002772414817esm597103ljo.1.2022.12.02.02.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 02:40:47 -0800 (PST)
Message-ID: <3a6bc7ea-284d-27f0-104c-51a326d07d27@linaro.org>
Date: Fri, 2 Dec 2022 11:40:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v8 10/11] dt-bindings: clock: meson: fixup A1 peripherals
 clkc dtb_check errors
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, neil.armstrong@linaro.org,
 jbrunet@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
 <20221201225703.6507-11-ddrokosov@sberdevices.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221201225703.6507-11-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_024052_293531_E6790D33 
X-CRM114-Status: GOOD (  11.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 01/12/2022 23:57, Dmitry Rokosov wrote:
> During running dtbs_check and dt_binding_check checkers the following
> problems were found and resolved:
>     - $id is not correct, it has wrong url path
>     - no base offset in the dt node definition
>     - CLKIDs aren't applied by names, just magic int constants there
>     - address and size cells are required for long reg definition
>     - wrong indentations
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  .../bindings/clock/amlogic,a1-clkc.yaml       | 36 +++++++++++--------
>  1 file changed, 22 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
> index 7729850046cf..b0249ab21466 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
> @@ -1,7 +1,7 @@
> -#SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/amlogic,a1-clkc.yaml#"
> +$id: "http://devicetree.org/schemas/clock/amlogic,a1-clkc.yaml#"
>  $schema: "http://devicetree.org/meta-schemas/core.yaml#"
>  

NAK. This must be squashed.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
