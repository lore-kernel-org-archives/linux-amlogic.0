Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564F6C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Apr 2023 13:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YB3qFoCy/byb18VjQjOm3m2jVHnA6mHz4DRIRTVdFPM=; b=YU1Gff0WQ8wTov
	EgqmPj60JPcJf7jpYhQKO/N1WXYBUWNeOPAl5UkBIQDa8qthgow+gE9J1EzBXqbtqLjUE/rzdmBOB
	RVqafav5PtLbNtxylY6JI+GbF+FKL5lPdk6IIzqVSEY78a7/xfr+JgiIuUeDtvXiEpjeRhZDL3oZe
	VINxLjERmIYeE0N1ba1I/ROiUUaoRvNb8LLZnJw8iAlmlLLY05SbyncYrwEQ+txNu2kYDfmZkToKn
	bIIVccS18Wi6hf/ZmgjKrzB2OZvn+RNvnztPOotk9nZZ/NuMVB13gYd6+5nPp60FOHoh/D2zpA5pe
	bHZoYcdAeHOt+8qOSbeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmT9-00APXl-2L;
	Fri, 07 Apr 2023 13:49:35 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmT1-00APRH-2B
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Apr 2023 13:49:31 +0000
Received: by mail-ej1-x62c.google.com with SMTP id 18so8537587ejo.13
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Apr 2023 06:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680875364;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bzY0VrOQTdhqb0xLz66yvPJl/GNdYUn650SOB4Bm09E=;
        b=cOGiYYGRbtQnZeCD9QAclfQHyNRlDqZeUSuPCh4/DPCGm+6i5ASUZFEjO9l3nyDeoa
         XkmIRhNgo+pcN9x653lqzGw/M3/5QwxdKu/ZMmRBlNKOSBjppYXDlKLY78rDUxER3m8e
         mMkrhEY43wWKGpIhXiANbwLJKNMH4HHDoywdrjO2Qyk8mqfqLAAsiB625woAheq7WXCz
         xT2KhVP2TAB4PlC/oZn81zwh1YsUvFucFmx+Lbx88AcUXcw3mcy2cWE06QnCWOb81rLo
         CfMCkUPhcHPuEOk0KaXFFyQxGob2ac7IVuHZOYSuHAcDNYAaJkIF6SDUSgKP6xBafTm7
         afhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680875364;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bzY0VrOQTdhqb0xLz66yvPJl/GNdYUn650SOB4Bm09E=;
        b=Xlf9J+CEHgMi7nppLLUQI11P+4JBb/DuuTL+kqgcdyoXXd0M6VFeRglax6dbe3EKNq
         AELwRBKlCMd99sl8id9FW7e8E0uLzfC86gX6F5Ku3eUQXWQBImmA1oYLWpkpGMFme75d
         wrE0s3Mn+mKLTBwZoJgee8xeeBaoPyD7ZiUlc43uuJNXHbrr48+x4pGSSAlyDzYcQakA
         5oo5rw0XromKGAXbSCbJyu3x+apNR5um8wgf3ZcdL+SeQ0zXVridEBhkmes/rFmpfDfc
         5sO+wzFA/UYErpnwjQKhb7vOEBSRNHPpb8ff1joJKOPFYftudDqWX4U14mmfQb9mqORt
         E0jw==
X-Gm-Message-State: AAQBX9cowdLnhXXSpBE4+oO34OJKhD7H8YcQWV3IzIS9TtJqIi935cs6
	Y5AZZ21xpfCvBrBUA7DaVBqTAw==
X-Google-Smtp-Source: AKy350YwpUdmG0KaCQJJF4r+lCKOc6QEvs5tkq4aYNG2bKi1iKT+qj+Y9CzWolMLeqEkPQOItaOBlw==
X-Received: by 2002:a17:906:5945:b0:8c3:3439:24d9 with SMTP id g5-20020a170906594500b008c3343924d9mr2393601ejr.24.1680875364729;
        Fri, 07 Apr 2023 06:49:24 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:b20f:8824:c926:8299? ([2a02:810d:15c0:828:b20f:8824:c926:8299])
        by smtp.gmail.com with ESMTPSA id x9-20020a50d609000000b004fce9ff4830sm1907574edi.88.2023.04.07.06.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 06:49:24 -0700 (PDT)
Message-ID: <0f1c0267-da04-8ddc-0703-1f51b53f542f@linaro.org>
Date: Fri, 7 Apr 2023 15:49:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: arm: amlogic: add C3 bindings
Content-Language: en-US
To: Kelvin Zhang <kelvin.zhang@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20230407102704.1055152-1-kelvin.zhang@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230407102704.1055152-1-kelvin.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_064927_750498_1D011AAB 
X-CRM114-Status: UNSURE (   7.47  )
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

On 07/04/2023 12:27, Kelvin Zhang wrote:
> Document the new C3 SoC/board device tree bindings.
> 
> C3 is an advanced edge AI processor designed for smart IP camera
> applications, which does not belong to Meson series.
> 
> Therefore, modify the title field accordingly.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
