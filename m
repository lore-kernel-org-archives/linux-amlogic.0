Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF8EC6FD1C
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Mar 2023 10:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ui07OXGp9TJgrg6fi4mRRaAE4P7xar0RbHNq6dG7bZM=; b=S9u4HemXYZdGnPGVAekQWROWja
	CjxjFg5m1mfYA7z7QQT8UlC/OwLF7eseM/zclqwFSjiSzgYyCaShqYzYoCPIMrjKxKydpjjEGcNt6
	AH8xJWhPaSj2KRnFk6xYIMMSdo+adT4y8o0NS1ev7Fg9MhJ56v9Ai0ebP+q3izfHXAgZmGHO2b8LN
	y63vmcJDPRqfXaxADF/JNcTYK1Jga5ZhEOC8oMPggz2VuhqaASBwTZKWcyCbWD9/DpSRIkyguzEio
	LklBMJZdWlnBBEsMSVUTUkzXdpYnXxA0TthgTwGYztUDSTEbUUwVgZcCa7V1jhp478i8qr8lpHMXS
	5ghWOzYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfeO8-0047IX-0h;
	Fri, 24 Mar 2023 10:11:12 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfeO4-0047GJ-0P
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Mar 2023 10:11:09 +0000
Received: by mail-wm1-x335.google.com with SMTP id v4-20020a05600c470400b003ee4f06428fso620737wmo.4
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Mar 2023 03:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679652664;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7D0AnhC8qINGmkMrvNsGrg02iqTAAE7pNka7bMg+dd4=;
        b=kbJqE+Kpv3PBewVIEy8nF3lSWyuRxhA6lgVtPWSLhfPYk2uEMWIVMSs8RXDh28Wrb9
         +ub1etCXA1woCJcKZpAx5T3ZYSCXckuXjQFAcWKviA1vvX8QV/Cm1RrFYSG5bnIMJVxI
         eGaRZR9KGVDI2CJ0KzhFIbEAyBg8MGpvzGdecOXjhODB+klLh+P8EL4ZXDYhTsyUHoRK
         ZLTKEB/oMQKFjjA1FiXwF2JF0FE7XvXVpcxj2y7b7hqpavFu99Mq68Avo/OOUni7HrVg
         rv31Sz8ImlgdpTJChxWDrGlfiE93FDc5cUqmJeDoja7wURvhnYbxXz1fvCPYIABiJdf/
         sy+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679652664;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7D0AnhC8qINGmkMrvNsGrg02iqTAAE7pNka7bMg+dd4=;
        b=vZ0iyk6ZUZWuAbL1jujeZJOUS1wPKkbUmd35oWRwe9JSQQS79zeaKTotpU4SC4e/ee
         QQHOLBYMURUJIWFFpnyjiQgu+I8COndXC6FycSebGHU7hKRmmU7WP0oWl5zcdc6gTWmp
         jmJlQaFa6ln5zPmXmYRGtrxj7BzjIOBQUz8KuDoOXoz1D1RL/1DEBCkcBC2oK3a/0jJZ
         V+72yKzKYjx33JmykFHqTa7GIJbhTORqYNodvI8w+Sk9iZovcl3BBB8tw3DDLFwgw7fr
         hW2IMBA6bQG7HcUH+8Z6buoGL177aWmQytESW/BpddMXPXqt8G6mBFfNH4F8Yw2wcHRR
         zxSQ==
X-Gm-Message-State: AO0yUKV4mmEUXykiJMpU0ePlx4CDLPh9XpIWyBLJRoQmMk56O+dfDRIv
	OftUQJQZ83kUHKpftInBi6fyvA==
X-Google-Smtp-Source: AK7set9DwzUdUe5hHDRBjGUaWsA8ce55Mua1cKuCK5olDg5+9I5GW9T8rQyUE71YZ4JRpa/kTpVOwQ==
X-Received: by 2002:a7b:c046:0:b0:3ef:8b0:dbac with SMTP id u6-20020a7bc046000000b003ef08b0dbacmr1595348wmc.31.1679652664202;
        Fri, 24 Mar 2023 03:11:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:213f:a579:70af:e4a0? ([2a01:e0a:982:cbb0:213f:a579:70af:e4a0])
        by smtp.gmail.com with ESMTPSA id p7-20020a1c5447000000b003dd1bd0b915sm4537056wmi.22.2023.03.24.03.11.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 03:11:03 -0700 (PDT)
Message-ID: <d180c7d5-7db9-a961-e519-cca5ccf6f013@linaro.org>
Date: Fri, 24 Mar 2023 11:11:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v1] arm64: dts: meson: a1: place pwrc and secure-monitor
 under /firmware
Content-Language: en-US
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>,
 krzysztof.kozlowski@linaro.org, robh@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 jianxin.pan@amlogic.com
Cc: kernel@sberdevices.ru, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, rockosov@gmail.com
References: <20230323185548.13731-1-ddrokosov@sberdevices.ru>
Organization: Linaro Developer Services
In-Reply-To: <20230323185548.13731-1-ddrokosov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_031108_203924_A5D32A28 
X-CRM114-Status: GOOD (  16.26  )
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

Hi,

On 23/03/2023 19:55, Dmitry Rokosov wrote:
> Before, meson power secure controller was a child of secure monitor node.
> But secure monitor isn't the bus in terms of device tree subsystem, so
> of_platform initialization code doesn't populate its children
> (of_platform_default_populate() API).
> 
> Therefore in the current device tree meson power secure controller isn't
> probed at all.
> 
> If we place meson power secure controller and secure monitor nodes under
> '/firmware', they will be populated automatically from of_platform
> initialization.
> 
> Fixes: 04dd0b6584cd ("arm64: dts: meson: a1: add secure power domain controller")
> Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> ---
>   arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> index 77023a29b6e7..44c651254dc5 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -72,8 +72,10 @@ linux,cma {
>   		};
>   	};
>   
> -	sm: secure-monitor {
> -		compatible = "amlogic,meson-gxbb-sm";
> +	firmware {
> +		sm: secure-monitor {
> +			compatible = "amlogic,meson-gxbb-sm";
> +		};
>   
>   		pwrc: power-controller {
>   			compatible = "amlogic,meson-a1-pwrc";

The amlogic,meson-gxbb-sm bindings says the power-controller node should be
a subnode of secure-monitor, so instead please fix the sm driver by calling:

of_platform_populate(dev->of_node, NULL, NULL, dev);

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
