Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58259C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Nov 2022 16:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cDaVwujSDAotykrmoXwQKjuiL+Ea6S+C5CYUivBZyYA=; b=fuPoeUYfXhLHV9
	cV8+g/bDrH7qOA2wWxFE/LcLpfH6Q2TGhlVIi3/AtvdB59SgcGTcmMLbGCJtUJ4SMOImwfwIrpt68
	vU3uZo5KjwKzICnwDFgIEp1xaW6d3YpsmlMEwjfdU82oLpBGR3aqE5isShFtE0J/kgEjSLrDwBTfk
	kKffJRPsIN+6eZfxfuZYVWd7+HIWslEihNSpLVJH6jiA0Klkym1fL52ceSeOVAVvPZIQSHU9StaV6
	Sds4CNcphYd9VRHEJD1vnuRs+R+rFA+Gvox86MlECQnBMz8UCV3W4XsQpkhfV6/Zs3/zfhIHQtuYS
	h73n8X/nxhSusnYT/9Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqGWx-00C6eP-RA; Wed, 02 Nov 2022 16:23:55 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqGWn-00C6az-DA; Wed, 02 Nov 2022 16:23:46 +0000
Received: by mail-oi1-f175.google.com with SMTP id p127so19676914oih.9;
        Wed, 02 Nov 2022 09:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ArImpJZNyMuqB41SlvrWbpD1C1fAYza6cCSGrdURoHQ=;
        b=Hw7UTv5NfL10y/Uy1ZPG4rW8t/o071siKLRisyYXTUYs8Hdrf0OzADI5FEbTp4ZeUt
         +eKSBiW1Nl85aYsJCc8XxLS8jMZYHt+Xx9mYjDcCr0z28Q6EJJiHHRHF0jqFnIVGU6GZ
         YLVH4tosixXuxqmFetNTrMhVJRvOEwHWBzOJkGy7v7OZEAAInKDV2T0lIow4TEIADKRt
         7sQdS+BM0KfD0wgIdiCqLrVF3WDJuxzlxmlSEpVtoUq8KvnhXDlVVce2Uwn/6ydtitcu
         HL/K4zYQ0XBBRE2kMN2zdVbKE01u5ynq9AJbYhshT78bCJ9Cczea5/nPhUrB4Ipc4MtE
         q0wA==
X-Gm-Message-State: ACrzQf225xQJK7yqR3yD2ZaOJJB6OY+NTWRwqAdkcW2sMTyB2CMAL7rl
	/Ojh0yAuQCofdvjGRMVI6g==
X-Google-Smtp-Source: AMsMyM4x7Ze5gmyrwMejMf5OYTUdwzld0GDFsHu6nva22uV0UXFmTGNXQ/gF7bSrV5yC0cuzzrGVSw==
X-Received: by 2002:aca:db45:0:b0:354:b943:9e5b with SMTP id s66-20020acadb45000000b00354b9439e5bmr13918471oig.277.1667406223095;
        Wed, 02 Nov 2022 09:23:43 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bl8-20020a056808308800b0035028730c90sm4664594oib.1.2022.11.02.09.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 09:23:42 -0700 (PDT)
Received: (nullmailer pid 3997053 invoked by uid 1000);
	Wed, 02 Nov 2022 16:23:44 -0000
Date: Wed, 2 Nov 2022 11:23:44 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Sebastian Reichel <sre@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: reset: document Odroid Go Ultra
 power-off
Message-ID: <20221102162344.GA3993882-robh@kernel.org>
References: <20221031-b4-odroid-go-ultra-initial-v1-0-42e3dbea86d5@linaro.org>
 <20221031-b4-odroid-go-ultra-initial-v1-1-42e3dbea86d5@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221031-b4-odroid-go-ultra-initial-v1-1-42e3dbea86d5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_092345_468032_B86C9956 
X-CRM114-Status: GOOD (  18.09  )
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

On Mon, Oct 31, 2022 at 05:47:25PM +0100, Neil Armstrong wrote:
> The Hardkernel Odroid Go Ultra poweroff scheme requires requesting a poweroff
> to its two PMICs in order, this represents the poweroff scheme needed to complet
> a clean poeroff of the system.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../reset/hardkernel,odroid-go-ultra-poweroff.yaml | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/reset/hardkernel,odroid-go-ultra-poweroff.yaml b/Documentation/devicetree/bindings/power/reset/hardkernel,odroid-go-ultra-poweroff.yaml
> new file mode 100644
> index 000000000000..65e42258717c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/reset/hardkernel,odroid-go-ultra-poweroff.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/reset/hardkernel,odroid-go-ultra-poweroff.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Hardkernel Odroid Go Ultra poweroff
> +
> +maintainers:
> +  - Neil Armstrong <neil.armstrong@linaro.org>
> +
> +description:
> +  The Hardkernel Odroid Go Ultra poweroff scheme requires requesting a poweroff
> +  to its two PMICs in order, this represents the poweroff scheme needed to complete
> +  a clean poeroff of the system.

You don't really need a node for this. Test against the top level 
compatible and then find the PMIC nodes by their compatible strings.

> +
> +properties:
> +  compatible:
> +    const: hardkernel,odroid-go-ultra-poweroff
> +
> +  hardkernel,rk817-pmic:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the RK817 PMIC node
> +
> +  hardkernel,rk818-pmic:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Phandle to the RK818 PMIC node
> +
> +required:
> +  - compatible
> +  - hardkernel,rk817-pmic
> +  - hardkernel,rk818-pmic
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    poweroff {
> +        compatible = "hardkernel,odroid-go-ultra-poweroff";
> +        hardkernel,rk817-pmic = <&rk817>;
> +        hardkernel,rk818-pmic = <&rk818>;
> +    };
> 
> -- 
> b4 0.10.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
