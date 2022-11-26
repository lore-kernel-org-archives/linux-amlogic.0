Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598EAC4321E
	for <linux-amlogic@archiver.kernel.org>; Sat, 26 Nov 2022 14:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xNLRAXXsC0ZHTYrsPKYWFS1S7gYfCDVOYDZwdW3cgJ8=; b=IjOLQ730DNIdcl
	z+7Bobe/CpMYJk+UhcSbLry1kMqPL3FV5z9LdnsVS5m4ReraSisabKwgo96Bst91lO26x1LQaTsKL
	Kkf+zkS09NGruSrL0WhZ/sK3XWlYe1phcTg4RjOB6peuAkDgqfSA0NGZtWc4QA51VAHTdDoWRQTDy
	R4UUHldRJiy4cban/6EdHeg14py/dtPqipmsct70d45QRpP6Tmf4DhjuL3PhQqN0FZazncP4P6+1s
	4VXUcbKzXdDWUndTF5i7LajARTYXqR6jvwYrL+GXRlOuMDMAXA4Qv7VUf9haYgChYY1brH5rz9ra5
	GTSnpl8KCTTCa11QAftA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyvzN-006X6Q-21; Sat, 26 Nov 2022 14:17:05 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyvz9-006X0A-0B
	for linux-amlogic@lists.infradead.org; Sat, 26 Nov 2022 14:16:52 +0000
Received: by mail-lj1-x233.google.com with SMTP id n1so3455869ljg.3
        for <linux-amlogic@lists.infradead.org>; Sat, 26 Nov 2022 06:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OIMZD3XxyhT7mbxN3+O9EeY+atM1x1y6l6xsxzVqKFo=;
        b=EaWjhKBu2mujx7WpVfhmDydUuW6097k7tvxgB0dRAxOdIx9bgLU8TrRCshsOeT+QK1
         XzPvkNlUTDHmw4gVb8cv1ECC8SoDuKnMw1eewAV6BPfcDf75JWjqaPks0JEQvn+HRCzf
         S0WtiSbG7ZUzZ53Nkxx2I8jfouvXyF89NqZQopIXIMNqqAX66cJJ6hA1vQC3zZ5zZMZM
         8Xm8u/OChrurt+aZglid7hOhSQVQiNUC6HFKCCpQX/GXQkFL1jnuCoH/6YWHSFoRvxx/
         MWwE6RnM7oKH7E6gxwqcKb1THTmDmJlApDNJ+BZcM5bTQM4CCrGPafqDQWSoy63K3zpT
         9Irw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OIMZD3XxyhT7mbxN3+O9EeY+atM1x1y6l6xsxzVqKFo=;
        b=lGLKUy/314bH7Z41dAsu9xyiYhJ2hjxfWpr/4mvGAhXQJYGFGInGh/n5pnhJOygKQH
         UG82EtFf4v74dYUw4FG14pjXugmbl9rO/Jk3YddLaqGoRw+3uoI4eLRxWBqOI8omkLcJ
         sdbW0Z74QzYPr+l36tkIuIaeigtbbP4HHGDNUI7f+XjWClkb52i67f7Y8nYUsYJmjc+Y
         5tPNznJ/aZsRMO1b1mP2Xu+V5QNt+1x6CVS3EVcUo6MOJO8Let0RCaORKVkyuXxkhhwM
         IXyY0ku4Mdu7ta7nUrI44NbTIVbBX4T7IWW/kyaoNV8A7tC50KTrLZ9VMlHFDePFL+dN
         sbDw==
X-Gm-Message-State: ANoB5plZOPD4NRd0nJWoch6NYav0PMSN5pazwfiUpPZ45g/bVFjB3wyO
	Vb1HYceO39LR8n+iDdsQsygGng==
X-Google-Smtp-Source: AA0mqf7U2YqAOIaKV8TxXn235bn6cK6igkK9AUjLBApqru9timelSNmL19AoXsWnLnrcyURNL9pwCg==
X-Received: by 2002:a2e:be28:0:b0:278:f1a5:a361 with SMTP id z40-20020a2ebe28000000b00278f1a5a361mr8073946ljq.124.1669472209423;
        Sat, 26 Nov 2022 06:16:49 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id 2-20020ac24822000000b004a22599c4ddsm930015lft.268.2022.11.26.06.16.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Nov 2022 06:16:48 -0800 (PST)
Message-ID: <a135f93a-235a-27b8-f649-69d62f6ebd30@linaro.org>
Date: Sat, 26 Nov 2022 15:16:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] arm64: dts: amlogic: align LED node names with dtschema
Content-Language: en-US
To: neil.armstrong@linaro.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221125144141.477253-1-krzysztof.kozlowski@linaro.org>
 <3719828c-0ac5-34c9-a04b-251cbeb5f6ef@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3719828c-0ac5-34c9-a04b-251cbeb5f6ef@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_061651_072099_818F52A9 
X-CRM114-Status: GOOD (  10.98  )
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

On 25/11/2022 18:16, Neil Armstrong wrote:
> On 25/11/2022 15:41, Krzysztof Kozlowski wrote:
>> The node names should be generic and DT schema expects certain pattern:
>>
>>    amlogic/meson-sm1-bananapi-m5.dtb: leds: 'blue' does not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
> 
> 
> <snip>
> 
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Aren't you maintainer of the platform? This means I should take care of
this patch?

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
