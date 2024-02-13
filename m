Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FC6C4829A
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Feb 2024 08:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V5uCIRFWzG4nkElUu6zEyLdnDWSP2bMQLm8Z6858Rl4=; b=YmMPDObQsgY/le
	7UCOMtJQSQrMm4ARlwYOWs+9jJcoe5SQTIpV886EggqPBHtl35OQqjGZGBmMspRnnZwTUJyHXkzz5
	iYNm4rOlFZgNf8Ujbz6VXI3wJDf+UiyZ4uqgihnfXdQcxKT0KcvJzGlJaylbNLIhG5v+qktutC2PC
	zGyOPUIbc4T3mf32JkL5Xr3hpXdHSNbt+HrIK/w3qC32MBuZ0n9HDO+epnKowW3GmKlxV4cdGtRcm
	FpA7CKiCXZINOom9VkBW+Jt3z8LmApozeAlXyFMQmbEmHhwinlKejugNSsFhe4El0/zSA9vJQJjIK
	pXEbAuNZGLRKsN02zhEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZoNf-00000008Sv3-0EYs;
	Tue, 13 Feb 2024 08:43:07 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZoNb-00000008Sub-2rPp
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Feb 2024 08:43:04 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-511831801f3so2855197e87.2
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Feb 2024 00:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707813780; x=1708418580; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VhpfqVz0MC9ec7oi+QK7oU6iWsnL0uOl8qGAcGmLjbU=;
        b=B6n0BpLzp1RwQfIr6tRi6hTgIaR/JCz9gD2PFvNeTJ8VwqUIEA2srEfny/L1HgzE7Q
         ig0CTrh4mzLJUS7YVvpx6GJEgWswSi531qnwPbhqWWZXz0espdzKB3NKEaumy673bz17
         d+J94hk++hQRmcmE0wPeDLmVyWza2o6YV46N8DlHRU43F70V3ga1Ml93H2c8l0A1gWd0
         QFTx6nfdbHS9H7ecEt/wHcvgGDYaWH4+7szllPvsxkhC+/4KdYjCi+msZwVU1rcH+K7x
         5ACXNhTWVM7gpaYe02NMNDqhrLKGFT8YnDQuJsfeyKHYBrzJFC0xDmXuOPOERUizWYVV
         zP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707813780; x=1708418580;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VhpfqVz0MC9ec7oi+QK7oU6iWsnL0uOl8qGAcGmLjbU=;
        b=jGxdo6du+Uy/6HsygfMXjRI1iOdH+QGXgwg3YYJNXcI4eX6s0WMWyX9LHLtQ/dE8Pz
         /uhAMgE3lZ/PIQBFMma+Tf488WhRTL/aqDHxUCYq3FFM2vasZ/iGmMnLGSIOkpAd31rh
         vcVd8/jWMKDoHlYULH51cdKXvGT24w6mhM1N/MaNKDFDqpcfiuEPWPCkS6ZJKP1lmT8D
         pq7g4ex3hCXtHSzu8nGyM+Gm6VugL4L2yPdXad7fZod1d61FAFJDQIfvkJbEz514sDQ7
         hM8TBtDILF+pvOI9pMW6KqO+M3K1BtgYr4G3e8b3/SjEyyDQr3x8zAsfyBdJfeN+PW5i
         OMMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4nutGgO2H40wsnteRg5ReXpgAPaRyHJx1eAbQ79uqHv5HViM8Gg+82cZtCW31CTwgYLJSS1P/wZHXKikFO7qd0VJQctbOh5MjuLWXfwSvRuk=
X-Gm-Message-State: AOJu0Yzk3k+oxVsbOujTXGYp3qfs8bp3Lm2W3L/LU/w9JjtMgkviUACe
	9T+CQytgIWC/RqYHipBMs2GGv5K5ZtzUFZBI6C12L5omoghuUp19hP6l0BMQWgs=
X-Google-Smtp-Source: AGHT+IFBpSzz7faRBGR+vFyRFGR8yPdvGC5isYyOFELLNoJEC1LVWM9Gd/X5POHwe100KvQxjhegdA==
X-Received: by 2002:a05:6512:2824:b0:511:693c:976c with SMTP id cf36-20020a056512282400b00511693c976cmr6845347lfb.47.1707813779968;
        Tue, 13 Feb 2024 00:42:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUBVGFPN+xeSwxCHmog761fiYvvENViiJz0lg5+dvdTHJRwzy3+PDvkEvI3wLOxd+tarWKvUge1+E5v7xygyGZcxdoopgxt4bvYmW/EM+1mE2bjIBJ/SQH6hxQ7PzpOpRQ6YCaAzwDrapR84P9a2qo9IfShTLxQ9IJYXYf8ErLkHlgEAX2aeGl3GfEopU0wamoDwp3aiOZfhEkIdYshptWS7Z99gU39Hwk6o4qOCwMGApTw3eYd+Zn6As5BdztndK9O6+I0Y1Jyg3NFvVJcD0FKR2vDJaUQhNNyxeWuwTuhQv296PwN1CyqBGi0SKxCzuiZbpuFReNVn3RQ+femklXlXk83b8XVIVky9Cc7ftKrmBj/SsDaAM4OR7Kb+cDT
Received: from [192.168.1.20] ([178.197.223.6])
        by smtp.gmail.com with ESMTPSA id jg8-20020a05600ca00800b00410820995dcsm10446311wmb.23.2024.02.13.00.42.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 00:42:59 -0800 (PST)
Message-ID: <76638bd7-f290-4729-8d15-98e1bccfbb40@linaro.org>
Date: Tue, 13 Feb 2024 09:42:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: amlogic: add fbx8am board
Content-Language: en-US
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <77edaf7e-aeb5-4fc0-8b69-85dcddfd5a58@freebox.fr>
 <7ff2d053-7645-4016-99b1-646242463547@freebox.fr>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <7ff2d053-7645-4016-99b1-646242463547@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_004303_761052_E08E4BE3 
X-CRM114-Status: UNSURE (   7.29  )
X-CRM114-Notice: Please train this message.
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

On 12/02/2024 18:51, Marc Gonzalez wrote:
> From: Pierre-Hugues Husson <phhusson@freebox.fr>
> 
> The fbx8am boards are based on the Amlogic Meson G12A S905X2 SoC,
> and the SEI510 board design.
> 
> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>

...

> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_connector_in: endpoint {
> +				remote-endpoint = <&hdmi_tx_tmds_out>;
> +			};
> +		};
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x0 0x0 0x80000000>;
> +	};
> +
> +	ao_5v: regulator-ao_5v {

No underscores in node names.

Didn't you get such comment before?


Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
