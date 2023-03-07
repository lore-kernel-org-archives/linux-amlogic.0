Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540E5C678D5
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Mar 2023 09:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lhdvYwI2JUYTal5xDnjCI5wD99QX23OciNT6otitzoQ=; b=DY+Y+bvaFLQJIH
	4/3TfZKhw6QsQceybt0vB7ZRW5qDKYzu7zLTEvhxdYSFXg4K7ydJmcVGKJ24Z9pEyXlhnCBulVsZC
	JyG5YrE+QvbGGzLUyUfbljMwvWnmWw/YZP+L+hJzMHQwkn5vQt4wvt18qihZtKB335njEPL8qpuV3
	4NioXrTbx8L1yHiH6fYejxJwdn1rSHJIqFIbgePnn0reT21XpVfBq1GHMQSfgYYuwfm+Ti1/C4g5F
	Nwx8OtJ1RLB4zdPxF3G8z0TxZbLq7ynGUYaTI8Z2J8o9AhgbAoKAW6X1XsxUcKmflQKvADAdi+YrR
	LLuXfbswz0BsOfzGiVpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTtQ-00H0Hd-NQ; Tue, 07 Mar 2023 09:46:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTtB-00H0AO-Li
	for linux-amlogic@bombadil.infradead.org; Tue, 07 Mar 2023 09:45:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=F7j1dxawSrzqkrX+B4b2Ope1wZoGmjsuZyY/TvC7R90=; b=L885rJVqx7cam0rYl1+XFVp1Zm
	s9+367hQe99uEVeSxUbzWC6Pl2kdYGWSYWcduQ0EW+yzw8zzs1zUfAKjX2tQ0Ms9+5isezkvpoP2K
	EHk66x+GjOMudbCrYlFhEjfIXR2fvrl9p5a7zB5TOv/tVxIYTQoIYXhxjc2D1npqo4aaJ+nQanYzJ
	eMZpgf0bP822RD2vpv94+CZnvhVGkjO/Yw84vUU2xU7vLaLZcmHmmFQVnNhu6elptgW4MYwSmNWFl
	z9ZLTnKtcNV1XV0bWzD8qeF+lCjgd25mQWh5kpTO0WNDKrTqGqdz2ohCI30Mohd+bNRpBZNOH1bc4
	u+eR4psQ==;
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pZSyp-00Gyru-1F
	for linux-amlogic@lists.infradead.org;
	Tue, 07 Mar 2023 08:47:34 +0000
Received: by mail-ed1-x536.google.com with SMTP id cw28so49267911edb.5
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Mar 2023 00:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678178848;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F7j1dxawSrzqkrX+B4b2Ope1wZoGmjsuZyY/TvC7R90=;
        b=KrPnQCQzPUPY60yp/upZkZQ+xtOhVLkA6VUoRtFFyu2Rg6pVzIDB7vzQHvy1OpxUrD
         J7/r4Bzgfsx71H24CQbUR2kCqY34qfEhSVr+689pLtfvll8VzYEphha7p6v9OjxA3i3F
         rOmx8CIySFGYXeh8Vz6fViQv0qsgTGaMIUkOt1ElTiz6VnOVHCFfgvs9j3oA3LK0x0cs
         USTJwFWiRI6afGVjDET/0Yr7dYdT145F0Hw004rY94ewMbi9oTo1ULB8VSGm8PP1M6ci
         vY8q+eTfH4boLWE/3agfobFX5Jn/wJkxNnbPGTP/+xK8ZC2wqrP7RxstQQGI9NpH6wmC
         djew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678178848;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F7j1dxawSrzqkrX+B4b2Ope1wZoGmjsuZyY/TvC7R90=;
        b=VnnDKV4MHkSlFMhlR4JtNMKtj1YbgvzehjijiPkZpWo4EcYLNQpnPZ6AcLFuqkm+U2
         ctq+GAnDvk1MchaAu1HJMLb7AUDQDXbXkT4WGLGQvzvT7B8a/UymjZfK0PZ2B3qpp5gb
         7xOl+1G7fWUML/hgKrIa1cBC9wVurI3xAJd0tc6TrPAZ1Yi4G80NCTG4027bsio42H+D
         3m3ShMUWK4sIlE5BTQWdDxYCyL3ceVFcW2xKshub0D8GFxwdj+ZQ2w79kUERccByCo3I
         l4pC1vNxIfqPza9OxySA4YTfZ+JuREaD4Zgy43Web7THiTh0wMA2o6OWkhxVvELajDbt
         /4nA==
X-Gm-Message-State: AO0yUKWsLpLs7qO7ri6Le6FX5nfnqTqSqmr2crge+5n8BpqoipF3r54Y
	/6U/gJPkmXUmpsuaJ9iudcVDGQ==
X-Google-Smtp-Source: AK7set8yb4W6UUL7Tlxzj+98ZRvi1NqN0Ko2zYCzCmsu+d5uG+xYuK7RP0uMGVGKYNML4Q3cYpACLQ==
X-Received: by 2002:a05:6402:510:b0:4bb:83fa:5e83 with SMTP id m16-20020a056402051000b004bb83fa5e83mr11967349edv.12.1678178848606;
        Tue, 07 Mar 2023 00:47:28 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:5310:35c7:6f9e:2cd3? ([2a02:810d:15c0:828:5310:35c7:6f9e:2cd3])
        by smtp.gmail.com with ESMTPSA id q2-20020a50cc82000000b004acbda55f6bsm6274500edi.27.2023.03.07.00.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 00:47:28 -0800 (PST)
Message-ID: <227d9815-cf5f-6d2b-d52c-dbcc95729a59@linaro.org>
Date: Tue, 7 Mar 2023 09:47:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/3] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for G12A
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
References: <20230306194223.1869814-1-martin.blumenstingl@googlemail.com>
 <20230306194223.1869814-2-martin.blumenstingl@googlemail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230306194223.1869814-2-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_084731_996606_A1511B10 
X-CRM114-Status: GOOD (  15.27  )
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
Cc: neil.armstrong@linaro.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 06/03/2023 20:42, Martin Blumenstingl wrote:
> Amlogic G12A SoCs gained a new "divide XTAL by 2" bit. Everything else
> (we know about) is identical to the UART IP on GX (GXBB/GXL/GXM) SoCs.
> Add a new compatible string for this SoC so this new bit can be managed
> accordingly while keeping "amlogic,meson-gx-uart" as fallback compatible
> string.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Changes from v1 -> v2:
> - make meson-gx-uart a valid compatible string for meson-g12a-uart
> 
> 
>  .../bindings/serial/amlogic,meson-uart.yaml   | 28 +++++++++++++------
>  1 file changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> index 3cbdde85ed71..f3af0da8edaf 100644
> --- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> @@ -26,21 +26,31 @@ properties:
>    compatible:
>      oneOf:
>        - description: Always-on power domain UART controller
> -        items:
> +        oneOf:
> +          - items:
> +              - enum:
> +                  - amlogic,meson6-uart
> +                  - amlogic,meson8-uart
> +                  - amlogic,meson8b-uart
> +                  - amlogic,meson-gx-uart
> +                  - amlogic,meson-s4-uart
> +              - const: amlogic,meson-ao-uart
> +          - items:
> +              - const: amlogic,meson-g12a-uart
> +              - const: amlogic,meson-gx-uart
> +              - const: amlogic,meson-ao-uart
> +      - description: Everything-Else power domain UART controller
> +        oneOf:
>            - enum:
>                - amlogic,meson6-uart
>                - amlogic,meson8-uart
>                - amlogic,meson8b-uart
>                - amlogic,meson-gx-uart
> +              - amlogic,meson-g12a-uart
>                - amlogic,meson-s4-uart
> -          - const: amlogic,meson-ao-uart
> -      - description: Everything-Else power domain UART controller
> -        enum:
> -          - amlogic,meson6-uart
> -          - amlogic,meson8-uart
> -          - amlogic,meson8b-uart
> -          - amlogic,meson-gx-uart
> -          - amlogic,meson-s4-uart
> +          - items:
> +              - const: amlogic,meson-g12a-uart
> +              - const: amlogic,meson-gx-uart

Difficult to review... You claim you add only g12a which seems like is
happening there but with some other changes. I see g12a three times and
a lot of reshuffling. I also see multiple oneOf, so something is clearly
wrong. oneOf is only one.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
