Return-Path: <SRS0=pdBZ=4R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC7CFC3F2CD
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 16:29:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0D062468E
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 16:29:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nqLC8hM2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SIEnl2c4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0D062468E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JHjcl4K9RHJvETQ4t4Bp/zs4HSBesBZCR0VXb1JXj8g=; b=nqLC8hM2Osr2WM
	/NP165aHOPICARA638rdO3/LfmMul2iU+Uj8BXIRJoPWBmEGgerB77r61rB+D3mBzFpuU2ny2rQJ/
	JlT9YsS6OMYcX0CiR74bdJzKQajpey8ZKaXcd+2ACf0GjZQjlCFuWR8ivrLXS5ty4i1Uq4MThPlme
	O7IVIIIzu116Y4pzwi6Jxfbiu2gJcyiNnXsUyp4YRZhHVwGYADSHghMsAi6JvCC/pSaozmrYflg95
	ymsibV+TODNE/VPM0zmdSH/n/OW5XuBjwlw9JUw4yPOwSuj28t6QBg+t728SvsacW0Cq/kuJK0Cgl
	KYDkvFFYzv+MIHUopEWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j84zD-0004th-Q4; Sat, 29 Feb 2020 16:29:07 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j84z9-0004sy-Uj
 for linux-amlogic@lists.infradead.org; Sat, 29 Feb 2020 16:29:05 +0000
Received: by mail-wm1-x344.google.com with SMTP id 9so485519wmo.1
 for <linux-amlogic@lists.infradead.org>; Sat, 29 Feb 2020 08:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=/nhS7fRXWHjddQ2mW6qgUCBhU766o/FgbNANhrsBC+c=;
 b=SIEnl2c4LTlz56TnuowihDkAwHNgn0iRVkJm3p3VjdUo+NAOW0iAVBgUQCS93z+qC0
 NT/o0F4dGyDIfEKjqkkST4MXWGElsz0Ms3ijH4V1bTcuhOe2N/ISC7T3Pw33rNt1yb6i
 GoLFZG5G0clR5UIczr7iKW2GGVbFANq8SyTJzqmqYAgJBEFmyOo0FEBRgbcFXLdiVt9Q
 UpniXAW9a39DtmI3q75R0yMYdeZHZEwOc8LSKN3YTICHjqoYUuBiPT1nralowAP0Tnnv
 u38Hk6QCZptvhO+2BwbnflrKwueq3HYZMib9xY/OO2HWHKK8aubquWy/I7h3o0bMu9Kk
 X00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=/nhS7fRXWHjddQ2mW6qgUCBhU766o/FgbNANhrsBC+c=;
 b=Lz6hQVbYHmMRe8WUZSV0KZ64aIMqhXUb6NmkOLTDQ5r4/L52pcF9q29R12bmouqHKe
 abPG4bufS00zGBujK0nFdO0hKJC/fG5xB8OOxYnhMboMI3TRGiws+yVS9/kwH6ZpHRgn
 zQd8LvHkui8GtqhH0WwOVXBJ+ZSHb1O0gtih70nPV8pqQYGvWw2xCPG2IOr+nm2eSlUr
 yZnE3HJkbPP6ZvN+2sIL6uqfPlH9iyRnVRrcpZWW1o6Rzxn1nWS5Lath0PSW3cSDXnPc
 Ih1d1b3WIqb8NrfqO1zsZUTK+HQ0f3qw6oI+8OO2O0ffLizUfxl5LL/+D4pqfnSJGaYK
 5SHQ==
X-Gm-Message-State: APjAAAWhOTXiCDjfyRN2ZKc9V3YjCb1kwAmCCC0gBPrleQ1Hc3QD4pvJ
 NG6me1n9kF1cvJQxKfGGxQn0ig==
X-Google-Smtp-Source: APXvYqzfqcYtCrS+L+2YW0wCapvE4z22/nu0RMLPxck3ioY80N+w/B/BrxC//vE2fGmjFlcQRyFnqA==
X-Received: by 2002:a7b:cc6a:: with SMTP id n10mr10430395wmj.170.1582993741675; 
 Sat, 29 Feb 2020 08:29:01 -0800 (PST)
Received: from localhost (229.3.136.88.rev.sfr.net. [88.136.3.229])
 by smtp.gmail.com with ESMTPSA id k7sm18113920wrq.12.2020.02.29.08.29.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 29 Feb 2020 08:29:00 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jianxin Pan <jianxin.pan@amlogic.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH RESEND] dt-bindings: power: Fix dt_binding_check error
In-Reply-To: <1582856099-105484-1-git-send-email-jianxin.pan@amlogic.com>
References: <1582856099-105484-1-git-send-email-jianxin.pan@amlogic.com>
Date: Sat, 29 Feb 2020 17:28:59 +0100
Message-ID: <7h5zfpbbn8.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200229_082903_988624_08849DE4 
X-CRM114-Status: GOOD (  12.98  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jianxin,

Jianxin Pan <jianxin.pan@amlogic.com> writes:

> Missing ';' in the end of secure-monitor example node.
>
> Fixes: f50b4108ede1 ("dt-bindings: power: add Amlogic secure power domains bindings")

Thanks for the fix, but where did this commit ID come from?  I think
this is the right upstream commit:

Fixes: 165b5fb294e8 ("dt-bindings: power: add Amlogic secure power domains bindings")

Also, when you resend, can you cc soc@kernel.org.  The soc maintainers
are who queue my amlogic tree.  I will ack and they can submit to Linus
for v5.7 so Stephen doesn't have to carry his local linux-next fix
anymore.

Thanks,

Kevin

> Reported-by: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
> index af32209..bc4e037 100644
> --- a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
> +++ b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
> @@ -36,5 +36,5 @@ examples:
>              compatible = "amlogic,meson-a1-pwrc";
>              #power-domain-cells = <1>;
>          };
> -    }
> +    };
>  
> -- 
> 2.7.4

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
