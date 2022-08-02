Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB9DC00140
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Aug 2022 08:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O5XjQP8H6ldpH9Lb9SsXPaFRYWI2XQ8JwSGPYDQl2D8=; b=pMbdopyzVYlAhg
	i6bGMRA0cuRayND0ivhaEH0zEM1L9OIFGQ24hqGCdGja3+tVP8Tm/PcqHKoG8Y00QOlr67df2l6fK
	wIeh3QTVvhGD23zjF77CMZqDCBVJG8gotiCLCTVpJufr2oonfyRjBIPVvDL9UY+arznNWapwM9syA
	X4JMmyGFumGsCDX70K7+WGF3GC+v4enperRMFa76lmb/XQxoPMEpMty3VZMb3ldQA5Gg1g9EzQlXK
	Z8GgCjSfpAaIWZMcVZr8kKEoD6Fk+pNPbKxRfgSDiQ8gXW0TguvAinE0BW/Zb/rAtlG8Jqks1TZrW
	VXvR/CI7OjQsS8TBZ6wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oImtQ-00Bdug-GJ; Tue, 02 Aug 2022 08:04:44 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oImtN-00BdqD-4g
	for linux-amlogic@lists.infradead.org; Tue, 02 Aug 2022 08:04:42 +0000
Received: by mail-lj1-x231.google.com with SMTP id r14so14823925ljp.2
        for <linux-amlogic@lists.infradead.org>; Tue, 02 Aug 2022 01:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ShX8SdjvHP5x/QEd5P7yAfW5q1aymhg/8ZpNAExgulI=;
        b=sW5x7sNbJm4KPJDaPbJSKP/ieBiy0VQV6/CwTUBzDue1/tqIDXiGuUa3pPKGip/gp7
         dvIASGX9muNVoZQezp0vMnf7L1LMoOqMU5yT9cz4AQVtRztDTuGLTRTxnJarqn0wrvg/
         ME1fncpdVr6vy8k0Npb+7fUiCN2Y9XxzQse3A96WsGPwXswnSmjky0hZpOdV6FhjulJj
         ZZ/oG+94OFhETqBbW/S/95+mrNbHoOqPSigy/svtn4ZVfCl1PQ9Ebfjco2kqb4Ll0EJ+
         wUhZ47JELQTKpt/xzT4O6hDHuGermjL1ws/kPYxw+fuYslE+1rOBC02k+xhg3k80AbX4
         RsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ShX8SdjvHP5x/QEd5P7yAfW5q1aymhg/8ZpNAExgulI=;
        b=A/Yk4BDamaCnNpRNrp8fO5PXMj7273d2zDPxl+mix4kKP/0GOb4Vr9TCI7TroGFZPs
         XewRAEjPUeCvZV/JSUuvPaFGqqqgd4amwVVzkA3Yz0+mEuEQhDxE83zFXciywd9h5W/y
         l9Q+paniPLJDhFymZ/qRlCkj8GHRg7dzsswRsnLxY46aU1YinQsU0enFwff8aut7mIxK
         5vtaTglmX9AclzLB+1V5S4/LPuHe8HD85ciHf/1EO3B2yTw9KaXa4GP81QZ4KMGU9CBp
         QYSxtyOR9Fu5VGck77UuVZkDslQPxLGNkVQTsdFmNEMnBQ36iRqeWxbiOBt7nIWylrAD
         aKlQ==
X-Gm-Message-State: AJIora8fAn+YW19Ul40uvElT+WYYocCufLQgWB6k4iv05dQi4R6BRXxw
	YYDNZm739E8eoi3JBYlkpGarKQ==
X-Google-Smtp-Source: AGRyM1usD347g/PCYf5onVBO1mElQUVrm5vGKhPd8Gyrw+2mzv2u3tW20rdNGIxVEc6umXcRtrExZA==
X-Received: by 2002:a05:651c:1147:b0:25d:eb36:755d with SMTP id h7-20020a05651c114700b0025deb36755dmr5848282ljo.16.1659427479158;
        Tue, 02 Aug 2022 01:04:39 -0700 (PDT)
Received: from [192.168.1.6] ([213.161.169.44])
        by smtp.gmail.com with ESMTPSA id x18-20020a056512079200b0048b038c7624sm436240lfr.42.2022.08.02.01.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 01:04:38 -0700 (PDT)
Message-ID: <0893fab6-a7e1-bfa7-2497-239e044cc7ed@linaro.org>
Date: Tue, 2 Aug 2022 10:04:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 4/4] dt-binding: perf: Add Amlogic DDR PMU
Content-Language: en-US
To: Jiucheng Xu <jiucheng.xu@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chris Healy <cphealy@gmail.com>
References: <20220801060049.1655177-1-jiucheng.xu@amlogic.com>
 <20220801060049.1655177-4-jiucheng.xu@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220801060049.1655177-4-jiucheng.xu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_010441_321037_8C49A1D3 
X-CRM114-Status: GOOD (  14.98  )
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

On 01/08/2022 08:00, Jiucheng Xu wrote:
> Add binding documentation for the Amlogic G12 series DDR
> performance monitor unit.
> 
> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
> ---
> Changes v2 -> v3:
>   - Remove oneOf
>   - Add descriptions
>   - Fix compiling warning
> 
> Changes v1 -> v2:
>   - Rename file, from aml_ddr_pmu.yaml to amlogic,g12_ddr_pmu.yaml
>   - Delete "model", "dmc_nr", "chann_nr" new properties
>   - Fix compiling error
> ---
>  .../bindings/perf/amlogic,g12_ddr_pmu.yaml    | 51 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/perf/amlogic,g12_ddr_pmu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/perf/amlogic,g12_ddr_pmu.yaml b/Documentation/devicetree/bindings/perf/amlogic,g12_ddr_pmu.yaml
> new file mode 100644
> index 000000000000..961656d4db6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/perf/amlogic,g12_ddr_pmu.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/perf/amlogic,g12-ddr-pmu.yaml#

You still did not test the bindings...

You received such comment (with instructions how to do it) and still
decided to send untested bindings.

That's not how submission procces should look like.

NAK, till you send something which you actually test.


Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
