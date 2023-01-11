Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142FAC46467
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Jan 2023 08:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bnAUKyiL6sTMiz8xHUmOCFhL9AVJ+3Xdrrf9QYFiuhw=; b=yLRRzfe91W2Q5t
	XgEeiIAHLk5hsKqvOSw3DnA/5eZFE1HsGZts8qN/hJK+3od3dQp9z7DXb5ku/lPHR3dRJkorQIwpA
	fQLrPkIDRieHE+1bnyc3ThTC4oUGXtoGLnngjnSVSzBAt80QMk2HXXcfdGFqwMSo6iUq7SDya728B
	ilsBxDJmoZTGG4TCfF7fXiy1+vjINKoh+pU+ELuHYaNfPwLEUm6mhxIXKCuknyEHwJ4WNJEb7rC6V
	D/b122tUrSTWuXVmAQYhSxzqCXmj/+OiulIQwt2p612dBPmStGs2sxUbaD8C9DHmbuQYB7zEco49x
	inX85OBc5sDBKGXZadxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFWvL-00AQlF-Iz; Wed, 11 Jan 2023 08:57:31 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFWv9-00AQhT-UN
	for linux-amlogic@lists.infradead.org; Wed, 11 Jan 2023 08:57:21 +0000
Received: by mail-wm1-x333.google.com with SMTP id ja17so10591674wmb.3
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Jan 2023 00:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yw1hwfBWZKA4eArOgxuAWfDDW9pVN08Ny+kHlfHHKTs=;
        b=EsvdekbA1p6fczMMI+X8YHscBob+aET+s9nzz2DHvxICrDuOVSrctw1nY7odovVL39
         01ehLvGkrNayur3gslwYliDe/6pzX+yBCy791xBRyfh7Paq5OnBNZcX49U7gAbsaDjZY
         Ug5Ruc6ugBj2mD1tkRFSB07sXSPgJP3wTZQqKjiBbsBqb7r5wHU6hJRNnJnEqthEqOjx
         9sgf9mryQElHyOqbExivXJ8vrGTJF7sq7yp70Jy8S2IPpSyZDRCt7kVE1FqsBJ+C0Ine
         rRkbnJvSu8zPLog/zZN5zgEPIdrJjTiH/hotkDNh54uzKFi7P5eEF2H52JKS6cdtgsve
         uRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yw1hwfBWZKA4eArOgxuAWfDDW9pVN08Ny+kHlfHHKTs=;
        b=x9otmzY6LC/thLxzqgMfkspQX5/VwZd/sOYW/JIEEh24cTHWRS/mcutAo53czf4bGe
         2XXhSUfZB75y6M/ZJk6+svX7uwG4R9nc0ii9KqW6rIwN0TPSXSpVk7VsgZKj8OkM+Dyz
         7JtF79InnqXRwgxzxVbDiQsWlIP3ORnzXaU/czDlDvpHdMAVYHKGkCKvr5sjmZVhlh69
         S12fGcF1akmogFu9naAPRPlpaGN0YIIZ3FnPsk/JSpKyocg/PmqufxdXMPonw9LVTe1e
         LSG5hfkn9P3++I+Ay2/JF8iiqi13c8q4OyfFw+BEWxzL3ZMI8Tfvv7jDYGQ3/vbbAqj2
         ynvA==
X-Gm-Message-State: AFqh2kpBhwivxUFhgOsFF2gUcTe4vTA/OrsHjH0j1eg3p3OoKoEG2Bl2
	6G/lajq++qtTS6J0+PDjqGhEswzQLM757D+g
X-Google-Smtp-Source: AMrXdXvfW0wGX2+BKbHuSVV9VoySBr4jZ/ApUkymTjNbEWMDTOqC6kNxLWXp4WimVhnYj6p0nXlHuw==
X-Received: by 2002:a05:600c:2318:b0:3c6:e63e:23e9 with SMTP id 24-20020a05600c231800b003c6e63e23e9mr54445395wmo.24.1673427433668;
        Wed, 11 Jan 2023 00:57:13 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q20-20020a7bce94000000b003c6c3fb3cf6sm17307533wmj.18.2023.01.11.00.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 00:57:13 -0800 (PST)
Message-ID: <39ed8a13-8b27-80d4-99b8-5693ce6d3f58@linaro.org>
Date: Wed, 11 Jan 2023 09:57:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] arm64: dts: meson-gxl: jethub-j80: Fix WiFi MAC unit
 address
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 adeep@lexina.in, khilman@baylibre.com, neil.armstrong@linaro.org,
 jbrunet@baylibre.com, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
References: <20230110215926.1296650-1-martin.blumenstingl@googlemail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230110215926.1296650-1-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_005720_013858_4EE34C42 
X-CRM114-Status: GOOD (  15.49  )
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

On 10/01/2023 22:59, Martin Blumenstingl wrote:
> Unit addresses should be written using lower-case hex characters. Use
> wifi_mac@c to fix a yaml schema validation error once the eFuse
> dt-bindings have been converted to a yaml schema:
>   efuse: Unevaluated properties are not allowed ('wifi_mac@C' was
>   unexpected)
> 
> Fixes: abfaae24ecf3 ("arm64: dts: meson-gxl: add support for JetHub H1")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
> index 6831137c5c10..4f742e1b9301 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905w-jethome-jethub-j80.dts
> @@ -90,7 +90,7 @@ bt_mac: bt_mac@6 {
>  		reg = <0x6 0x6>;
>  	};
>  
> -	wifi_mac: wifi_mac@C {
> +	wifi_mac: wifi_mac@c {

While fixing the unit address, maybe also fix the node name -
underscores are cause warnings and should be replaced with hyphens.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
