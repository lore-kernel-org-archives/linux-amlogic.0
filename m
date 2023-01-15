Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02FFC3DA78
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Jan 2023 14:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aQYGRD5Fn83wvucdj3jQznvMSfMH0ji6YB1aXKAHoqY=; b=ETZYKdFTaK/Rq2
	la8+U8Zb51kyeztVKsmHUtDYHg0HR1DSoqivs6PJqJMq7LPTaOK/NTPRDv2BPr+0NlYT+wj2ff7e8
	LgfwCe+2k8nh2BEzh7E8HoGVGmJt5yc/jRmxH4JXoeLy+1XZwt1m3YD0hQDcAFkkhd0LIssvjwE6g
	Lvu0zf1AmmSz7/y26Y+4UaZVR7WpvVRDHqFZhmOqsV0ZQnVH4SQstu16GH/33yi4dIICFlTetUqtB
	VIbyTksqAFkUrLG0TZa+AASLjScOOudN8F4MJ90RLM2ytukZiLUhnZXG+1acK/MZU1il45W1KvuIf
	PJqtXkBxVoWu/Np17zxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH4NK-007VBz-Ne; Sun, 15 Jan 2023 14:52:46 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH4N8-007V7q-V2
	for linux-amlogic@lists.infradead.org; Sun, 15 Jan 2023 14:52:37 +0000
Received: by mail-ej1-x634.google.com with SMTP id qx13so4268552ejb.13
        for <linux-amlogic@lists.infradead.org>; Sun, 15 Jan 2023 06:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Yj3ZCXHbKRPY/verkHqKVV2Cn5cPlwC4PAo4402Q4Q=;
        b=iqw/8vxRAV1j4K+vf1puxs69rRZZNOsLn3Po3Wvob635y84Rs88b1q0Ve23rtKwAB8
         r5xL8BwntUVtjZBWb9lc61CHWl1mvtapmmTQv8NeXwhccnXIcYf5oZ86M1kasRckLOjb
         JgJAwgE+aR+Xs2ReBo6ya+2WjLg72YcuVnjGfFyonGFcYoBoY0QVTA5HaDUdRfB0wScK
         8TFXggBJej4KB6FS2Kl2lqxltiJsWdWa4jk9u2oBgkSnz1vYSh+qjhlQPt73I9DAdq0R
         r2NlSUOnLha9yMDDEE4/iN9J/W/KehPIhLSrhAXiPh5y6t+8KIHVNtIM8c9N6IAVP4bm
         yZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Yj3ZCXHbKRPY/verkHqKVV2Cn5cPlwC4PAo4402Q4Q=;
        b=NgZUeO2B7CoKyOEQladpNzH6PShPpjWoSFkfE5DZCC5lyjnGVnI8C9PCJxk+MJomeA
         T+xly0NJ9XO9snF/abk27hXNxvlc09ba+KjZSxkk/XfA9wL+HI3rgq0BGl5vR6X8xOSI
         4Bm4tuHi8nf5FReoNAXcIufgnX2LCgimE+/YCwBBgDLgy2oWF/bxNWmkUwa8dniszMYi
         NtsYBbR5A7NRu9+DQVpfUYXnrGea1nKYENCNQu21mf70cihV7X4n6YMrnC7Bc81Xx4t0
         eoDBIq4z6Krk89VmIrdw70aVNaVzq0fbw3h8mQO37tX1xvbZEOFN3xyUrBa7DYBr9kgU
         6ldw==
X-Gm-Message-State: AFqh2krlSDtZOt3UP5gL6xEjrP5A9cN8Y2w22C2N2vZn3M3U/okUN3Cb
	kNawF0Qhbb6JFsApHsXoNwUm4A==
X-Google-Smtp-Source: AMrXdXuiaVUL8PexVx8yHacmbIi/Aj8XME5c4Vcpg+doICTMFKAbvOswIjaRnFD+v5hTB7YgqWHpKA==
X-Received: by 2002:a17:906:d9cf:b0:870:ac36:268d with SMTP id qk15-20020a170906d9cf00b00870ac36268dmr202177ejb.35.1673794352254;
        Sun, 15 Jan 2023 06:52:32 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r1-20020a17090609c100b007e0e2e35205sm10852102eje.143.2023.01.15.06.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jan 2023 06:52:31 -0800 (PST)
Message-ID: <3d81a196-3b45-222d-a22b-4fb5a98f0ed8@linaro.org>
Date: Sun, 15 Jan 2023 15:52:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] dt-bindings: phy: g12a-usb3-pcie-phy: fix compatible
 string documentation
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-phy@lists.infradead.org,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <8f1b2db3-f17d-f192-c28e-cb34dfcaf63d@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8f1b2db3-f17d-f192-c28e-cb34dfcaf63d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_065235_017196_DB25C698 
X-CRM114-Status: UNSURE (   8.08  )
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

On 15/01/2023 15:24, Heiner Kallweit wrote:
> The compatible string in the driver doesn't have the meson prefix.
> Fix this in the documentation and rename the file accordingly.
> 
> Fixes: 87a55485f2fc ("dt-bindings: phy: meson-g12a-usb3-pcie-phy: convert to yaml")
> Cc: stable@vger.kernel.org
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
