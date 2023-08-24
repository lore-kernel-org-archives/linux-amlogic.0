Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52778C27C40
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Aug 2023 18:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Crw15193/nsQTYaezfbOftYuMwiHbs8oXpaDC0dyRHY=; b=1hCQGodqh8saIo
	lrbEwrkPKAOqFaYjS7H2A4XxXORzaLKwUsFQtELx9sbzKH06YIhTE+zL4TdZ2CWRLoD0T59q/ReHG
	BgguHeUxeiPghoHYnyUfTxbfHDk2zmmJe6cito78YmbnUJKwdpSApaLbnlbmQNFzrwPH8cihD0D92
	c795WrLG9XiYwcliO2EnuZhZcXMrM/pkxmYpl/FRpt9yZr0sc0t5xhCO16NVZJav4Ik3ksChupdrv
	abHMR3kK7Gk0zwSg4DL7yISApZTduxuw7HSLIfyPFgCWvM3edtxbEsLgT0fbfOrAovWCjUVSlkZD+
	4hdbV4cDG5ApRTx5IRbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZEj7-003ZLF-16;
	Thu, 24 Aug 2023 18:06:37 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZEj4-003ZKY-0J
	for linux-amlogic@lists.infradead.org;
	Thu, 24 Aug 2023 18:06:35 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4ff8f2630e3so113899e87.1
        for <linux-amlogic@lists.infradead.org>; Thu, 24 Aug 2023 11:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692900391; x=1693505191;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hXj7S19q5RtNo0D6iEd60OU8sFKZ3w5IrG/8uMz9J+Y=;
        b=Ki5a+t6UrQ1+9tLh7WV4ENOQmIOrWU6BmGDMU8UqYaFeZE9pPEOZYZESCIffhk8M1O
         YPZNXY0mZRFBW5BCBfyPUwnJsUcUA0sxsXjYb40YDXmWWQwZFfxqIUYa7upR5ev2fBcX
         CKBi2M4O1sdyvu4eBzBRlVn7Z8qkLzvofJiFNPD289RLB5bIldVpNXbivz8P08qQXAEK
         HZOXNDNWHE7iYK5NAcDu/l33E/HipVpF/y3xwCHCQQT5DG9WE3gHM2ExyWYiLuwRmu2a
         amCDOMNHvfRQ3n6KRtPhxOB7tWUCeg9ueZl8ZGV+wPVbB6KUQJfE3EtxvbedTWXiLy45
         SgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692900391; x=1693505191;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hXj7S19q5RtNo0D6iEd60OU8sFKZ3w5IrG/8uMz9J+Y=;
        b=jZZE+W8lBXfWcFD9BS8ABJZxeLZLIKPUBRTYhxlGvMHjnA97GsQWgKWsd6JDTVUDXR
         Um+PDv2avKaBViZ1cAld5sfD1miW3EnWu70pzPRH90sEC+xhcO97DBYQSJoJLyMm+UXZ
         RMftWtsALnXVLgSepDhLMZ7pMSrNmm24BF2HM4Oa50mk88CpkACExNsH9htl5NZJ2qJG
         59LfYQd26JOzkCdxn0g1jH1LJMYFI7rUqbdQsELrpK6oHFFbQJ5ffK3qFf0uHrYqE5wq
         G8wQtELgr17Mdv5oemTOiKyssYfpBVTNqE+4Ye7efi5IJxZriC18ELe9o/Kpum/GM91d
         9N0w==
X-Gm-Message-State: AOJu0YxA/4/4RRDX/qR0caEBR1D8Qu8bwI10MAAFZo0/WYJlP2pbaXue
	zV5OIPcI5LsNttA36tVd2p9HJ5TO2WLFZb1GBGQ=
X-Google-Smtp-Source: AGHT+IHvVpbN9zi77RkQ8HXMO7WXhe94dT4RB/bcvBKwuEkMOB6WxM8tK+7RaBfXqx9rlD5oCnH8rw==
X-Received: by 2002:a19:791d:0:b0:4fb:7675:1c16 with SMTP id u29-20020a19791d000000b004fb76751c16mr10077974lfc.49.1692900391074;
        Thu, 24 Aug 2023 11:06:31 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id z24-20020a170906815800b0099b42c90830sm11256190ejw.36.2023.08.24.11.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 11:06:30 -0700 (PDT)
Message-ID: <84865d1b-1322-2f40-2c1b-069f12e6ea29@linaro.org>
Date: Thu, 24 Aug 2023 20:06:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] dt-bindings: clock: meson: Convert axg-audio-clkc to
 YAML format
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@mailbox.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <20230824164649.2914789-1-jbrunet@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230824164649.2914789-1-jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_110634_137100_FFAD6B30 
X-CRM114-Status: UNSURE (   9.81  )
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

On 24/08/2023 18:46, Jerome Brunet wrote:
> From: Alexander Stein <alexander.stein@mailbox.org>
> 
> Convert Amlogic AXG Audio Clock Controller binding to yaml.
> 

...

> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 29
> +
> +  # All clocks except pclk are optional inputs of the controller
> +  # which may or may not be wired in depending on SoC variants, boards config, etc ...
> +  # The order in which those clocks appear is unpredictable and does not matter.
> +  # Lacking a better way to describe this, the optional clocks are repeated 28 times.

Use pattern.


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
