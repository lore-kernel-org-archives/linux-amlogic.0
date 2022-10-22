Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54803C04A95
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Oct 2022 10:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=syzXOpREsSyNtUj0Ccp8YC+LKJnarz+8HsQS8QLk8PA=; b=xomSzcRi6jhKkU
	m7eZLtV0lSQ7gp+OFeaeRLH4cEn4iB7t9VcP8h62W05X8rYu2toPF5aelFBTlgUr+nCkGUiBA9bil
	ACaSaFsESeQBafGRmja6JmBKl9ghRkWUiTRao+DP5q0kzZg3O71FHKA6fNrXSMjIMiTN20R0JplGg
	qiGUNPT0wTnZhkIy0iiQYbwh7qv9dKibJnTElVi0JeMLLu01MMn2SepXNCoMedpOxuwlaGlHxSuOr
	gzSYUNoQZpMv8gim9NieMG4RpqfJli/R9l2LqaeqBZmPdRib5uJIfSbG7UlSKo/4DX9DEiAg6hPQv
	t0jjLHUc1Wc/fkNu49hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omBWZ-00C8lQ-89; Sat, 22 Oct 2022 10:14:39 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omBWV-00C8gA-Jw; Sat, 22 Oct 2022 10:14:36 +0000
Received: by mail-ed1-x533.google.com with SMTP id u21so14441908edi.9;
        Sat, 22 Oct 2022 03:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HRxA1wCfL0RgEilQ0nEOZlpZEZ5XChNDT1P0uuoGXtQ=;
        b=YwPo+TMxhdFYaL4vjMP2doMRR8fiV0VoWpwn5nZQQwIfyDL8JeoFqv97TD/P0UkcEG
         fvsEZEL7uEM5F6r0xtA6szfPMw+neybQ/XFz5Z3jmwFQ8owH2Hx40x6Uw8VxDC/xZAx/
         3JmIH8Tkuwhn9KQwKQG38qW/YAexVvU1e2BS/CJ3c+EBYQ23TbKUtV2PU5sJBiypBKuj
         IaAiK0DHFzqvhMMk5HCZIAYhQOH94rG0uYIdLePxny++FEVb+PoxJaFshpBOHi5JfORy
         F4K0TGGLDCtwAUWCL5MfXPKU1vLgSKW2yWmBTnGx/5dHeVUN1K+eS6Cq4uKnOa3QuqCU
         UnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HRxA1wCfL0RgEilQ0nEOZlpZEZ5XChNDT1P0uuoGXtQ=;
        b=mlsYtV1mq1n4CLC4Je00HUEu7elX52gE4mNcGuuQ3hiN2lGeFLsGiL6UaoENdTIfNu
         LhiKi4BI3ujxc8fQuPJ91gxrxJwRjA+NjumZEth+0JhehyzEJ/bhM/y8eUV0C8/cww4n
         cmZiuYB7O2VbkGEmZvKlitMiMddo/NGW94e8tROKIJ9vvAxQaydfCxR3Xf+ayPt/W/4F
         ryub1Qg8ArOQGsZcTfiOphW5FHITPO6EX4gpvErsRU+f+JgcASTdvfOAjEn1N4GFR6bb
         oE7A4tFv+kZ6s14NysMnCGuEqJ25YJJ2BI3ZMX6xBiSINNCF2wUb8XyD+spPEv7SdIPq
         IAIA==
X-Gm-Message-State: ACrzQf2a+FwcQ+0Js1Xg2cC1p5/G9zEBgNyMfeJa/in04Yp5RlxtBUkn
	XY9U9RZIfzJIqta9iIToObkbSAeN2AHoxiwHnXQ=
X-Google-Smtp-Source: AMsMyM6d73cg4d0wNQuMJiODAPL6zKNKjfXCGBbTlKTkeqI5Y6WOfEPAHw1TL16UWW/UIDYpbG+ENDd56IYLTXWR9CM=
X-Received: by 2002:a17:907:2da5:b0:78e:1208:8783 with SMTP id
 gt37-20020a1709072da500b0078e12088783mr19641226ejc.743.1666433670312; Sat, 22
 Oct 2022 03:14:30 -0700 (PDT)
MIME-Version: 1.0
References: <20221004-up-aml-fix-spi-v4-0-0342d8e10c49@baylibre.com> <20221004-up-aml-fix-spi-v4-4-0342d8e10c49@baylibre.com>
In-Reply-To: <20221004-up-aml-fix-spi-v4-4-0342d8e10c49@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 22 Oct 2022 12:14:18 +0200
Message-ID: <CAFBinCD63tjLKU0mSUhutb5beGOy1k7LHw0-WngB7yE2VaeJFQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: meson-gxbb: add SPI pinctrl nodes for CLK
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Rob Herring <robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>, 
	linux-amlogic@lists.infradead.org, Da Xue <da@libre.computer>, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_031435_699313_C772E9CC 
X-CRM114-Status: UNSURE (   7.33  )
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

On Fri, Oct 21, 2022 at 3:31 PM Amjad Ouled-Ameur
<aouledameur@baylibre.com> wrote:
>
> Add SPICC Controller pin nodes for CLK line when idle for Amlogic GXBB
> SoCs.
>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
