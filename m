Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED71E80A92
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Sep 2023 06:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kCW8js5O9bFhYG768hfzmxtVGEOP8JqN3mi714WUgJE=; b=BnKMJoooaTIonA
	iMRWpqkYRqeITX4MJcjEYo0pSmzXkhnhBdx8Ma4EE/QH/RQZ4jB97DALwZLl4683ca86vZOoFrjJP
	YNMydNMiUFUk0C3i/13nYkyRzySlSHil0XvX8gd5p7Z7SKCUuIF7RYEWSV4ojaGOO2dpQ8P1/oEAb
	Mpn4F9AlJKbMhOFWiC+Vq5KQDieKuTctE4jpIp99YULEGqFyHOUEnKYoucxyFIPhmGa8Q4OrScaSi
	BpcnnJ2CqH6nvMvIxEw25zpZWsK7tNAKLrmfJCJOmUfNjNmRQlzTmBRDV1FYcGvZoEyje9QYHhaai
	dfID+PQRp9V65Wb1+UgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlNij-0004SR-2W;
	Wed, 27 Sep 2023 06:08:25 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlNig-0004RU-2B;
	Wed, 27 Sep 2023 06:08:23 +0000
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40535597f01so103891885e9.3;
        Tue, 26 Sep 2023 23:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695794901; x=1696399701;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bH2ZBDFihZ5G3MXi10qtfUOqTCbjZERCfSpFkYReq6E=;
        b=opVIuw7x0Xbz0h3eogBKu8gJKy7xmhePKl25TcVqbtuOv2lds1bA9aqNfAi+bqbLuf
         +xYrQ0qvVP6OPnK7Yy6rGe9WgoZq3jpbitVzvK3y4PkljSlmOl5iFdbI7kOfObnIqIOO
         Y7GKVx/mAaD8JLVq6QrehLwMaF+eHmZ6Y077Gm574AXKvJf1dcLD80obhDDwLekXX7B2
         y4xMgGLcxiyP+9UHgzF7DKXRws/Sl+Tts9WsC/YAwkuAwBnugtcTVmIfMn0xF+Dclp6W
         QSv/CjMym20ddMCQyYzeEi47wxMsDkSWP3fpHWaB9Ky9px/UDZ0Lp0hZourj9DiSUkrx
         CQoQ==
X-Gm-Message-State: AOJu0YzWXai1+FnjkMRiZ4bFWol9xH0bcc/wdIJzMN+zw6oKn9YFOvlQ
	qnz8q68V3ZQNQmmesumeQak=
X-Google-Smtp-Source: AGHT+IEGCnSX2ywr0S6FC1D6CnGJQJEwSb0KUpp+zJof+5WezKUECmQWZoWWn5U2hNhP3cz+xHVOrA==
X-Received: by 2002:a05:600c:2149:b0:3fb:b3aa:1c8a with SMTP id v9-20020a05600c214900b003fbb3aa1c8amr1027557wml.16.1695794900576;
        Tue, 26 Sep 2023 23:08:20 -0700 (PDT)
Received: from [192.168.86.246] (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id s9-20020a05600c45c900b0040550c20cbcsm12015055wmo.24.2023.09.26.23.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 23:08:20 -0700 (PDT)
Message-ID: <ab5d0544-b613-42c1-9b20-ab26c3785175@linux.com>
Date: Wed, 27 Sep 2023 07:08:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 3/3] arm64: dts: Add pinctrl node for Amlogic T7 SoCs
Content-Language: en-US
To: Huqiang Qin <huqiang.qin@amlogic.com>, linus.walleij@linaro.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, brgl@bgdev.pl, andy@kernel.org
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230922094342.637251-1-huqiang.qin@amlogic.com>
 <20230922094342.637251-4-huqiang.qin@amlogic.com>
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <20230922094342.637251-4-huqiang.qin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_230822_720652_54F1FFE7 
X-CRM114-Status: GOOD (  11.54  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 22-09-2023 10:43, Huqiang Qin wrote:
> Add pinctrl device.
> 
> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> 
> V1 -> V2: Unchanged.
> V2 -> V3: Unchanged.
> 
>   arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> index dae3465bd39b..a03c7667d2b6 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
> @@ -155,6 +155,22 @@ watchdog@2100 {
>   				clocks = <&xtal>;
>   			};
>   
> +			periphs_pinctrl: pinctrl@4000 {
> +				compatible = "amlogic,t7-periphs-pinctrl";
> +				#address-cells = <2>;
> +				#size-cells = <2>;
> +				ranges;
> +
> +				gpio: bank@4000 {
> +					reg = <0x0 0x4000 0x0 0x0064>,
> +					      <0x0 0x40c0 0x0 0x0220>;
> +					reg-names = "mux", "gpio";
> +					gpio-controller;
> +					#gpio-cells = <2>;
> +					gpio-ranges = <&periphs_pinctrl 0 0 157>;
> +				};
> +			};
> +
>   			uart_a: serial@78000 {
>   				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
>   				reg = <0x0 0x78000 0x0 0x18>;
Tested-by: Lucas Tanure <tanure@linux.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
