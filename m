Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACEBC6FD1F
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Mar 2023 16:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v8+3siC2sh3wF1uW+KVz8c5HYNVTzYtX5gyP8bZ3awE=; b=B1B/vwY/ajAmWf
	8oKGE4oIcJUtCVrkcZ/vho7WXpehsCl9Fa9gjWRh49QyymxcTuFp37wXnltOL4vgHBu9hWkvOU2GW
	GSCbbvqzbG0TdB2AGz3ax2nOWErzRx2WDKwAlait7Ksvmo/Gdf1ZnDmf7J0gOux2R36NYt2T7D/IJ
	faiTXWNKcxmWcoKlMLV6jwvW4CF50fFTV+xom8BrHjx8gQNndJsKkytz6MgpUlPEr60X3TpGYqr4e
	1knWgWHYDM39SLmkoJC+k/s4Lnr06whHzl2ar9FfRtx5DnyuFkNlOxl+g7+h88kxQlrkRwsREiE5j
	qHliA1tq5hq9oNamedJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf1HR-00GfH1-1r;
	Wed, 22 Mar 2023 16:25:41 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf1HN-00GfFk-2y
	for linux-amlogic@lists.infradead.org;
	Wed, 22 Mar 2023 16:25:39 +0000
Received: by mail-ed1-x535.google.com with SMTP id eg48so75169712edb.13
        for <linux-amlogic@lists.infradead.org>; Wed, 22 Mar 2023 09:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679502334;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sr/j+3cgxhM/KwgZTgpDYZTgFfI9GXlmQ/zkQE90CIw=;
        b=DnfWqPzonQ3weXJMufSIJ/VihFVfOy9/L/LsGefrAXYKMpiQSxjIcg3WNspyJtCx5g
         qOB3MX03pwwXyIorvs6eQ2NUPntoug7U5TqkYrbXLu8vYdp1uw4cCo/vLufkoGb6+UDr
         qt4AWE33l5Axb5tiRamp1bOexP4LJ057foVO13gQcQnEYOepeusmY+YRktiCTJ+UvMWT
         iFFmrsabL5S6QtQi6Ng/8kgCzV3FmkvjkmnO81TtzyjbhzbKGikGaKqyr6yUOC388PKy
         GKWRCABXhpl0rUA2BLzBua147+Vys8ZepByB1w40o37GlR60Q5m/VkKNCgHaAmA3SjJk
         FHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679502334;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sr/j+3cgxhM/KwgZTgpDYZTgFfI9GXlmQ/zkQE90CIw=;
        b=EVyVW7/QN4myULi/Dg+b703rdrC2sXxkyOq5svhi+PaPYEnIKs7cxi0W1eyL2rpDa0
         ZK/yEU7XxjRpC/2+vkPM7ye31L5XLiokP5vAjxWbcss+CXvOgvlet0me59fUWu7U2ZOf
         +MuyfNsMHWsVCPLOBu6SL35GhVmWuondLRhTuOLX5FsF2DVQzfbydPty2EV9KQQ5osri
         VpaQ7egmpSp9IsHixDArlu11J3GjB/tBYj6ygfXiYze3FL4vyKcEu4yAimOX2lMbdG6g
         3hwyff1tYcrOetUQfv9LRLoH3YSZdDUe8IL/FXL9waaINtUs4o3cYWTksaB5cdz3vdnM
         rIbA==
X-Gm-Message-State: AO0yUKXxailb0PiX/bCLDydjROVnC+UtzmN90EY9+R68Nh6wjtz30Qqy
	uewECvpxOYgEBivMSx8NojTrcg==
X-Google-Smtp-Source: AK7set9wGnyFe5XaKDU4cr/JttOVQwkZpPZ2A7mTqYQgkHG7Gr2iKP4b2JK7K+TnSFBBJB3q9BxgKg==
X-Received: by 2002:a05:6402:1762:b0:4af:70a5:560b with SMTP id da2-20020a056402176200b004af70a5560bmr3025768edb.9.1679502334017;
        Wed, 22 Mar 2023 09:25:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5050:151b:e755:1c6? ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id k24-20020a50ce58000000b004fc9e462743sm7924722edj.91.2023.03.22.09.25.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 09:25:33 -0700 (PDT)
Message-ID: <21bc1f94-35f8-42b1-f04b-86a5b4c03675@linaro.org>
Date: Wed, 22 Mar 2023 17:25:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 1/2] dt-bindings: spi: add binding for meson-spifc-a1
Content-Language: en-US
To: Martin Kurbanov <mmkurbanov@sberdevices.ru>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@sberdevices.ru
References: <20230322150458.783901-1-mmkurbanov@sberdevices.ru>
 <20230322150458.783901-2-mmkurbanov@sberdevices.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230322150458.783901-2-mmkurbanov@sberdevices.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_092537_968744_521B26FC 
X-CRM114-Status: UNSURE (   8.70  )
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

On 22/03/2023 16:04, Martin Kurbanov wrote:
> Add YAML devicetree binding for Amlogic Meson A113L (A1 family)
> SPIFC Driver.

Subject: drop second/last, redundant "binding for". The "dt-bindings"
prefix is already stating that these are bindings.

> +examples:
> +  - |
> +    #include <dt-bindings/clock/amlogic,a1-clkc.h>
> +    spi@fd000400 {
> +          compatible = "amlogic,meson-a1-spifc";

Use 4 spaces for example indentation.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
