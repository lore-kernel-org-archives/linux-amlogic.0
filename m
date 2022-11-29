Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03089C4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Nov 2022 08:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJktawtklbFSeMAWbjJLlDQlEqKpnt4wwN96jAdS5h8=; b=UAytPXF8dD/LT71WIUSjkpAUpF
	FbAq8fi7QY2vKl7h4jZFy5xlT3DP98laNhJ36tP+myhKtcvijcxpcTfMaKpEt+RrAhvSPqtgQMm+3
	KAjyBNXH5eCTYx4ya5o17cdah/abGYBY4R6XoEanxdbtmP5akOL4Olgv1fk64ipIz613MYj0nUpJ9
	6ycQv58BFj6YvIkEi8c0d3klbatamVbkwtC35Fp+PoZjbpXu2+jeE4zE3UuVL17ogf2iuP3fpiW+1
	XuH8nR3y0vsFnssMC/m/8cFrzuHcuV1x3ihowX+oMpFdN1JmUcgg49jtV5s479+NkMZys7sFURNFG
	nAhseJNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozw5R-007P4r-I1; Tue, 29 Nov 2022 08:35:29 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozw5O-007P1y-DY
	for linux-amlogic@lists.infradead.org; Tue, 29 Nov 2022 08:35:27 +0000
Received: by mail-wm1-x335.google.com with SMTP id r66-20020a1c4445000000b003d05a3775d4so4253827wma.3
        for <linux-amlogic@lists.infradead.org>; Tue, 29 Nov 2022 00:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nFrj+28YyuR0eqY1nguFSdC/SUrYraG5B7QZglg6iPA=;
        b=ujNxPiyJBK+27e2UV5LExF7tASbXCmHBTpWP/RH/a2N/b3EbR9zCXcPRw52zCramKL
         b/T14DR90xpGsLypzyiwFS893323AO+s3BlDak017FuHP1E51BRm/s8it43KHe/NbzLs
         xP68JSc3OFe1G6cJbjNX6RS/H7GQY++kVDMsWV2im6N2hRffagou4am1CWRJjm1UXIKF
         zw73TChC5bnKS0T1X1yY9lpTfZC61L9sbGFGa9moVTvwEz0BvVm2hd8PCnNbbV9rk8P2
         x0ymg/G3bsDoAuLeRon5Ch9+Ts1z7i682/9cNO5HD8k/cBOM5fUSocVgZUoUT3WQakmZ
         Kbaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nFrj+28YyuR0eqY1nguFSdC/SUrYraG5B7QZglg6iPA=;
        b=sJjs5Yq+2kADSFR3b4iJU2RAD459ojKNh+aJmbtkhHqcXFftM6ZhenjZ3vqeiDb+S4
         D3lLOFyoPT0uyce/FVBdjxL2RB79RIYAWhRiNhTDNgvckTftWkxrbui1geFR5/Ui7jzk
         Mu1cIT+YYNBI3CUfPw3jNETUN9D2vOifhe8nPdoe9PVbpuQ9NrUJ0l/UqW+RF/CWj1v+
         kVga669g2hdOChAzoZsGjZdULBTP+MecQdZFyGVHOO3QCAwlvrfzaK133g0FE8AmpoFe
         yj6csqQM1rfLD7RUbU/MlZGxoYkKOB0H0Nxz2rqJnPD7nWg0TOLIxS31+itbJbHBoJDg
         5gFA==
X-Gm-Message-State: ANoB5pnNZpuooUQVG+pimxw4sMiiScXmy01KCFpJSsxswa8Tj0iJLt9R
	9e29Lo5XlFx1ZL/e20uWh5cZ8w==
X-Google-Smtp-Source: AA0mqf5jyfHXkfUmC+Gip38Uos2hKiuERdUVeokOAKcyV7egdfjw73V5ejHd9sGDUqNPJniods1eLg==
X-Received: by 2002:a05:600c:2302:b0:3cf:a3c4:59b3 with SMTP id 2-20020a05600c230200b003cfa3c459b3mr33009149wmo.198.1669710923877;
        Tue, 29 Nov 2022 00:35:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:2f85:a28c:5df7:9cd2? ([2a01:e0a:982:cbb0:2f85:a28c:5df7:9cd2])
        by smtp.gmail.com with ESMTPSA id w13-20020adfec4d000000b00241dd5de644sm12981186wrn.97.2022.11.29.00.35.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 00:35:23 -0800 (PST)
Message-ID: <f69c9db1-6274-6caa-e3bd-92ae4a7bff19@linaro.org>
Date: Tue, 29 Nov 2022 09:35:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 4/5] arm64: dts: Add DT node for the VIPNano-QI on the
 A311D
Content-Language: en-US
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: italonicola@collabora.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson SoC support"
 <linux-amlogic@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
References: <20221128111740.39003-1-tomeu.vizoso@collabora.com>
 <20221128111740.39003-5-tomeu.vizoso@collabora.com>
Organization: Linaro Developer Services
In-Reply-To: <20221128111740.39003-5-tomeu.vizoso@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_003526_495790_44829DCC 
X-CRM114-Status: GOOD (  16.42  )
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

On 28/11/2022 12:17, Tomeu Vizoso wrote:
> This "NPU" is very similar to the Vivante GPUs and Etnaviv works well
> with it with just a few small changes.
> 
> v2: Add reference to RESET_NNA (Neil)
> 
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi     | 11 +++++++++++
>   .../boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts |  4 ++++
>   2 files changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 45947c1031c4..aaa629816e41 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -11,6 +11,7 @@
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/reset/amlogic,meson-g12a-reset.h>
>   #include <dt-bindings/thermal/thermal.h>
> +#include <dt-bindings/power/meson-g12a-power.h>
>   
>   / {
>   	interrupt-parent = <&gic>;
> @@ -2484,4 +2485,14 @@ xtal: xtal-clk {
>   		#clock-cells = <0>;
>   	};
>   
> +	npu: npu@ff100000 {
> +		compatible = "vivante,gc";
> +		reg = <0x0 0xff100000 0x0 0x20000>;
> +		interrupts = <0 147 4>;
> +		clocks = <&clkc CLKID_NNA_CORE_CLK>,
> +			<&clkc CLKID_NNA_AXI_CLK>;

Nit pick, but this should be aligned.

> +		clock-names = "core", "bus";
> +		resets = <&reset RESET_NNA>;
> +		power-domains = <&pwrc PWRC_G12A_NNA_ID>;
> +	};
>   };
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
> index 124a80901084..73f3d87dcefd 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
> @@ -15,6 +15,10 @@ / {
>   	compatible = "khadas,vim3", "amlogic,a311d", "amlogic,g12b";
>   };
>   
> +&npu {
> +	status = "okay";
> +};
> +
>   /*
>    * The VIM3 on-board  MCU can mux the PCIe/USB3.0 shared differential
>    * lines using a FUSB340TMX USB 3.1 SuperSpeed Data Switch between

With that fixed:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
