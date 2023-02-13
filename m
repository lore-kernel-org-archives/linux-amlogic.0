Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF0DBC636CC
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Feb 2023 11:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iNUSvPaQJiP/urg5zISgBJIao2QlzKNpYQc30Qy/Qig=; b=gxSxWkUWnm8phb
	8Q6ZgkrnxKq8m+49cnH4NN4DrVpviixICh0bmejozU9411QD2OASgVx9dPeeUwlhGNV1DoCefqBDv
	D30HswalkMub5pYEfpnPuDd/cJvAU/UkzFERcJyQt2rhP/CKO+zrXPE+Sb33zv7UyaPeFpCyi4iXI
	221vHyE0vhXiJCZog5YU8/W5vumvzQTlP/XIG5ztdtLzDmVQYGe/Ir4pv/JCm7nHrfInehaMTMy0T
	WdSo2EjkW3pjQ5g/Ac/R7siD7Q+EBi0AGzylUgrCIPs8LLWdFkIsdO7g9ABegLVqHXxmIexguoSI3
	ndSB742uLkydbnikERtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRWZc-00EHa2-Ad; Mon, 13 Feb 2023 11:00:40 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRWZF-00EHNd-1m
	for linux-amlogic@lists.infradead.org; Mon, 13 Feb 2023 11:00:24 +0000
Received: by mail-wr1-x42f.google.com with SMTP id bk16so11705797wrb.11
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Feb 2023 03:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c2OREUNkDHFo+6N4ZDHlsRxITrcEyLw+kVy88yhDDyg=;
        b=bLYM6lVB6hoCsp0byzoA0iR72BM+YJVLDs6Nu4sZLAVLA1pPuYwCJV8ecUJQIoR+8P
         u76I2Z1jSi5uzQIX5yjPAKAGvBql3yAlnYXPbTnWlGMknTpgcSYMs3MR4/v6uOtpCZrm
         GS9XdUVWWvdzk83i5f3svEgoqndpoVNtVNm7Klf8FcAWt+9ItdaWtQvyHfM2HdRavRr9
         nCNaByxSrKsHAM770HAQLfAhtooM3/1sQfAUqEqW+UmJXInJvAMNhVXimCyMr1UsSxao
         NLd/4fHTDEIH3jbvW84cpuFFq3AjiWbJ8frIF4CWHfMRP/ovJQvSmXlMkb8FOK3+eEw7
         jEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c2OREUNkDHFo+6N4ZDHlsRxITrcEyLw+kVy88yhDDyg=;
        b=NZBBph3iVip829eaAIwJxNOcl8OHXYeN9zR6ivPjzZqKdZZTCjpq7T5NqQhHtrWsbM
         1Hnsbz6SPeyyQTqPYOhvWbEiXsQyD31im13MvcsdxAnLmALOdSFgGdBx6du0jRLYAcK8
         6N99c0dMKc3XSZZTqj3E72d8GJFMFUJaHSrWiUxCNeEzw+zoSVC+xWjsZp5ItYl37UNa
         VHaNZwgEdbPO0rEZ9ryPQ4CVkklP3qG2bs0rpHl+qVhuYom5Py2hvIwIuq2D1TLMf+47
         Jij8o52BZ2QJY5g6kIm0H73LnIT2ffh3GuXFdeBbwrFIhW2e1RvP4FV0038adtUcugxi
         ouew==
X-Gm-Message-State: AO0yUKV5lpI6zFWtpCugf6wkTiE8PkLkTrlbwX51ew0DF61wRd69sAw1
	+yxOuaWX4Gz+LHFHkYNL3P/G9A==
X-Google-Smtp-Source: AK7set8Az8lflKGGAyVJoMUwWTvPJZXQy3tXG76vQT2n6km1ji7E3RkIzXnJ3v/QjTWCBlEoeoqdzw==
X-Received: by 2002:a05:6000:1d2:b0:2bf:b661:87d9 with SMTP id t18-20020a05600001d200b002bfb66187d9mr19780548wrx.50.1676286009033;
        Mon, 13 Feb 2023 03:00:09 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g17-20020a056000119100b002c54e26bca5sm5790579wrx.49.2023.02.13.03.00.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 03:00:08 -0800 (PST)
Message-ID: <f18230c9-7c9b-9e59-993f-24d40b74ba9d@linaro.org>
Date: Mon, 13 Feb 2023 12:00:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 6/6] dt-bindings: soc: amlogic: update sysctrl
 clock-controller subnode type
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
 <20230209-b4-amlogic-bindings-convert-take2-v1-6-c4fe9049def9@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230209-b4-amlogic-bindings-convert-take2-v1-6-c4fe9049def9@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_030017_774246_687CF7F3 
X-CRM114-Status: GOOD (  15.22  )
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

On 09/02/2023 14:41, Neil Armstrong wrote:
> Since the clock controllers are now documented define the right ref
> for the clock-controller subnodes and fill up the example node.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml         | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
> index 672eabd90c09..57eae355f1b9 100644
> --- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
> +++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
> @@ -43,6 +43,10 @@ allOf:
>              - amlogic,meson-gx-hhi-sysctrl
>              - amlogic,meson-axg-hhi-sysctrl
>      then:
> +      properties:
> +        clock-controller:
> +          $ref: /schemas/clock/amlogic,gxbb-clkc.yaml#

You just added this binding. I don't understand the split.

> +
>        required:
>          - power-controller
>  
> @@ -53,6 +57,10 @@ allOf:
>              - amlogic,meson-gx-ao-sysctrl
>              - amlogic,meson-axg-ao-sysctrl
>      then:
> +      properties:
> +        clock-controller:
> +          $ref: /schemas/clock/amlogic,gxbb-aoclkc.yaml#
> +
>        required:
>          - pinctrl
>  
> @@ -81,7 +89,12 @@ examples:
>          compatible = "amlogic,meson-gx-hhi-sysctrl", "simple-mfd", "syscon";
>          reg = <0 0x400>;
>  
> -        clock-controller { };
> +        clock-controller {
> +            compatible = "amlogic,gxbb-clkc";
> +            #clock-cells = <1>;
> +            clocks = <&xtal>;
> +            clock-names = "xtal";


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
