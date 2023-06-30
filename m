Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A72DEB64DA
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jun 2023 16:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p6HrvewFDWIBjqikEkT4fgJ1vS/xtiszTXwjcOKVzKk=; b=Y1JiicaxgRw/Q8
	Uwr9I7Ef3cKpqFzRF97wMfVhBfuumnhccqSNmXDSbVkuRBlw5kYS66wn7kd9ZqHfRgsLRXeJjUGjz
	eEunOZygJWN9Y6nZknFv2aM56symog4o66XJGY/nrE35dhcXx6Tip5+zxz6QB7GgpZVhgpubAcIHd
	vn244HyijcdJ8qpCs18c8apwx1Xccp0rq0hIBQv6qUtwwrhfQ4T2fvpHCo3NeUo9O+N+EqP8VzoCd
	BWq7OLPw+3gg5S4gcXNKxALkqRerzjFFkF+JNQQGof+XCz5CIj/OK0WS+mEU3t5XArcRew72BxXu+
	/vhlnaHG9xLic5geUT8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFH2U-0044M3-31;
	Fri, 30 Jun 2023 16:32:06 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFH2R-0044Kd-32
	for linux-amlogic@lists.infradead.org;
	Fri, 30 Jun 2023 16:32:05 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fa94ea1caaso18896655e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 30 Jun 2023 09:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688142722; x=1690734722;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Fr5aNPnmIj4+do1i4OEVQYr9sSaiIia2H95Z8vclIKA=;
        b=YC62Xiq2beFNyTzUM0KwQ+R1zMCJUdqw5sheNfpuNAPyNKBFzXdHaCJ6t9LXZ6pgPp
         5xaxuBmllaqmvLe58I1CZFns/5eNTLpkoXZvZClEB9FEGO1XSNw6UfL8rXd7mJED7sfm
         zgLyfzvN2zIGVDfoaxEIgc2EGz7vUKtpH8IWvoDI2FIjRsRj7dbuJZpOL1ZsExNGfGo5
         PQThDYAqzn5yrqNzsygXfEr6dGBO8MoyEjLGv067Wl63cbLiUMesoqEuS+IygqjAWRNR
         u6P8aG5BaPcVlqf7poPw0u4iNSzY9bSQSoPGFtuR7lr8gyH4VQQG7Od4WatXqeWliWZp
         JnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688142722; x=1690734722;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fr5aNPnmIj4+do1i4OEVQYr9sSaiIia2H95Z8vclIKA=;
        b=loM6UALxFCF77vIvBYq/e995VhoDjG6M4l/CZCFLsiyyOxLEAaIWosIkjvVglKrMbQ
         SNTl4qbzxkFJNkDKznvUjNKY1y1jUnlJ5UYLxepgEn95Qgw8WO4EeSUkA82D2MDQQy0e
         C2bkWxAuiay5YkBy7qdOFbEpp9vvMHwpfBZVK0a1NoenoePcceSoDq6pxEo1GjoKqMrb
         RaYCRIculGiDxqIKTm9VqDx+YRiTeOXBre8IREbR1N0umk3C1Xtfxl/qd2jLDFy2jFR/
         Z9TE/k3ky8npW4G0TTQn3mvVze2cifkcHjYQ1REKprd9ykmXjNU58XLzWIj9jdhqCOmk
         Ho9Q==
X-Gm-Message-State: AC+VfDxJFHpednWaqQRP1zdFZx3UNf1rkw1J4kTR+UWpMoAErbB8nGq0
	r7ERDvEU60F6VmjMFqXniMKfQQ==
X-Google-Smtp-Source: ACHHUZ689KxjgFZkvbAXDIM4DEHGdQNln8Kd+r4DSZSr8D6WQDrLFgyFflb30XwOa8hCBVU70F4MoA==
X-Received: by 2002:a05:600c:1c98:b0:3f9:b867:4bb with SMTP id k24-20020a05600c1c9800b003f9b86704bbmr7947161wms.2.1688142722350;
        Fri, 30 Jun 2023 09:32:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:eac6:eb92:cae4:cfd2? ([2a01:e0a:982:cbb0:eac6:eb92:cae4:cfd2])
        by smtp.gmail.com with ESMTPSA id l6-20020a7bc446000000b003fba137857esm10828160wmi.14.2023.06.30.09.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 09:32:01 -0700 (PDT)
Message-ID: <18716904-87fa-bd72-b53f-9e71565b72f7@linaro.org>
Date: Fri, 30 Jun 2023 18:32:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/3] arm64: dts: meson: add reset controller for Meson-C3
 SoC
Content-Language: en-US
To: zelong dong <zelong.dong@amlogic.com>, narmstrong@baylibre.com,
 p.zabel@pengutronix.de, khilman@baylibre.com,
 Rob Herring <robh+dt@kernel.org>, martin.blumenstingl@googlemail.com
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com,
 devicetree@vger.kernel.org, kelvin.zhang@amlogic.com
References: <20230630121059.28748-1-zelong.dong@amlogic.com>
 <20230630121059.28748-4-zelong.dong@amlogic.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230630121059.28748-4-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_093203_990136_8601ACBD 
X-CRM114-Status: GOOD (  12.75  )
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

On 30/06/2023 14:10, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add the reset controller device of Meson-C3 SoC family
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> index 60ad4f3eef9d..62684b7a684c 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> @@ -6,6 +6,7 @@
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/reset/amlogic,meson-c3-reset.h>
>   
>   / {
>   	cpus {
> @@ -82,6 +83,12 @@ uart_b: serial@7a000 {
>   				clock-names = "xtal", "pclk", "baud";
>   			};
>   
> +			reset: reset-controller@0x2000 {

Please drop 0x, the node name should be: reset-controller@2000

Thanks,
Neil

> +				compatible = "amlogic,meson-c3-reset";
> +				reg = <0x0 0x2000 0x0 0x98>;
> +				#reset-cells = <1>;
> +			};
> +
>   		};
>   	};
>   };


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
