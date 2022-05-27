Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439C7C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 May 2022 13:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fQqh/TKJP0k2v4EvCfqxPOytXitvNqu8qiHtyxiIEvg=; b=YQ02AgH2fQHtiE
	nLbHp0Yt4j1mor8d6sz7TGJeLqPqiLT5+LuDlcNeKJzXT0w0pS2w+q2JPYINyKTB9SQCPDvFPpmoH
	yMaFnKCSMaFTF28OPOgaB/4aKh0sxLF9sXijDBAgeUIuMR6mmWfnqGCJVIFTmGB15GmPw0mDIWZ+k
	2EKXt9/ZMWoKmTzI/C5+S06mzaJ52C2K/horhtdIMIGkVpJKbNKna4+nu3DPvV11lvQJqz/w3qb/T
	ugbmxaYWfSxm1miBCZ4f5D236101fER16m5UO9VCiznxWyeiy4ubtyXT7LdWk2RATE3KQIJRyasbe
	mFWtrFgxC6K5c2Y1Ld6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuaHs-0009sl-Da; Fri, 27 May 2022 13:45:56 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuaHX-0009nB-2u
	for linux-amlogic@lists.infradead.org; Fri, 27 May 2022 13:45:37 +0000
Received: by mail-wm1-x332.google.com with SMTP id o9so2700401wmd.0
        for <linux-amlogic@lists.infradead.org>; Fri, 27 May 2022 06:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=jBX6sPP/edoe4coCPmiUBmbs1kcK2bMRWX97xjgtvx8=;
        b=JWLI8KLcxTNF3ggaTQHWvElnpoMg5ySLRYT9qMnjpJ26mb4XV1XZnrtGP6RdIb63oU
         vVdTAiv6SK9RQ7WGAxamRpwlEDXpQv2X6QNcMsKFNrXb6zdxCIiw6HLV7DD4JV1NqL8R
         xwau3E89cavQkVogB64htJPJdOo//B6QRNen8YVJ+p2ldlm+MUov87XMIJsBZfMS2Epu
         1m2Ds2dbBDUbrajs7hUy1hkqjNSYWFRaLX4KS0vsnUy0EqF62XGRK4v6cmlsvcWt+sQB
         4K5HeuAIW/7e2qjNvc/27xOiqY5E1lmLiUeMsi13xzYP2MG5nF1lpVEvjORm6JdgGPjp
         j3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=jBX6sPP/edoe4coCPmiUBmbs1kcK2bMRWX97xjgtvx8=;
        b=tTGdYj3R8lG90YhIDqyCxU6KBZACAQhK+C6at9uBOkO/vhGuSj70/bNx2oG50CDC56
         l0mk9fs6je/EM4m9H3P94rrfC0c+j2EeiiSHb1iqL19G/WmOj86ePhJng5RnDYxMdW1i
         sLEBEpWSkwHDkj4MF4fLvL57Jf8zq1dyXxY5bmw5vGupYdbAxSRUhdSYYalESZZenJIo
         mbHYsDD8QX2GL1ZSB2U6MfoOV438wGLihuCLB1nhUF4U7ur7nuhm04lmk46++1h+1dO4
         lVLsx5EQIjaMsu1KP7qtlVUdk2AWqpyvloO3Rtd5MJGB43JbYelBQAqJ7IbGAOquC0Ri
         +AyA==
X-Gm-Message-State: AOAM533WfbHwUAbO7m6r1Oms9GM3ggYpyl94TXk8N7eoKgT5MxXfmbZM
	R2da0aMzIlC64QbxveTVDuFm6A==
X-Google-Smtp-Source: ABdhPJzPdKyv3HnK5pKB3f32K0HPpugENpmEnYc8YylJwZqpuwS9yD2Zu4cpYiY8OxyWx4YH6xFk4Q==
X-Received: by 2002:a05:600c:154d:b0:394:8d64:9166 with SMTP id f13-20020a05600c154d00b003948d649166mr7123702wmg.102.1653659132457;
        Fri, 27 May 2022 06:45:32 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:f081:5ded:fc86:365d? ([2001:861:44c0:66c0:f081:5ded:fc86:365d])
        by smtp.gmail.com with ESMTPSA id e7-20020adfa447000000b0020e5d2a9d0bsm2107939wra.54.2022.05.27.06.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 May 2022 06:45:32 -0700 (PDT)
Message-ID: <a6b1fd65-d6c4-e3dc-d237-9cb2e72bbecf@baylibre.com>
Date: Fri, 27 May 2022 15:45:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] arm64: dts: meson: add reset controller for Meson-S4 SoC
Content-Language: en-US
To: Zelong Dong <zelong.dong@amlogic.com>, devicetree@vger.kernel.org,
 p.zabel@pengutronix.de, robh+dt@kernel.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
References: <20220526130158.36651-1-zelong.dong@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220526130158.36651-1-zelong.dong@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_064535_414370_C96B8D44 
X-CRM114-Status: GOOD (  12.49  )
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

On 26/05/2022 15:01, Zelong Dong wrote:
> Add the reset controller device of Meson-S4 SoC family
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> index 480afa2cc61f..c750bc60786f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
> @@ -94,6 +94,12 @@ uart_B: serial@7a000 {
>   				clocks = <&xtal>, <&xtal>, <&xtal>;
>   				clock-names = "xtal", "pclk", "baud";
>   			};
> +
> +			reset: reset-controller@2000 {
> +				compatible = "amlogic,meson-s4-reset";
> +				reg = <0x0 0x2000 0x0 0x98>;
> +				#reset-cells = <1>;
> +			};
>   		};
>   	};
>   };

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
