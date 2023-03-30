Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBFAC761AF
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Mar 2023 07:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjpTKfjzehy+KQPQhBCk23p1f9iXbtzx8ZdmPN9vReE=; b=H8qT1ZG65UtC1NyDll3ZIUNkuA
	ZsHi9W26BwGH6RQK0GLoBdaa7vWDP/CF9b0ivExpiSNOwrr6GYSyiZlcVNMf0tyZAktxFFGW6K1eF
	uZlKqTqq8EYZdWHoxNqJrntrbFBmbz4d5WpvpYDr8Vl0/ya/nYMlYADXKEQ7JUwQQp4Jd5Sm0O5Wi
	PmA4j4ObJdRp02VAzhgt3vNq8H8ovRSykwApGTG/n3zD7qSLLxuEH7LQmba8L25o2mbAMgRJGFWrc
	tOa518825jxgnplvgEi+9HG0866dDgVsDPZabCJ4EYgd6kYwmH/y3N3kkRY7XP1nbiNj2YFFwy3El
	KjshWCJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phmjz-002tjk-1F;
	Thu, 30 Mar 2023 07:30:35 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phmjw-002tj2-2l
	for linux-amlogic@lists.infradead.org;
	Thu, 30 Mar 2023 07:30:34 +0000
Received: by mail-wm1-x32c.google.com with SMTP id l15-20020a05600c4f0f00b003ef6d684102so7525006wmq.3
        for <linux-amlogic@lists.infradead.org>; Thu, 30 Mar 2023 00:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680161429;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R9Sq3GghZPSalrYUSlYEg5rtJO5siyHm45G17IspFvU=;
        b=W8hTUnm3FJqGZsNDUkrS7U0/MDDiEvivsCWPAiKAiGV6gTQygCCgMMJLJBLIxNu/72
         mTWPrPQ0wSDPuqljkL60qnzNbV5cQI3W+uAaNjGeB58RVX1W+dyedU45zyjhDkxZK2Em
         357vQSWIr0qJJaK3kSgE4akGJozICx3gYJTYrcoRlzBXsTrKP/3HsTOpoCjxzbxsBiam
         pqTDwlWbQ17o1Xr/xaNJnFpImqaW3wRTz50MvER4tnEkH/mlu8FSo0LuhLDgRA2FBPiA
         7X5sr37GoSALrAtRLsWzv7GYCeNqzNmF8vPkYq3zuhM4KxbUjUpFAN0OHXZdSBJEg/Ro
         jZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680161429;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R9Sq3GghZPSalrYUSlYEg5rtJO5siyHm45G17IspFvU=;
        b=S9S+LB/toc8OECal92H5E3uSerMQIHtOnaLXPpxwrX8WgyaKzAtLKyMmsAB/a68Q/7
         K1AU5cgxxoYGsqY2TPLmi4k5NKZ6yGHADGkNMUu7+adlKVqz6yeMCl/ztjtmmqd0DQdk
         8kJTk5rKGL7Dzntd9N5FJ6boP+7z0K/Q7cMDqNRC3rNp8dviQ2GiX8PTH8oZwt5AXZSz
         p8+wkREbrYk0uqpKZqDTYqvAYl4lC2rg+505z8G0o8atPrFxhhc5+WpYo+2k5vnJwl5m
         F6CHSEOoOmrASNwJWgCz2K19zPBygL/yTuw1VEnJoxjycJnSfQTx2nCeOueO4i6gBcY/
         q/Gg==
X-Gm-Message-State: AO0yUKVjf9C8lflCIBS+Ca6OshXXf4gEvUGL012kvbNvQXm0Rtue6Eai
	nRG2gLZFg3YvZe9YxGmNSCQ3cQ==
X-Google-Smtp-Source: AK7set/990zYxsUocwt1yD0MUSMosyecq1clA1R/FSRQa9PAXq4liR6KvZqs+/7FvnAVteYWRkrvFA==
X-Received: by 2002:a1c:7406:0:b0:3ed:320a:3721 with SMTP id p6-20020a1c7406000000b003ed320a3721mr17989911wmc.22.1680161428900;
        Thu, 30 Mar 2023 00:30:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:fe8e:8291:fc25:6c8f? ([2a01:e0a:982:cbb0:fe8e:8291:fc25:6c8f])
        by smtp.gmail.com with ESMTPSA id n2-20020a05600c4f8200b003ef5e5f93f5sm5068457wmq.19.2023.03.30.00.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 00:30:28 -0700 (PDT)
Message-ID: <45c5597b-628e-f1ee-cd48-9ce5291765ee@linaro.org>
Date: Thu, 30 Mar 2023 09:30:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: serial: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Hammer Hsieh <hammerh0314@gmail.com>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230327170137.4104272-1-robh@kernel.org>
Organization: Linaro Developer Services
In-Reply-To: <20230327170137.4104272-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_003032_899849_8CAF7C80 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
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

On 27/03/2023 19:01, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   .../devicetree/bindings/serial/amlogic,meson-uart.yaml        | 4 ++--

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

>   .../devicetree/bindings/serial/qcom,serial-geni-qcom.yaml     | 4 ++--
>   Documentation/devicetree/bindings/serial/renesas,em-uart.yaml | 4 ++--
>   Documentation/devicetree/bindings/serial/renesas,hscif.yaml   | 4 ++--
>   Documentation/devicetree/bindings/serial/renesas,sci.yaml     | 4 ++--
>   Documentation/devicetree/bindings/serial/renesas,scif.yaml    | 4 ++--
>   Documentation/devicetree/bindings/serial/renesas,scifa.yaml   | 4 ++--
>   Documentation/devicetree/bindings/serial/renesas,scifb.yaml   | 4 ++--
>   Documentation/devicetree/bindings/serial/serial.yaml          | 4 ++--
>   Documentation/devicetree/bindings/serial/sprd-uart.yaml       | 4 ++--
>   .../devicetree/bindings/serial/sunplus,sp7021-uart.yaml       | 4 ++--
>   11 files changed, 22 insertions(+), 22 deletions(-)
> 

<snip>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
