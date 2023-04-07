Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F21BC6FD1D
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Apr 2023 14:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6QGSHpHWt7fV4gy5GfC2pRw0hlbQzdIPwmRTCN5jWw4=; b=OLhFy8mCSsInuARslkoLCJr19Y
	3DSFebKUxF3OM3K2ORE075Y2N7u+ZjqwkfQAA4Bf8VyZZoJsqwEtug0kJxqFVIfYRvPHz6YzWo+rK
	2ydnSaUNdd+kclx+D+AVSrtrKb5EWfrUMZr/ICLEGtGRktFwniLUee3lrzqhyfJBG3waKW2Tq0sE1
	Se4n/HczANpnSUEuT+H5DUNdxCsxibKdolWxu+ry+YHURkUqoFDeI3c01oMsxfkYs+MkaAwW5P4uf
	svAL25YKw8HojzS0FeqYWESyylpBVvhXO6gisu7RbyHXhog3d1383JdZIYXD/J0kOu0lo+lOPulDr
	Zd5YCdZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pknIo-00AWQv-0D;
	Fri, 07 Apr 2023 14:42:58 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pknIk-00AWPp-2N
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Apr 2023 14:42:56 +0000
Received: by mail-wr1-x435.google.com with SMTP id h17so42465709wrt.8
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Apr 2023 07:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680878571; x=1683470571;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YaOlozGSnw9Y7fDgqjcUFYA4GgoO3+wl2jKckce8L5A=;
        b=QtizWJS7vuhUodCnYsQsSlajZqPLAGXXp1ZW/QGMX3RQUrD9cl1ByO/Yy9JiCc9EV7
         nrMXe1XJxXLp/ZznKViQpVn4QaWa72ZYCLmnH/l3jPsfLh8JS1EIbRxBzh6GeZKPiakK
         RPnCRkTbg8I4aBVIYgGqMUYfJE2F5pCskeYRzNVqIPRS8gt9VukTXAfTav/TIoxDv7kF
         eJe3AgCAWg2WRPUaJaUcgqM3Mc0Bfdtj/fVnbGz9m9sLtSsnWaI9sbpy5JoajpcqZQYf
         GW1ifCHAHkEHBijQVq2wHzlJhrPL7zLZqQWAMib583TyORx6kMNcn4apxpy6MKSlEfyv
         0T8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680878571; x=1683470571;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YaOlozGSnw9Y7fDgqjcUFYA4GgoO3+wl2jKckce8L5A=;
        b=5BS3mSHgRx1uKqjIkBJOwzSiKqK5f4xaWpXi1xYPcq3yjFKQvoLz7pADz0wPAnAQzc
         LVPBaGWDd0IXlDqy4pRxSB1F0rYCzbojkPz/JDSc6ThkMdQWUtOSihpmR1VVE7RypPfh
         sNvxrJgXPGJku9UzaE19arHCZR5wnF/d6GiXhbiq/tkLarqe2PePo8VrqpC0Y5oq0Odo
         J4eF22bGVl1r6b9xdXv4ZKp9JdOyut1ynRwTNoHWSUTagbAd3gGdNJ/e6q0G1YNxcjCb
         FtLJ748Ob+KS1EMVah3lMx0IwwmIP0fsgYJHBKRdb4PhFmXjL4X2EsJeRJyVA1NSZcC8
         UpYw==
X-Gm-Message-State: AAQBX9c/xilKCsl14NW4Rc1CQ9/USCQaL6gOHe0gIlQAJIuBHA8iQbxL
	+ibjaHubiKpMGcmBcgVfq5gfPQ==
X-Google-Smtp-Source: AKy350aeVnRBuhANMWkVH5LZ0N8qNk35i656AmJqPizaE31yarn72S34sgq1gg8oV2N4JiGQZS+WfQ==
X-Received: by 2002:a5d:50d0:0:b0:2ce:ae4c:c429 with SMTP id f16-20020a5d50d0000000b002ceae4cc429mr1540731wrt.4.1680878570973;
        Fri, 07 Apr 2023 07:42:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:d0cf:7013:b9fa:35f6? ([2a01:e0a:982:cbb0:d0cf:7013:b9fa:35f6])
        by smtp.gmail.com with ESMTPSA id e17-20020adffc51000000b002ef2e148d59sm4035408wrs.16.2023.04.07.07.42.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 07:42:50 -0700 (PDT)
Message-ID: <37b4faa1-a957-3ba3-e37a-0c1edef6fbaa@linaro.org>
Date: Fri, 7 Apr 2023 16:42:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] dt-bindings: arm: amlogic: add C3 bindings
Content-Language: en-US
To: Kelvin Zhang <kelvin.zhang@amlogic.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>
References: <20230407102704.1055152-1-kelvin.zhang@amlogic.com>
Organization: Linaro Developer Services
In-Reply-To: <20230407102704.1055152-1-kelvin.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_074254_795822_71A2D98A 
X-CRM114-Status: GOOD (  15.66  )
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

Hi Kelvin,

On 07/04/2023 12:27, Kelvin Zhang wrote:
> Document the new C3 SoC/board device tree bindings.
> 
> C3 is an advanced edge AI processor designed for smart IP camera
> applications, which does not belong to Meson series.
> 
> Therefore, modify the title field accordingly.
> 
> Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
> ---
>   Documentation/devicetree/bindings/arm/amlogic.yaml | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
> index 274ee0890312..08d59842655c 100644
> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
> @@ -4,7 +4,7 @@
>   $id: http://devicetree.org/schemas/arm/amlogic.yaml#
>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>   
> -title: Amlogic MesonX
> +title: Amlogic SoC based Platforms
>   
>   maintainers:
>     - Kevin Hilman <khilman@baylibre.com>
> @@ -205,6 +205,13 @@ properties:
>                 - amlogic,ad401
>             - const: amlogic,a1
>   
> +      - description: Boards with the Amlogic C3 C302X/C308L SoC
> +        items:
> +          - enum:
> +              - amlogic,aw409
> +              - amlogic,aw419
> +          - const: amlogic,c3
> +
>         - description: Boards with the Amlogic Meson S4 S805X2 SoC
>           items:
>             - enum:
> 
> base-commit: e134c93f788fb93fd6a3ec3af9af850a2048c7e6

I'll apply it in my v6.5/arm64-dt since I already sent the v6.4 PRs,
since it's early for v6.5 the branch will eventually be rebase when v6.4-rc1 is tagged

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
