Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CE4C74A44
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Mar 2023 11:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XGr0ObCpD7e+JCzH44+kT6ABxPg1YUV0ayQsRHWcUO0=; b=4e03il2kb7gH29
	UxejlynZeAP2vEekDahwtf+Ryb9ZLz96U4rpCv6ttvF+jpe4lo8l19W1gUENU/NEhq/4osyRIcMzX
	ki0khSlcM4SAPW8SDiybTOeMjQVutvjoKYiMD/8iOeEvQbhOn33IoYap4qxQohobe9LsKkhiFlhql
	A93aikNwKbWG0TgQ6xVeAWTtyFsRLAJCOUTgCrVKo30Dl1Y966iTeA0aSjpxCdcrmZFFYJOyGXWpv
	42SmnIfn0nzcT6REiRLPpPQiMXKEysgp6sC2jNYZCTxtGyySUoZN7EGkbet/xR61vTdjgihbYSFTA
	SU2jxMSWo8I56939my8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZrZU-004VEL-3n; Wed, 08 Mar 2023 11:03:00 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZrZI-004V9d-Pi
	for linux-amlogic@lists.infradead.org; Wed, 08 Mar 2023 11:02:50 +0000
Received: by mail-ed1-x535.google.com with SMTP id cw28so64102566edb.5
        for <linux-amlogic@lists.infradead.org>; Wed, 08 Mar 2023 03:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678273367;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k80FxeJerPUTe5+cMAy1ESh6Ajb9kzwQ2sNMq2PHkUE=;
        b=y6J1U+DEAr44b6ONBQvcjwqRCpi6ifaA7Ef8AKQHLdwv0HFwCmxo6klNVD4nFasBMx
         LXQZ7D7Ybilz/jkKjemDBIiBkY4C+J1lPIedVjxBtRQ23YCCA+5f6Ye5bQ1FKu23mtZ/
         MPIHcd09Et10Hc3yUzkidzidbTo8K36CuYNWc+/FOwcA+URltJDXcfrJ449+0hyYTX9M
         hQEkM0karO7uCHYz8suCFzMvI+Zj4DZDDUxOSRVS6aXgRmgvtu2Ai/pTuJ/dB+VA2scL
         hyzyCNtmlrgJDDo93pDtLKe0jaSqMvXQuznR3s3PVt6hHg3ysW3UFpot7JCyCmbWcCzI
         5v5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678273367;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k80FxeJerPUTe5+cMAy1ESh6Ajb9kzwQ2sNMq2PHkUE=;
        b=ngyEKnnkRsC3OOpQLQPFWYe50Y3Y1PdXX8lb/O2iTbWLAKMhuHewrPYzBC7LsUfO7/
         bwvlE0/aK13N3zxl+YkOX0pxrbqeuqzA/xhxA7rh4iiaoYeEABUY8M6QCvLkQkS6SPrt
         aWmDvkMApBmPgRuGeosO4uf22pM01yopgctbjBqiCiODYKgWE4x18+ApKQKb1zB0/7hj
         CFuLFIq0FqGN8hAXyFFNQeVxbakt6z9mRrdUiQEe6UHQKAvmXgTY5AQKtsXIFrL6lLd0
         c/zxhWeQtgutgYTtYSLrllehiClzqjksF9t3diCXdz9+JlctQxSVGs3FyhPLr/Up7ZOi
         07CQ==
X-Gm-Message-State: AO0yUKV8r1ztm90MDsFGrMHFmbeDMIn5NZvy4SIKqumTV5rlHJYC3o7Z
	uaQwvRFDEsPhwqfo4PuIlgrVow==
X-Google-Smtp-Source: AK7set/ArpYmcUcM28cuvqr+z9jdgU4VQTOPhT9VclgPwbZWgL1KJjomKcNhXvek9qwmGUU38jNmlQ==
X-Received: by 2002:a17:907:9493:b0:87e:9441:4c6c with SMTP id dm19-20020a170907949300b0087e94414c6cmr24160431ejc.49.1678273367175;
        Wed, 08 Mar 2023 03:02:47 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:ff33:9b14:bdd2:a3da? ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id lc9-20020a170906f90900b008e34bcd7940sm7274120ejb.132.2023.03.08.03.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 03:02:46 -0800 (PST)
Message-ID: <ebc59782-4cd0-ad0d-e8a9-15008d93a7c8@linaro.org>
Date: Wed, 8 Mar 2023 12:02:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/3] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for G12A
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
References: <20230307222651.2106615-1-martin.blumenstingl@googlemail.com>
 <20230307222651.2106615-2-martin.blumenstingl@googlemail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230307222651.2106615-2-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_030248_887786_35E1CA18 
X-CRM114-Status: GOOD (  10.48  )
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
Cc: neil.armstrong@linaro.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 07/03/2023 23:26, Martin Blumenstingl wrote:
> Amlogic G12A SoCs gained a new "divide XTAL by 2" bit. Everything else
> (we know about) is identical to the UART IP on GX (GXBB/GXL/GXM) SoCs.
> Add a new compatible string for this SoC so this new bit can be managed
> accordingly while keeping "amlogic,meson-gx-uart" as fallback compatible
> string.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Changes from v1 -> v2:
> - make meson-gx-uart a valid compatible string for meson-g12a-uart
> 
> Changes from v2 -> v3:
> - don't add extra oneOf as all of the entries are enclosed in oneOf
>   already
> - don't allow amlogic,meson-g12a-uart as standalone compatible string
>   (which slipped through in v2 due to all of the formatting changes
>   that the extra oneOf required)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
