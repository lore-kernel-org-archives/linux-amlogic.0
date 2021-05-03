Return-Path: <SRS0=FAU3=J6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04E70C433B4
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 23:57:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54C3061208
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 23:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54C3061208
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ySyTBMWJ/GZrdojNqFE/jVyowBGixhmyPIGCfjok3Vw=; b=S0xcbzbFSW66SAxsw31+2EQPx
	G11IiK3KtZ7Oz4inm2LDhH3B1pHvUUQDgU+nJvA5lu3K26fkhDzcwFMk7O+f5+vt9dZvgDRb1usID
	9onUtJr8a9ifBpOmHit6MaxC2uEdQhFSCc+0uUBM/G5KtsTqEOJOOU1i3A2n7RkmQIsSoKgxmNgUm
	maLWzQ8otE7DhTnXfQTFKi1AtlQfJIyppMF30HZ0jfXCRigxtkrsmsj1PkmzbYCdH55Nx8HcyzmHc
	dIy/LA5J+oSA+x3s0j0T30azKau23MaYq27HaQztutVnB56mRB0LwC59AQ+LfRpqUSAMUfYTAWI/2
	t8PHIcnWA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldiRQ-00F4PK-QQ; Mon, 03 May 2021 23:57:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldiRF-00F4Ob-Kz
 for linux-amlogic@desiato.infradead.org; Mon, 03 May 2021 23:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=RTrhwe5FlqMxAXLpGz6FP3pMNfP7DO0JlS/VtPEMG74=; b=1sIq1mHL4krqdpxxKoz9A4JkVD
 gfZh1E5S6i59JMZHiTlfdqJN+5j+HTXF94EUC0yS36Q3IZ2FxjQWI28EAGD2e18+XkCMywol240sb
 u3fZo/KQdKg7UeqfqT6eajzJ6aRWbJaC6d15TEPFDqzgvk4h28S2Jt7u3GQlZ0LwQdb4/r6dUg6Yd
 45RI9qVolQyzfXTrnGaNu3G+PCNMBPMFK4kwJqK5zVoPenO2sWlnVSketE0zekAIcZhU5trdDMVp6
 4cJ3ktUehHz2I5TarVd5Jf+iKdmoTxxLSDFmdIrrLceedQy+0zbl14XLNXUR7jkfxb/0TGhzIWz1O
 X9F7Ut7w==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldiRC-003Z1w-8L
 for linux-amlogic@lists.infradead.org; Mon, 03 May 2021 23:57:20 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso240269wmh.4
 for <linux-amlogic@lists.infradead.org>; Mon, 03 May 2021 16:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=RTrhwe5FlqMxAXLpGz6FP3pMNfP7DO0JlS/VtPEMG74=;
 b=OY1GqMrdXwXrnAuXBTPr8YH2MPvErnn0sAltbHEyap7pDnJekaXQOqHbGBdfm0RmTC
 6lrbrm1e8bB27RkTSrQwqflaQuijdIRWiTrYNSXGkdM5JCYyqZ4EcvpSTZlZQW/daRSE
 kvncir60eNNRthz++TvIxP8bZjVdylGQlR8cDFxgIfe/kgIjzRjgNUZNiZW6ZecvgUAB
 Q9fDdzkrWXVqblYfvjxyvNwuAiAWK/VqmVU2mInJer6EsufZ3Zj5yIMFZeMon7DiZvPh
 smhmClp5QXg53UJHwbbucyPhi5mj2VxExty0pJqxLAXoKTsjfnlHbBr+fvnRKTg6RJAk
 k20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=RTrhwe5FlqMxAXLpGz6FP3pMNfP7DO0JlS/VtPEMG74=;
 b=H3QOaMj0TLDvMCfIr7FsxtCx2ySpOWGAq/eWZwJXjGGdsfTAT8by31FQ2IjKRFb0rc
 LEBF/9636f1PP5moNM6Bqfvl2jRibWh/KMC+UxuAdc+xYV/LBTd4ltDBdwzsFGfYKvhC
 T5tTTfruxs2CAvxqSeqTctFdLdrlpefGPemIoeLC1gKFlZadTEwqmSwXM85xN5RATdGd
 UUj4pDbOPbYa6N+N9VRCHg8/3/Fvz5s95fys779+KYwFww8/eLISrO09m4jbFes+eiGX
 CFWdotk9RzyDTxgvzCChwGJ0zogQesbwLmcq/RwuAaJmhsG765JhKE4XgHlKwIAlYadz
 AZ1A==
X-Gm-Message-State: AOAM531xtueSA4WBc89MSOwJzI3SEanWeGl7RUWZDygt4bD5a6sredO5
 sx5Wxk9CokkJxnjVQj+2oK7B5c03kGZ//w==
X-Google-Smtp-Source: ABdhPJwOb2mcyPA4UP5yR/4VuPO7Gv/UDWC/a9zIVAp438kCOwtM4TxMYEhupEG0lyY2Us6CEfsRFg==
X-Received: by 2002:a05:600c:3388:: with SMTP id
 o8mr1025054wmp.101.1620086235839; 
 Mon, 03 May 2021 16:57:15 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id l14sm14048582wrv.94.2021.05.03.16.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 16:57:15 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 narmstrong@baylibre.com, linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Stefan Agner <stefan@agner.ch>
Subject: Re: [PATCH RFC] soc: amlogic: meson-ee-pwrc: Drop the .shutdown
 callback from the driver
In-Reply-To: <20210429203723.1177082-1-martin.blumenstingl@googlemail.com>
References: <20210429203723.1177082-1-martin.blumenstingl@googlemail.com>
Date: Mon, 03 May 2021 16:57:12 -0700
Message-ID: <7h4kfjpe07.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_165718_377379_8FE72FF2 
X-CRM114-Status: UNSURE (   9.25  )
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

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Stefan reports that rebooting his ODROID-N2+ (using a G12B SoC) results
> in the board hanging. His kernel config uses:
>   CONFIG_MESON_EE_PM_DOMAINS=y
>   CONFIG_DRM_MESON=m
>
> He reports that his kernel config results in the DRM driver's .shutdown
> callback to be executed after the power domain driver's .shutdown
> callback. That's problematic because meson_ee_pwrc_shutdown disables the
> clock which are used by the VPU IP. This causes the board to hang.

I didn't dig deeply on this yet because this smells very much like an
issue Art reported[1] and fixed.

What kernel version are you using, and does it contain
commit fa0c16caf3d7 (drm: meson_drv add shutdown function)

Kevin

[1] https://lore.kernel.org/dri-devel/20210302042202.3728113-1-art@khadas.com/


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
