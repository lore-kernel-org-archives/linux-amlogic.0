Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A012C74A5B
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Mar 2023 07:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uYURbIgAJnWy3yW/JIE7uWOioNeFG9OmqtvKWMFGZpE=; b=3o2k8Mr2Wki7UL
	ov1igjfjlLYk+iqCFj9lCQFVJ3NRq4ySrQumNy93En1gMRuH8Tox7v3qByOxmJeMtJ1OUZyNT8+C+
	wuhxwjuo9qVU0iajM2BNV7bJvyDDCyceUkuCpSaADOASzTQ9IoegDwln7mUcUd7gkjmMrQmcH5rX8
	Agrmnd9+Oh7CPHluaQGipol8hlitlgcnfxJQQn+apCjLbO2ZlXifZFvWKUvNGdqV9iSXjhPlEWsEw
	am/p8zDnJRwD+ftGzr1+cEFCS9BYSTTShyKXqqV9bbihraB6hQH1noHqu6Rs1pADOZg0DEas3LnIs
	yMoy1K/1U4EUumhx8Zuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peWIh-00BVtF-36;
	Tue, 21 Mar 2023 07:20:55 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peWIe-00BVrm-1g
	for linux-amlogic@lists.infradead.org;
	Tue, 21 Mar 2023 07:20:53 +0000
Received: by mail-ed1-x530.google.com with SMTP id i5so9036452eda.0
        for <linux-amlogic@lists.infradead.org>; Tue, 21 Mar 2023 00:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679383251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n1ju9SHjn0EjnX+WJqAHc/qHXQe1M1fQAhQ9irmoRLI=;
        b=G6ekUazE6TcVZTpMdj9FhFeFggQPVT2VFUWaVtSaXIXTASqF++fMNxdF9KK8E6jaSL
         ZxuQCYzENQ9eYwWdylaKVB8cU5qUsu4R5sIwD0IIrNZX+Oo0AX814EHrHOZ4nB7WYMax
         YUWo1MqBTLRXOMVVr9tYCNrgu923Xrw6URPxwNxkAEkDp7epE2F8hgxV4cZiji7lOREJ
         niygwQoFXhUPEUDsSetV6Edn47C9sgSWqXDTI3Dz/fCXVRaHBilN6IPoShYT9gKzSq2h
         v+dykiWM/hzx+RdJMIfdogOBRMX12snNrk7GfqZ43S8HyiNmdwkPfVFwvscVb/2iLiXG
         aCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679383251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n1ju9SHjn0EjnX+WJqAHc/qHXQe1M1fQAhQ9irmoRLI=;
        b=QNIYeC6P7+CvQkHjK4J94MK7ijEy4QCOtH2n4WmSsA2qLoTJ7wiP7f8q5risu8N7oJ
         6WzL4YXriOGVJ/a4ZFlAa/xGmG9Vjh2kY+37y0X9Flyn/u853wGI83tpJpx+AIFJInLh
         g3WgJNDIUan+s948WU6eSIPgnhSsVI5vZc4+bcnC6oWXJrVTjzR4SaEsqnsCbdKW09+S
         vKFokMocZHd2wij6QurRKiO5+busZhI5KTMY6EQvlo9iU7TX43K+wvvHw/ry5QyJ8bO7
         t2kHTnxrkKPcrCRBH0VRA5icdA1VvxOsbQTcRGOzBpiUMmre6ohuutzB9AlM6mBfVuwV
         ttHg==
X-Gm-Message-State: AO0yUKUMYe9FnI6SP0rGVjJrr1LsWQsvoWrb1WOu2S13JHqRVqcAf0zt
	aWeWwAPRPTbvl6m4WqHDEVec7w==
X-Google-Smtp-Source: AK7set9ajV2h8MoJNZmNzFZ4RL5J57SDG8cMw8WnAC78cNBMYl3mTmrve+NyaqmHOj1gJroxcZnYrQ==
X-Received: by 2002:a17:906:607:b0:932:be78:a728 with SMTP id s7-20020a170906060700b00932be78a728mr1688168ejb.68.1679383251026;
        Tue, 21 Mar 2023 00:20:51 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id qn17-20020a170907211100b0093048a8bd31sm5385926ejb.68.2023.03.21.00.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 00:20:50 -0700 (PDT)
Message-ID: <cc45efa0-e2c6-525a-e3f3-7f87e8762e2e@linaro.org>
Date: Tue, 21 Mar 2023 08:20:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: usb: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Justin Chen <justinpopo6@gmail.com>, Al Cooper <alcooperx@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org
References: <20230320233904.2920197-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230320233904.2920197-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_002052_562610_E26803C5 
X-CRM114-Status: UNSURE (   8.16  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 21/03/2023 00:39, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
