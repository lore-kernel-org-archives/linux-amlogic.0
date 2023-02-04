Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200FDC636CC
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Feb 2023 23:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/tkUwmP56x3VHC1NxQTijNHKVza7KElGNVgu4v95JpY=; b=FPvRvcaDkHvOg7
	gQO4VLmW/BGDfbpHe0CcaBta6XDADyMwToXYCMOr4SoV3LCDDJaMCRkoZPkzELL9yugW1LPyQCv+h
	qELCp2e30oOtWeuxM4hlotFog1oOEUdCA6UaPgqrkxLUgbSnMd+HH8uGdYTN4VmCHvCnnk8jOVnLV
	4UOIxVL/dyPOzFcgAwFQUGK3Pmi8niNN/JlGu0Zi9WtYC1TqQ5cEWJe5SqAi7Uw2Nt/+7iRY/wQNH
	eZOEHSPYaVlOs1tOF92jlTcwClDOpk3DMdLLPS8Kj6NmvixsKMdNuP9mz7nWIt6DYwuAFVKh+vS9U
	k/NK4N/asnecjyk7maLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pORch-005fft-18; Sat, 04 Feb 2023 23:07:07 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pORce-005fej-8s; Sat, 04 Feb 2023 23:07:05 +0000
Received: by mail-ej1-x629.google.com with SMTP id p26so24667267ejx.13;
        Sat, 04 Feb 2023 15:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bcb1s9VJkccwiv9hfLYBUmr2IZ71QXiGTqX43dsIWtA=;
        b=iqKZ7/2QMGcNBHl2zhcSWT0Go4Cnn83/XFH+fJ8f93K67lUCYdXWcSgQOCF43tCbe0
         Y3CPT9M0KORfH4ZpO5coHLvsitVIPkgC23pzq1MPZQn5muBUIWDKwpP0ztsCs4WWyIAF
         AGxweuS/dOBKUgWxtLqZbU8VzPt3hEFN6Q3sao4TbKeb8qR8krcFaM4bXSgtc9NP7ViM
         LTGWij20RPkSMZmb19GRAfrWSgHZQIZGxVN8pJrC25rxRjzxWs2YxCC/tl2C/hpksP1c
         +TcmDirlh6/7DBswXvv9tOOux7rJHGzpQM+SVj0bdI5zHmdccbsrR1x12ZWbvP7Xjj4L
         yOFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcb1s9VJkccwiv9hfLYBUmr2IZ71QXiGTqX43dsIWtA=;
        b=7ddIAIdWb8UExBdC7HVWEbOJUcTpcdOLhVyRJGzTM2RGibwbFYhGtCRmujVlgunIBg
         btEpmatm06fGoGJDauNGW/qOFwwhu2CY9Lt74ceHqJsY2yqPx4dtcHJ8S7NvayojeSBI
         ktXpmse120mcqgX7lEoa+5TEmr3cGuUkteTr6V9k8zEzEggW0Q48K35nCD/IVA6vMlKF
         2ofPHolNjUF+149kgAJgZao2/+yPAb3Np9bmzgFq3AwhLVUMReQkTliZjIVRySRj9Cvw
         RmCp7X7WpDQGn+WiR0vAfZB+Vb4xhgCb9txt9fzkYkhmGG5R/TdvQjz3/zhBnFqjsUwj
         VbPg==
X-Gm-Message-State: AO0yUKVZRwygONtGT3tE3JbYw9+PVJKosDgz8AblORy14Y4dbHh5z7pH
	oAkT6/PTYVDwcc+OhjcjLUPkhPkp6MPSq2dvn5E=
X-Google-Smtp-Source: AK7set8dlk/12WJdxLKyI1EkZFKpAReFptsRHZJwEP5g7SdpXMu2cnevSl2MhoMzH8y5Q51SWKBrguS9muf+ZfrC1aE=
X-Received: by 2002:a17:907:9916:b0:886:2823:423e with SMTP id
 ka22-20020a170907991600b008862823423emr4321280ejc.284.1675552021901; Sat, 04
 Feb 2023 15:07:01 -0800 (PST)
MIME-Version: 1.0
References: <8df4ceec-663c-dc68-d775-5caeb02c0cca@gmail.com> <66f77c32-2678-3e31-fb00-1294ccaa6045@gmail.com>
In-Reply-To: <66f77c32-2678-3e31-fb00-1294ccaa6045@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 5 Feb 2023 00:06:51 +0100
Message-ID: <CAFBinCC+4WLgWFn6bPrRVnRwZ46_Fi0gVoh6nHwV2BEwFQgh=A@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm: dts: meson: adjust order of some compatibles
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Marc Zyngier <maz@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Thierry Reding <thierry.reding@gmail.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230204_150704_327873_CD6B9161 
X-CRM114-Status: UNSURE (   8.33  )
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

On Wed, Feb 1, 2023 at 9:02 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> During review of a new yaml binding, affecting these dts, it turned out
> that some compatibles aren't ordered as they should be. Order should be
> most specific to least specific.
>
> Suggested-by: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
