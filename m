Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845F2C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jan 2022 08:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=O0nRHxQlVTjXszppUBGMSshmCAGjH2mqSteTjy72NA4=; b=lDU13AVPLMIjO4x8bqXVwg4Dvl
	juLVgpFG7/tl20fAoL7989jxM2QrZGNdZsPp6RbiaBhq32oRM9d+E8PKB4eemZOzsEAA+X06g54yw
	jAwjE5mIviE/wVz4FljK3XH4LCRbkkRMp4BGLYAKKX9BlRNEbw9PalxHn2eYfq3gzhld4IxFGgQlT
	wQ+gfMrukbmeMP3OmYr58hhNKRAAv075B7q2VUrbLqDsk3+ewKsmq+CtaxY26ze5HWJuphHkrQBG+
	Yyv9T3vAn38zRkSJMHzewJeKVnYyczYYc2js8MTwgbkJ644nql0ED6NU+UzWsqg5vZnp9yM+T5gTj
	s7pZCOlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7vvb-0059wA-Iw; Thu, 13 Jan 2022 08:57:51 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7vvZ-0059uW-Bm
 for linux-amlogic@lists.infradead.org; Thu, 13 Jan 2022 08:57:50 +0000
Received: by mail-wr1-x430.google.com with SMTP id o3so8756810wrh.10
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Jan 2022 00:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0EWMr6KitlRWDO5arnJCvWClLIIvkp/yLaDhRRbKQPU=;
 b=KrDvC0T2RkDm2S10PdyyDxIPGujwx2mMzNvpQr5OeKbYdtmkeeiJTrvkYNCTpxFztK
 FYFI1+5uWv9k7dbdh06gSvpB07XseM31gcJsHImOSvdONPW9kGVcnqkgaTIvC3l7D4cd
 Hx3BrEI/pOHsRKnJ9rCpP8uEC/Yxl2TI/ibTx4m8gGtJFg4zJ+nwZihosW9of4MnRmCB
 3JcucSDwWvrUegVoxpLg9RJm/Xtdx1TpXWM0TtJk/IBJIrtEWiQ6CHIryUAf1qyG0adz
 yQrhVOQqTg5hi+ySeIL3Qoe7AYI/7dxVZ3lhmCcydZf50dc1NYZkKRobOqZZGzS5ZUj+
 ab1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0EWMr6KitlRWDO5arnJCvWClLIIvkp/yLaDhRRbKQPU=;
 b=FPFg8KQDfxJLakGqhpWHM7O3ldlGrNMlxdVp6psDo91YnKWsWePr7swS7u+/iuw+EW
 XWdtSuexsbFaUUWzZMA3hnWCtsT9XeYhG5ReCtF6oysmxmQBDeKCYu2vSKEyWE1tAa4w
 +QoBy53Q7p41lPT0A0EwAiaV78FZnDsco58kZE+ZuibPEzTTB9dK/MIIAINFVjQEwCJv
 hFXtffSnjXWlD5gGAvyKu1p84NMJ+vHXH1dLMe6UuOZ7pHkTkJjEs9CduLJqjHhYleD3
 kUP3yTLHdvxHEKHAPjEJC4mo1evaFQ4RJVK46s3YcPqullsKvaikW0qijvEFr1gpqeIK
 XFLQ==
X-Gm-Message-State: AOAM532yQRC65yJa/3XHhT5Nr68EIIBLJ9zS/bm2LZDJIb5R84lMQLie
 MQSVd/16N17X3DsSetGOBHEVDA==
X-Google-Smtp-Source: ABdhPJwzp7BlKb4wIp3XPCOF5PL3ihQEqq3SYQ39aZWcM7ZbYisYAeReeY5uo9mESQLZDRWV0YfjxQ==
X-Received: by 2002:a05:6000:1a85:: with SMTP id
 f5mr2179980wry.463.1642064267839; 
 Thu, 13 Jan 2022 00:57:47 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:bece:ab45:7469:4195?
 ([2001:861:44c0:66c0:bece:ab45:7469:4195])
 by smtp.gmail.com with ESMTPSA id o11sm7392798wmq.15.2022.01.13.00.57.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 00:57:47 -0800 (PST)
Subject: Re: [PATCH v2 3/3] arm64: dts: meson-g12-common: add uart_ao_b pins
 muxing
To: Gary Bisson <gary.bisson@boundarydevices.com>,
 linux-amlogic@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220103154616.308376-1-gary.bisson@boundarydevices.com>
 <20220112211642.2248901-1-gary.bisson@boundarydevices.com>
 <20220112211642.2248901-4-gary.bisson@boundarydevices.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <78e5049b-5e39-ff70-7c77-9f233c7b2fd2@baylibre.com>
Date: Thu, 13 Jan 2022 09:57:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220112211642.2248901-4-gary.bisson@boundarydevices.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_005749_452113_F1BE3619 
X-CRM114-Status: GOOD (  15.12  )
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

On 12/01/2022 22:16, Gary Bisson wrote:
> - RX/TX signals can be mapped on 2 different pairs of pins so supporting
>   both options
> - RTS/CTS signals however only have 1 option available
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
> Changes v1->v2:
> - renamed nodes as suggested by Neil
> 
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
> index af1357c48bee..62350c408e16 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -1952,6 +1952,33 @@ mux {
>  						};
>  					};
>  
> +					uart_ao_b_2_3_pins: uart-ao-b-2-3 {
> +						mux {
> +							groups = "uart_ao_b_tx_2",
> +								 "uart_ao_b_rx_3";
> +							function = "uart_ao_b";
> +							bias-disable;
> +						};
> +					};
> +
> +					uart_ao_b_8_9_pins: uart-ao-b-8-9 {
> +						mux {
> +							groups = "uart_ao_b_tx_8",
> +								 "uart_ao_b_rx_9";
> +							function = "uart_ao_b";
> +							bias-disable;
> +						};
> +					};
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

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks !
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
