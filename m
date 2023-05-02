Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B1A9C77B7E
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 May 2023 07:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n8Jvyt1KgCi5eOjwd4uMYlHw9jK9mUvwDBUWJ3dJYk4=; b=w3IpTGilWSb0BL
	Eut4UDZgTXsxoTNU9i3xb0ehK8ZY1UStsPKzJv2QHnN9a/4Bcvo7FaDcqjKQ8O7jyToT5XTakVPiQ
	u8s/hHEBgBLT8rCg7D1h/e3fDEMGksi+Vpy5ERCBTBiDU10/Muuo21mZXws+1xCTTBc5yAAY1j/Mw
	2zYEtV9zhPyQ+hnPHVvpr0UrL0TRRvwiCsZnIZ9hLR+MqwqAF84nh5I5Fk92cWbK4Mnu7j1kqa6Fr
	xWiAJLbun6s+mpAEXzgjF5uI0nKv5dU5QhhkojlPLyLR/HrRED0gVHDu+Hm4c9ivlS0CSIYiL7xK1
	QdTgjVfKj1uShqLihTlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptkQi-000TcN-2V;
	Tue, 02 May 2023 07:28:08 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptkQg-000Tbg-2O
	for linux-amlogic@lists.infradead.org;
	Tue, 02 May 2023 07:28:07 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-959a3e2dc72so688737066b.2
        for <linux-amlogic@lists.infradead.org>; Tue, 02 May 2023 00:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683012485; x=1685604485;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uxqIQluB2Z5De+KoFY9KA9mX8YPwnDskO3lw2FlElZs=;
        b=q1fqgb3UJzeU3o8j7LOumaD2lYrexvbU2mq2hlvvdvwphrQAzfR3m/WhZUQXdzzXwo
         anlCHeP/S2shFqkqDCJ8wbEsb12h/Q/gPtGe3ZSb+mV1q9Y7PQ0C51VKo8reaxjNYgPy
         uGgDXcCzuVzu0aeA4qfc5kz4HJHutTyN2m6rcNR2qUlHfCAevmiaaLC3vSQH+SvVtvBh
         6+2xCJhi8laSF7mkG6LmqhBP0tKfdk1QAxFJpjrm3T5hqDr9BzK68PCRCtYHizXFm6/L
         8iE22+UgXIV88tYgeB9jQV3Px2RV1Rac1eDWlPp4P8XUoo9+1wuWJrWOFyt+iDfgsBSc
         5rhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683012485; x=1685604485;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uxqIQluB2Z5De+KoFY9KA9mX8YPwnDskO3lw2FlElZs=;
        b=hod6CId/5BiX5x6wzz5IQ+tHrUITqzMBdbj1aOt2/u4BnzkIrdFl/2/MRHnG2j1mgx
         +oFObwkkPTRwUft5s+Laj5pCqNPeFMXC6XwKxB/10C9oXS9/tVaJA4pf/jiMF1xSdjME
         5qKtBra79WT6bMBUsCQpJcbSiuy00sne36S/qSH3a8RTLMM+ScVW0thIO5kCKXrwhuoX
         DvEqqYmixds1sSLjXxIy4+k7U5+2N50ohKX2foqlQRkfNigzOmqEH0JrCVvoITIILZYo
         pj3TNUGa7OtGqA2s+5sB6drttvFvjhv1CXi5bLa4jucEDc4c8SrEa2Jfai1XpfZep/lc
         4ISg==
X-Gm-Message-State: AC+VfDwPrxxO9RJQK4SGUe5kZCPe6u9oP+YconEwxXT9aTkvpSUb5vah
	IrB2er7gTYUSd7O/xDgoAjoOSA==
X-Google-Smtp-Source: ACHHUZ4gNy/JK2zvP7iIWv5h2Du0eVngU8hcE0mrCK5p5SUEf7rR3RGpdFzEGjZusLEWsn3q7hbDVQ==
X-Received: by 2002:a17:907:31c7:b0:94a:785e:6a46 with SMTP id xf7-20020a17090731c700b0094a785e6a46mr16023751ejb.24.1683012485294;
        Tue, 02 May 2023 00:28:05 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:bafd:1283:b136:5f6a? ([2a02:810d:15c0:828:bafd:1283:b136:5f6a])
        by smtp.gmail.com with ESMTPSA id l13-20020a170906230d00b0094f2f1c5ea1sm16044643eja.174.2023.05.02.00.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 00:28:04 -0700 (PDT)
Message-ID: <5edec8db-64de-553b-6313-9b570f4d2a03@linaro.org>
Date: Tue, 2 May 2023 09:28:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v5 2/2] arm64: dts: meson-gxl: add support for Xiaomi Mi
 box 3
Content-Language: en-US
To: Karl Chan <exkcmailist@inbox.lv>, linux-amlogic@lists.infradead.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230425165624.11999-1-exkcmailist@inbox.lv>
 <20230425165624.11999-3-exkcmailist@inbox.lv>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230425165624.11999-3-exkcmailist@inbox.lv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_002806_803281_50395506 
X-CRM114-Status: GOOD (  10.84  )
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

On 25/04/2023 18:56, Karl Chan wrote:
> From: "Karl Chan"  <exkcmailist@inbox.lv>
> 
> The Xiaomi Mi box 3 is a TV box based on the Amlogic S905X chipset.
> There are two variants:
> - 2 GiB/8GIB
> - 1 GiB/4GIB
> 

...

> +&hdmi_tx_tmds_port {
> +	hdmi_tx_tmds_out: endpoint {
> +		remote-endpoint = <&hdmi_connector_in>;
> +	};
> +};
> +
> +/* This UART is brought out to the uart pad on upper left of the pcb */
> +&uart_AO {
> +	status = "okay";
> +};
> +

Drop stray blank lines.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
