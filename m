Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB74DC04A68
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Jul 2022 07:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AweD4zg1d/lKz4lo8mq54cUpQiCZYm533H4r5hh7FD4=; b=hFJhmOCdgRDYQe
	ZcS4fm0hCD1DSYxmBQofnByq3c+ntV6Td42aNKut1D/a5TvP7n3lFuJN85dg+kTPWxpXoA9XDwFOR
	MIVZmA0Vn9h8KuXhFZrmJh+iZxsAGXf+wqGozZT5oFmCZfHkW4TyMflM4dmQVO7a4J7rYHxfLo9RR
	oZM1De9tRUZG+RL0o3DQw+D1i6ptSCPvxTPvjXRb3gUH35e4W7kKp/Dm56CWYekARslKg9r9mP5te
	DupBt8vjU3xsYK3umMTdSMeXut+FpBOnY4xWXY6PPruyCWt4JzQzv52M33JIUwkjBYiWIxCY0U7u6
	GyOvBfE/JRLQFSM9xRww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGb7Y-00AKKN-Er; Wed, 27 Jul 2022 07:06:16 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGb7V-00AKFc-UF
	for linux-amlogic@lists.infradead.org; Wed, 27 Jul 2022 07:06:15 +0000
Received: by mail-lf1-x12d.google.com with SMTP id y11so25651025lfs.6
        for <linux-amlogic@lists.infradead.org>; Wed, 27 Jul 2022 00:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=4sf9T+KkmX+oKbYf44r0dMaCsbRx2OJI0DY04Ho/KW0=;
        b=XhyVVxoBGYlOH7LOualKl0oesVqPAiTF79SgVH4tPivvYz8h+2BXVbzizOooH6BLQl
         FWiqJXmDXCLYdH2E2kT76qMS3UoW9tK7OVQRxRbxOaNpU0lCXf3alqGXxbG5j1TyXD0c
         FAUBvF5ECKgbAPm0koN6pqUOiF8ot7wdOgMH6OYrJgVTIySsG4ufoSWVNQGcI9ZFXJYs
         EjnBc+a1tAK7O3OClre3Fibp4IehsiAyrRcq1uVZ5ADrd21dvTXrLwBeHJcXnBDialZI
         0VS4qsGlkY9mliBR25kyEmFLLlek7aoRrW2UT+Eb85v/uQ1WFbplMYgAhPJHBMJ+0iHG
         RuIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4sf9T+KkmX+oKbYf44r0dMaCsbRx2OJI0DY04Ho/KW0=;
        b=cggVd+IMa0D2gwZ9GU7F8CzLYBl+F/b69FrTurTsevX/lyjIu08KwTq6V6cI4iX2Vx
         Yr7kM83RCJnVt9gVhjsiGSMS6h6ypzhY6lZEuI+Zaz9y6h9PzTyKz2XuEh/Bm8A2KAvL
         fSjE7otsoQf5ySCCwE2R2STD1gRW7VWs19thQVcEjQFEAXuVEU7tjMIZ47vh1/TRj1Lm
         MPHAvHRxRBkk9Br6lAm3srKtaanyqh2wjoZ5uTgc806F6t6zTagwraTdl2YC/xUTg3Dl
         8CUGd1zqX9OwVQ9JR2q8DzQORLr9dqqG1gcf+x5zymWtcubPAZFM9Jbd1iftaupKmr/o
         AHYA==
X-Gm-Message-State: AJIora/J7OUdVKtCypvMCVPF5QkXsGd+XYAQiodS9z+8bVV3S8GK68x+
	Wo9h4i3WN3QosbJR+vMSj3tJPQ==
X-Google-Smtp-Source: AGRyM1smLYBVDCToR7HgdYuRNy05cPwfZUcF2DERzTh5zJoAqiJt5xc2kcI5NHi2mD6/B2qbs17SLw==
X-Received: by 2002:ac2:54a1:0:b0:48a:6908:1d54 with SMTP id w1-20020ac254a1000000b0048a69081d54mr7981941lfk.295.1658905569296;
        Wed, 27 Jul 2022 00:06:09 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id f2-20020a056512228200b0047f7b641951sm774404lfu.272.2022.07.27.00.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 00:06:08 -0700 (PDT)
Message-ID: <20725cba-220c-5664-5766-14d89d24b93c@linaro.org>
Date: Wed, 27 Jul 2022 09:06:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [v7 3/4] dt-bindings: arm: amlogic: add MagicBox M16S bindings
Content-Language: en-US
To: Zhang Ning <zhangn1985@qq.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, narmstrong@baylibre.com,
 martin.blumenstingl@googlemail.com, sean@mess.org,
 christianshewitt@gmail.com, linux-amlogic@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20220726143649.142574-1-zhangn1985@qq.com>
 <tencent_A962A641C180EEC2680CA53DDD6643BA6E05@qq.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <tencent_A962A641C180EEC2680CA53DDD6643BA6E05@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_000614_018496_01AA5444 
X-CRM114-Status: GOOD (  12.10  )
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

On 26/07/2022 16:36, Zhang Ning wrote:
> Add manufactor bindings for Tmall
> Add the board bindings for Magicbox M16S Tv Box
> 
> Signed-off-by: Zhang Ning <zhangn1985@qq.com>

All your subjects are still partially wrong. I pointed this out in v5
and you still send v6 and v7 without proper patch prefix.

> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml     | 1 +
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
> index 61a6cabb375b..a67af2adf6a5 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> @@ -125,6 +125,7 @@ properties:
>                - libretech,aml-s912-pc
>                - minix,neo-u9h
>                - nexbox,a1
> +              - tmall,magicbox-m16s

Previously the vendor was magicbox... now it is tmall. But you write
also Alibaba. It's a bit confusing.

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
