Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B86C05027
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Feb 2023 22:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eFIChe49vaPseY+xM3A6n2OPc+Q383Bg1mAwk9YXXqY=; b=Z6v3Mkbk7uFnYn
	JPyCTw3iBxiCQBpPY08mbfyldUAtg22ANiowK9Ywe1GOlahmQ7wgfxDgKG8WCqnYxkG/M3x4xc4Qa
	PzppsOytyPTK5IGePKeUNPRgr8dJv4j5DnMOdntaCBdZW6oPDT5yXE9XzpZlBzDR8hU5PBeVupLm2
	rrdM6bqFU+HC+gxOJTTvVCssdvZ0TzAAlfeBFkTmfQgOeU4MeoM2S0OuNWrDBECg08DwIKrr39jPX
	p/75LYVq/ugccjr94ow0tWn0HbojlI813pvArGjvBsYN55evC4DEKiDABakkaVZLqYCxvz5gnq8L6
	AkhALNepDdyQH2CUp4Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNLMP-00Dl43-VX; Wed, 01 Feb 2023 22:13:45 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNLMF-00Dl2R-PD; Wed, 01 Feb 2023 22:13:37 +0000
Received: by mail-wm1-x331.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso7860wms.3;
        Wed, 01 Feb 2023 14:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CNRHDNKDz3PF77hDFv89NP6dgEBns2Rf5wX2Wa7bFI8=;
        b=h/p2OM4mxGvy1Tl/Mtj7PX3iy1EGHMIuVgAzpipXtMRbXjPzkHXPJvfxa6r0/Ph/Zf
         8kGgUz62Ubm68nL+6PWXCCKPeeELaoEI/HaTaZeYkaOs7faV++mKUGwgB0cfN19evZaZ
         r8Nq3cQkYpXmguGZVYFII3o7Xdyr328Ntd11U+Y3Ey1GCiGa/tuz10Ts/HIrcQSPVFeH
         rhyxlQOdSXepRAjF4OlIKW6BIfMPYuPd44tV8lYAkVHeW5XFe+l6W6+zRlLTC5HPPBOc
         xSVFkxs8VIs9nl+pImlghdoqBlgiGTKfgmOR7ZAKBcnFBujzcA696eJbN7dQFSq+eFB4
         AquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CNRHDNKDz3PF77hDFv89NP6dgEBns2Rf5wX2Wa7bFI8=;
        b=iHvLmGb6K/rRUBtoSMcd6BPHLcKoxN3qRf2Pa/BYwQAqHs3ipz/54wqgLGpWGC4wwa
         ptIm19/J0580URCcrKvp4rVdThvy3ww8SNlIpmlwSTNHzRge4kAQmyWZKNKz7WxO7v+0
         gsQCelI2Z0YcMKSkqunjxpKnIRrYZiej+Mm5O+KxoRVv+TafD37f6Ix/iTzrr/HZZx5I
         Wnb8iU14Z7+gI1XzVfhWSwIAawJ/qWHizF1COZobgCjomd8GkZmB1gaxJdcFbv+76h2p
         Pfdh5DbrXsAjbgSGEK96q9M00Jp1UbGpKJWORKFbNC2sJQixc7MgcB7u+LAeeo1cW6nZ
         J5Xg==
X-Gm-Message-State: AO0yUKWsjiYNAfjIzTpiqwRGVzuEKu6QOybdifwm+koICmVbgIv24Dia
	7YGEKBLhhxSUDbOFQqrysG4=
X-Google-Smtp-Source: AK7set8m1ylKmngS1T2pC+6ncY2Puh9mLc4nJuWQjIDtQIMBCY0jMfdrIrlEl89gFkkPtqnUWZ9vEg==
X-Received: by 2002:a05:600c:3b16:b0:3d3:4f99:bb32 with SMTP id m22-20020a05600c3b1600b003d34f99bb32mr3488208wms.36.1675289613368;
        Wed, 01 Feb 2023 14:13:33 -0800 (PST)
Received: from ?IPV6:2a01:c23:b912:d400:3963:7bc4:12b:ddb3? (dynamic-2a01-0c23-b912-d400-3963-7bc4-012b-ddb3.c23.pool.telefonica.de. [2a01:c23:b912:d400:3963:7bc4:12b:ddb3])
        by smtp.googlemail.com with ESMTPSA id az24-20020a05600c601800b003dc4baaedd3sm3078760wmb.37.2023.02.01.14.13.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 14:13:32 -0800 (PST)
Message-ID: <b0e502fa-ef11-df82-ad45-9367ff7c75b3@gmail.com>
Date: Wed, 1 Feb 2023 23:13:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3] dt-bindings: pinctrl: Convert Amlogic Meson pinctrl
 binding
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
 <285b7b4b-4fd4-be5f-266c-96b1ee6f4cbf@gmail.com>
 <20230201020647.GA2318275-robh@kernel.org>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <20230201020647.GA2318275-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_141335_867628_7914B088 
X-CRM114-Status: GOOD (  14.00  )
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

On 01.02.2023 03:06, Rob Herring wrote:
> On Mon, Jan 30, 2023 at 10:00:24PM +0100, Heiner Kallweit wrote:
>> Convert Amlogic Meson pinctrl binding to yaml.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>> v2:
>> - consider that more than one compatible can be set
>> - remove bus part from example
>> v3:
>> - remove minItem/maxItem properties for compatible
>> ---
>>  .../pinctrl/amlogic,meson-pinctrl.yaml        | 122 ++++++++++++++++++
>>  .../bindings/pinctrl/meson,pinctrl.txt        |  94 --------------
>>  2 files changed, 122 insertions(+), 94 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl.yaml
>>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/meson,pinctrl.txt
>>
>> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl.yaml
>> new file mode 100644
>> index 000000000..7aaae606b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl.yaml
>> @@ -0,0 +1,122 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pinctrl/amlogic,meson-pinctrl.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Amlogic Meson pinmux controller
>> +
>> +maintainers:
>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>> +
>> +allOf:
>> +  - $ref: pinctrl.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - amlogic,meson8-cbus-pinctrl
>> +              - amlogic,meson8b-cbus-pinctrl
>> +              - amlogic,meson8m2-cbus-pinctrl
>> +              - amlogic,meson8-aobus-pinctrl
>> +              - amlogic,meson8b-aobus-pinctrl
>> +              - amlogic,meson8m2-aobus-pinctrl
>> +              - amlogic,meson-gxbb-periphs-pinctrl
>> +              - amlogic,meson-gxbb-aobus-pinctrl
>> +              - amlogic,meson-gxl-periphs-pinctrl
>> +              - amlogic,meson-gxl-aobus-pinctrl
>> +              - amlogic,meson-axg-periphs-pinctrl
>> +              - amlogic,meson-axg-aobus-pinctrl
>> +              - amlogic,meson-g12a-periphs-pinctrl
>> +              - amlogic,meson-g12a-aobus-pinctrl
>> +              - amlogic,meson-a1-periphs-pinctrl
>> +              - amlogic,meson-s4-periphs-pinctrl
>> +      - items:
>> +          - const: amlogic,meson8m2-aobus-pinctrl
>> +          - const: amlogic,meson8-aobus-pinctrl
>> +      - items:
>> +          - const: amlogic,meson8m2-cbus-pinctrl
>> +          - const: amlogic,meson8-cbus-pinctrl
> 
> Again, can't have both with and without the fallback allowed.
> 
Hi Martin,

meson8m2 is the only chip version having a fallback for the
pinctrl compatible. Is this fallback really needed?
Looking at the driver it seems that both compatibles
are handled identically.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
