Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E7EC3DA78
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Jan 2023 11:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bvs6Ol0pEVyiGhmkiuEtWDqETMYBGncIEB577jVSPWg=; b=FX4/b5U5L83uom
	zmwpvAcWNN8T0p5XGvMVKHJeDzeHOG00ZyKZ9Hm52S0cwlO5FzqniqTvjoJG3MFbU0uzfN0aZvml2
	67l9z0B6mGVXV0TH4vrZMOvWzLCrSS4wjA3LlGxJcZkNtPnaWT268miICWju7zYBJpBnjBP6C0m0V
	X4EwmtqyUTJraLB+EYv0ruf6OWSbqSS4FQygqh/OTDOMHcKB/piu3kR8zxPcWJMQVIokfT83tTNVM
	UUxzCwc4LIrMGLJgJHAxzWJZ9XrWCfyrarlBxPnQBs2D2g+Yr6wAVIj8JhuVy2Y75aIDPmapLkojj
	Af42BA3hrRGW084EPipQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHjsY-00DxSI-SC; Tue, 17 Jan 2023 11:11:46 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHjsV-00DxQ9-PO
	for linux-amlogic@lists.infradead.org; Tue, 17 Jan 2023 11:11:45 +0000
Received: by mail-wm1-x334.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so4550533wml.3
        for <linux-amlogic@lists.infradead.org>; Tue, 17 Jan 2023 03:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1URupxNkkQ6nwEeC7CDBNm2xIHn6oEX5/tof7O7mRAk=;
        b=y9aZusuNGqbDOTNH83k4SycSt94Tw953zLUGwwV1D5OGiUPe6WcJMlvE1XGVqkFazK
         lHcIym3mqiNZBxWqQmtDqPAt6JVQFcKHDUqhz++UPBEfgVDu9eWknowhzGjW88rasICj
         P7FiX7u6MjJkwxNnpcqjsNLWUGVHuOxRdwtzsHqYyqp5U3yfSbGLBQbx0LEtW2Q458Nn
         5Jv3SJzkGI2A04U4w9kueCOG61I1Fa+IzWMjXZo0kWLOhlrrYcYHm/5UAkqrjA021cxs
         LgN48YfJtdGsZks42/F1lk6S88EC1M3Gra+ANcf6Tr8jC+zJo9HSLikN18/ih/BBz+La
         M+Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1URupxNkkQ6nwEeC7CDBNm2xIHn6oEX5/tof7O7mRAk=;
        b=oCjtPSKrk4e4h6+EQPFJaenLqIVJaPSzUPYA1g0bp/BMbxTDJDGy3JWkY3th9hN42V
         P2q+ZG5fDVcdKTqZ2vihLWEmTKL2fd1aJYUY2mDBfcM1eHYOA3BvavTnbShbVa6HzXbt
         Cb2IPjE29GHqbhrKDOZQA27AIeTAW2Z/tmFmt1laCByWofe+KlRsSlblwbTbeTbkyLhm
         SFBFNH3hAhsPwAjQHzpdDVCQWociXyhazQ13+mOpjC7kTv+ldmKEfGYCRo78idszTCUe
         aiC/NqBTLYiwU2m2jsnTQRlYwOpFewJXrAFY160MCKHYwlqcYmolIL34jjr28A1ttkJj
         ZE4g==
X-Gm-Message-State: AFqh2kopyO4oJ87A+b4/HHb5u0baNnKgHGDkncBV1EOSF0uSPfXtQDXK
	lKdTHZfqOWp/JTm00F49ol8+ZQ==
X-Google-Smtp-Source: AMrXdXvUbsEJU4Tq3rQTaPgknItqfI6wQpizQ0tSS0tS7+wxUmVTWHC2RYmatSgnkwU2PwbZpMyIOg==
X-Received: by 2002:a05:600c:4d06:b0:3da:f0a:83d7 with SMTP id u6-20020a05600c4d0600b003da0f0a83d7mr2655999wmp.8.1673953902540;
        Tue, 17 Jan 2023 03:11:42 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c1c0700b003d9f14e9085sm11033822wms.17.2023.01.17.03.11.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 03:11:41 -0800 (PST)
Message-ID: <ccf7f144-12d1-4fdc-2b03-ea2e60912691@linaro.org>
Date: Tue, 17 Jan 2023 12:11:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] dt-bindings: phy: g12a-usb2-phy: fix compatible string
 documentation
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
References: <8d960029-e94d-224b-911f-03e5deb47ebc@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8d960029-e94d-224b-911f-03e5deb47ebc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_031143_874401_473E8FD4 
X-CRM114-Status: UNSURE (   9.62  )
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

On 16/01/2023 21:17, Heiner Kallweit wrote:
> The compatible strings in the driver don't have the meson prefix.
> Fix this in the documentation and rename the file accordingly.
> 
> Fixes: da86d286cce8 ("dt-bindings: phy: meson-g12a-usb2-phy: convert to yaml")
> Cc: stable@vger.kernel.org
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v2:
> - align $id with new file name

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
