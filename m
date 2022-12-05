Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D21C4321E
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Dec 2022 15:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CMYzVX+i43r0tFGiKvU2t6hFeKCjkbqKvg84Ar01XGQ=; b=AnXBjhTFkLa3IE
	dqvHadEPBePk94Pn8S38vG1KEIwNPXZ02ESnG1RjaKKOpEH+iH/toEtOT9Wj3zNC4wicv7UaslLF8
	bqfs090qXdzDqHJ3gj4wJNTLIawXOx50UkPIYM+YoN7amaHC03j2YtjTLTiXCcmRz8QIvWDBdycK6
	DeI5tvA5d0mI20Ww6F0oDci/Xk6XCE4NOGZLLEMAK2UZi9hHgV7jX118dcSnONSUhZc42rxqhCRKr
	pznxe2IAOTJfJRdfvd/WdmT3Ccw8qfZV6WMRa3AbxN/jLzRYDs6XDFSeL7B6a122yAtc8+oSMVjl4
	jH411kIWV1MvpLhmIZNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DER-004exZ-Qv; Mon, 05 Dec 2022 15:18:11 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DEG-004efF-Ag
	for linux-amlogic@lists.infradead.org; Mon, 05 Dec 2022 15:18:01 +0000
Received: by mail-lj1-x229.google.com with SMTP id q7so13876229ljp.9
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Dec 2022 07:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tubnq3Lb1VVWqLrhjxAXy/EV/eNx6+cm8xh6RrNzzTM=;
        b=AIqfGwx71gO9vLfBYjXxUMedb1KiG2HcnbySTeVyFNkdrqm8R/q3bAmVtiE5e60CZD
         XoCsOQnTeTO+JJrXz5TfPqzGSiaCdlVb5BRFShvlZhVsgTpbNmbF6bqv/FP/UPPXFRXU
         WPydXGV2z2bawxqjAGyoAaQUAdYybDPyf210uMSFDVTf/zOspHXc9GAHCeFhl6r+kNFU
         +6cWu+DrfJQiUaaUQ3bs7PZeQWf0X4UlhiHKkU15yVojPN6mRWhavScbZCCPAr2DZucN
         Kct+cf6ygsaSMG2MoCWMSeTNM8QmP/hp/zFZQJbsgmsjCqCOlbHfVpe000NAM6eTbxkk
         LMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tubnq3Lb1VVWqLrhjxAXy/EV/eNx6+cm8xh6RrNzzTM=;
        b=z4RgcPUx1OPQS7heA0iu9ASLfFj9Lc2t+rxVEwy4aNmDJFGwsv4VltCshg+WVUllX7
         Vk4msak+wNJG00WydZi8cBngOKxGeARwhaPdWIHZ1tamyWUA7aEUsxi873yPs8zUOC4g
         nGvz0q+kgHVMxMUH1hgL2VdGxvuM1x5n+0hpPxAV35xUyLicYNHPfYPYpeQgJYczIEXH
         mL3dsy+jhTrFWJpSBZTow5q/peJ3FveIQXxxZ1B/lKVIYq1gopCHumBHYO2wEaH9F/la
         Rje49k7ZM47R0xFVZoWGEe6nOq6U7MDtb+9fOnq+FjpCDBCPrkBF/ApNP6CDlq/nnpqq
         qddQ==
X-Gm-Message-State: ANoB5pk8NxTuVRBRn2C50KXm0wEtK2axE9BH/N3X7L88MWKKcI0EpUZV
	giI22dFEbmMgiahhCvWuNgMR/g==
X-Google-Smtp-Source: AA0mqf7AXb6jmtQHyKyaAg541NUdZ6ve9Xm0GWLbAM0+giRLqWCe+D+MTsptwcE1Dlw0gletu1rDVg==
X-Received: by 2002:a2e:b5d5:0:b0:27a:37c:cd59 with SMTP id g21-20020a2eb5d5000000b0027a037ccd59mr1038330ljn.157.1670253476392;
        Mon, 05 Dec 2022 07:17:56 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id x3-20020a056512130300b004b551cdfe13sm1350223lfu.279.2022.12.05.07.17.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 07:17:55 -0800 (PST)
Message-ID: <da51f5db-b697-47f1-208f-e710e491299e@linaro.org>
Date: Mon, 5 Dec 2022 16:17:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 5/9] media: dt-bindings: chrontel,ch7322: reference common
 CEC properties
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amlogic@lists.infradead.org, Joe Tessler <jrt@google.com>,
 Jeff Chase <jnchase@google.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
 <20221204182908.138910-5-krzysztof.kozlowski@linaro.org>
 <167025248440.1785019.8058849269946787324.robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <167025248440.1785019.8058849269946787324.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_071800_425207_DDC787A7 
X-CRM114-Status: GOOD (  11.11  )
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

On 05/12/2022 16:07, Rob Herring wrote:
> 
> On Sun, 04 Dec 2022 19:29:04 +0100, Krzysztof Kozlowski wrote:
>> Reference common HDMI CEC adapter properties to simplify the binding and
>> have only one place of definition for common properties.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../devicetree/bindings/media/i2c/chrontel,ch7322.yaml   | 9 ++++-----
>>  1 file changed, 4 insertions(+), 5 deletions(-)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.example.dtb: ch7322@75: $nodename:0: 'ch7322@75' does not match 

I'll fix it.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
