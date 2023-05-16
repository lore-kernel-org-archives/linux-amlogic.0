Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B777C77B75
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 May 2023 09:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cSuERlwttUVdkL9wq5oCVN/WzCldbdjFD/tk0PBggm0=; b=Zs5SxLUcncwm/7
	l2Azq+/uNNVOH0Ezw4ezwIFoM8i7SBXtMzmlOOtA945//qnQ5FFiQ5d201Ej+5vKJbkz3TeFxz1r3
	8fBoyIsr81XG9JxgdVcXrwd/0UJIXAgnmGlLFyIwvp5GOc3FVHN7wVYH4OzSWUDP0SNblZJispTqg
	rh2ysme71Ml6MG0ApH5RJMtC7lNY09BfLDFd3Rojkb3X9Ct4UF66IHg64C0UHjP/d8ApgAzlGks5q
	WD91kpa28OzziZvA5XpM4yCvEwtZrLWjlKkUCrsNme84seYwJITdVuir+JJnGNAPlgD3rTEab1AkU
	9Kiti8SWgn/n9KOq9I8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyqry-0052jI-2A;
	Tue, 16 May 2023 09:21:22 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyqrv-0052iF-2V
	for linux-amlogic@lists.infradead.org;
	Tue, 16 May 2023 09:21:21 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-965cc5170bdso2136168666b.2
        for <linux-amlogic@lists.infradead.org>; Tue, 16 May 2023 02:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684228877; x=1686820877;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GIxKr3aX2BYjnoWfUPAEf66ji9uTTT0hy2kkalP7tEo=;
        b=z2ocyro2qH97P1SExYDO0aZUDuVW2RYJH99+aT0lMGrRSNCAAMT7aH47X6trbdCej+
         0/gvFtvV3lw8YzkvRKgrtmvxrvbCh868VlGHvRMVzdlHNZ5/x/lGHZvK04XR7C+BbrRv
         VESyB/VVG2qES+iiv9YWTiDEHTA4N15GpS9K7eTCLR+1WSAflIJtqwtgqicnMt7Y0faF
         rsDxU3AZiGxmBtYal+wqdUHvxqe8YjkrbHR0gYqXcouIECcDhRkZtXt3Gwz9L63CpF6C
         eIOGQOhIw02s2mlM3xzQd+etEMvLEdXyu+QdAoYPfKYQ+aCyIuBnR04uWUI/hS8M5bfO
         jEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684228877; x=1686820877;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GIxKr3aX2BYjnoWfUPAEf66ji9uTTT0hy2kkalP7tEo=;
        b=BOPmTsxnCUYiGziBaXjtLUoe/ySaT0ptAgkrVNXBuISn/HL4SbVeBqHa019NxWz5fC
         Bcl0VwCFDWsCTC2tB9SKbl12eBwUH6wVKBy1IOxHI++b3TT1pEEK6+9SXJMbEv6aW5TJ
         wME90F8KP9AOBuZv2Pu9wI+AIV6Z1LG+wiNEfCOPuJ/igdWIMsJw7F379Cl4AoevFyCB
         1a7YP6igq5CDbL9gQhK4UgBoi92I0n3cRD2bGrrZn1gNsZx+zWBIn59oPTzWIsKVi7h6
         xloOY/wklC/xxGLsPHZmkw3B7H38s4XYv1413/l6L4obB05QmAHHgPhUvG6XR7gDgV6n
         pJKg==
X-Gm-Message-State: AC+VfDzMqrvKPNpqFzIMYJ2Uc5qpgi7cBml5mFB8exhYyl41nxqlZcIW
	qYxl8oERr5IHpOXrF9Pyv+s0Aw==
X-Google-Smtp-Source: ACHHUZ7dzFmPjJCKif5jB1+N0nHY21kGqLzOZEPILSuue896Kpc4Nn7f7bqfkz3TWcmxSoNINxsYNw==
X-Received: by 2002:a17:907:7251:b0:96a:1ab:b4a2 with SMTP id ds17-20020a170907725100b0096a01abb4a2mr26409591ejc.25.1684228877779;
        Tue, 16 May 2023 02:21:17 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:77d1:16a1:abe1:84fc? ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id tl14-20020a170907c30e00b00961277a426dsm10532335ejc.205.2023.05.16.02.21.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 02:21:17 -0700 (PDT)
Message-ID: <0efd549a-6caf-aa92-f78d-3dd0dbb12b0f@linaro.org>
Date: Tue, 16 May 2023 11:21:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V8 RESEND 1/4] dt-bindings: clock: document Amlogic S4 SoC
 PLL clock controller
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: kelvin.zhang@amlogic.com, qi.duan@amlogic.com
References: <20230516064736.10270-1-yu.tu@amlogic.com>
 <20230516064736.10270-2-yu.tu@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230516064736.10270-2-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_022119_816943_4FEB693A 
X-CRM114-Status: GOOD (  11.04  )
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

On 16/05/2023 08:47, Yu Tu wrote:
> Add the S4 PLL clock controller dt-bindings in the s4 SoC family.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
