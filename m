Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1A1C636CC
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Feb 2023 10:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EUlTiigpz+YIWuPZwkOG+xVHRKO2b1zo/fHG/n9jfKo=; b=ctZYmj4Agb4+b/
	QR27X0VtK0XpS1Kh4pAHEDOzAu6Tkbk8yJ6D9F0EKH6VsvbLx1Od/kN/g8jUxhE+5muXKaEo3DPmr
	aJNa2mpM0c/6EHIlHS0PU7EoU312Owi/+LH3WrR6MUofqkEcoh3euOJ95arPBQcTDU9wLCj3Niv77
	aObIa8mZwm3TM2v695Y6B4o29sVpfy+lrVPtkyN/dSXA33YtgZfDI9CY6JC3pOhw1AkWtX63hwKHU
	y/abh4PjVFz50jzNHUr9t0PsTLxp8hsJ3tbh2VbrbRz80NJg8RY+7jIKfzp6p4CsrrbCMtkz/rD20
	g07sm9K3SQradOSMxUhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRWWN-00EG9E-A3; Mon, 13 Feb 2023 10:57:19 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRWTZ-00EEnT-IU
	for linux-amlogic@lists.infradead.org; Mon, 13 Feb 2023 10:54:27 +0000
Received: by mail-wm1-x32b.google.com with SMTP id z13so8403161wmp.2
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Feb 2023 02:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c4gMj6DLk69LRUfrPQck9bSlMaISXZGCTkv4ZK5wjaA=;
        b=xabJSuvfnWQ37OhcxWukJ0rXnPEPPnqpfPEl3xZ9fab+kcs6mpfL4TM7e8zIRCjW/4
         cbyiT9qL5tOjl1arDVGpYqSYxESw8hMGf8evAiiZNAOcFams9kls907jCDm/PHJVZuqW
         7a7rIklVAFSV41LWtX/EIADWfNc+dAJA73ppMk9wHuxfVHBAerHdJAVsHQnCr30BNUcT
         gSPhyTZv0MaH6gyT857R0bCz0/kFmca+6WP5vcuxbxTCLZGZrZokHL/U8qKY8LSBk4Ly
         gyHCSC86sq5RuEvEJzyYg62jNjnv75DBnfJCDMB8IwQ03o3CSs+cftV9AgKTewri8keA
         tb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c4gMj6DLk69LRUfrPQck9bSlMaISXZGCTkv4ZK5wjaA=;
        b=PnVn2Izy6k0Nv4zRs2ntaYazN+LT0gGlayxlbdh/SZQfakSveImeCPOaeBxc+Tmjkk
         0Zx0evdoheNI1IH0yhjRe3EGlsUgvjSUarQ1teLNsl/tkFSlHk3MlymrPZCsw/BuolZJ
         QeqryROKw17qJTUslEAb1nFL6+9NTKMfOvukB8yoFMsMAz1TzKgDJDHfk4dep8vVWBvB
         3VyoF1wjA3zVUccF0/2NoJW19rxWBH6ArG/RmDLOFCZJm/SX/XZClNZ9F7fXYfRFAcbz
         rWVXLa1nkUuoZEzrh6K+3ASp+pS++WaP6d5I0EzPjj/zklIBuuAyMYdAvoJRUU2WHvTb
         W8Tw==
X-Gm-Message-State: AO0yUKUUkQIpLgMdb27K9HncPbXj8lpkedNmEy18X+yqkozhkxe8h2to
	YdRK+woTiX1VskDyVdBff2liRw==
X-Google-Smtp-Source: AK7set+dmnC8fFHSMMpTa9TbZ82Axtabej6jsHRu8DYMsSuwhXURadcSWX18R3jADIv3rFMAblj0Sw==
X-Received: by 2002:a05:600c:1688:b0:3dc:573c:6601 with SMTP id k8-20020a05600c168800b003dc573c6601mr20411857wmn.36.1676285662715;
        Mon, 13 Feb 2023 02:54:22 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j23-20020a05600c1c1700b003daf681d05dsm14507052wms.26.2023.02.13.02.54.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 02:54:22 -0800 (PST)
Message-ID: <28f16bc4-a1a7-9345-10e8-e292b94420a7@linaro.org>
Date: Mon, 13 Feb 2023 11:54:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/6] dt-bindings: soc: amlogic: convert clk-measure.txt to
 dt-schema
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
 <20230209-b4-amlogic-bindings-convert-take2-v1-2-c4fe9049def9@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230209-b4-amlogic-bindings-convert-take2-v1-2-c4fe9049def9@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_025425_677537_85549ED6 
X-CRM114-Status: UNSURE (   7.00  )
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

On 09/02/2023 14:41, Neil Armstrong wrote:
> Convert the Amlogic Internal Clock Measurer bindings to dt-schema.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
