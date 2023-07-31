Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F85C001DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Jul 2023 09:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdoeC5UIdUPQ7DeRtaXcg9pYQsfU639Ggz3uJDZ+rho=; b=lFOoyZfIi07yQrsYMeDOUfPsfU
	FaUPbt90FH2mkmupNArbchZu/mnWG+aarXUWgxVIgiEVec8WNdamnxyiN10ldGKBGrLNpF7Taj6TL
	3jbUg4EtR4j+hzLaHOYQGMdquLf5aB2iHX3urxEQbPckqkeDVqYGVyvboYpL7hJfGfx4FIBd+8azP
	SfZ1QExy2QeCDya+/4A25Q6EORE2SfwIPe+Bwc+TKUzAMWy1rfLdeygkMw5c06YHW+NAhBsxGZOOZ
	hI6I2Ci/x8cJNlIpnpCvegkX0m1n8pbahg+fkjZf3114gmUenzAUQ990uuE/dYRI3TLH8QzpX4wnH
	+regC9UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQP1j-00EkS3-1R;
	Mon, 31 Jul 2023 09:17:19 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQP1b-00EkOJ-1R
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Jul 2023 09:17:12 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so41476291fa.3
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Jul 2023 02:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690795028; x=1691399828;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5KvgIxXrNBW+ICpRpcD8ldB4nPJk8pR1BpuMuP6iUoA=;
        b=jyDUsroFZnsQwdHDhpyfjJP16KxJ2Bm3z32mGNUxbV5AHato4TcsXK7RKrVP2LJdY/
         2/4KGWkwKj29qTEg3NPF/FF7ee8ZQGx+k2qRXcWjefmx6ibIi9+xy3R1razFVaP1PFKa
         6Jtl+rqNRvuQfxLSu2mx15L9eQdM6902mvBKTDu+aS3k0rzLZD0oHUK6UxauVZYKtyY4
         c7br/qTJpA4rq1rdijEybfTYzdxfZH2WJnNUYaEMM+NKQjZxgi45XY5eJ1hx75KxqwKM
         fYorjbTqUmbPTZzEIVRr+Jhvxzwd6OBdNAwC6anYBfq0jTLVYDUpyc2MP48HJS/4qJlg
         S3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690795028; x=1691399828;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5KvgIxXrNBW+ICpRpcD8ldB4nPJk8pR1BpuMuP6iUoA=;
        b=Vzp87bGooFfYrYgGw5O1TFFdbxMViJ4KP6b/zZzaToo/hD75tt3UZP79u+bWqELjHE
         jGWXYzyDO9O3hGgEnlzz5yBOfJslRRgKjfhFo8bh93buMkF4kE/wrdD9ZOuQJm9Eerf/
         mXs2CGASuuNOu3AYtlxeQfkHJuDVYqfr2sgFKvLjCDxOtZV6Ywdd5+ozZjwJD8Nfg9gH
         m32bt/lMZ5/RYPdQw3tGCPm+Wu1WiTNQu3CCmaOUSOwV3TeiSUe3H3mlDy84297JNHCo
         8m1XyCyS9AOYMV65Ahn2BsVn225p+9/TkqD1SvgfnhQyXeT5NiyJFpyR6LPVQnXeEaCx
         oX1Q==
X-Gm-Message-State: ABy/qLYDC+SOtQTIxm+kmygWcxpQL+rse82SVPbjpG4tpDqh4Ccal6RS
	/u2QAy0ao2X0bIxkgrkvuKe5pA==
X-Google-Smtp-Source: APBJJlFhbontxRh2AYxqpfnm5ytn+b3cKOcZKI0ursWXowN0xpSywbzEKe4jSNS+2JWGR7yjRKMYcg==
X-Received: by 2002:a2e:910f:0:b0:2b9:5695:d10d with SMTP id m15-20020a2e910f000000b002b95695d10dmr5741521ljg.36.1690795028263;
        Mon, 31 Jul 2023 02:17:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:14b8:9aa7:6bf0:256d? ([2a01:e0a:982:cbb0:14b8:9aa7:6bf0:256d])
        by smtp.gmail.com with ESMTPSA id a20-20020a05600c225400b003fbe791a0e8sm10745362wmm.0.2023.07.31.02.17.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 02:17:07 -0700 (PDT)
Message-ID: <55cbdbba-39c6-7415-37db-97d2c35412cb@linaro.org>
Date: Mon, 31 Jul 2023 11:17:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: reset: Add compatible and DT bindings
 for Amlogic C3 Reset Controller
Content-Language: en-US
To: Philipp Zabel <p.zabel@pengutronix.de>,
 zelong dong <zelong.dong@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, kelvin.zhang@amlogic.com
References: <20230719060954.14864-1-zelong.dong@amlogic.com>
 <20230719060954.14864-2-zelong.dong@amlogic.com>
 <f7b72ee90009f6749700a7bd79a3a63786a82a32.camel@pengutronix.de>
Organization: Linaro Developer Services
In-Reply-To: <f7b72ee90009f6749700a7bd79a3a63786a82a32.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_021711_492447_0FD651A0 
X-CRM114-Status: GOOD (  13.66  )
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

On 28/07/2023 17:49, Philipp Zabel wrote:
> On Mi, 2023-07-19 at 14:09 +0800, zelong dong wrote:
>> From: Zelong Dong <zelong.dong@amlogic.com>
>>
>> Add new compatible and DT bindings for Amlogic C3 Reset Controller
>>
>> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
>> ---
>>   .../bindings/reset/amlogic,meson-reset.yaml   |   1 +
>>   include/dt-bindings/reset/amlogic,c3-reset.h  | 119 ++++++++++++++++++
>>   2 files changed, 120 insertions(+)
>>   create mode 100644 include/dt-bindings/reset/amlogic,c3-reset.h
>>
>> diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
>> index d3fdee89d4f8..f0c6c0df0ce3 100644
>> --- a/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
>> +++ b/Documentation/devicetree/bindings/reset/amlogic,meson-reset.yaml
>> @@ -18,6 +18,7 @@ properties:
>>         - amlogic,meson-axg-reset # Reset Controller on AXG and compatible SoCs
>>         - amlogic,meson-a1-reset # Reset Controller on A1 and compatible SoCs
>>         - amlogic,meson-s4-reset # Reset Controller on S4 and compatible SoCs
>> +      - amlogic,c3-reset # Reset Controller on C3 and compatible SoCs
>>   
>>     reg:
>>       maxItems: 1
>> diff --git a/include/dt-bindings/reset/amlogic,c3-reset.h b/include/dt-bindings/reset/amlogic,c3-reset.h
>> new file mode 100644
>> index 000000000000..d9127863f603
>> --- /dev/null
>> +++ b/include/dt-bindings/reset/amlogic,c3-reset.h
> 
> Given that this is only included by
> arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi, should this header be
> moved to arch/arm64/boot/dts/amlogic ?

Maybe I missed something, but since when should we move bindings headers to arch/xxx/boot/dts/vendor ?

Neil

> 
> regards
> Philipp


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
