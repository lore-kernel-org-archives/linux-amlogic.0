Return-Path: <SRS0=/4qX=OK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 093A7C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 08:24:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C43EE61077
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 08:24:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C43EE61077
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7FDPHPryobLXv/jPaOXXEBuhBYrPffyXd/o3U1vp5ss=; b=Bu0KF27cfaTLTUdadcTMLVfKSa
	qcUbxt2VNm2ZKrdtMcody9sdoYmPWC6/hOvKmzFU1rCjQM2ZH6rFIrIBDwX2QMyHhfKUMj7Yek2sX
	AyqtbbtUuO+pLSZ9RBsDcNywPqbp2B+Z7QWOYeDHgu98zMLW2t+ZG/KslDpdomt3lKAi6A82tYdI1
	26ViyaTIAOCg+N5EicmwCVTOA2rJnf6rVnmJWs+8iEweleabrgyus+pqCQ8Br0xBaRJIba+2bl02w
	ZUdk2t4lYijnrUlRHdEWouZgpxLp+vkKQv/0lb0dUPt1LCm0+gc80gxh2XrbkeOr51ze5gcah68Ky
	6yeLLTSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSEas-000uXf-0W; Mon, 20 Sep 2021 08:24:06 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSEaf-000uUB-1b
 for linux-amlogic@lists.infradead.org; Mon, 20 Sep 2021 08:23:54 +0000
Received: by mail-wr1-x430.google.com with SMTP id d6so27282276wrc.11
 for <linux-amlogic@lists.infradead.org>; Mon, 20 Sep 2021 01:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jA3PUfcB8IXDnqpW4ECqSitXcmSlkqlE5fXiosOJTOo=;
 b=FaBXEgEx8+bjza3Q5tKipeVR8HxfZxSGKrtz34erCdsVUaddUBaUM5u7wf07thayrT
 GLcm3wylnWpQD5S13RgvSlLyqi8xoTvHovPr+7f8eLw695aCraDhGx82gkE9zmzjLK2U
 kELSfQIgQ2fvzWv2Bqa0Ppcz939SlHR7tnFKxRYJ09t1KaJXhYbKISVpbGytIPrRcpoB
 B3IcP0EBQpYOcuaI8OSajxSyK9/LfCFjt+TdJns1/pfpHfjPZJujUbccOkHAnrCb6phd
 mMIoD9a9ZgQbjz2zZBVhBtGbfy7p/IxgtXwzlM5gxk5RKtzA+ogoeYYkQKGTWvnY6LTB
 S4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=jA3PUfcB8IXDnqpW4ECqSitXcmSlkqlE5fXiosOJTOo=;
 b=8KGHNU7EJsm2DTKMlo/Y4ZAni6R8KBJhnevgR8xrSLp4dZbZdtC8ySuWL8+/iFZi3v
 OfPMN5V1GsI3pGqgSTYUftZ6/zzzaYC3Yh/OwDqAlvSoCXcnzJK0jWk4i1dr2r8Rdyhd
 1/vCpD2nGdKlDeATGkk7NxoNa6nShapDuA2jQEYXxxw0+RpVU2I0PtT8E2bfTFyKkTnK
 lyAVjAtZ5VoZbET133fhs7jzGRtqyVqBDHsUty9Fj8Qe1ZwqZYjiUnc40sIMZNYQXeAQ
 CXlIO/OnR1wGl9ujFkbsz9takirdHidEuqFOk8P1vqCDHdDRZlDIl+ftzXVJ7+/DHe6s
 YRFg==
X-Gm-Message-State: AOAM531zP7JmZrVvPOXvBOSngT8m+GmdpUklwNfw6n04zhZNaTTkliUV
 r2GnRzwuFggNumw70rQwwnWOig==
X-Google-Smtp-Source: ABdhPJyySDfp0Tt9vPlhMutYIwWn7eTnlpMOdM8CIDq3Yb1eS7BY8LfohWnuU/6TFFPPEdPUsNTHow==
X-Received: by 2002:a5d:64ab:: with SMTP id m11mr24719653wrp.343.1632126229497; 
 Mon, 20 Sep 2021 01:23:49 -0700 (PDT)
Received: from [172.20.10.7] ([37.169.24.17])
 by smtp.gmail.com with ESMTPSA id y64sm11852384wmc.38.2021.09.20.01.23.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 01:23:49 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: meson-g12b-odroid-n2: add 5v regulator gpio
To: Anand Moon <linux.amoon@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org
References: <20210919213135.4928-1-linux.amoon@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <c2487717-17e6-ec0b-9569-6f9a605d8fec@baylibre.com>
Date: Mon, 20 Sep 2021 10:23:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210919213135.4928-1-linux.amoon@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_012353_157127_522E717F 
X-CRM114-Status: GOOD (  16.54  )
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

On 19/09/2021 23:31, Anand Moon wrote:
> As described in the Odroid-n2 & Odroid-n2-plus schematics,
> the 5V regulator is controlled by GPIOH_8 and in Open Drain
> since this GPIO doesn't support Push-Pull.
>

Fixes: c35f6dc5c377 ("arm64: dts: meson: Add minimal support for Odroid-N2")
Fixes: ef599f5f3e10 ("arm64: dts: meson: convert ODROID-N2 to dtsi")

> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> index 4f33820aba1f..e8a00a2f8812 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> @@ -99,6 +99,8 @@ vcc_5v: regulator-vcc_5v {
>  		regulator-max-microvolt = <5000000>;
>  		regulator-always-on;
>  		vin-supply = <&main_12v>;
> +		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
> +		enable-active-high;
>  	};
>  
>  	vcc_1v8: regulator-vcc_1v8 {
> 

Exact

I wonder how I missed this....

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
