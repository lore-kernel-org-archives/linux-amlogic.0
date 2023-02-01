Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED63C05027
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Feb 2023 17:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fJNwAua1tEkIZp82Wg/djY32wyxWItZdrZD8xgWA8us=; b=OBEYowCzJuYhAC
	9uyLm2eaTM8JQnPX+S+HXT8ZyCG4L4MXza84o7dxn3bhPivERiJMFp4EnJm4rRufhHDS0BA9Z5Ghi
	JNPIgd4hJ0jpQH2mjm4d7LkEK24hWxVIe7ZvxP0vsrsvzZ6AeVqsmZxzP6D37X46kWI8FxN0J6unz
	6taNWo4v8eHYaHtq3qg0vclA0xqCIxkXlB3DkW73LkD8r8wfDsfj4HrPugAnHanmcLn61UanSzJTo
	6QzQpe+/HVEE2913bP0QUxX2MqYNCRuV9YejzRaViSffQemoAso6yhaVrxh+K66mTNWedK4c49Uud
	glGF4cjKzzLjWitUZTIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHIA-00D560-N3; Wed, 01 Feb 2023 17:53:06 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHI1-00D52z-De
	for linux-amlogic@lists.infradead.org; Wed, 01 Feb 2023 17:52:58 +0000
Received: by mail-wr1-x434.google.com with SMTP id r2so18075893wrv.7
        for <linux-amlogic@lists.infradead.org>; Wed, 01 Feb 2023 09:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QqkRimUZCUkO1JuqK4G89C8Sdk2yfsCOyvpc+ZSm4mg=;
        b=H0W1lUqnxB8/wskxUt1FFcmuqYCIOLPNldjoHoDmTbdE6BtzUzRCZFD98AgsfPdSkS
         FPuN6OK/n1yprufrd80BrmT3//ufhCV0jPNOY3cInwmN8E7aKjcgTmT+Qhr3djzSK0+W
         Hb1qlflGY4u9EECirx3+o9RqU/EsB5gwj4sBOplzdFx/LcJYGF384qsPTajwWHDkvP8a
         8MkR0PVCLMjPM64EuuTMDLnvpMJPh86oGRpFmQ1/53vAFFanSb7vtnyh2jbQHXTGDAhN
         Mk97DrqFXHXPS7W5igf8ysW4ZUnIheJcavgZfZMSI+nlibvreRQG/D6mWFIAsjhOg8St
         nVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QqkRimUZCUkO1JuqK4G89C8Sdk2yfsCOyvpc+ZSm4mg=;
        b=oDmZBbsic/NHrCPhaDgy++ZJ2T6d1g78WlvE8jED5/dO6OLgYvy4rCUCHIs4xnfUaH
         HEkMpXwgZwQirs6qF5deog5YoYl1nidusCqQt43/vBdipaZ4PB1qONoVsKgeXNjRuamz
         3Kbw5N2hyUMrqyofhiAiRDHhNsZHRw3KRBxhtdLL0kVSEAiI7g2052NxbEuTbs4dVW8E
         4ldC6RnZaGVVM1LhX5bqf6hKPp2kLaF1sFO6Iotv8HI5OFYXvvHP89kkGK8yLmzr0ED7
         dgwqN+lhUceZhOaYgYhW55NZN3mJjR5hSdbBpw6a6Ixud/pRsqOftVfDkycpdw66HEuQ
         wv+Q==
X-Gm-Message-State: AO0yUKVJigZjs8t150mkeLXUycbIYFZ40tUEHgXVdU5WAxl4B+ks5lqt
	HEY4NYvXeNAKMQhmZ5tE0ITVjA==
X-Google-Smtp-Source: AK7set8cPJaRXAp/5k01V3nK45aC2Of7dJlRJ58sJqQVi0YxYfJYz9YfogtTs1yQGcDM7DY2vEurmw==
X-Received: by 2002:adf:e650:0:b0:2bf:ed09:abf1 with SMTP id b16-20020adfe650000000b002bfed09abf1mr3048310wrn.21.1675273973811;
        Wed, 01 Feb 2023 09:52:53 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m15-20020a056000024f00b002bfae16ee2fsm18583946wrz.111.2023.02.01.09.52.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 09:52:53 -0800 (PST)
Message-ID: <26703ea7-bfd1-7c47-f0de-1ae8ea3778c8@linaro.org>
Date: Wed, 1 Feb 2023 18:52:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4] dt-bindings: pwm: Convert Amlogic Meson PWM binding
Content-Language: en-US
To: Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: linux-pwm@vger.kernel.org,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <aaa73903-1837-d9c8-8c45-54b4473fd548@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <aaa73903-1837-d9c8-8c45-54b4473fd548@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_095257_490975_D4CE84BD 
X-CRM114-Status: UNSURE (   9.28  )
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

On 01/02/2023 18:45, Heiner Kallweit wrote:
> Convert Amlogic Meson PWM binding to yaml.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - fix clocks and clock-names
> - consider that more than one compatible may be set
> v3:
> - remove minItem/maxItem properties for compatible
> v4:
> - remove not needed "items" before "enum"

You got here a tag and my comment was about minor issue, so please keep
that tag.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
