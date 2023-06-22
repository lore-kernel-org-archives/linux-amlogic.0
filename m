Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A69BEB64D8
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Jun 2023 09:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:References:Cc:To:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KxCdZb/XHoFbcnRp9iDBNZ5JhyoCGzpLaUYY6cc5nQ=; b=iERUEyhra/S9I54LVTpUycvL+a
	kj/n6p3T+jGiWW0W6hDDddvRvqU3wzIPvgn/F/W57W3IYLgLEhSo8z7A/zW14q6HF6lwvlfq2EKq5
	2i50G4MYLIj0eSBuk9jppeex5npqxoJdljaHOJxv04wPLOGZ6RBL8OEYRoa1VmOjjKHp3UhkUrvnz
	7CRPwC34JMRPgWM0drbMVBZWQwOQ6V0P9SrtW3f9UbBuDVmYpLrqS4m9zet3LCYZbikDksfyOQYmi
	a6cbxwD9x+G/TQ+RxH3lpg8L+eZ4k/fw6vgDw4jXMhU9tLSItGkxK1omhWw8XxHb0MQ+ijD/bMrly
	WGxIXtHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCGmG-0002Ad-1x;
	Thu, 22 Jun 2023 09:38:56 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCGmD-00029A-3D
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Jun 2023 09:38:55 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f9c532f9e3so15509985e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Jun 2023 02:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687426731; x=1690018731;
        h=content-transfer-encoding:in-reply-to:subject:organization
         :references:cc:to:content-language:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1j31YwGJInJp0uzBca00KMvrBtU/vucRfvT/lc8M/k=;
        b=r31WHGpDwAnxyUVyweo5c3+lMARcpIsEl6qSJ0JpMHq68mEoGcJ2eEf9pqIPOWrPjF
         uPAhY9IbZC7NTawDk4C0h2B0lnMFNZnLfWVDQ7HMEm+0Kf5AdCUUGwlXOBxxBD3yhzbD
         hT1/aQg8RdtrLi0XNEU5f7uNLWbJeV19nO2KDyf5f+Oufd5SR+i2CEXXlt/eBk12yGpz
         U/OGVGV4DtpgrrWpw9K2TIUjlAcHkuLpmzBx/SmIevMGqbH9aDQ+xEH0WBoJ6P32b9VX
         e6hsxfhI7WgmronTZTpGimp52hUP4w1oCaODpbjeaU+qYmnDpCIXAQRS49lKFRmCUDKc
         eMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687426731; x=1690018731;
        h=content-transfer-encoding:in-reply-to:subject:organization
         :references:cc:to:content-language:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y1j31YwGJInJp0uzBca00KMvrBtU/vucRfvT/lc8M/k=;
        b=iwBTTsqwT7inPIltQpzLSocDVkjBjZhTLTaspsZquLo9yViu6XRAp+fEiS5JZ5sVMN
         Se16VRXxw57FR6di/AnOEbPwFj5CWda1jq6nTgAa1NOoHHm2stbVEBgGxwEd4Zbu20dv
         VbESX1Pwhn4F4EUMl50CxRns0G+973dq1ei+1EfSqerNuwzdKnHYjzUPMDbs75yLSAxp
         aDaL7LCW2Aaf8lF1bTjZ8E9Npv1wKrGdiNHAU5N5lDsZjxMNRwTWvCe0gUTxF/9/PRgR
         guxyabW401Qo+OkDI0lDs03DcexvpGbmReGWgs8ZRp0M2HhIdXryLXMYRkZSlB2Ecn2J
         +9xg==
X-Gm-Message-State: AC+VfDxuaWTGSzToJcNl/rP+o1F/oN+UdHN6ZZcx31A+hdcFlYzdU5EQ
	lvcvOfVy9VYvheMFSLoK0A9BcA==
X-Google-Smtp-Source: ACHHUZ6o5KJy6XmDPYy+gz9tcwBxBrnmssvKZ+GzsUV9aZ03hz6SJ4PS8LJmpLVIWGc0+MREh27jvA==
X-Received: by 2002:a05:600c:2211:b0:3f7:e655:a498 with SMTP id z17-20020a05600c221100b003f7e655a498mr14748565wml.14.1687426731505;
        Thu, 22 Jun 2023 02:38:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f692:a800:4794:385? ([2a01:e0a:982:cbb0:f692:a800:4794:385])
        by smtp.gmail.com with ESMTPSA id 8-20020a05600c028800b003f9c8c6bf53sm3102092wmk.13.2023.06.22.02.38.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 02:38:50 -0700 (PDT)
Message-ID: <4a2a2f0c-f9dd-d5c4-1e7e-5852970f87a7@linaro.org>
Date: Thu, 22 Jun 2023 11:38:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>, Lucas Tanure <tanure@linux.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Nick <nick@khadas.com>,
 Artem <art@khadas.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor@kernel.org>
References: <20230622084045.519203-1-tanure@linux.com>
 <20230622084045.519203-3-tanure@linux.com>
 <20230622-unsent-willing-574906af5e1a@wendy>
Organization: Linaro Developer Services
Subject: Re: [PATCH v4 2/3] dt-bindings: serial: amlogic,meson-uart: Add
 compatible string for T7
In-Reply-To: <20230622-unsent-willing-574906af5e1a@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_023854_044703_D7F71548 
X-CRM114-Status: GOOD (  18.14  )
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

On 22/06/2023 11:26, Conor Dooley wrote:
> Hey Lucas,
> 
> On Thu, Jun 22, 2023 at 09:40:44AM +0100, Lucas Tanure wrote:
>> Amlogic T7 SoCs uses the same UART controller as S4 SoCs and G12A.
>> There is no need for an extra compatible line in the driver, but
>> add T7 compatible line for documentation.
>>
>> Co-developed-by: Conor Dooley <conor@kernel.org>
> 
> You can delete this, I don't need a Co-developed-by tag for review
> feedback.
> 
>> Signed-off-by: Lucas Tanure <tanure@linux.com>
>> ---
>>   .../devicetree/bindings/serial/amlogic,meson-uart.yaml      | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
>> index 01ec45b3b406..4ca4673169aa 100644
>> --- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
>> +++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
>> @@ -46,6 +46,12 @@ properties:
>>             - amlogic,meson8b-uart
>>             - amlogic,meson-gx-uart
>>             - amlogic,meson-s4-uart
>> +      - description: Everything-Else power domain UART controller on G12A compatible SoCs
> 
> s/Everything-Else/Always-on/


"Everything-Else" was the amlogic naming for the non-always-on power domain, but it seems
it's no more something used on new SoCs like the T7 family.

Anyway, the description is wrong, and it's a mess because we used "amlogic,meson-ao-uart"
for uarts on the Always-On domain, but here it's described as Everything-Else...

Lucas, is there AO_uarts on T7 ? if not drop this amlogic,meson-ao-uart for the T7 UARTs.

But if there's no more AO uart controller, you'll need to change drivers/tty/serial/meson_uart.c
and add a OF_EARLYCON_DECLARE() for amlogic,meson-t7-uart.

But still, why don't you use the amlogic,meson-s4-uart as fallback instead ?

+      - description: UART controller on T7 compatible SoCs
+        items:
+          - const: amlogic,meson-t7-uart
+          - const: amlogic,meson-s4-uart

and update meson_uart.c if there's no AO uarts anymore....

Neil

> Otherwise,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Perhaps it can be fixed on application, I don't know how the amlogic
> maintainers operate.
> 
> Cheers,
> Conor.
> 
>> +        items:
>> +          - enum:
>> +              - amlogic,meson-t7-uart
>> +          - const: amlogic,meson-g12a-uart
>> +          - const: amlogic,meson-ao-uart
>>         - description: Everything-Else power domain UART controller on G12A SoCs
>>           items:
>>             - const: amlogic,meson-g12a-uart
>> -- 
>> 2.41.0
>>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
