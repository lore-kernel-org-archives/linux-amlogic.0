Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC423EB64D7
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jun 2023 15:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tEfhab9rqZYMda0O8iS3sUv+wL/XAR2XA3xwKpWFCxE=; b=rlGuxY7k1WyFbD
	3cn+zTFd3Ao4OIHGkMIbidRQYZeGYzGHfXNa5rD/aNBs+4WZ4WaH9+dGxHXu7ZybGwKltPNxPdzwI
	2HVMXFeN4V9Gd49+UEocsrQHvYHjD/1lEtB4imeKGnsBbS+fyzmzZLH7ZWixu5ot1AYRLOu3Cwo1d
	hdJKZh5w03NryhzADEktVlkeg9EjR1XG/PaWxReaGMI0omtKrFQyowExASLWyIjg7lHpz1IGOuRrB
	3hSweU9Dfq3MtWz94qLeccriM5JyAjgZL6G81gpotLYQmRRXRlQL/7P/xARfh91Cjjwny6npuETgL
	Ns/ribVm8z46iWjN9VuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoIT-00AWM3-1W;
	Mon, 26 Jun 2023 15:38:33 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDoIQ-00AWKw-1X
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Jun 2023 15:38:31 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fa99f6a482so9324195e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 26 Jun 2023 08:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687793909; x=1690385909;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Aowf3vYu+TzusHuYBS30zZpzrQhDchfRz0fvyLxDepg=;
        b=Z/r1Wfd7CYtynhOebMVYp+4fsXcivyGaGsftCeD/zNgZCaKVFNC0i6AxAcgx1u32BH
         Bo5pmsmabOniCJBWTixY2SykTl0V5ZCBb5XOzcpVEXtg1KYejeyhxQSbWik04Nw2LNFq
         qRINqZEYDzSDNYxGVocv5HjRs8KPBK+Law1GRf6uiGdOqjY3JP26R9eDzSuXCZx6chF4
         szThVO9VHv/Y2n7YBSaVjjeufKELJvK1y5kl8CP5v2HKkT/Bbs+6gRD658XBp46EhTPR
         ilDRPQ8HFFBFHgQMJ2riWBLMXobCVamENebS1SKwCL9jdVfpKp+3ShmGbVcdO45n7Ob5
         IHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687793909; x=1690385909;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aowf3vYu+TzusHuYBS30zZpzrQhDchfRz0fvyLxDepg=;
        b=BaT1HWOioXkDVVZMTRh0vg8lBcjcBtcpMeZmWKkncN6mx+fg2BjI4Zy7SaWym08Isk
         YwR/bov6CAcrKaNeUrCT34GMjrMYVZqueWV77WZ4OMjPDursi94W0xUBWhlzQTqFEstG
         Wv8i7EBRjaOW73ixClj90MKNQwThGpXz8jCwWtUmHVyaUcKE8zZINUJ4rNh/eQ9AGHd8
         v6dZp6c+HqAjEHTDJuqUYtGCXhv30vSn0+KAw/4RKnokBVpxm9lES2KUcS6IcLpvwDJh
         rn9i8hSBpSCxmRg51g79DJdfB2ogsNMYRN4ljWSLZsH2YOsyrHDz6Y1951l4NP1o+tPp
         Lmsw==
X-Gm-Message-State: AC+VfDxCavmJcBqyWM+NP4drQUewblQhHGPmnXhfHKVJEZGZOZupgKyo
	R73B58lUjaWFhKkZJESDxqv6UQ==
X-Google-Smtp-Source: ACHHUZ6hBxdWt0pk22ZtTSP8LLaFYHBix/uPdvH4jb1EhndRhUe4vv/qftln+OheZD+7CTDamEG8wA==
X-Received: by 2002:a05:600c:250:b0:3fa:8987:3c0c with SMTP id 16-20020a05600c025000b003fa89873c0cmr3919959wmj.9.1687793908732;
        Mon, 26 Jun 2023 08:38:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id p8-20020a7bcc88000000b003fb225d414fsm1710268wma.21.2023.06.26.08.38.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 08:38:28 -0700 (PDT)
Message-ID: <cd9d82cc-d98c-f4d8-8dd5-01ce4130aa78@linaro.org>
Date: Mon, 26 Jun 2023 17:38:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add T7 based AN400
 bindings
Content-Language: en-US
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230626095223.721011-1-xianwei.zhao@amlogic.com>
 <20230626095223.721011-2-xianwei.zhao@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230626095223.721011-2-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_083830_515691_A91C98D7 
X-CRM114-Status: UNSURE (   9.43  )
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

On 26/06/2023 11:52, Xianwei Zhao wrote:
> Document the new T7 SoC/board device tree bindings.
> 
> T7 is an advanced application processor designed for smart display.
> It integrates a powerful CPU/GPU subsystem, a secured 8K video
> CODEC engine with all major peripherals.
> 
> The main system CPU is based on Big.LITTLE architecture,
> with quad core Cortex-A73 cluster and quad core Cortex-A53 cluster.
> 


If there is going to be new version, subject: drop second/last,
redundant "bindings". The "dt-bindings" prefix is already stating that
these are bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
