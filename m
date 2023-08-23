Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A42EE49B0
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Aug 2023 15:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/7JC7jAOqRYDCU0RQgozL5nktSh5uCeh/h+fkrU3CE=; b=4dZ6l5w+GhScKh
	UJtP4RSQPpxZa2W1A/0bPxD6wJGULJ6cAhaPbQFHGFUUVDN5nyKdeZZJN3NEaFgCPhUzQZQIF0kzH
	ZOERKqACzA3WXOnyKRKEEIB6TVJT+RrE2SqmqnbIC+KSbMJHiaQD2KKbh/KlXUHx68D/FRyNxG66l
	MZoPiETqwMhe52GH8nEyNVi7IM81NsWdkcsBDTRgWMJ/yFujEFdgfbB/fv/DyFSy0KoynLcE5TJlJ
	EQ7QYS0gB72PWuE/XaFphIzN+/IzbR2Ybr9h03EZ9od8JIudx7iZixC+XYb01xZYMz7Vodrn5Ym50
	tnReiW+j4HjiaTNjtcmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYq4r-0010tx-2C;
	Wed, 23 Aug 2023 15:47:25 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYq4o-0010se-1V;
	Wed, 23 Aug 2023 15:47:23 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bf5c314a57so24645215ad.1;
        Wed, 23 Aug 2023 08:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692805639; x=1693410439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WurYBg+NZ6za3J4za8WbFatr1squSIdva6ePZIn2LvA=;
        b=hJqtfb1IpkzbqQ07XrqAxskBHiC2FZIK1Bm0JszMZC87fH9rBaqpZ8h6/aOylD6Dpw
         MxvAb6RmJOpOPKfwU3iuK3aSV3BXwTlYruAdpRMvDAGXXLlP2G0Wg85d1bIElvDZwriu
         JRtnruY8sGEtosLMg2XRrJ019twrzS065fXWDz9ATNQvFJM6hgz48e/350DTJ1TwUrk0
         Wq1K3hSEFxD/Q0DX3fZNk+ODezNGfFevU8yi6H2NdsRI/OoW95CDt+naUhJSRqeK9MxG
         IDa/U3vOFbqUMkFh2Aur823FySfdriErJNUqiThASQsWyIZ0Sc3y1oA+yCbYZHHrc6kH
         euwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692805639; x=1693410439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WurYBg+NZ6za3J4za8WbFatr1squSIdva6ePZIn2LvA=;
        b=DMzleM48udXmHjsWdcVZnK6at6vIoDWFSWb1wKLZn61AEuzvaMUJzjaHmaQCk24YHU
         NVRENgiesdZIUxCswSbpySuvs1aVl2QJqCykMEFfO+zjmWQVmXzXZelqqt7LaNRqQAX7
         qPQGaSo7hL7xlHUhtqWuCidpOpJTso9Zi8bg2QKrO9jQa4ePQiF3ipZ1h8SKEgaAy0Us
         hnX0jP+jjH4lYs3aDX1ie848u0CQVHcwqVslMCW7VdvVWTTA9EunAgxs6LeNmMeujDhn
         a9gSKDRQX2UXbWlpN4oszrcUgRPnz9yNT9usvINp2Ix5WYntRptAoa8lFvXKjsxZYX6o
         vQSg==
X-Gm-Message-State: AOJu0YwT8d6cbgeh9G7L9AIU2sN2mLf+l22VWHtrHCgiK/64Au8+8Wnj
	11zPVSGrUvIKpvI66DXLVAs=
X-Google-Smtp-Source: AGHT+IHPj2nDzISm/XvpmfNVtMUdMs/0WMgdpjwvz+U0QN/Qryj1IeUFu2ksYk/W00AtMbg3bvajVQ==
X-Received: by 2002:a17:902:e5ca:b0:1b8:8b72:fa28 with SMTP id u10-20020a170902e5ca00b001b88b72fa28mr12241242plf.58.1692805639441;
        Wed, 23 Aug 2023 08:47:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u2-20020a170902b28200b001bda30ecaa6sm11167111plr.51.2023.08.23.08.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 08:47:19 -0700 (PDT)
Date: Wed, 23 Aug 2023 08:47:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Huqiang Qin <huqiang.qin@amlogic.com>
Cc: wim@linux-watchdog.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	neil.armstrong@linaro.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH V2 1/4] dt-bindings: watchdog: Add support for Amlogic-T7
 SoCs
Message-ID: <88d42a22-7e07-466e-bd03-432ff3b6d71a@roeck-us.net>
References: <20230802033222.4024946-1-huqiang.qin@amlogic.com>
 <20230802033222.4024946-2-huqiang.qin@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230802033222.4024946-2-huqiang.qin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_084722_504566_0B6578AA 
X-CRM114-Status: GOOD (  12.35  )
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

On Wed, Aug 02, 2023 at 11:32:19AM +0800, Huqiang Qin wrote:
> Update dt-binding document for watchdog of Amlogic-T7 SoCs.
> 
> Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> V1 -> V2: Unchanged.
> 
>  .../devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml     | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
> index f5cc7aa1b93b..443e2e7ab467 100644
> --- a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
> @@ -17,6 +17,7 @@ properties:
>    compatible:
>      enum:
>        - amlogic,meson-gxbb-wdt
> +      - amlogic,t7-wdt
>  
>    reg:
>      maxItems: 1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
