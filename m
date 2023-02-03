Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D66C636D4
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Feb 2023 17:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XG3yuDxEqYSjNYY97AfYGn3UGzOK1V8ADLUbDzmxxv8=; b=I6EBwEJj4hjvei
	4D9HSCx0y0txGb/hBxG3Pjf/JRtLCL3worjh2uq36sP9baTgU7hf5qP3gZbOWBvdGRQDOMtxDl4LC
	v1o3DCXvEbJknWJscvvjSfxRGCBAPdsglNUkEcU/prmZMKi4P+rSczNhViJSELU+7CIs4bVxeexvv
	TIp3F49WLQjzaFEGfBedZ54ofnCdxlLMA6G7vZWDKkSnsajp2YULqL0ZmPjEzKqzLLAA8h39yzFU7
	9RhKUNNzAkDq4U3fcKm3FxjMZbmG3gMLXgyV1W+hGjZaUjXlZlc0TiihOENnQKW6c1B7j6TPdu53x
	ilF8vCfB+n+WaEtv+KeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO0LX-0039vY-PB; Fri, 03 Feb 2023 17:59:35 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO0LU-0039uW-UI
	for linux-amlogic@lists.infradead.org; Fri, 03 Feb 2023 17:59:34 +0000
Received: by mail-wr1-x436.google.com with SMTP id o18so5378324wrj.3
        for <linux-amlogic@lists.infradead.org>; Fri, 03 Feb 2023 09:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UnkV8eglfBQ3m7iE71cgfuq2SGzc7qznHVEMOlIyJ5k=;
        b=txMUNSAB2UzgNJC5K8ThvnqZcmDr9Xbfbuga4hMfATueyFe2FumlAI/I6oBTc9hSia
         baW6RsfPnETMBqGXWrZ/Lkqo5ZBLO77S6wFuMUn06uUTlmnQdaRUzUOjDqm+vv6rG1Ra
         b3BIPdH5JqeKuhOq8r3MqVDKUCda0NJ2GQbrmZ1IU4WgtC5UxTZxv80pruA73eaDRnF7
         sTi0S6ckGPDrfkNLw3Yz8+uY8OKf152X8h0z+h3tBgVnIoRo8x1m6CUquIXukViwnCQw
         I7PXau1BdzrMMgTjbZOVvam9wswmA9AMH4CUTxrk3IbSqJOqqnlB4A/YPyUK11O6k2jW
         Ebgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UnkV8eglfBQ3m7iE71cgfuq2SGzc7qznHVEMOlIyJ5k=;
        b=2mkmQ/9ZCS1FJPLYbUd4zPwdLQoXvhI4zIoJk3XZxsBjEkJb/2bLRg2mNYMIG5FJVZ
         bJNNZxwE411fJ8t47HiGU8u3q8knAZtgAgnjVvI1tOozczEWSdfIPAjZrXT3cNxpKVCS
         plExiKsa5T4KXKpykmmyH4bacBb//ndg1E6GiR1LMoiBYmj7iDTi8l28gAke7EYiYsG8
         sHHzfCHr2fm1V7pgoP+AOP7JeNLKln4TdjVzdWvqMM08oQ2ur82l7Qjw/5NNWR+9Myys
         9AMtVbG5q/Zs2vlBjJdTfmmu6CHkurBUVDiZQOzDfz4DBt/L+sgYjcu8UCQZbOewaRcN
         SwOw==
X-Gm-Message-State: AO0yUKUZrNA/YHRFvKHGz6JkjW/313ifEaBJPYGPfDaTsKVQe3N4Sg47
	rEnb6Aai64FE//3LXS8P2pjx5A==
X-Google-Smtp-Source: AK7set+Tfe3BDkZewBOqFV5KXz7+EuxIJvkv67VKmNkAgrrkoHAC1MxgyKcfMByhaN7MOoO8d5gHWg==
X-Received: by 2002:a5d:5982:0:b0:2bf:eec5:3912 with SMTP id n2-20020a5d5982000000b002bfeec53912mr10791579wri.34.1675447169866;
        Fri, 03 Feb 2023 09:59:29 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h12-20020adff4cc000000b002c3d814cc63sm1758281wrp.76.2023.02.03.09.59.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 09:59:29 -0800 (PST)
Message-ID: <fede7119-4a9b-76a1-ae1a-7af5dd8d1032@linaro.org>
Date: Fri, 3 Feb 2023 18:59:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 9/9] ASoC: dt-bindings: meson: convert axg sound card
 control to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-10-jbrunet@baylibre.com>
 <f229e181-c56d-6ec7-2a1c-754690f70438@linaro.org>
 <1jfsbmn7ql.fsf@starbuckisacylon.baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1jfsbmn7ql.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_095933_022463_C260A4D0 
X-CRM114-Status: UNSURE (   9.97  )
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

On 03/02/2023 15:13, Jerome Brunet wrote:
>>> +          Multiplication factor between the frame rate and master clock
>>> +          rate
>>> +
>>> +      sound-dai:
>>> +        $ref: /schemas/types.yaml#/definitions/phandle-array
>>
>> Old binding was saying it is just phandle
> 
> It is just a phandle but the bindings used to have problem with phandle
> that had cells.
> 
> See:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml?h=v6.2-rc6&id=d031d99b02eaf7363c33f5b27b38086cc8104082
> 
> Was it wrong or did the situation change since then ?

Then define it as having cells:

https://elixir.bootlin.com/linux/v5.18-rc1/source/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml#L42


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
