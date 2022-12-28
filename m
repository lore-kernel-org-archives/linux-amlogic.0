Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE6FC3DA7A
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Dec 2022 15:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=veWpD2iwHnQqJZWYFe6o5QlkeGxiTzUjxByrWkfDjjI=; b=pkPcxiS040v9g1
	410SmuVSdBgFXT3moUx6BTEOWOneoFcLhpCyB6feT6TFnPktWcpYQ+ajoVkQPOp2rCoOLSRRYnxVp
	60YPomCIIgLFEMnVHKOKSH285EV2KPBP3HDUMcnVVo1+/8QB1nOA58TePWvE7iR9SOBcHYNk11U4b
	oKBpzjODIOmoDgARdkMZCSsrJTWyD/E0S7Qd3rHopg1D6LR0xi12Obzw+aCJsaYwS60olmKEtkVGI
	GlgMrWm0GvtN5R1egFabLrBWwWOZvqlYkLSGj4Y58+uC9+YShKsbtLpTVbQ4uwV/TTp+DPJP6Mbqi
	4d0pEGKFbQOwd0vaKJug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAY5z-005qFc-Db; Wed, 28 Dec 2022 15:11:55 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAY5w-005qCB-C9
	for linux-amlogic@lists.infradead.org; Wed, 28 Dec 2022 15:11:53 +0000
Received: by mail-lj1-x22e.google.com with SMTP id v23so6643192ljj.9
        for <linux-amlogic@lists.infradead.org>; Wed, 28 Dec 2022 07:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ubYwZeaZS68YtABRDEYXGkCnGRePf9F31/jYHcMocpw=;
        b=L4DA9N9QVywBhf5U3AMOC+UzziT2R6n3W9DLQ8MzZPa7EEEG4W4ir3fgTeVvOLmfN6
         85/nu/j4zvTff3gFFKCYOaRDBmEN64lg4Z74ngBhxMMy7jKP8ZVRIZlJw0hRLPhvjO0G
         VwLuZZs0SkODzHTzRRjeWW2BBDXYlnXWzoNC2tL8gjrkMRbytiQdk0A+QKXwj2FQEDFS
         qrW6x5NhOYfl/OCRccROhrzV67paQqzS9xl7AUTQcYiVf2gsREkxogZE+oetRig8suGr
         Eq3ZOemLNjjDXVkXtZ9kBmI+XDCVoA7p9oo2BVafT81FJten/eEo11S7fhL0dMGJwGwL
         vfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ubYwZeaZS68YtABRDEYXGkCnGRePf9F31/jYHcMocpw=;
        b=3Tjsss0CiDX23gBQovUxubX4rtSRVvP48WA4CtwzFsUIMjG+5L+bAPw7B6W7yZRv2t
         mfU78UbIOEK6MLsgia+8qQf3dl8mPke17FdZGGxpB0KIFpR4ejQ2/F3YCszXGBBGTH7a
         LX08qTzBcRlVKpZSnc3h1+vL5G6Qq0IgEcLou+EnpJBYkhj6mX0dttVGt2UZ/R1y/bTK
         mL9u3TMCvkZrBfqfMzhyWM9y0V77+o9Ra0QPR0J5CTtiD2Ul0nzA0JYLx2QChbalQ9yf
         tf9M17Ig5n7+wEM5FTA9RFqt3opX9YBQh/2SIY6W43fCBuwzk7fKn5SsvFUsxz2vxYKE
         EpfA==
X-Gm-Message-State: AFqh2kprFA7x9RnpS4HI5+ZxDQw4aSFyPrhAgfeknVkjUibjTk1y9HpW
	+2d56Um1k/7cZRqSe5d/03eBlg==
X-Google-Smtp-Source: AMrXdXvIcY/heKHIPnpMU96K2aJammSqLAViET3DK30IyVf7ZggpP+EjutDQlr2EUBzwxhyhYVPm4g==
X-Received: by 2002:a2e:99cd:0:b0:27f:ac85:2b6a with SMTP id l13-20020a2e99cd000000b0027fac852b6amr5512348ljj.1.1672240308530;
        Wed, 28 Dec 2022 07:11:48 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i14-20020a2ea36e000000b0026fc822c264sm1973119ljn.87.2022.12.28.07.11.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 07:11:47 -0800 (PST)
Message-ID: <f42a5b1e-922b-22d2-2f95-cac0be47d6b2@linaro.org>
Date: Wed, 28 Dec 2022 16:11:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 07/11] vendor-prefixes: Add VIA Labs, Inc.
Content-Language: en-US
To: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-amlogic@lists.infradead.org, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221228100321.15949-1-linux.amoon@gmail.com>
 <20221228100321.15949-8-linux.amoon@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221228100321.15949-8-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_071152_524875_A62D3BF8 
X-CRM114-Status: UNSURE (   4.78  )
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

On 28/12/2022 11:03, Anand Moon wrote:
> Add the vendor prefix for VIA Labs, Inc. (VLI) is a leading supplier

Drop marketing, so without "leading".


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
