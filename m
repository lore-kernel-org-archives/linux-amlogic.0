Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24509C4167B
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Dec 2022 15:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I8RGk8UCnokf486gKR3fsNPg+vpBPsOiKs1Cm6fidDQ=; b=mo6fzlNeyutOYS
	qA/2/wyNJAPo1iCDcOh4RTf7OnLSpOtz9pnNSPOKs5MPyrDBL/5B9Uy06UjhRiXd8lmfvJLuTeLy1
	+c91FiRbR+RyZGtt7IPcz6wwt4bk1D+uyZmO/W1e5Y0BmeLoAIqdc152AWNJlNEKFDnyb1CpvoU2w
	UtMhOHeFVb61RHSLdhTRhiH54OmaSy6nGIzXyxYfENXCz7bPNOOY40V+6192wLHqDjzcAFC9SmSA0
	ywqFeEIjLHFpg31oJ3N90cwiNI25j8FDzvL6mtQrCjGlbd3pI69mRBJCRamfiHvzVxaS+JMzcduNs
	gR3eC5+eIxFNIaE9UYUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAY2V-005obm-Ei; Wed, 28 Dec 2022 15:08:19 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAY2T-005oXu-7q
	for linux-amlogic@lists.infradead.org; Wed, 28 Dec 2022 15:08:18 +0000
Received: by mail-lf1-x129.google.com with SMTP id bf43so23980987lfb.6
        for <linux-amlogic@lists.infradead.org>; Wed, 28 Dec 2022 07:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uvoaUVlI285DJxXau3dNL+g6kLRhbJT4y1ScX7i8GqI=;
        b=KRz1ugeTeE5shFPwKo2/mZX2HG1BAXYV25vlDoxH61FV1a/byeKAmLbT85OUcTwEnI
         k7a1z6tqBbOVHm+L4kEBUi4VkXVwLDpsFtaEHHX+aog84SzM9uL4e2j7XVD2z3Xdo/9c
         KSNgtASrBFziQzgpxKYn8Mz1YXG9odRbiAQkcLr/E4lGZEZZ5khszA3Ln9RBhIj1ZzAf
         0AVjtaWLRqHqDhroXTQxPfBq7u+mUDPZuGb8F5y90djUHG2cbxTg0oRLo24uhVvWJoG9
         ML95E3ivHoe+NCam7PKsWdV6qVc5QV2KMHl1h4kZTbUWivmlONKdUS5UgItgkscJrSXV
         lBuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uvoaUVlI285DJxXau3dNL+g6kLRhbJT4y1ScX7i8GqI=;
        b=MAP3TQ8s0EO8LOB2BuyK2pVGUtQ6EZhcAmPAShAjYAHITuyyC/Z2lblK6iW/w39lAH
         65E5YoNjRL95tWQ+EHi0dA+/2Tl1I6Y6QVQgrAtGd9Cs2Nuwo8YtBL/T9zg8Syylefb8
         C7mreZ018vBt/qv66FQkRc6DCWSb6NxujDsqNyYBwddfUVZzauNfxSCw3D5fC1CH66JJ
         widDM3e5tl5lu/Y3Ro5zHLX2WPKr+4YqWBusbHuw0GJCWihgVX55S+byaVdCx56EdB3N
         easoilHrd4uVjHm7WbguZB8EPjmk831NSXLDgo+80yP3aa+Pgm6BV3gtWHKr0OpTuycD
         aguA==
X-Gm-Message-State: AFqh2kpcYFSw8F1N6uyzumryCnnz9L3/HRzqIq4XBF/bfcXi4fEqQy4C
	yIX/Sh4ZczjJlaIjlxUdHgC50g==
X-Google-Smtp-Source: AMrXdXsyazxH9ayip6OwOKWlEqFs9prb83uyZtAy6fABC4Qtj1GpnFuz0aWl3a2VV3M1BIZoYotubQ==
X-Received: by 2002:a05:6512:2356:b0:4b5:6417:43bb with SMTP id p22-20020a056512235600b004b5641743bbmr9430166lfu.51.1672240090961;
        Wed, 28 Dec 2022 07:08:10 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p1-20020ac24ec1000000b004b15bc0ff63sm2671305lfr.277.2022.12.28.07.08.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 07:08:10 -0800 (PST)
Message-ID: <d0127811-6be1-4f1c-c138-1e8b0c69aaeb@linaro.org>
Date: Wed, 28 Dec 2022 16:08:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 01/11] dt-bindings: usb: Add device id for Genesys
 Logic hub controller
Content-Language: en-US
To: Anand Moon <linux.amoon@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Icenowy Zheng <uwu@icenowy.me>
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221228100321.15949-1-linux.amoon@gmail.com>
 <20221228100321.15949-2-linux.amoon@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221228100321.15949-2-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_070817_322331_35ACAD55 
X-CRM114-Status: GOOD (  12.18  )
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
> Add usb hub device id for Genesys Logic, Inc. GL852G-OHG Hub USB 2.0
> root hub and Genesys Logic, Inc. GL3523-QFN76 USB 3.1 root hub.
> 
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/genesys,gl850g.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> index a9f831448cca..db009f3ef438 100644
> --- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> +++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
> @@ -16,6 +16,8 @@ properties:
>    compatible:
>      enum:
>        - usb5e3,608
> +      - genesys,usb5e3,610
> +      - genesys,usb5e3,620

This does not look like correct compatible. Did you test the bindings
and DTS? This should fail.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
