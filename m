Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0468C05027
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Feb 2023 19:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BjNBT5MF968ghJDh5mnUOLSgrhPtKOXBFL9aCdZswlU=; b=Y/pIIPKJg1xzOR
	txbR0382E57ZkWMROffvLCvo3PP5XHCBf5OCbPbUt1ZedmF3br5W+QvvjssHI9UiaTYpuMOy8sy1c
	aC/4cIFtieuSo16mzofH+Y80Yfc/8Z/XEXkC14BConJjO66BqQ2Q9DctdMjOjVeUC5q5GOdzkEvD+
	95aODIJM0huerQo9WKwombTD5DJxXi4wiL0qzB70a4ngD6Q3EhCWFCoiNpZg7NnT2sKPmYcHRy8kS
	pWmKLWbqqm8hUkN8WkQqXiuM3+9Iyv3eDfFHJabICLSlwScuJP6B25ov7VepDXknBShGXDnOThYpi
	l63WSAN8B7z8rYD2dEpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP73m-009hs2-MG; Mon, 06 Feb 2023 19:21:50 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP73j-009hqn-V5
	for linux-amlogic@lists.infradead.org; Mon, 06 Feb 2023 19:21:49 +0000
Received: by mail-wm1-x330.google.com with SMTP id o36so9444876wms.1
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Feb 2023 11:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KGhlandvp32zJuT9yzD1H530+wjS7yGNPZyYGw6c5iw=;
        b=RK9KdUt9G34mb44xh/5h3OJn/2y9DCQCHJYG6331S3Nkcfl1SCla9sdyBucGntiPxP
         fCwsuLQRfMDC19jPGH1Y7GtU7tj7qiU+PNQ9WWEc9RdVP7nGXvPJ1whG7edf62isi0WJ
         9hY/eOpkb+YzwOk7lCraIXsxuQRi2r3r0WGQQUCCsSVgxAV0n7+DM7Wqb4Ph4/ZV5WuJ
         2BzG6Bys/oFKYCIL40QiJjohO9wOQasfG/5PnsgCj7Dmr/+j84I2kvOCRHhTLFAIn3Gp
         7rlmaIm9O+vHBDwcnfD0bj856GTRBl1D7nA+L9/lE1Wr4pZiY507foIqIiNwdphuGrZy
         W5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KGhlandvp32zJuT9yzD1H530+wjS7yGNPZyYGw6c5iw=;
        b=zyTdvDt6Zb08R57zRxmLOYMUtnGNEI7UYvuui0Itcitq3aDcWse+JLbsWQ0fJfm+tW
         HII+4cO1nxd9ZJLsU3YQ2gIslpXLhVzw/boBbTQYsaJkIWSCtIMRuREzHgCxnlnYaqUg
         BRz6U2RN3qQEgNn4ogMu+zCPxVoQFSBNXcaJZ/RV4LMPvKsw4eOshtxknkDYHZa/Hmxi
         h+znh+kDRh2kHRlAZK4+r3vpUcscBgyaYS9B2uxfawWNbTbhSIszs0aTDYm/wlfxz2ul
         2Z8pnw5Bk6k0aPlwOEjkrfdJOYeEjF7eqY5N/5KSeo8Yhchk98K+7t40capqfFepFYTO
         W3Og==
X-Gm-Message-State: AO0yUKWGL/Rw+k8ReFqa161dRu3I14IouOFxpi9aDv/svtqPHGSU+7QI
	mZ9bNWmmskkEsZCCnpcGXh04EQ==
X-Google-Smtp-Source: AK7set/SDIe02vvcqIXxVdYR1JTowEX0cXIGhrq4GDN8fP/pcdD3VeaD4VIm3863dwYdvnDd4WXa9w==
X-Received: by 2002:a05:600c:1714:b0:3df:dc29:d69 with SMTP id c20-20020a05600c171400b003dfdc290d69mr676718wmn.36.1675711304635;
        Mon, 06 Feb 2023 11:21:44 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r13-20020a05600c35cd00b003dc5b59ed7asm12549446wmq.11.2023.02.06.11.21.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Feb 2023 11:21:44 -0800 (PST)
Message-ID: <a711905e-dbfb-4258-62be-250a9549a9c4@linaro.org>
Date: Mon, 6 Feb 2023 20:21:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 7/7] ASoC: dt-bindings: meson: convert axg sound card
 control to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
References: <20230206153449.596326-1-jbrunet@baylibre.com>
 <20230206153449.596326-8-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230206153449.596326-8-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_112148_034852_8FE105E2 
X-CRM114-Status: GOOD (  15.48  )
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

On 06/02/2023 16:34, Jerome Brunet wrote:
> Convert the DT binding documentation for the Amlogic axg sound card to
> schema.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  .../bindings/sound/amlogic,axg-sound-card.txt | 124 ------------
>  .../sound/amlogic,axg-sound-card.yaml         | 183 ++++++++++++++++++
>  2 files changed, 183 insertions(+), 124 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> 


Thank you for your patch. There is something to discuss/improve.


> -};
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> new file mode 100644
> index 000000000000..b7459fad0e7f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
> @@ -0,0 +1,183 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic AXG sound card
> +
> +maintainers:
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +
> +properties:
> +  compatible:
> +    const: amlogic,axg-sound-card
> +
> +  audio-aux-devs:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: list of auxiliary devices
> +
> +  audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description: |

You still have everywhere | which should be removed. Here and in almost
every other description when no special formatting is needed.



Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
