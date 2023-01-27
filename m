Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB15AC38142
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 16:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AfQ88Ch4QmJnjw321BH/ywnjx4q39Hx5Ueh91lI6kQg=; b=xFPwcURvJyTcTjDcC1zNfC+9HH
	B0cotEX1cOMZv+b9G/WmoHaxrI38GLFODBHb6bNgWkA2/FW2sO/TbzIXuREYHPpp8amOP+eXd9PJA
	ldtdcUKPlkzbSFUt+yqUWGwV5Fl5YJFCv4kP8dYdy0kjLd0G2ryr/7Bp7WOPX5J7zzI9R3EeAo856
	I1rAJ5OKYhSTNZ7LJAXpbrHSsy11oN7azPxq0W2JEtX6q3FpIvL7+SrBgN+r5fyfzqZNSosU/zQRy
	65r/MFQ1QggkClBPSSGNeA++UzdVppQAF35aKOCpABklMAg2BFUdwxrskcgefFl1DHz4AB324s/S3
	bsrilfDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLRWm-00FfNl-5Q; Fri, 27 Jan 2023 16:24:36 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLRW0-00Ff3q-BE
	for linux-amlogic@lists.infradead.org; Fri, 27 Jan 2023 16:23:50 +0000
Received: by mail-wr1-x436.google.com with SMTP id q5so5482533wrv.0
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Jan 2023 08:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OFZ/BTQfLUI4AMEOvHlW0oDJVdmzbciPT1PhvmheSG0=;
        b=Xijd+vNgyTj7S9rsA6yloLjWak7DQEZFGDKEiucPfNb0lKVu1UOC8FarbM8rq7Sp1H
         aIYWoVjWfDmhzIZqWFkHuc2jUBEXbBr9B8+Dlsdf1hENmYvdo5h3AJmz/r27Iu/aLrMc
         CZ5cDNSEiKVRainkE+lLmXjLvucyi1FzR91rmOtY0vDV5JMV67rYTHJoWRlpKwq6IFXH
         xlzlRMgD4Wypwux38lHdNS6BR0wrQ/pjATJrqLCSFHGA9nE5R2zRlZyn+T7XSxCDNruq
         RYgF7+KF+YCyBkKVthnqoiizKTOev/UJf7Pr82LImqGPGKqpjr/NDzooqPUvh/p6GN1O
         ys/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OFZ/BTQfLUI4AMEOvHlW0oDJVdmzbciPT1PhvmheSG0=;
        b=pL56EFXJWPYNV/cyeKm3RoD6yn8sU50fdPlARk2k8q9Ii9boxvrTrzrkV2zCjRNvZH
         bBEdaMQnvuP74x3HIOBsbMIo2tZDu8hH7C2CtnDv5epueoyTFclmXsSDoGqQ6H/Bkc0P
         szR51T+ZaFIBY3RaGCfRNYZjKnLmrhOCu23lh0O3e02JfED1bnVwDMeVDhau86sjN0Kn
         AuiY/jnRPMMvwILkvDtnmMscQjutHHO8ZvsOuIjKTFvc+U3MxLhBTvVgfUJt55PGQ70C
         GTKvUJCJLoa/lmRn0k67Pf6K8lCamCeov9M729KILyEsl83D7MkJ/cZq0Nhobc3LAaU0
         8wXQ==
X-Gm-Message-State: AFqh2kqQ5LIicdu+IdyEx/3/arhnaO6g8KG9syUt/qiIiwPK+v44/5E8
	BsVkWZXyVSbPKkrhAZiWCPH11Anbc3sroa90aBI=
X-Google-Smtp-Source: AMrXdXsICGx9XFP2osGdhhQ2tv0Rnw7eemSj1jTTYkvE8MHdg+ouYA9RBSEukdfnlM1B1j1yOMEHwg==
X-Received: by 2002:adf:e0c5:0:b0:2bc:8074:b702 with SMTP id m5-20020adfe0c5000000b002bc8074b702mr36680743wri.19.1674836625714;
        Fri, 27 Jan 2023 08:23:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:d4ec:15ea:873c:61e6? ([2a01:e0a:982:cbb0:d4ec:15ea:873c:61e6])
        by smtp.gmail.com with ESMTPSA id f12-20020adfdb4c000000b002bfb1de74absm4466462wrj.114.2023.01.27.08.23.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 08:23:45 -0800 (PST)
Message-ID: <24c7e160-762d-61f9-1745-4d91a29ff0d6@linaro.org>
Date: Fri, 27 Jan 2023 17:23:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/5] arm64: dts: meson: bananapi-m5: switch VDDIO_C pin
 to OPEN_DRAIN
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230127142221.3718184-1-christianshewitt@gmail.com>
 <20230127142221.3718184-2-christianshewitt@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230127142221.3718184-2-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_082348_581127_10FDF44D 
X-CRM114-Status: GOOD (  16.48  )
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

On 27/01/2023 15:22, Christian Hewitt wrote:
> For proper warm (re)boot from SD card the BPI-M5 board requires TFLASH_VDD_EN
> and VDDIO_C pins to be switched to high impedance mode. This can be achieved
> using OPEN_DRAIN instead of ACTIVE_HIGH to leave the GPIO pins in input mode
> and retain high state (pin has the pull-up).
> 
> This change is inspired by meson-sm1-odroid.dtsi where OPEN_DRAIN has been
> used to resolve similar problems with the Odroid C4 board (TF_IO in the C4
> dts is the equivalent regulator).
> 
> Fixes: 976e920183e4 ("arm64: dts: meson-sm1: add Banana PI BPI-M5 board dts")
> Suggested-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> index 028220ed45ad..3c1267a7ffef 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> @@ -123,7 +123,7 @@ vddio_c: regulator-vddio_c {
>   		regulator-min-microvolt = <1800000>;
>   		regulator-max-microvolt = <3300000>;
>   
> -		enable-gpio = <&gpio_ao GPIOE_2 GPIO_ACTIVE_HIGH>;
> +		enable-gpio = <&gpio_ao GPIOE_2 GPIO_OPEN_DRAIN>;
>   		enable-active-high;
>   		regulator-always-on;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
