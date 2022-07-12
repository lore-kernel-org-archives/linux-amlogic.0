Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE670C43334
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Jul 2022 09:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3iPMRK8bjlHYy5hAt1xUPsVEFkesjFojJImwESloYg4=; b=4OYClCFW1c6JjY
	ocU/DxdukPYOVOg4f5pZcVPd3a4dOdltskkx1qk98IgZoG0aC4Lkpwa3E431/K53ZY/pMbLXntORk
	0AzK3ylr7UK/lwFPvzFYpc3MLxgiQnlw3wBw5n1rQuoyGUShtZamtc9iARCsPjnOdaYIrTsTb46dJ
	CFCbk9qYY5HEI6PVlQX3Cd8i9km4zLhQ1ED6cNzghBSIYEZ+7XWNXLKPZ3tbMEIJ8pyPKKz/dc/Qs
	jrFINdOGRIsJkjfAOoj+VW+qrrC3bcdfV3CooIcoEgtDHeLBYZZV3NTlV8RxdjYpqJU6viH4RIucr
	y911hFJ3N/pVQGtM8aig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBCP6-009Nba-64; Tue, 12 Jul 2022 09:42:04 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBCP2-009NUp-TM
	for linux-amlogic@lists.infradead.org; Tue, 12 Jul 2022 09:42:02 +0000
Received: by mail-lf1-x134.google.com with SMTP id e28so9403540lfj.4
        for <linux-amlogic@lists.infradead.org>; Tue, 12 Jul 2022 02:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=GtNcbY+thFGWFHGivawuvM8/TzJCNdYcEcpdyt/HTv8=;
        b=hoRNHMu8pbtSEJjWc0m3nLg/0i3njcuDyG9QY2f1J/vveCAjVVnfz55Bg91uTGhnKe
         XYBssxeZgADKTrcOiJh0Rij6uJPRQUEBP/ngjz3n/5rotwAGg8U+spSNBrQnx+CpZGcF
         vpyaNQFMmEkrr3yZ5A1MC4hliwn51WAPyVsieQGp3uvlr2CCkPBBj4nUqmxi8Ej9bLJo
         LQ0P8Am3KthThasD4RgN/H2R2CsKsCOdwSSuubdgmhla/oVJnS/PxvEQIkkEwf879Ulq
         fF+oEt9tatuSegeLS7W4HeG9yYPdktL8opTtf8PiubBdhPuYxQMBmKQRMieTZrFHTvTY
         PtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GtNcbY+thFGWFHGivawuvM8/TzJCNdYcEcpdyt/HTv8=;
        b=UASDMr1vj0aoAy7qArUW/OOMlsiTj0hyQuov2QJQT7vlKY338LHtOxFbkmKhapGSSk
         0qR4zkHb1mm/gzVYBIT4cQhF6H6XnppsEZ7Xfav9L1jm0AKjqWVSFrO7dg41uQzSmyPr
         ySSUwm5SuVBAQOIKT7oMMgea1Soxb6I14vf1rmtTS37HkYESZOoJDx9GWfdiOKPiswgo
         ElTT05Attf/Jhbplt9t8cXyAxQE/o3H4aBnXu8w9i2fyqibEhixBSoCBQ0jEMcJXTw7s
         B6Ow02lYngs2EJqKTOahJ3mDlnXFcLLjL72l1IlT/RjDZd/TWvD0irwFFWE7KFa4JypK
         wQ7w==
X-Gm-Message-State: AJIora8uNG7RgzMjDdLJc5lpsfIRYkIdWjCWAz1gp+QZ8RsyU/msHLDY
	SWjapVCPgGVPHy60zVVBmdtjxQ==
X-Google-Smtp-Source: AGRyM1tk3WkRoJLINYQJslACTfyPMhidqRMvgky2hVLupgjFPZNabqHdygz2W63mTSnI8afdU1JbhQ==
X-Received: by 2002:a05:6512:a89:b0:481:1327:6ff6 with SMTP id m9-20020a0565120a8900b0048113276ff6mr15376395lfu.471.1657618917082;
        Tue, 12 Jul 2022 02:41:57 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id o15-20020a05651205cf00b00488d0e38283sm2068224lfo.153.2022.07.12.02.41.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 02:41:56 -0700 (PDT)
Message-ID: <f5b3e2de-ec60-88ee-4066-6b3860b6c89a@linaro.org>
Date: Tue, 12 Jul 2022 11:41:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/3] arm64: dts: meson: add S4 Soc clock controller in DT
Content-Language: en-US
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220708062757.3662-1-yu.tu@amlogic.com>
 <20220708062757.3662-3-yu.tu@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220708062757.3662-3-yu.tu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_024201_001075_065C4A0E 
X-CRM114-Status: GOOD (  14.46  )
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

On 08/07/2022 08:27, Yu Tu wrote:
> Added information about the S4 SOC Clock controller in DT.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index ff213618a598..ad2ec26a1f4a 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -86,7 +86,7 @@ gic: interrupt-controller@fff01000 {
>  		};
>  
>  		apb4: apb4@fe000000 {
> -			compatible = "simple-bus";
> +			compatible = "simple-bus", "syscon";

This is not allowed.
1. syscon needs also dedicated compatible
2. simple-bus with syscon means it is not a simple bus anymore, so nope.

>  			reg = <0x0 0xfe000000 0x0 0x480000>;
>  			#address-cells = <2>;
>  			#size-cells = <2>;
> @@ -118,6 +118,13 @@ gpio_intc: interrupt-controller@4080 {
>  					<10 11 12 13 14 15 16 17 18 19 20 21>;
>  			};
>  
> +			clkc: clock-controller {
> +				compatible = "amlogic,s4-clkc";
> +				#clock-cells = <1>;
> +				clocks = <&xtal>;
> +				clock-names = "xtal";
> +			};
> +
>  			uart_B: serial@7a000 {
>  				compatible = "amlogic,meson-s4-uart",
>  					     "amlogic,meson-ao-uart";


Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
