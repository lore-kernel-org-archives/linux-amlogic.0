Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36CDC3DA7A
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Jan 2023 09:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHU9KjvI3AYJ9wQS288eu7ffk2QvfFi9lorlaVlZaj8=; b=u45q6nKCAWxKcpcYrTFaEFQ/6Y
	ALGlO2FJT2HqxghHyOx320jT7hGuhqR5iQbgBkpuekrBBD18RWlwPUTnMNPGQbLXC3UmNcWvZSlhJ
	EqM+Aehcc+g+SXI1rigkArB4g/naToLvdA6FJDjMw/luSA0LeVVxFpBYqF3pbjolzYYqp5yaPKktr
	glci6pf0cU3Ssb/2eJuPqk7RFyYgXqmBn6XFSPZTCOh1X85PjwPHW10q1dL+8hWjwVAe5zITvbVD6
	MMoA9p1Kn709O1MUij7FNHfexhrF6PAKLSoiXQC4IaV28aPXYeUpRB85H1vFSNtMxDRLfHdwAMHR5
	QoKZtYSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCHb7-00AAS2-9l; Mon, 02 Jan 2023 09:59:13 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCHW0-00A7Kg-WE
	for linux-amlogic@lists.infradead.org; Mon, 02 Jan 2023 09:54:03 +0000
Received: by mail-wr1-x42f.google.com with SMTP id y8so25839212wrl.13
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Jan 2023 01:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l+/g4OFevxQxj3ZDU3ipz6hKywBVT0qBoACJLcSqq4M=;
        b=uPhtFfxGx1PHn79fSh6g5TqdHIc5I+mE0Euh7ayeA62uFN0W6iPkzaWlzJnjAOukBz
         YfTAaMZrv/XYHR+FPBk6IC6fQGfKNloz0/DcMXvE0M8iym3aErj+VFJTJplo6xEQhhwj
         X2VsICQEDqqMAnRfyKKDBEqK53hNPGmvuMyd6J3ywo5JXTln8+F5DrD82ISz2vPvUMhg
         TZMnew8tvPBwYC180/DivQ/V5vLziCsxisWQqgayu94oVA/34OzPyq0aV5FwYarYoVq3
         PJi0ddgIO7PJtNkl/0Bgp4nFHVI69CSHNESYzCGn1MRNFLPFHdhX5dSyuGFYN/ezPVH+
         2ieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+/g4OFevxQxj3ZDU3ipz6hKywBVT0qBoACJLcSqq4M=;
        b=NNOsHCQczj7I4i8x8ThMgbIz6No8zrO4DYx8LFpQ8pXLNJbK/ysbmAuzgOAINwTdpM
         BYROD9h3pYA9KGiGtihizjAZVpTNXpSzXxJlrNdyNRFmJ95A0Odi/PAK9BrD56m0Dh5P
         PyhDUWfa72U/RH6R8cUz8MDPED7bDDJVGF6DTKxtOd4O5shde6M+la3L4T0ThsOGJUd7
         1fAhY5JqnJ39N1701Jou7YusGX62BsyavrIPeXK1ImzpIjW777SP4Z0a5vP3xsDLFqEy
         FuMaP/w5+huu7BckljsvtY6fKlMZjrWV9CUyNBy6VmfrNacvV7lg2KixoRq7Owr8GgmR
         joKQ==
X-Gm-Message-State: AFqh2koYaJRo7APVoJyE55eiBjiPex1jhOlZplVIE9CQu9jYAVUBSfjy
	4fjeMqhtMS5e3iymFMMYDsdjfQ==
X-Google-Smtp-Source: AMrXdXtn8MnvQhXsoUddUydMeU25/PmnIRF88UjZXtcC/hZzFGziSqo12v8zKsIJJzFrTNvZ08M9YQ==
X-Received: by 2002:adf:ee83:0:b0:270:213a:b53d with SMTP id b3-20020adfee83000000b00270213ab53dmr23568623wro.33.1672653234797;
        Mon, 02 Jan 2023 01:53:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4f32:f70:35be:acf9? ([2a01:e0a:982:cbb0:4f32:f70:35be:acf9])
        by smtp.gmail.com with ESMTPSA id u13-20020a5d468d000000b00275970a85f4sm25889021wrq.74.2023.01.02.01.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 01:53:53 -0800 (PST)
Message-ID: <5e5babae-224d-51cf-4eac-6272df87a8e7@linaro.org>
Date: Mon, 2 Jan 2023 10:53:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 4/8] arm64: dts: Add DT node for the VIPNano-QI on the
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
References: <20221202115223.39051-1-tomeu.vizoso@collabora.com>
 <20221202115223.39051-5-tomeu.vizoso@collabora.com>
Organization: Linaro Developer Services
In-Reply-To: <20221202115223.39051-5-tomeu.vizoso@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_015359_160228_0511AF22 
X-CRM114-Status: GOOD (  17.28  )
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

On 02/12/2022 12:52, Tomeu Vizoso wrote:
> This "NPU" is very similar to the Vivante GPUs and Etnaviv works well
> with it with just a few small changes.
> 
> v2: Add reference to RESET_NNA (Neil)
> v3: Fix indentation (Neil)
> 
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi     | 11 +++++++++++
>   .../boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts |  4 ++++
>   2 files changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 45947c1031c4..61c8461df614 100644
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
> +			 <&clkc CLKID_NNA_AXI_CLK>;
> +		clock-names = "core", "bus";
> +		resets = <&reset RESET_NNA>;
> +		power-domains = <&pwrc PWRC_G12A_NNA_ID>;

A status = "disable" is missing here.

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

Tomeu, I think until the user-space stack is clean this should be removed
and left disabled.

I can fix this while applying if you want,

Neil

> +};
> +
>   /*
>    * The VIM3 on-board  MCU can mux the PCIe/USB3.0 shared differential
>    * lines using a FUSB340TMX USB 3.1 SuperSpeed Data Switch between


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
