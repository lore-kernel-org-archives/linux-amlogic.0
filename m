Return-Path: <SRS0=7wMv=6U=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A806C28CBC
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 May 2020 20:06:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E3D42075E
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 May 2020 20:06:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lenpSX/I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E3D42075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/hT1XuLaw9ULFSA4I1qBedNCmB1aEtnQUr0dBlOeQg=; b=lenpSX/IuJtNzS
	OKJAWgtoJ1l9gslBWlBmLo/KxCOfd+34/5sjupXuDQKn+7DuNfEHuWEuDAvleeipYnSQaPJdmF6JA
	dvGqZhPnQudB0D3Dl2b9BK7NurBgsrIUVrRGMj9Q7YIISG+VQS3gE01g0gZdg4hGnQSfuLO/I4tmM
	B60NYD/PWyXJ9ePSfNZvPERwOr1+ZlBpQAttNqYpew9WJ+SUHvm4YTVnRrOoqCUachaepCOTPxq1U
	MRqbEzlwVu7TNplj0dEMcKriwG/HbCgADKfT2hxCj3touEEg1fWtTXKG7eIVgvPrDMt9HRaufX1ft
	8PpCTzZDPhkQ6+bSQwGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWQIw-0008DW-Ov; Wed, 06 May 2020 20:06:06 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWQIu-0008CO-Cb; Wed, 06 May 2020 20:06:05 +0000
Received: by mail-ot1-f66.google.com with SMTP id e20so2426958otk.12;
 Wed, 06 May 2020 13:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=B63JfAS5DnOPIn359Mu4SF2juiHItV8fI+NFsKVSGD8=;
 b=F8UCK/S0A6p3pRVN27NN29+0MLbYCeqpcJ9cjbTTK97QJm7EF2ZWuendxGbqYyurWh
 s8TJuCGPKhbZF2xeV3k8iLiBRLx9a9MuOg1dq90mV6cPsTJqoA0+LGYxF9bCTQHuFcO0
 1Q/aDqJUMCJhsupNYNBwi3WxO5ZYkJ1Jo0FfQYiyKFXLt2XsXXbZFP18rhHLeim3AFTz
 0C/wvhstmj1jKa+UospTbCK45KgyR2xGGoeR89Yji+5Ojo5pYHmdW3xdvrFxOOCQJaDt
 dsIulfU8XXKzNm4vHW4qhwoL4GaCwZ5jy9xSL2Zh76CbQthRIXALOh4XPEhnbsF1XvVx
 paEA==
X-Gm-Message-State: AGi0PubiHV4HFA36JLQcaWm2QK9pkblHxuQpmJDVp5VaNXjA5QLPEHwJ
 95+VXZKPOSLfWMkSEK4pnA==
X-Google-Smtp-Source: APiQypIici0Rg+Y4p7bwcYXH235wYgoJGR0SXXaIzkdixkSakfukZtIjV7CDVl+EVrcArRIbhPWfrQ==
X-Received: by 2002:a05:6830:1e39:: with SMTP id
 t25mr7785497otr.114.1588795560432; 
 Wed, 06 May 2020 13:06:00 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a22sm774402otf.42.2020.05.06.13.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 13:05:59 -0700 (PDT)
Received: (nullmailer pid 31500 invoked by uid 1000);
 Wed, 06 May 2020 20:05:58 -0000
Date: Wed, 6 May 2020 15:05:58 -0500
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: power: meson-ee-pwrc: add support
 for  Meson8/8b/8m2
Message-ID: <20200506200558.GA31434@bogus>
References: <20200420202612.369370-1-martin.blumenstingl@googlemail.com>
 <20200420202612.369370-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200420202612.369370-2-martin.blumenstingl@googlemail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_130604_428955_D510D80C 
X-CRM114-Status: GOOD (  12.47  )
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 20 Apr 2020 22:26:09 +0200, Martin Blumenstingl wrote:
> The power domains on the 32-bit Meson8/Meson8b/Meson8m2 SoCs are very
> similar to what G12A still uses. The (known) differences are:
> - Meson8 doesn't use any reset lines at all
> - Meson8b and Meson8m2 use the same reset lines, which are different
>   from what the 64-bit SoCs use
> - there is no "vapb" clock on the older SoCs
> - amlogic,ao-sysctrl cannot point to the whole AO sysctrl region but
>   only the power management related registers
> 
> Add a new compatible string and adjust clock and reset line expectations
> for each SoC.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../bindings/power/amlogic,meson-ee-pwrc.yaml | 74 +++++++++++++++----
>  include/dt-bindings/power/meson8-power.h      | 13 ++++
>  2 files changed, 72 insertions(+), 15 deletions(-)
>  create mode 100644 include/dt-bindings/power/meson8-power.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
