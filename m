Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3F0C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Nov 2022 08:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xyrvjcWel+daKp/ps0VZFWeZvdBAWV8yzWqW1Rc3X6s=; b=A5N03DjSOLhk6tA+0oGUT05pPm
	VzGD5F4BNh+qaRKGfpW61UBP8g+MQx2eE4GgqvI0H2gaXkA22LcAPKAJxEMOC73OWccYQZMlYo5gp
	dnnTwERs05x8Hub2ZuOUMpctBe8Epg2b7v5hJ8s4WxWNYfrgcl+K4s7phxDn+MQLWbczb8b5oujRo
	gIFLlYPipdMzqP1IytZlnCbmgxubiQuyx3Re4i8Gfd7skVLacEm/kMIAPrViuJB/9OsvQFveqznVP
	yo2XZz1lOixNJqpReMpoD9YvfDDk0XhxX/ec9FTpEwB39qFilyck6gZdO0/6NivblswFfr6hWjhee
	tO51+RIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq9PG-009AhJ-Kj; Wed, 02 Nov 2022 08:47:30 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq9PE-009Acm-7B
	for linux-amlogic@lists.infradead.org; Wed, 02 Nov 2022 08:47:29 +0000
Received: by mail-wr1-x431.google.com with SMTP id v1so23417342wrt.11
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Nov 2022 01:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LacC/W4nEJTi1K9NvGGjHmz+dnzd8gTcBfyb9WbOq1M=;
        b=cXkcNEA+d7XPal/bfe1WsUKa0kt+a7cEVY5J1DH2cAjO5ctiRDAXvLJkieIOm/BYsi
         V3Qcizyu8AjXWzf0DaZi1udr2/bzEBEAFszhuorxVUNx9Puy3d+SBQirSUf00/PaZa15
         EnUbo0wweZJLFmIyVyXLkVj7+rmM7cjlU3Z3wje96es7TejoUW0aKip2QLWkUOz9eJdr
         yzZ0FE3o8aChRbHFOtchLMwlRXClbTZ7MllSb9jfK19BC+CvDgVHDfuQNjAd4/pvuBUL
         00cPXDYBJKSimPvt7e6XTzAYvVnONZvL/c8AXMUvtKEdm7+FhFZaUfMx4pMrV0tWgPPF
         BYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LacC/W4nEJTi1K9NvGGjHmz+dnzd8gTcBfyb9WbOq1M=;
        b=8G+QNynT1JBc1lvlLqSvBSfr6wsEeHmENXBI+91vZakRaBpHCav9o8efDG9+pVta7Z
         FrJCLHPuupP/Y2Q3nCcbP0aaGFFZeOOpX0MfkPJwq6LlZU5VV9JPLSrZcp24qrQ5uy3f
         236Wao7UHIrPgG1ec+BCKUeisZ1P5tavWXjR5CisqvhhygyhWe+LJinFk8UePiD00rHN
         QEnSQmqEGoy5iUq9s5XyZVImdmo4l87GXOep1le4VTuKssC56geaSOR9x/mdJPixgnR6
         qMOxtlMoRZb/jhvqYrus5mjlPeINOa91xdxd2ajmhCBAwYoIjJKl/JPulf2zSS4IEeUI
         GzkQ==
X-Gm-Message-State: ACrzQf2nEwxNbIGZs2xMEkCHlVoMHsqsAzpyb+Zj5aJkMnCGhq2CbKN/
	TPSnIwjI7sXCCAX36o6jLPtuVw==
X-Google-Smtp-Source: AMsMyM4/UnCKSPJDBb89BPx/nxH21VzXl0PaOgeJTz0qotnPqdKToT8N/zbTLYVlVCWaRARLV4HsJQ==
X-Received: by 2002:adf:f50b:0:b0:236:7d5d:d785 with SMTP id q11-20020adff50b000000b002367d5dd785mr13787442wro.427.1667378846080;
        Wed, 02 Nov 2022 01:47:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:6bae:ac40:a798:cbb4? ([2a01:e0a:982:cbb0:6bae:ac40:a798:cbb4])
        by smtp.gmail.com with ESMTPSA id q9-20020adfdfc9000000b002366d1cc198sm12634001wrn.41.2022.11.02.01.47.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 01:47:25 -0700 (PDT)
Message-ID: <3ee4a424-1a1f-514f-3289-cb813c382327@linaro.org>
Date: Wed, 2 Nov 2022 09:47:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/4] dt-bindings: reset: document Odroid Go Ultra
 power-off
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Sebastian Reichel <sre@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20221031-b4-odroid-go-ultra-initial-v1-0-42e3dbea86d5@linaro.org>
 <20221031-b4-odroid-go-ultra-initial-v1-1-42e3dbea86d5@linaro.org>
 <CAFBinCAQKf9RvRWQTCSg7g+7NP_vbEFBUeCoFbYnyfmqeegy5g@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAFBinCAQKf9RvRWQTCSg7g+7NP_vbEFBUeCoFbYnyfmqeegy5g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_014728_297049_E14403D7 
X-CRM114-Status: GOOD (  12.66  )
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

On 31/10/2022 22:16, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Mon, Oct 31, 2022 at 5:47 PM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
>>
>> The Hardkernel Odroid Go Ultra poweroff scheme requires requesting a poweroff
>> to its two PMICs in order, this represents the poweroff scheme needed to complet
> s/complet/complete/
>> a clean poeroff of the system.
> s/poeroff/poweroff/
> 
> Please wait with re-sending this patch in case the dt-bindings and
> reset experts have more to say than finding typos.

Thx for spotting those typos !

> 
> 
> Best regards,
> Martin

Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
