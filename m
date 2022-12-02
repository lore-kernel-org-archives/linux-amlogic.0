Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF70DC4332F
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Dec 2022 10:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wG3HifO8IXpIFEHt2n6WJj6XUKTtK2pvwdWoFS+j7KI=; b=k3u/06umRYHm5v
	Ne5/tjva7ocAi79vnxlHfAowUpZDzbOIMUupYZM7qw4036qH5KoGrzXi1DA/xVpkMsZywWGgzotCK
	M5rMVMO8Ov/8dWNL6pVpB5ULWOMJPvb1HgbEFxEJaiZF8OPJNZiycEKEztVBGnqH0cHuIToEHaiVQ
	OdVkiCHuXRjVMPRHVkVsK2OoIWm+6K/f/vnAUaikb1iliqCAzUq8Z8yEC+OnrBcWCJh45JYA1cuJ5
	TkH6NUPEYADSmrNR23WQDMAsjtnvvu1xUN2ak7/becxf6Xe3e98vYj18xvOqezvkynM9pFINllIWO
	aX1VDKwodOX4s37htKmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13Vu-00FfaU-Nn; Fri, 02 Dec 2022 10:43:26 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p13Vr-00FfWr-7c
	for linux-amlogic@lists.infradead.org; Fri, 02 Dec 2022 10:43:24 +0000
Received: by mail-lj1-x235.google.com with SMTP id z24so4976032ljn.4
        for <linux-amlogic@lists.infradead.org>; Fri, 02 Dec 2022 02:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d+0ulguKeXm/n7vuYd1eLCO9MpBSp6kkQ2zGIF22QHY=;
        b=plS6eIMbW/mDhBfftfW1Z8n7t5W9K5Mmg9a6PoOhB/Gv/GCVNDZBWq26hnL+vr589I
         0bl7zWf5dtuyyFwWRzdML1dSlMQfjDfYElaHi30+0izuSYsRmfV+OdnGo4sDV8jfjBr+
         5QQWmvwcfw97JBtAlIz6I5kZa3lyTQvKQUU6MMlS32xbu3yqsqLiVDMuyh6wqEgWw6LI
         ENuAwratBd1coZ4BX8QWVAVgYUhoFV3Pi0lVCjTc3nlVqvxFa/KBhtd9xrYzCdkjij9/
         2ZGyfMXdq3s4lTjyWkanpPmyR5jl6JDm5AoAKS1MVgfCsgtxwpVdUTtWUWOorcod/CPw
         T+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d+0ulguKeXm/n7vuYd1eLCO9MpBSp6kkQ2zGIF22QHY=;
        b=FsgGIlhxDIf0db38Wdg7aUXeR/X/WPCN6z9ZMH3cXAUyYExyWk5ERowSftj1zUqS4C
         V6OoyPm3X6UOgMkYaTvAj31EF8+7A7FB6adk+821H3TFQY3NuqhXYLl0TZmD5VuMjWSj
         0KL3FNxXcpMZNkTMoJSwh+H3kB5yWX3KFtcdobKHvHDE26tirmewKlsHHjC2MVu3gkgI
         6UUxXjnx5TBVHGdA7d6zFyDwjzyACLYRFd9ODidCKhQuproGMIr+XyEHJUxnaY5db1l+
         MTqRyY7YDnkoKlh/MNpeMWgkavcfTTE68fJwKdHmW3L0mh+Wr93YAIGB0NgmHLgo6kEq
         LO5g==
X-Gm-Message-State: ANoB5plFcxA/aZySB5XMswo4WNRa21YuMjFzEunZKbq/VpT+BVtOLOuO
	KiRIsjtPmL6nwFFU67v7k3VE7g==
X-Google-Smtp-Source: AA0mqf4RmALN2uJz6Yih1UczV5VibEASyt5/O2GGhNQ/c1rtTmGSmJJA71Hj6QLdVDxJtW/rqtQOVg==
X-Received: by 2002:a2e:8888:0:b0:279:ca3e:69f5 with SMTP id k8-20020a2e8888000000b00279ca3e69f5mr3666255lji.391.1669977801676;
        Fri, 02 Dec 2022 02:43:21 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c1-20020a19e341000000b00492b494c4e8sm971845lfk.298.2022.12.02.02.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 02:43:20 -0800 (PST)
Message-ID: <9e40f25b-3223-2fa2-6f33-fe91871aed1f@linaro.org>
Date: Fri, 2 Dec 2022 11:43:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v8 03/11] dt-bindings: clock: meson: add A1 peripheral
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
References: <20221201225703.6507-1-ddrokosov@sberdevices.ru>
 <20221201225703.6507-4-ddrokosov@sberdevices.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221201225703.6507-4-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_024323_327170_DF989B3B 
X-CRM114-Status: GOOD (  12.52  )
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

On 01/12/2022 23:56, Dmitry Rokosov wrote:
> From: Jian Hu <jian.hu@amlogic.com>
> 
> Add the documentation to support Amlogic A1 peripheral clock driver,
> and add A1 peripheral clock controller bindings.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>  .../bindings/clock/amlogic,a1-clkc.yaml       | 65 ++++++++++++
>  include/dt-bindings/clock/a1-clkc.h           | 98 +++++++++++++++++++
>  2 files changed, 163 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/a1-clkc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
> new file mode 100644
> index 000000000000..7729850046cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/amlogic,a1-clkc.yaml
> @@ -0,0 +1,65 @@
> +#SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/amlogic,a1-clkc.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson A/C serials Peripheral Clock Control Unit Device Tree Bindings

Same comments as with previous patch. All of them.


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
