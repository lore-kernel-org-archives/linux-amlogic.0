Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D527C00140
	for <linux-amlogic@archiver.kernel.org>; Fri,  5 Aug 2022 09:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e01bye80ovOISP8ty/oQcT1xsqDYskK5vJBCG/ahcNE=; b=EnprQk9Btb3bUY
	WoR3P6d8gGPDdUYM9oQ/TUtSkS2RhW8PB+CQqy4f6r9VEjiZ+A/ADKkj9+ZRD8AVZZlbyrxNX5uuy
	4MowM33yMdDGxfMwWKE/ER6jDesVldPgwupNEG/SEf9AZ0kOiIfnQ0OSdRahJAKlynElSE3xtrEZm
	EsTgkZAlxHPV7JrFNSpPcD/CRpYgtY86VTrpqALFQiqRA3q9RtKNsWgUqL01JizkZPDuCLV0eL1zk
	GuVv5qT6SLM3noqep1oz64juN1NMQTUtJ1nuGT1zK2KFLrPzVsObpSU1kREagZBsHNrqSiuP95Ezr
	4cq5VS5XI+ceaPkWm2dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJtOj-00DToc-9L; Fri, 05 Aug 2022 09:13:37 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJtOP-00DTbl-5z
	for linux-amlogic@lists.infradead.org; Fri, 05 Aug 2022 09:13:19 +0000
Received: by mail-lf1-x134.google.com with SMTP id t22so2607835lfg.1
        for <linux-amlogic@lists.infradead.org>; Fri, 05 Aug 2022 02:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=1YjciTp42v6B8MpUc3bNVR0+p597jmP1NofHHP0CW5A=;
        b=G+mXJvAK1kPPno2wsq/kuteBFt9rHaI3XejdqGG+vSGgabb/tWi6KkiARj4ncVr30H
         ozH8qcFU3E/N7VoT6+mvc1W/5DSc5mJ3pS7J4NaXRpqM1Oozjfa/1quzdWqRFH3xe00M
         Bl5gXBKCSD88+0dY5qYrxekCNmIS7ndOGQilK5JC9XTE0uX7rqY1w9JKmyaCUSkAHcHD
         04CX/swFSCUCtv/wQbqdwNTzIzRLXvrGb6vesKSkdIZURhGXwcGsqTlObd8sobGh0+8F
         N6wOp9h/YH3NZHAgbZKWG8vPOhoM7SrHQh5fIgFWsTda0l9RaJpgRE92Pvq5cvqP5+6Z
         nlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1YjciTp42v6B8MpUc3bNVR0+p597jmP1NofHHP0CW5A=;
        b=SGxWaUaopI0yT0Ue6J0EXvMJA8iIkjwhtdHNzNGjbqZYThpi9fT/lZLLOECPzIJgT2
         s+goTgXGuAL8OsH+nK0SFymJsKSi+ZYCQiQMXL/UlD3ZOSDK23Qy5oiPhk6xCvmHutyq
         PLUayilKYVABnbGFVXdRJJK0Ty864hSLvc257yHRtUarBmRI98QtOiAHTixO7xrW5Jwe
         pY4il0hzMK2U4rIL3/DKJeyTHogMIswLVabGepxycEzDyxgKMSaC1y0ZzyGotEijnnEX
         w00KqJQq5fhWUM+G3vshoiMbuuUDfBpQx+wSzSEmDEGTLf4DmSdz8sK2TT5d1mXilpyg
         rs5w==
X-Gm-Message-State: ACgBeo26+5m5y0wfIw7Sc5XCusWkJU+2QFAfevSH0v4LS7tQSXCQNeHU
	XMhCG4MeyJyJt27wtc2Saeexiw==
X-Google-Smtp-Source: AA6agR4bULYrPCXU3n8gQGnJBTOftjBg7+4i0kVjoCT2OP2w4PZcyJyxhpxAhpaVtFgNcT5U4DyRxw==
X-Received: by 2002:a05:6512:3b8e:b0:48b:23c6:9b0 with SMTP id g14-20020a0565123b8e00b0048b23c609b0mr2164925lfv.470.1659690795468;
        Fri, 05 Aug 2022 02:13:15 -0700 (PDT)
Received: from [192.168.1.6] ([77.222.167.48])
        by smtp.gmail.com with ESMTPSA id q1-20020a2eb4a1000000b0025e6d665a3fsm409199ljm.18.2022.08.05.02.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Aug 2022 02:13:12 -0700 (PDT)
Message-ID: <370378a9-4341-30fc-79b0-57ccfa7f3def@linaro.org>
Date: Fri, 5 Aug 2022 11:13:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH V3 1/6] dt-bindings: clock: meson: add S4 SoC PLL clock
 controller bindings
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220805085716.5635-1-yu.tu@amlogic.com>
 <20220805085716.5635-2-yu.tu@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220805085716.5635-2-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_021317_562023_CAD1B427 
X-CRM114-Status: GOOD (  12.98  )
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

On 05/08/2022 10:57, Yu Tu wrote:
> Add the documentation to support Amlogic S4 SoC PLL clock driver and
> add S4 SoC PLL clock controller bindings.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>  .../bindings/clock/amlogic,s4-pll-clkc.yaml   | 51 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  .../dt-bindings/clock/amlogic,s4-pll-clkc.h   | 30 +++++++++++
>  3 files changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/amlogic,s4-pll-clkc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
> new file mode 100644
> index 000000000000..079ae905b69e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,s4-pll-clkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson S serials PLL Clock Controller Device Tree Bindings

s/Device Tree Bindings//

With above:
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
