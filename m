Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EB5C54EBD
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Jan 2023 07:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tuWTRJhVIcqsK4FRwZoZ2qHcuKGkO80VwxrbId8QWcg=; b=KU8J3gqOZOiME0qUSA5GiI5aS+
	Lo8OwmJP5e1z1P0KDao4CEcOu2FgpYAGYnO6uaq5ar/2WbATVcijHfzD0PimnfMDw7APEXsIcefx6
	DdTLKcRUFwpGvWpC28JTm1qxpkz6BKMFLtuwJ0H85xZ40vOTxbpRwXYCHj44UlipShE3GjEwvj2dU
	Mz1+DnWUwh9RzAlQ7kJJSDdZ855eIO9VbWTIiW0qOPfWrLtqy98V24kH9f75Q8hvtdzxJic2r/fUK
	m+iiBoqE9vKf3kPxhs/qpbQkpiLbyYGeyCi6UrCFjD4rmvcB6U4PS3a3EA0GbzfUDFKpV4jz3YBID
	andt1ghw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGExx-0013hW-42; Fri, 13 Jan 2023 07:59:09 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGExh-0013cU-Kj
	for linux-amlogic@lists.infradead.org; Fri, 13 Jan 2023 07:58:55 +0000
Received: by mail-wm1-x331.google.com with SMTP id j34-20020a05600c1c2200b003da1b054057so2464305wms.5
        for <linux-amlogic@lists.infradead.org>; Thu, 12 Jan 2023 23:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2CYFqovSzVHBxFSUaQCsOuxkiPS8Ixm67dj6DWus2UU=;
        b=kUmMbJ/Fcrf7xVVomeL/NuF0+/87TSUrJx7IhyBajtZCxR4X9z5IIZDPVNbu+yVy0V
         0b6YrTSNExx2IDhWfQulO5E5l6tiCvIoVW5FwdrfKNluudVTTH7ZOLVTemY9tbm5NzrY
         zYMD0sO51E2tylfpkuIT8Z5SCTR/pgcJRIZKbvYYZKHWk2bfM+1EFBVwTl/IyR0+6BWg
         O64miOEcXq6gVaA4SJG1l+x0FS2q2g1yfhrw5Ts3gYFd9p9QORkdV46JX66csMqP8iya
         zHKnUuOc7VdYFzSuKNN5mWK/urd3wrHQUYMZDUHZnUglefwpaOgtzVEIDd84mtyYYKmE
         O6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2CYFqovSzVHBxFSUaQCsOuxkiPS8Ixm67dj6DWus2UU=;
        b=ya7NA7x8o87J4ZONa9N1PhRIRdTlgx42RlBIScm1cMC2jnegvuTrK67oKowtBHpBa1
         sJ2MfuHsT5XN3i0d7LjU7X/mWRxFcECyF7JDo1zkr44YllDrPkNn3YiZAAxob5Mezd5P
         kU3SsO+0yOyXaw/POzGY78p6rP6+HGsMKbdsqOJOiB/3CLirUnOUMXwtuuvMVGssm6ui
         3ZFFQwpRGj9AteYnjF4b/tnA+IKn1KEdtnEu1D4jktacnt33bulIlGR+2T3Jk4iqmk8v
         a8QJ99UjaGTNt3FJFGkd5kwzsaJd2a8GRw6kcQOfPGlRmDK0+t1lAMq5csU9UZbmFBeg
         szOg==
X-Gm-Message-State: AFqh2kqHDhrhmNuqOKar27oYg5tssXhCxLsk2lJovXJLhPYuOjWWrFyB
	ks4Rw6bTrtxkStYhE1FUBPSpCA==
X-Google-Smtp-Source: AMrXdXsdpE1ttuWm9jTS4AtyOfLNQsH/mYReqqftIQmPvZVg/2G0n3Rdg+fcjuHifn7a/oT8XK3BtA==
X-Received: by 2002:a05:600c:4e44:b0:3d3:3c60:b2bb with SMTP id e4-20020a05600c4e4400b003d33c60b2bbmr23716743wmq.23.1673596731509;
        Thu, 12 Jan 2023 23:58:51 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8660:aed9:5ce2:6bbb? ([2a01:e0a:982:cbb0:8660:aed9:5ce2:6bbb])
        by smtp.gmail.com with ESMTPSA id iv14-20020a05600c548e00b003b47b80cec3sm33156346wmb.42.2023.01.12.23.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 23:58:51 -0800 (PST)
Message-ID: <adb5145f-a084-af03-9ba7-5d5fc2a4d6b8@linaro.org>
Date: Fri, 13 Jan 2023 08:58:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/6] arm64: dts: meson-gxl: jethub-j80: Fix Bluetooth
 MAC node name
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, Vyacheslav Bocharov <adeep@lexina.in>
References: <20230111211350.1461860-1-martin.blumenstingl@googlemail.com>
 <20230111211350.1461860-3-martin.blumenstingl@googlemail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230111211350.1461860-3-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_235853_743397_794E5D41 
X-CRM114-Status: GOOD (  14.30  )
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

On 11/01/2023 22:13, Martin Blumenstingl wrote:
> Node names should use hyphens instead of underscores to not cause
> warnings.
> 
> Fixes: abfaae24ecf3 ("arm64: dts: meson-gxl: add support for JetHub H1")
> Suggested-by: Vyacheslav Bocharov <adeep@lexina.in>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> changes from v1 -> v2:
> - new patch
> 
>   .../boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts     | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
> index 270483e007bc..bb7412070cb2 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
> @@ -86,7 +86,7 @@ sdio_pwrseq: sdio-pwrseq {
>   };
>   
>   &efuse {
> -	bt_mac: bt_mac@6 {
> +	bt_mac: bt-mac@6 {
>   		reg = <0x6 0x6>;
>   	};
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
