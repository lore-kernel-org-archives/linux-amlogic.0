Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5186CC4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Nov 2022 17:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9FCWZiyn6e8RKRerF80DChGGtEBD30tj6Azc37iDNk=; b=Ayr4eS5w8oDDEvsxSv55ekzfxQ
	sAzAEL8Fw9Q5/mT6aBF5c16FJvWBEXn8kJBuOLT2uepBy+k64jhaRzf3tGthukf4EFef3x2fJgTPy
	UAE3NMSW+mTNu4cIabBZVEjSHy/UhRZyEZoTqQK7WvTNpGZIKpURBsFo9nuyuJvaN87gssTT8nDFE
	ZT2Jqh5s0hJ4IjOKr8qNtx2CoMDcFztV9UmPedVECzyK6ortiFvkuX2jrlx1+u+PGjETBTygHBdQW
	1UPPIH8J8ykylwSeJHG5rYvnvZKUWCApYyRzEWtpFFZaLNmgymbD5fxhCHQxgykMDJpFwGQaa14SL
	AxLwEugg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oycJn-000hlJ-BC; Fri, 25 Nov 2022 17:16:51 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oycJO-000hWj-8l
	for linux-amlogic@lists.infradead.org; Fri, 25 Nov 2022 17:16:27 +0000
Received: by mail-wm1-x32c.google.com with SMTP id t1so3937727wmi.4
        for <linux-amlogic@lists.infradead.org>; Fri, 25 Nov 2022 09:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=47IViwB02OvhSucg0Ac9RBJB2CEi9LYnQsnlhOV4/Dc=;
        b=k+QNQ6ArRaSCIYlpyHOjcAdzHLXEbOX4EWSHmtIlbjASNH1LVCpmwAVozTErJQYpWr
         9nJxw6U8Ern0FTBK7R5UweSYBbiw51PeKFAW77S2waqhW2u7NX8Ha9O8rc1O9Jsc2lrS
         +3SOJq9WC2o9qcXHIz/e8EOvbL68K9VCF+V2msmlSbsbGPS/KW+XY2oBhl7aOsTjwepu
         nNSIsp40btxpgQ171iV6HPzopEsL3UcHIkJY/RqYRuMygCpxTGcVQfNfMnlRGw+kSRKq
         FhUyDTcAM5WBh0DkG3EZPYaymeGwf4YJFMmmmfzdRi+74CN0YBqQxHHzCbZF9B6e0OKI
         /TWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47IViwB02OvhSucg0Ac9RBJB2CEi9LYnQsnlhOV4/Dc=;
        b=f9Tts6P2hPbtRAgdbE7sc3tFguLWXn6VMm7X4gfNf58LObmMYW5Ql7QNQrqUGHAMI3
         YyypceSCJozMV5lQeA/MyAAOjuN6+li0YAOPdTK2rdYQhQn2dpPVtwg7j7bAPptzhk9v
         vS/UUzyGXlJkg/9GPHUhov1gk8CG3wWj6aJp2HvngQiLfcLA0NifraUSFVnY3CVybzXH
         BgYKuNXMEtFqf8Nah+JlW0cJz6g1gDYDjzCnfffNMHOgsQuRXQIGWY+RPlMEFLUGJu1A
         Oo1AAuubWURzqObNwR8HNhN7LYrf0gVNL5km7+HkTWWqUUs00xNbBruUDFISab95c4nw
         T7nA==
X-Gm-Message-State: ANoB5pma8hTrmgwU8+nLaI60t2cfCylwGFfi6gwBWLR3ODz0to2gsIYX
	++p4IbBJPenXqzWXrzz3/ZKONw==
X-Google-Smtp-Source: AA0mqf69w6Yfu0TTbOHoIejvP3nOKghM7cjzJMlbSt2JYFq8gseJKVxI0YYjK3qo2In2faT5105xeA==
X-Received: by 2002:a7b:cd18:0:b0:3cf:a359:de90 with SMTP id f24-20020a7bcd18000000b003cfa359de90mr18862740wmj.122.1669396584441;
        Fri, 25 Nov 2022 09:16:24 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:84a5:7e09:b15:f1fe? ([2a01:e0a:982:cbb0:84a5:7e09:b15:f1fe])
        by smtp.gmail.com with ESMTPSA id d8-20020a5d6dc8000000b002415dd45320sm4071606wrz.112.2022.11.25.09.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 09:16:24 -0800 (PST)
Message-ID: <3719828c-0ac5-34c9-a04b-251cbeb5f6ef@linaro.org>
Date: Fri, 25 Nov 2022 18:16:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: align LED node names with dtschema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221125144141.477253-1-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20221125144141.477253-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_091626_367949_43D8D7D2 
X-CRM114-Status: UNSURE (   9.02  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 25/11/2022 15:41, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern:
> 
>    amlogic/meson-sm1-bananapi-m5.dtb: leds: 'blue' does not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 


<snip>


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
