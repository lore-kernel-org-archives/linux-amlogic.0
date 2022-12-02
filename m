Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E968C4167B
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 10:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bhDdgg70UcTDrFujUD1MUWyXn57Vw1v9Y5x2HyJZbx0=; b=mOr3DXz2pL0PFa
	Rc5teOVv6q7MaR4KoKno4p0RAE6iYmOGk95FwQ8g5aoL8dXmc+QL7aKhFIR0PSkoEw5XyY52eb+9U
	W+QpDs8g7Beari4EiDS3vyr45tiWDQq/kNGUcgu3VV/cfqWFVJmfg3VzZbI8kHDtGhzN5XzTrxSxS
	OWlEZf/7HndZfD8wukGhqcldJgBvLOQt06LIPTQdjrn70K6XCyup0viUbd9vK0Yu3gjrJx/KNwmuo
	tuNNvLTTF478V0W0NyT5/4IEPpSMJ+8mUqQTGk+JQZLyRQSqme5q0a80YR6IBO5VaynF+EMWD5KEp
	td27jttQhJLjkt0LHQSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13TR-00Fdv3-AO; Fri, 02 Dec 2022 10:40:53 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13T7-00Fdia-C7
	for linux-amlogic@lists.infradead.org; Fri, 02 Dec 2022 10:40:34 +0000
Received: by mail-lf1-x12f.google.com with SMTP id g7so6789706lfv.5
        for <linux-amlogic@lists.infradead.org>; Fri, 02 Dec 2022 02:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TPk3ApbRCS0/4hhMFJ/d7DRNyPwO/DR9Aal7CDZHgzk=;
        b=HEiPaeK82n8UhnGfAkC3Ydjm03bumfbVLUgTH1il6UfUvynI2T3gUniZgCOp+PROe8
         +oAFrM3Xl4qkJRsGqLZ6jmHVDk/BHtAi8WteHEfOdlMfmuzppFHUSk2TOSkGHX2RDM/4
         F9hzOPgWwLl3vrVFTuM+6wB5B4vpuS3uSaz6nhGDksqtXs8u2AxTU8QapxZmwAOVQZvd
         /L0n7ivXdQ9BmSVqY7tidcdCt8+uWlfA/G6gWvKu0zXfuf7n3F6OGX78JRcj+J0f+Xts
         XaHLzli5Rjry5b4JHkVlvBTFzGvWHA5+NhqkeDHHPsIJVHNquIJYjj2lg4oQ/U/AEACN
         Q7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TPk3ApbRCS0/4hhMFJ/d7DRNyPwO/DR9Aal7CDZHgzk=;
        b=RXByGcFvuqWbut3r4wQ4z4sD75sJGfwnmIwy/mfRyNCHLtwP42EfvTckOHdIFKx5UE
         9Rz4nE0StkdtcRIXR9VLqi46gRtWan+15KpILpBPYlSTU69thHvvE3Vq2qgO0zCuPfVZ
         XdT8KcuICBID+aXMWj/mnAxrQmT+2WM9ROC2JTg8+tqTN+qmNO4BJIEON+1DO+UaHgSY
         7t8R34u2wRHkZxwtGkqY6mCDD+QhENbxOUIju2/+N099anLlC+m10TAb/ywyTfggkiqd
         deZltxT8DcqzaXsb7+WLcJ8tvIDpFKOtFpY0sYCOlntR9onIm15wd3LI8R4PUzmtLf9J
         G9Xw==
X-Gm-Message-State: ANoB5pn2X0G/cxjf8jG7BV0gBcMGIFg8QOLq9pmfIcQ7UJWNo+ke0L0z
	ItoVSnBmS27wUNgSkSfduhMpfg==
X-Google-Smtp-Source: AA0mqf7w4T+ArramDxaYnxkQZkngy0bGcYs96DDb75oY+RO84Yx8wbbk5xolu8+QOpXawniNAqT39g==
X-Received: by 2002:a19:2d0a:0:b0:4ac:e5ff:d1d8 with SMTP id k10-20020a192d0a000000b004ace5ffd1d8mr22660150lfj.304.1669977629431;
        Fri, 02 Dec 2022 02:40:29 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id e4-20020a05651236c400b00485caa0f5dfsm981818lfs.44.2022.12.02.02.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 02:40:28 -0800 (PST)
Message-ID: <05cadb7d-2087-a507-f33d-c4501361175f@linaro.org>
Date: Fri, 2 Dec 2022 11:40:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v8 08/11] dt-bindings: clock: meson: fixup A1 PLL clkc
 dtb_check errors
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
 <20221201225703.6507-9-ddrokosov@sberdevices.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221201225703.6507-9-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_024033_420912_0E873FB5 
X-CRM114-Status: GOOD (  13.27  )
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
>     - CLKIDs aren't applied by names, just magic int constants there
>     - address and size cells are required for long reg definition
>     - wrong indentations
> 
> Also this patch adds new A1 clk controllers dt bindings to MAINTAINERS.
> 
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  .../bindings/clock/amlogic,a1-pll-clkc.yaml   | 27 ++++++++++++-------
>  MAINTAINERS                                   |  1 +
>  2 files changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> index d67250fbeece..83f98a73c04e 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-pll-clkc.yaml
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: "http://devicetree.org/schemas/amlogic,a1-pll-clkc.yaml#"
> +$id: "http://devicetree.org/schemas/clock/amlogic,a1-pll-clkc.yaml#"
>  $schema: "http://devicetree.org/meta-schemas/core.yaml#"
>  
>  title: Amlogic Meson A/C serials PLL Clock Control Unit Device Tree Bindings

NAK.

This must be squashed.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
