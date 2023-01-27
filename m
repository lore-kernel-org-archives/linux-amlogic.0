Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60549C61D97
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 16:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V2vzGUjq6bVmH9VRuhyttvXi43NK19ZhpuEdXtodWaM=; b=fo19lnW7mYD3eMnVDYsk904OgD
	jb8/dKwdvsB/gIeTnlZKl/KkVSKasmx4TdbJTIzL+q9PArZtbwQHzQyJkirqZFfeY8qVo9q5yNJoY
	7HHxW6IgzSBlDEWleYjHOiLtTaEejzM2URfIUfVy28jmrvj17EmUoD6QtA5/7C8X/kaVY2tU7EUAz
	vt5hq5XCFvodDQFi4F4EAPy9EjYpx32BawnxWUznmgNMFTd4TFHmYpOcoBDWUTrM8y1iup7lxjoVS
	5PtEI9mjDZctHi1tJ10AD6V0gphEKe8lroYCGIWyhFcTUwhXnulfX0rF/fak8TE0lzsVJCUrTcsYI
	n8FaGohA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLRWm-00FfP3-T2; Fri, 27 Jan 2023 16:24:36 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLRW5-00Ff7C-D7
	for linux-amlogic@lists.infradead.org; Fri, 27 Jan 2023 16:23:58 +0000
Received: by mail-wm1-x333.google.com with SMTP id fl11-20020a05600c0b8b00b003daf72fc844so5787862wmb.0
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Jan 2023 08:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=65MO12imV1nqCcpTeXSLh3c/aVlDLZs9NEXVWBJqWRk=;
        b=wVDHfwnW/Z2+BDsP/bNqlYsc+0Obb42FoQhtkUt3II9REyXmgmnN9Mnv9bbVeXBfRy
         +56GhmfJLXI/J64TBWemi9pxLT0PrwyXIgdO5HGtoOFKAUlfjcWkiaCTmtJThB8VmwUh
         LcByHD0PCiN3MabUOD0/xVnZiHPcYIezFr+QVPtC5yK2K18vrqjnmpOBWMgpMcyQMYnN
         fv58JdLgiEN/PI8SITq8NU06Rv+mq/02zbEac+Gnvo4i2izPeLKdKhjHe4+f7PLMZJBa
         rUuR1rMx2E1XsLDuYDlpA0w3wNC1urnmV/n1KPAqCwPrjuq2HpZIIYF+l8UTVUHBqByb
         sinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65MO12imV1nqCcpTeXSLh3c/aVlDLZs9NEXVWBJqWRk=;
        b=6rNUVOzmKPnus5pr/0whDHL4szb6yxc6xtLyRh7K5cZe3uXKDVk1fkLZPSgb4A5/EK
         8zTgEpFLJITc8H+boAZq1CN7y+YIxHr2m5ZbHmBm58/KVxRxMmDesyVfBmJpGc/betDl
         SBYKt7awFn8bYfdTmRcW9erFufN79eO7toq9lherQEs7i6aPAVjrX5ltADg/mSIONC2Q
         cXLmhiUjMzRw2X/wPuJFxoTiMWdoABFkiYDrEeLUY7uzXOCl/PsyIGEK3N9uRK84pGUo
         EUNHS8ph8h4/G1QLfS7U8bSHz8M6RNAKamNaO//BN9ld0ryWuoJNokbJR4ZTGHmc/CBX
         PO8Q==
X-Gm-Message-State: AFqh2kq5Qg4ilKIZyEfKRoNYSmuokHWfmVlk7PHCf2p3I63V7/X1BS30
	TE8yYdNI/ZGPmxHEaBGIwxRlNQ==
X-Google-Smtp-Source: AMrXdXuidEmKRArhNg4hR1+6a9tqUH+Fvwc/xoaTWpcivHWXGGhJYiSN6tDkGVlXLzZqW9icUMm8dg==
X-Received: by 2002:a05:600c:1d22:b0:3d9:6bc3:b8b9 with SMTP id l34-20020a05600c1d2200b003d96bc3b8b9mr40855982wms.9.1674836631849;
        Fri, 27 Jan 2023 08:23:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:d4ec:15ea:873c:61e6? ([2a01:e0a:982:cbb0:d4ec:15ea:873c:61e6])
        by smtp.gmail.com with ESMTPSA id v6-20020a05600c444600b003db09692364sm9191058wmn.11.2023.01.27.08.23.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 08:23:51 -0800 (PST)
Message-ID: <7e52a67a-ac64-2340-3b52-83e334440d7c@linaro.org>
Date: Fri, 27 Jan 2023 17:23:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/5] arm64: dts: meson: bananapi-m5: remove redundant
 status from sound node
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230127142221.3718184-1-christianshewitt@gmail.com>
 <20230127142221.3718184-3-christianshewitt@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230127142221.3718184-3-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_082353_514297_3567FC00 
X-CRM114-Status: GOOD (  12.61  )
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
> The sound device is enabled by default so remove the redundant status.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> index 3c1267a7ffef..86f0afe6491e 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
> @@ -233,7 +233,6 @@ sound {
>   		assigned-clock-rates = <294912000>,
>   				       <270950400>,
>   				       <393216000>;
> -		status = "okay";
>   
>   		dai-link-0 {
>   			sound-dai = <&frddr_a>;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
