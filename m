Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05A6C6FA8E
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Mar 2023 09:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lID3SnMBQGg0ia4TsuH+lerNqaRSjsNIS6hSn1YljM=; b=VsFnJLaK3ckjo15pLNoebn2lcQ
	BQT92KSHcuG6jtxGJ4yTRKVJbQwH0Zsv1XjBEJFSGzV5ONGGfElXZoBfd4oksfBRI9pgvD1++VXXS
	+C/axHbNH9wjl0To6f8pdJMqQQVaGh2/8t91ln9ZmPSDU71Xykk9wFNjr4ANOKkAN7AnJ6y9vBQAv
	lAHQcC4f7o8S87x6s3hjn/HGr0pPiVx0czaBxRpz7/9L8f/HRJNsJDB0ZK+KOAshlRSYSWGQf2iEi
	AsIJD7KyDwWp9darJ7HHhp3EXYQ9VF5N3C27uyUzJsUuEsy+z47kbdew/7rof1NmoTByxdwNLdK6h
	WFDLUGLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfB0-001OxB-RN; Thu, 02 Mar 2023 09:24:38 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfAw-001Ow3-Rv
	for linux-amlogic@lists.infradead.org; Thu, 02 Mar 2023 09:24:36 +0000
Received: by mail-wm1-x32e.google.com with SMTP id p16so10215161wmq.5
        for <linux-amlogic@lists.infradead.org>; Thu, 02 Mar 2023 01:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677749072;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BWGLYdD4ufr/E1ThoieJ1WMoxdv/y+QHtWqXixPFyHM=;
        b=X68qidyzTxaMruoXSnw75a33xhU2o+s2SL3T5qVupPU8y5m5co69P00W5FuDrOzHVo
         qUmlZhYwbREc0fLI5Is3/kPvW7WhJJPUxs5bbjTFLuU/gJllttSYrfqxNposQLCEdYQY
         2D/g+2lHdy6bkoCdR9obskI5dHzZFLx/MJnDrUJSHJSSQrU7XIrqThiUBwYwQwevNb6U
         TGC6GZP8tV/6vhc5rnvQ5m3LGpwd4eymVgY+gQUmPikcrYB4uSkKPULBQsjBM1qzlCow
         oMBNJURS/WqJ1IkqsGpR9028mwHWUGRLqe3O3Ex79dRn4iXSS57ucWnNBbnZQkJA6dVI
         LNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677749072;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BWGLYdD4ufr/E1ThoieJ1WMoxdv/y+QHtWqXixPFyHM=;
        b=RHwxLLNoE30fV6riynNsZ0fdKp2RclJu0wOodw2Dlv03MbsYSxpq8griLLfq+Ac/Nf
         QMu1VFwmaEhJBj4BdCapqoHvjGo2FXNBduY9TAx7VQ6ys3jG1Zzsu1ux3MoeCPWepKOw
         liUf+N1o+CtShFYGemJs+h2QhBeMdR89xm5OOaJdvC0kRcoPoleBAl8gMxlC8yPTveqO
         nyADy9xbcOKTVENmiFvUjR0VAmPPjRxatCFCSlPZKvLXiNIGLmNd3SvKlaglO1N58bfx
         QY3CpLPiJOGZ8RXL9MXbJaFTrT8+3PbTPj8AlQrX+0t9i0xi04oVgYoGLaP+dPfzriKL
         CWfA==
X-Gm-Message-State: AO0yUKUVHqL8cyxEAURNmpzVMExzNBjbU0dzgCAYLQYzVpelDkFoYlRc
	oOEweWjzeJm35qzUvAsxT7NuZSUPn8j1UE4jZUs=
X-Google-Smtp-Source: AK7set8erNKdqlF8yG+383R3lM3MlNAuoEOfGSP045v0ekFPlCjl3NaWImxTogQfTMWbxdLPor7Tuw==
X-Received: by 2002:a05:600c:713:b0:3eb:2b69:c3c4 with SMTP id i19-20020a05600c071300b003eb2b69c3c4mr8106566wmn.36.1677749071877;
        Thu, 02 Mar 2023 01:24:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:217a:db24:fe27:6b35? ([2a01:e0a:982:cbb0:217a:db24:fe27:6b35])
        by smtp.gmail.com with ESMTPSA id c21-20020a7bc015000000b003e214803343sm2238704wmb.46.2023.03.02.01.24.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 01:24:31 -0800 (PST)
Message-ID: <80fe197a-3f15-d1b8-ed99-adeb4a8c24d2@linaro.org>
Date: Thu, 2 Mar 2023 10:24:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/3] dt-bindings: media: Add compatible for Meson-S4 IR
 Controller
Content-Language: en-US
To: zelong dong <zelong.dong@amlogic.com>, Sean Young <sean@mess.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20230302063402.42708-1-zelong.dong@amlogic.com>
 <20230302063402.42708-3-zelong.dong@amlogic.com>
Organization: Linaro Developer Services
In-Reply-To: <20230302063402.42708-3-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_012434_960986_BDD1035D 
X-CRM114-Status: GOOD (  16.80  )
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

On 02/03/2023 07:34, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add new compatible for Amlogic's Meson-S4 IR Controller
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>   Documentation/devicetree/bindings/media/meson-ir.txt | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/meson-ir.txt b/Documentation/devicetree/bindings/media/meson-ir.txt
> index efd9d29a8f10..2a6662edd04d 100644
> --- a/Documentation/devicetree/bindings/media/meson-ir.txt
> +++ b/Documentation/devicetree/bindings/media/meson-ir.txt
> @@ -5,11 +5,14 @@ Required properties:
>   		  - "amlogic,meson6-ir"
>   		  - "amlogic,meson8b-ir"
>   		  - "amlogic,meson-gxbb-ir"
> +		  - "amlogic,meson-s4-ir"
>    - reg		: physical base address and length of the device registers
>    - interrupts	: a single specifier for the interrupt from the device
>   
>   Optional properties:
>    - linux,rc-map-name:	see rc.txt file in the same directory.
> + - amlogic,ir-support-hw-decode: enable hardware IR Decoder, and register
> +				 rc driver as type RC_DRIVER_SCANCODE

AFAIK this is a software parameter since the HW is capable of decoding,
if you want to make the HW decoding a runtime option, please use another way.

>   
>   Example:
>   

Please base changes on top of https://lore.kernel.org/all/20221117-b4-amlogic-bindings-convert-v3-4-e28dd31e3bed@linaro.org/

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
