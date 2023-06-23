Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534CBEB64DD
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Jun 2023 08:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mt6TgDGyk9zt1ew0SKeCS4jZtusSuQBHy95BuxoFzjI=; b=j1j1LlhUL/Dr3d
	LQjajQ8r1tnHXMvNls5vjmIjQCDgjSVMR7foM/DH4lI0lLKcAtus5iPCnl4QwGFoS7GutOmnk2M+t
	Z5az2gtJVouPDUfAr0xx+1g8eDDa3UOC9U9zsYv0y+HbumIhTQaOW7hxJUE0o0PXj7Rhg0fv1zMvH
	67eaw0p5zhkZ8/hFGZsMSG3KqRGtd+3yc0AMoty0EjfL/BWJUyxMB8nDUEWICl2SKR4iJtdzgH3O1
	6SiQsdd+nzNjFLqnOU4sib8t0xh6jA/13cdmdOCLtDXtncnwRT8601DzeELa9HvbMwSqt67qp2qFM
	b25vfW4FLj3al6gVLOug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCcWF-002xrq-2q;
	Fri, 23 Jun 2023 08:51:51 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCcWC-002xoR-2n
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Jun 2023 08:51:50 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-51a3e6a952aso355336a12.3
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Jun 2023 01:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687510304; x=1690102304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zKPx96b2HZf8v4/X7YdtJWbMwp53QOhswyd3lmkmMOc=;
        b=J8QWPFI/vzn/TVspSQXNG3xeXjiV9Lmfa7RJqKvCru8It60AItpxgDQfHHA1SpFEuR
         HTVjgaMKUANmhntyw0uFMpLM0Iv47gNxMtcFKXzGftMN7UxsvWkdWY9Pj/b67PHTALmV
         gDPNBTWnj80olZpfDDQ6cZE2YIieIp1q8o0kk4pi3YDMehlgOiK2xCDjjTUDELgbejuF
         +ArhdGBpQVo5AElVHXWxA3xJS93MAE+oAMXnJcZw8Ez9tr0mVv6LsGCXchAMf4jAfH3u
         1h6QDW9WZP6JbrQFLzGU4LcvvwNMe0LRVnXh0fUFldHuVvjQiE8bweDvxbScv1nX0lhw
         NRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687510304; x=1690102304;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zKPx96b2HZf8v4/X7YdtJWbMwp53QOhswyd3lmkmMOc=;
        b=Le7AVbnfiOzLXiCdSRXtzDFtn8+qhyW/2K8WdTY/+mrU2uETpU7r9ohypp+DlMtVMN
         VUQHyzVDUSaEjSauqUSNIPH2CSVwCjfv+Z6hdoSg55zsfMeEZ0rC54J83dp9M3gfiow5
         nCGNRZMLvnKM30l33FB1BWi6mLws1sFkh/nKM5ZyHDlifvKFAGqsMJUIylRhuujRa/6o
         Wdi/u17b0RwfAGjarx/jvi5wXKRE+9taZsvdqij0PEk4e6SG/6OZaIsIc5RCau0TQ11c
         TSLLNQE2yhDvWq4lHxdMh0nJVAZL0SxA+Qh4G3ldK3UFKHb2vpACwz/T6g8XGnkYw4Dp
         3+Zw==
X-Gm-Message-State: AC+VfDx9UwWhco6Ef17mmvvORAhrPsG1yXtbG8j+6qNuQMQTThtPOBGJ
	N/ZlpUO0RUaX2Dab+LCmUVvnnQ==
X-Google-Smtp-Source: ACHHUZ4uT69UHrkrbEuBvO117wkeSQNiX5LmpwsS9GS3Skq8ALjvAC8d3Ly5sriXb6rbxZpG8THuQQ==
X-Received: by 2002:aa7:cb0c:0:b0:514:8fdd:fc41 with SMTP id s12-20020aa7cb0c000000b005148fddfc41mr13121292edt.15.1687510304159;
        Fri, 23 Jun 2023 01:51:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id r24-20020a056402019800b0051bed090703sm1405740edv.12.2023.06.23.01.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 01:51:43 -0700 (PDT)
Message-ID: <a885b97e-aaf0-cb72-f25b-71054d6d3fe2@linaro.org>
Date: Fri, 23 Jun 2023 10:51:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 2/4] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for T7
Content-Language: en-US
To: Lucas Tanure <tanure@linux.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Nick <nick@khadas.com>, Artem <art@khadas.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20230623081242.109131-1-tanure@linux.com>
 <20230623081242.109131-3-tanure@linux.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623081242.109131-3-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_015148_902430_38C22ED8 
X-CRM114-Status: GOOD (  14.07  )
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

On 23/06/2023 10:12, Lucas Tanure wrote:
> Amlogic T7 SoCs uses the same UART controller as S4 SoCs and G12A.
> There is no need for an extra compatible line in the driver, but
> add T7 compatible line for documentation.
> 
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>  .../devicetree/bindings/serial/amlogic,meson-uart.yaml        | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> index 01ec45b3b406..ad970c9ed1c7 100644
> --- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> +++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
> @@ -50,6 +50,10 @@ properties:
>          items:
>            - const: amlogic,meson-g12a-uart
>            - const: amlogic,meson-gx-uart
> +      - description: UART controller on T7 compatible SoCs

Your description is rather incorrect. This is UART on SoCs compatible
with S4, not with T7. Otherwise what do you expect to grow later when
adding more compatible devices? Just drop the description, it's kind of
obvious when done correctly (but can be misleading if done wrong).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
