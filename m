Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDADEB64DD
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jul 2023 13:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PXMdyyvcYVPoFs2tZmyp6iQxTGtC7my1s8vuWVfNwVo=; b=S9NSwWNhu4f2Sp
	ri22QYprb1mqIt5zoFSjDWZorg9DOnJzUhfPf5reR68CDV/YiIWD5mVVnXrWj3ePIugJAVEfz0jNA
	Mgij83U2pTsyxiTdEzA4M8cmPY5gTcBLyiYzcXFEvfPIlg1QYQEf5i76iQO6Ccq/VgWqWMwGZ6rda
	WviQUTYUKV7g+UXXmytbGkfcB73Uv0KTJEGmbas3y4vFL27ny1tvuSNAt9+d7IC+45FCN5iLdq4Wz
	+ANL3LH86ghAIYqyAjFKVn8RrKV55glV8t0XJszOIeA5o9SlLMkAslXFPhsGl9/4IFO3S2rfxaZR2
	efsu6WucVV2oFlL8RW7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJM4-00AbAw-0O;
	Mon, 03 Jul 2023 13:12:36 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJM1-00Ab9p-2U
	for linux-amlogic@lists.infradead.org;
	Mon, 03 Jul 2023 13:12:35 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbc0981756so42072895e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 03 Jul 2023 06:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688389952; x=1690981952;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QKzjbaIgnIombKyMIib7qqY3jsIUiwxCqbvrBlGncK4=;
        b=ERoVkEkfHI7aOWSjWlRDt4sDjlGc3pbfjEIR1Xi0onXASTGgBQ3ZGsr+uH1Yt9XsHY
         7XhjhHrcmLWCSrKKqb0XMVOA1G0dG0tTsm6RCQnbbM5SJdMrcr3UM0mUxCVt5GC5UJo1
         skTUo1es3siZ7aRH2XbGV78uXJwyF2cLFa6pbRQNmhDrEe3HEIl5mQ86KmmFUpx5wbVW
         3fiPQaV7h+gIeJDNAnqWkrELmPW9N+G7/i51DlwEYly1YvN32zEffOW6C0xmAv4x6iUe
         hJozW7DqgmDoNYvyT67jT7v3v3NWy5I8HzERc9p8z0RthvjCbv2MSMnTQNMGIFShBOKS
         P+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688389952; x=1690981952;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QKzjbaIgnIombKyMIib7qqY3jsIUiwxCqbvrBlGncK4=;
        b=NfgK5zmYx4q0Zfuy3ssoBqO1Ozo7XTA+ERbrSmm8GJLjyfcSOxaRJ3vVhzlRr0A9Pv
         Mhs3yNNfIHGhocG/ZlTfOQx/N5Q8tk4e4onuwvhAhAt4EhChg8a8IwPY10IapCcBAaIS
         pklmS4I8ff271ARywunhBi1ycxQ6lj9px/qCj3haWfgU8TmNM68YCrLHawttCMK7w5Ed
         uQpvsk/mbPrjm8nptOiGGKyv7UQ838D2TD1uqfUjOG7C/SCiYKR0332NhJtta8/Tc5Q9
         igKawdfJQkVKG+iuY0/uCCSdNeFWJD4M5TTXZKKnhMifOFdN+n4VRatWmpNHz+G98ugm
         HuuA==
X-Gm-Message-State: AC+VfDzaBI9F5guYzENHaFZHLyYKCd7Mgq6IgWAaC7j9p1mwKEYLysUh
	prUMYboWUsb6VApf5QxD5BLmrw==
X-Google-Smtp-Source: ACHHUZ4vQVWQg5VnD+c85J+p/WSP+uTvOOXNZORtq5LfjCclTzh2iyZKnqMpyx6VkF9lyaMOIspoHw==
X-Received: by 2002:a1c:6a1a:0:b0:3fa:98c3:7dbd with SMTP id f26-20020a1c6a1a000000b003fa98c37dbdmr7712700wmc.41.1688389952033;
        Mon, 03 Jul 2023 06:12:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u3-20020a7bc043000000b003fbdd5d0758sm904403wmc.22.2023.07.03.06.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 06:12:31 -0700 (PDT)
Message-ID: <992f74b3-373c-14d2-12cc-85ada068d54b@linaro.org>
Date: Mon, 3 Jul 2023 15:12:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/3] arm64: dts: add support for C3 power domain
 controller
Content-Language: en-US
To: =Xianwei Zhao <xianwei.zhao@amlogic.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>
References: <20230703093142.2028500-1-xianwei.zhao@amlogic.com>
 <20230703093142.2028500-4-xianwei.zhao@amlogic.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230703093142.2028500-4-xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_061233_810542_04AA4312 
X-CRM114-Status: GOOD (  12.84  )
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

On 03/07/2023 11:31, =Xianwei Zhao wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Enable power domain controller for Amlogic C3 SoC
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> index 60ad4f3eef9d..826c51b1aff6 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> @@ -47,6 +47,16 @@ xtal: xtal-clk {
>  		#clock-cells = <0>;
>  	};
>  
> +	sm: secure-monitor {
> +		compatible = "amlogic,meson-gxbb-sm";
> +
> +		pwrc: power-controller {
> +			compatible = "amlogic,c3-pwrc";
> +			#power-domain-cells = <1>;
> +			status = "okay";

Why do you need it? okay is by default.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
