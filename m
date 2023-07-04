Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B740EB64DD
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jul 2023 05:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ai57/2XsESeQzQKfO3GP6DMjpaShJrK8A9vg5aBdCSY=; b=kFgbLeFFbMVQJP
	z+E+VKqizFlgYRy/v/DmbpTePNpuxf73yaX/VW9cuOfItnCHre4RRMvKxLKyT6kBrRrYHBAMgdpru
	xZ2F5PhJmxb4Lj7JTh+bsfFTqjndsIjB++d5NLkgS3aWXOAnHODmxuavVSzk5rYGGbAhBEgrzX/hm
	xA6rZn40iE4dhfTJ18rhi8DaCdIzismZYjhlO6Og6m/FUDfeUP7mGctOIO/xDl7k6yVWT2FSe4cZC
	6FBA4QCJUScM4SPwgKrcu2TvTLbJ+rjC5Fun6i5FacCgV0STzvbvrqbsfdM7fEeDwlxO0BcjVsUFz
	7ysvHgRZoC9VKDixJZBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGYth-00CEfV-0V;
	Tue, 04 Jul 2023 05:48:21 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGYtd-00CEeU-22
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Jul 2023 05:48:18 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-992e22c09edso322901766b.2
        for <linux-amlogic@lists.infradead.org>; Mon, 03 Jul 2023 22:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688449695; x=1691041695;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UdcpK0TGfVOpUi3FvoqQbLWi9UKO2fgo/3u0cXln2gQ=;
        b=AYAvf1isMLVmdOpZc3LRZjhsbRslrPlDiin+0tKpT2x7Tx+qyCifBpoKVRjIXiprTQ
         y/9JT67EGaOiVuAeQK2rF+gmLzABWwWaWk+lYhDA7vj/y4mIi9W3nQnpK6by00ijHDbJ
         CySiJANyWOzQ1X1JaplkNY9NI3conxU7GX635X4bOF/B2V7VOHvh0p2t7x2LEdgWN67p
         ksvR7WQGh+hkVfcQ1XsLjh5cnwTDT+TjV3eXWOB8AEiFVCIZt/05TtJBl87SAXIn6G/n
         JorMbsUVHhGgiHg6jGkbol9jNbsRzYO5y74wWQmlDFqM6t6w57P1nFGONzJ/G9BUGJ+t
         Z56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688449695; x=1691041695;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UdcpK0TGfVOpUi3FvoqQbLWi9UKO2fgo/3u0cXln2gQ=;
        b=Uhp9dprHPglfl68KmDFcqiaNscCi4790mhHqK8WVvnoX08fTJOZ0FrLM0y1YhSccGX
         L9ig/l86IS0SfasMMaLbSYoM+IXYgn+cLaxPTSs6mHwfoknZtRwlbvJzUSAB69gFaXc3
         mf2ssFsZOu0MvUdUk6aV5FlkJQyoMdfklTdDp1XOwwPZBnan1iCeB5XNfmBXXEt8QO+Y
         Eo6KwzCZCgWjYklgoUFHek64dH/aq8kOWxTYpug674PDSdwgCdTlWVPikguL61mTsV4E
         /Lz95+BSbJor6PnSIwPAOC4YsfNQYc/7HpqbEereEA+ieUdty+L5uiKsSs054qvgHFph
         UwyA==
X-Gm-Message-State: ABy/qLYZDRuW1FihPXeEkop4hJ7nQhc3oSqqgIh33r5XhdlD7IbfugVG
	wAMd0wXPrA5FJARKCKC93TH5OQ==
X-Google-Smtp-Source: APBJJlEr9YF/9CNvGTe9vjpKd20FUAoxwqrMpGl6gocRSWRY/Mtmuh2yQ0ohbrUFyjLn8JQKjpzgTg==
X-Received: by 2002:a17:906:3453:b0:974:771e:6bf0 with SMTP id d19-20020a170906345300b00974771e6bf0mr8047779ejb.56.1688449695121;
        Mon, 03 Jul 2023 22:48:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id t14-20020a170906948e00b009886aaeb722sm12793010ejx.137.2023.07.03.22.48.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 22:48:14 -0700 (PDT)
Message-ID: <01c7baae-4cc7-79af-8839-6f72b5175ef9@linaro.org>
Date: Tue, 4 Jul 2023 07:48:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: amlogic: add board AN400
Content-Language: en-US
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230704031636.3215838-1-xianwei.zhao@amlogic.com>
 <20230704031636.3215838-2-xianwei.zhao@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230704031636.3215838-2-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_224817_741720_8A4CB6D8 
X-CRM114-Status: UNSURE (   6.55  )
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

On 04/07/2023 05:16, Xianwei Zhao wrote:
> Add the board AN400 tree bindings based Amloigc T7 SoC.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
