Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F4FC7EE2F
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Mar 2023 08:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vOujTRsyd/MpJKI2CvajFfDGiViObUF01IXMeB4CGm8=; b=rdpdesHm81N9mu
	KrHD927Lo+cT5U7gXSXuXtBpTJJN2GtmwoRl98BMcDIVviZUBElwAcEIn+mNTLRMaozQ+u8ojdUuM
	yVHsU/mdDTvTtgrsy2ehZR1IbqVZKsaR0H8tol+LJ8uBNhbcFp95Mx0vE7xsnGWmbA93inj+logWM
	YsBCyzLorIuICuijuWQcKL9KS9EHOoWV7tAaHGDr1GbAPbEIGKsJaSZo4ZdFmNolGE4XHNfOsc5s5
	MYbNwW0a+OXOlxfpPd9emTdShbM2GmtO0KNl6Zj3Y+zn+MY7z+O+JJuRpck6GwFv6x4s0U/i+j/bZ
	TXe+59CDZtdIPhfw3DoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY0nm-005OsO-OT; Fri, 03 Mar 2023 08:30:06 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY0nj-005Oqv-KR
	for linux-amlogic@lists.infradead.org; Fri, 03 Mar 2023 08:30:05 +0000
Received: by mail-ed1-x529.google.com with SMTP id g3so7325419eda.1
        for <linux-amlogic@lists.infradead.org>; Fri, 03 Mar 2023 00:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677832202;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vyMEf9DcHz7Rey1/n9uL5ThzUAVI9l0JbNqQFMHxvRc=;
        b=ndiZ3xAyUQhK0y/jMn9s9SmP4K2ugri8iWU6ePoBkWIz/Nr6QLQE4nLVBp6MC976Oc
         WNtRVeQ6J1awkj1ScoitJkhM8K14Z1/PUTRj5zSZ4j15k7rm/eJ6ZiSCCl/bbUknEmSD
         9B2DosfSEvYB/KYSW9jOFrKKzEg3axpqHCrV18DX2WhLun9fg+JdmF/avPwtsKke23F4
         zHktnQSWQkJh8aP8BiSY5xZ3O8OpKuGDa7x3AIBlMGO2IYNEvTcBGQhc4fzG1c3LTIAe
         /d05wpmQOGVYjZZPA45HFBMymdaKNF+jNGD/dxnsAArwC7oVFAD3ejelrTBcOACqg+hN
         99TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677832202;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vyMEf9DcHz7Rey1/n9uL5ThzUAVI9l0JbNqQFMHxvRc=;
        b=XaHm4V7yYyFgin0YJ/w5BYesllEVjYqUdHVfRAMNKGrlnQpSCBpCmvf/vCJKk5BAJy
         MqSg0J22j0eHz1pJxBu6XQcoyuak4vYncLgVvAz9PmrNYlys8+1tl33nmt8zaToZ/o/i
         QCYsrYWcHtxItSrkPKsxFRFHHH5FN8/aOurdNw0jd//xnV+Fukn5WPEbEgeKwnVJzP2o
         sMb+pZWYzqRkXuWxV1HR8KzwmnrlljCHBJo1MN5XsPg7KYTX1X8gxCFtf3NUvJN1oYhJ
         WTr+fufdrw3bYwRHfLe89NTddmobG+NmXAvIEQxfSb/Uu8WFO2ppDAq06NHjgU4p8zpb
         cZNw==
X-Gm-Message-State: AO0yUKV26DahNRuBRMlv4MiIWOHE2GkUcjw9e4aTrL5rzMS9QpUyswQG
	Jq69eFPhQmLbs/gdu7ub0iasJw==
X-Google-Smtp-Source: AK7set/VLaLjdiP1fyM/FB0SX/nUogRG2TFTaQAtY/Ry8s11/NL7JEOUGMnEWKl8Vq3fHE6fT+KUvQ==
X-Received: by 2002:a17:907:9b03:b0:8aa:be5c:b7c5 with SMTP id kn3-20020a1709079b0300b008aabe5cb7c5mr798990ejc.41.1677832202361;
        Fri, 03 Mar 2023 00:30:02 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f20-20020a1709064dd400b008ec43ae626csm684564ejw.167.2023.03.03.00.30.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 00:30:02 -0800 (PST)
Message-ID: <d5c93a9f-4a66-f884-a4d1-68cf47bcd7d4@linaro.org>
Date: Fri, 3 Mar 2023 09:29:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v9 5/5] dt-bindings: clock: meson: add A1 Peripherals
 clock controller bindings
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, neil.armstrong@linaro.org,
 jbrunet@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230301183759.16163-1-ddrokosov@sberdevices.ru>
 <20230301183759.16163-6-ddrokosov@sberdevices.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230301183759.16163-6-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_003003_762694_CA2C6DCA 
X-CRM114-Status: GOOD (  14.56  )
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

On 01/03/2023 19:37, Dmitry Rokosov wrote:
> Add the documentation for Amlogic A1 Peripherals clock driver,
> and A1 Peripherals clock controller bindings.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  .../bindings/clock/amlogic,a1-clkc.yaml       |  73 +++++++++++++
>  include/dt-bindings/clock/a1-clkc.h           | 102 ++++++++++++++++++
>  2 files changed, 175 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/a1-clkc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
> new file mode 100644
> index 000000000000..3dc86e912dea
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/amlogic,a1-clkc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic Meson A/C serials Peripheral Clock Control Unit
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +  - Jerome Brunet <jbrunet@baylibre.com>
> +  - Jian Hu <jian.hu@jian.hu.com>
> +  - Dmitry Rokosov <ddrokosov@sberdevices.ru>
> +
> +properties:
> +  compatible:
> +    const: amlogic,a1-clkc
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: input fixed pll div2
> +      - description: input fixed pll div3
> +      - description: input fixed pll div5
> +      - description: input fixed pll div7
> +      - description: input hifi pll
> +      - description: input oscillator (usually at 24MHz)
> +
> +  clock-names:
> +    items:
> +      - const: fclk_div2
> +      - const: fclk_div3
> +      - const: fclk_div5
> +      - const: fclk_div7
> +      - const: hifi_pll
> +      - const: xtal
> +
> +required:
> +  - compatible
> +  - '#clock-cells'
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/a1-pll-clkc.h>

Eh, this explains bisectability problem.

Please do not sent patchets which are not bisectable. You can hard-code
the IDs in the example, they don't really matter.

> +    apb {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        clock-controller@800 {
> +            compatible = "amlogic,a1-clkc";
> +            reg = <0 0x800 0 0x104>;
> +            #clock-cells = <1>;
> +            clocks = <&clkc_pll CLKID_FCLK_DIV2>,
> +                     <&clkc_pll CLKID_FCLK_DIV3>,
> +                     <&clkc_pll CLKID_FCLK_DIV5>,
> +                     <&clkc_pll CLKID_FCLK_DIV7>,
> +                     <&clkc_pll CLKID_HIFI_PLL>,
> +                     <&xtal>;
> +            clock-names = "fclk_div2", "fclk_div3",
> +                          "fclk_div5", "fclk_div7",
> +                          "hifi_pll", "xtal";
> +        };
> +    };
> diff --git a/include/dt-bindings/clock/a1-clkc.h b/include/dt-bindings/clock/a1-clkc.h

Same comment for filename as for previous patch.



Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
