Return-Path: <SRS0=FFcv=4T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF8FC3F2CD
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 16:31:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 786BD21775
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 16:31:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ROIX8sD9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eoSemUK7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 786BD21775
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ku/L+0n07JxAEnb4MnBQmVjEhYr1fL8xsUqUn7x2keU=; b=ROIX8sD9/8mY+p
	6gq4ZhaWZPvwrVIfymUHHq6YE57Q5IV9cair3NlrneHQVRjaAKPFyGHFwpCMoq/zdyUFtOagOxba0
	u1YrxBjDMFIDYNYBJhNzH4MeI2vtv/KB8e+gQjzUZ6kk3fCUrO278Izj92zUiYrCpBRMfk5Z7WDTv
	bRChhuTQrhlyg2jZkFpTvd3AhQT24P0q34Nraxaapi47vopvCVDYdK8NSoTvJMaoqooU5JDuWzzIg
	PvxlQHNBZeiJz0cLAHilHFuzEtSmjkQWVMf/KGwRQan+ItCgHtPvnffeVYZAhWdyaXgxPNmmM27wy
	vpFR43tYoRzhLGrz/o9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8nyK-0006H4-7R; Mon, 02 Mar 2020 16:31:12 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8nyH-0006Fy-3a
 for linux-amlogic@lists.infradead.org; Mon, 02 Mar 2020 16:31:10 +0000
Received: by mail-wm1-x341.google.com with SMTP id m3so11284015wmi.0
 for <linux-amlogic@lists.infradead.org>; Mon, 02 Mar 2020 08:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=9ekD/wZU2juB89x3ikSs3OkvRfctZBZxxFo0UhHx8JY=;
 b=eoSemUK7ZEaNlKrg4HP6Fdxa2bm/AR3bYZEjvkL17es58SixQJTcPwvyZwNOpDQ8A/
 MQG1tGVsfuxNYI4m+NO7zBAFHQJmYENCdyK126T8b/+5n0RtMHVIIRFI3KCqz1cZ47cu
 ymX4QQ8l8KrH+NmiJS8zfmW0n9b6efekoW9GjqwPf1dHmurPNtTQ/bwcogGAuRZ5Kslc
 67wzNcuxqJnr8n4Ibt5O7nzmF+gMa81KoaNWC7OJdB3nWYNkVVKZZ+TVtLC6ORZ6eDA/
 ep5tQy1soUtgwjVcNFtV34CG7UMIljnWx4rgW1tykurhCb0F+8LSFTJ3Mj9v+xvo+Lss
 gJJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=9ekD/wZU2juB89x3ikSs3OkvRfctZBZxxFo0UhHx8JY=;
 b=RoTSaAjE88QrWZWTn2FhRl36ks4WxDhXo7Q/AmnW7bBZ+6NDJLMOCL/EmsIhf21uqg
 YCJMQqIkBb9YmFSrXBG50DRRmbuQ9vMM9nlNtg+dIbxVPXMhEEfqcajcJzpnEa+CcXrX
 NmoRCobrSpsJJ/8LIF4YtN9XjrNmkqGl4NLXjN+/+jK3mKzI2psL7cwhdNg45nFQs2NS
 w/LN7FnCwjSuhXr927+jzDEjxv0Jj1RSdtqqd/WNMcRktpSfIgWlfhiJOQcdov8skBgQ
 wDJBsMQ5eUv7goudkrEgI/y5q3erneHrDZupD78rAFtc1QelAwoHTxFdatHYQuxUtumI
 +rQg==
X-Gm-Message-State: ANhLgQ3F4B/eXAEtrWxeQuPVb3Nn1bAq8yYFsjBcjgTiqvNz8HJOcG6t
 NawCQChRny91XK4voYbPfZGJnA==
X-Google-Smtp-Source: ADFU+vsO4oMThfxe4T+3k8CrA3b+cufx1zE37BxkfjQy0S1+vSAU7EwEHK50HsH3LU0tLqS86uSXvw==
X-Received: by 2002:a7b:c183:: with SMTP id y3mr250047wmi.0.1583166667736;
 Mon, 02 Mar 2020 08:31:07 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v131sm17357885wme.23.2020.03.02.08.31.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 02 Mar 2020 08:31:07 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jianxin Pan <jianxin.pan@amlogic.com>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: power: Fix dt_binding_check error
In-Reply-To: <1583164448-83438-1-git-send-email-jianxin.pan@amlogic.com>
References: <1583164448-83438-1-git-send-email-jianxin.pan@amlogic.com>
Date: Mon, 02 Mar 2020 17:31:06 +0100
Message-ID: <7hsgiqra5x.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_083109_150826_D225F2B9 
X-CRM114-Status: GOOD (  10.79  )
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
List-Id: <soc.lore.kernel.org>
Cc: Stephen
 Rothwell <sfr@canb.auug.org.au>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Jianxin,

Jianxin Pan <jianxin.pan@amlogic.com> writes:

> Missing ';' in the end of secure-monitor example node.
>
> Fixes: 165b5fb294e8 ("dt-bindings: power: add Amlogic secure power domains bindings")
> Reported-by: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
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

Thanks for the fix.  Queued for v5.7.

@Arnd, @Olof: you can ignore this one.  I requested Jianxin to send to
you thinking this was a fix for something you already queued, but it's
not.  I'll handle it.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
