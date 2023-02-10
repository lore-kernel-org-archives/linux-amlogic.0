Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77ED3C636CD
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Feb 2023 15:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3McQBlZ4zzqtcA/EZ0FYjpzBkAk3zDasIBAgfjTiDQ=; b=I3k3RiU+S7UIeE4CLJVCqB+YAi
	yCcaQcrJYbr3WFDZgWuUeq5jyiW+KE2BHWgB2sRotxs4/k/DZK09eBHZvQbGTQWJHEm/yQP7AZ/Ot
	7s6mr7WRmQQHCmuw9IjkZQ9fhtUYzfmMujWvgpVpLNsBWwOTNEhnGL+03DN6Ic4peSLyq+qwKyHJ3
	sZCShoh99N+3Ik+Rtb4Qe15F9AOvSyaLPhJpHWouHMbkwt86Nb3piL7JldjEev3H/z3Ig6Cx17oB3
	YPzpYSGqAH9+ihsC9OOJzBxoi+6b4zQp+jJadTDx402enJItcrtKmfxETBE0RrIj9Q7oX2PpEysOW
	mxuiNJYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQV7s-006GWi-DD; Fri, 10 Feb 2023 15:15:48 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQV6p-006G51-HG
	for linux-amlogic@lists.infradead.org; Fri, 10 Feb 2023 15:14:44 +0000
Received: by mail-wr1-x434.google.com with SMTP id h16so5355335wrz.12
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Feb 2023 07:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZuYyqtTfQoaB/YinZiK/H1Kg2PxBItRwrhxGc1ifTPY=;
        b=QDUWpLtpzE+XalO0fqwhj1CLkdX2Ddht71y5GiHaN93Qp19hkDkz1jxukzpufMfNfT
         1hmEh6rPxwvY5xJtNp6xwhU5cxsRLwA+lCM60nZdl8yUk5onQAwlWLDZClgCNYPR3saD
         A2vkFUtARs4jLNcb4Olg9a+Dca45YYZSBtce/dme+XvGI4Cf4fKq9FsdTdcO175U3v9b
         g5eKWUgFggkkv4tGy7hkFGUaG63TYLyuSlT8j+0EnSGxNm+vaXp4QyEoGTHSWLgy7wbI
         A4firhDZXW1opDS5uPOvDCFl7jnx+o5xH6GXGnjXcrdWGeDzbRrk//6yTqSMl7x/0LgE
         5YxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZuYyqtTfQoaB/YinZiK/H1Kg2PxBItRwrhxGc1ifTPY=;
        b=Hh8A7VhbdvkUFt/ouGitQNa/PKvJBHeOvGhdqc4/aRZzHguOoEG6ghvDDfiaI8k+iP
         PAgtk4YNG86PEdkKTn17KaFxSpLAIL7mvJcYWP4GGQ6vvrvm1o2vmKaaLYR7A88B2Xyp
         BxiPvv+ii7VKSOE0srC5d17Sdy+7PZ6Iry7sgESLmHC6Et8Q9t/kiAAnMlhWj7zVGBPZ
         K3ShLiU5PiLttA+KmkdKzz/GojHa8+MGWZJYf26ESo+I+UkSWk40/4WsfDfAisn+6hWi
         pjDZyo/Tw0nz9bSY2o6lGmdytDGFAgzz7iJ8Lk2Tmv86ZC4cL9K7S8U9ZWv4wBHti5vl
         fQvw==
X-Gm-Message-State: AO0yUKWQ9URkZQ78zpp0CFndeuHbGvygzbzXbpwSIvB/4ipTcXcX2lv0
	bRM5fhz+ZyR3mHX1E60iF8Uu/A==
X-Google-Smtp-Source: AK7set+nlaHpmo6Bs3gY2OVBvVY1h55OP7NP0XAGbd/Fjf9fgUN2YGOeCg4yPACuTKPR8BEkKlNEqA==
X-Received: by 2002:a5d:60c6:0:b0:2bf:f735:1310 with SMTP id x6-20020a5d60c6000000b002bff7351310mr14873983wrt.2.1676042079709;
        Fri, 10 Feb 2023 07:14:39 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a65:5553:55cf:3027? ([2a01:e0a:982:cbb0:5a65:5553:55cf:3027])
        by smtp.gmail.com with ESMTPSA id a1-20020adff7c1000000b002c54a2037d1sm1688188wrq.75.2023.02.10.07.14.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 07:14:38 -0800 (PST)
Message-ID: <304e5e96-5387-4e72-b1ba-6dc28afea9cc@linaro.org>
Date: Fri, 10 Feb 2023 16:14:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/3] arm64: dts: meson: gxbb-kii-pro: complete the
 bluetooth node
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Ferass El Hafidi <vitali64pmemail@protonmail.com>
References: <20230210122817.1027765-1-christianshewitt@gmail.com>
 <20230210122817.1027765-3-christianshewitt@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230210122817.1027765-3-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_071443_628498_C69C954D 
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 10/02/2023 13:28, Christian Hewitt wrote:
> Add missing content to the bluetooth node to align it with the content
> used in (all) other GXBB dts files.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> Tested-by: Ferass El Hafidi <vitali64pmemail@protonmail.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> index 9bfdb54d912a..435ae2aa404e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts
> @@ -72,5 +72,10 @@ &uart_A {
>   
>   	bluetooth {
>   		compatible = "brcm,bcm4335a0";
> +		shutdown-gpios = <&gpio GPIOX_20 GPIO_ACTIVE_HIGH>;
> +		host-wakeup-gpios = <&gpio GPIOX_21 GPIO_ACTIVE_HIGH>;
> +		max-speed = <2000000>;
> +		clocks = <&wifi32k>;
> +		clock-names = "lpo";
>   	};
>   };

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
