Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC758C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jan 2022 08:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xVKPoEivP22KWqI/JLR6SnSVECk+04o3HGsdePvIxBc=; b=NY0K81b+7NYeRUADbSeoQK6eoQ
	Q872WesjHR6nfgnGfFr/08kz+B2NTE9ISNcwdE3O8xH14QUCzg9x2mM1IKnAX6dRT6UDkVhxRAlWM
	MiujDJWmAXxrAPINa01heYmfqrxrzZFpm+uth8w5qdlEeg1EdwtRBDRq/5YLxLuY08VLO87QGIwFD
	jv+lzGilC6+BInWxXatmbTtmomBvaiA5V0rPa6w9A23pn1xwcGyO6bkQ/S+3Q4SxiJ50Ecv9HIMLA
	QgHtRaCLGXXdq+QWN3ljNLemmARsY/JCVmeGUtw7GqOU63YJcu0OcwJXuWFZsO1G9fAvoVFvcunpd
	DqOCACSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Z4y-001YTa-GA; Wed, 12 Jan 2022 08:34:00 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Z4i-001YPE-Ge
 for linux-amlogic@lists.infradead.org; Wed, 12 Jan 2022 08:33:46 +0000
Received: by mail-wr1-x433.google.com with SMTP id h10so2810063wrb.1
 for <linux-amlogic@lists.infradead.org>; Wed, 12 Jan 2022 00:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L9IwQQiFv4F/PhynVJYSv5Kyc4QAGDJohE6u03AkZCY=;
 b=ykU5ZOUHvLq9H1hXJszUCoCrw8lfvWNcahYrIkAKp6JFkivyVZxKNdH9eQ85FGazOy
 gpwM1M4vXuWc4igtNKWSSb1oRtLO8Yvr1lTqcBJNGH31SvVM9ADxNx3SNLDoGxw07WK9
 dODBae7RBmpAE8JakS15tZUXb/Re85JA3MkQTZ2fAC6LS5sTuH1eoqYX8ka99EW4X6PR
 9KqQpTmxxw9t95YlEbE+WR4a57enObcr/Ssyi1LCrYg48AAodx1ec6IuRD5abA48hkrx
 MoVhc/o9XpGyrRGzW6LflkufCw+oOm/nBGghLbtmnVWdzVTZ/AZ/BdWzCt6+prPsfg9N
 cqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=L9IwQQiFv4F/PhynVJYSv5Kyc4QAGDJohE6u03AkZCY=;
 b=tkchMLfX4jAP2PRvAEMIpIil6G7yqHgxp/osVRpjRW/CZGOgPeD0MqLXA2klMVI8PA
 04hRR1fiEGavXT/I0JT6c5XeTxPfqDmB5IF2rssp14dyn6ezUXSgyQ2bVayg0yDY4M1d
 UF9tg6YOiEWUEUwdUECnasSkc5ZDB11qV/Cc26Mo7aAzQb2Z+i+W1qrXRzW7YykDyLoo
 3s6hMahme7p75yrN8AwneZ567Adn0r0Am0Ag965gvKC1gWUII3fyVKbNWYJ628pGGMSp
 RUBNG2oZtbNi9r2Z4NPDJy6PLnXGEBl6c7NSPzjLuRfCPG3CPO74x+SXeYFCFGcom7Cm
 kenA==
X-Gm-Message-State: AOAM532+BwhiccJF7dISOUV4P5Lq0XMPRzga36tjNCPjLmayyvuHTqsE
 PNA7Q1FhLz4tnIBM5c4IHKxf5A==
X-Google-Smtp-Source: ABdhPJyLeEQevgBuRP9or53vy/ZSxJEEVj0xCH5CX4telS7LvKnJ9CXi9LMJI9Y/jfyPrt/P/UuRqQ==
X-Received: by 2002:adf:d4cd:: with SMTP id w13mr7005412wrk.506.1641976423144; 
 Wed, 12 Jan 2022 00:33:43 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:381b:6e50:a892:5269?
 ([2001:861:44c0:66c0:381b:6e50:a892:5269])
 by smtp.gmail.com with ESMTPSA id l6sm3662645wmq.22.2022.01.12.00.33.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 00:33:42 -0800 (PST)
Subject: Re: [PATCH 3/3] arm64: dts: meson-g12-common: add uart_ao_b pins
 muxing
To: Gary Bisson <gary.bisson@boundarydevices.com>,
 linux-amlogic@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220103154616.308376-1-gary.bisson@boundarydevices.com>
 <20220103154616.308376-4-gary.bisson@boundarydevices.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <fe58c139-f127-d102-a6a6-b8c2151aac20@baylibre.com>
Date: Wed, 12 Jan 2022 09:33:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220103154616.308376-4-gary.bisson@boundarydevices.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220112_003344_593536_D8717DA5 
X-CRM114-Status: GOOD (  15.79  )
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

Hi,

On 03/01/2022 16:46, Gary Bisson wrote:
> - RX/TX signals can be mapped on 2 different pairs of pins so supporting
>   both options
> - RTS/CTS signals however only have 1 option available
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  .../boot/dts/amlogic/meson-g12-common.dtsi    | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index af1357c48bee..3a7773ffbd08 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -1952,6 +1952,33 @@ mux {
>  						};
>  					};
>  
> +					uart_ao_b_1_pins: uart-ao-b-1 {
> +						mux {
> +							groups = "uart_ao_b_tx_2",
> +								 "uart_ao_b_rx_3";
> +							function = "uart_ao_b";
> +							bias-disable;
> +						};
> +					};
> +
> +					uart_ao_b_2_pins: uart-ao-b-2 {
> +						mux {
> +							groups = "uart_ao_b_tx_8",
> +								 "uart_ao_b_rx_9";
> +							function = "uart_ao_b";
> +							bias-disable;
> +						};
> +					};

I'm not fan of these nodes namings.

Perhaps :
- uart-ao-b-2-3
- uart-ao-b-8-9

so the actual pins numbers used are more clear ?

> +
> +					uart_ao_b_cts_rts_pins: uart-ao-b-cts-rts {
> +						mux {
> +							groups = "uart_ao_b_cts",
> +								 "uart_ao_b_rts";
> +							function = "uart_ao_b";
> +							bias-disable;
> +						};
> +					};
> +
>  					pwm_a_e_pins: pwm-a-e {
>  						mux {
>  							groups = "pwm_a_e";
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
