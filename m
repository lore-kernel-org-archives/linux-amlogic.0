Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F110CC636CC
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Feb 2023 23:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/tkUwmP56x3VHC1NxQTijNHKVza7KElGNVgu4v95JpY=; b=abPojw7+9zRJI+
	tNzj3zzyaezP9ZB8qVIbl3UtmWkKL4i50VuOHlEMOTQG8699a9bXqAnENhiNVG9zJchOB9LT6jaaS
	QGvM5xMUZDqBW03HMvCB7BOdlu9W2umS7FSE6wZIIKfLieMUtqhlNm160ca573tGLb7Fq5OWN4lqL
	tK8LevkYkUSDy7TVfrnXp1M5ORzYD5DShO0QfygLvtSicrbiFRsava6BTHB2BvvtUeglKX3u2bbPh
	O1mpak62XYGGNrjdv3z0IbnFFlu1FYiEm5aELeGyk9xyo9/w+2jL4JrWBgCCE60y/PuPMsZ4/2z+C
	jhyqhut/IzrtqKnqWbYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pORcw-005fkL-KO; Sat, 04 Feb 2023 23:07:22 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pORct-005fj9-Ux; Sat, 04 Feb 2023 23:07:21 +0000
Received: by mail-ej1-x62a.google.com with SMTP id bk15so24737923ejb.9;
        Sat, 04 Feb 2023 15:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bcb1s9VJkccwiv9hfLYBUmr2IZ71QXiGTqX43dsIWtA=;
        b=DnElZdAbz0UA9aV2RnWHh7OySKDvNWkN1m/VIUV+9yTJP6ErTFFBwr8y136ZhwLsUf
         sC0f9oFAe+T9F0Ov5zJdsSJhvUigwkh9P0dR2CoA7GXOxF0YJhx/UhWTu5ZSGxNwwOjh
         Esa8KO84U2Qd2B6XsWzhYhK7CnD8g7uGZLuTNlM7mnw50atlm4rFjr+D+OvKST8hRmv9
         VDllvXpCpkP/RQZnIP+028G5yyZN9MOzimTriJByI9uw8DLirxwDl0KaiS+MX/YrJcNJ
         ZU4rUVQhB8L7RECOcNHBZhMiNHUftZxiBCpMLP5gQQ4FZJrh/Nx38tpGoICyVLf/2xy0
         PInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcb1s9VJkccwiv9hfLYBUmr2IZ71QXiGTqX43dsIWtA=;
        b=fIpSuUs9ly9Kj3udJB8THoJJSIY0qb5ly0IEU3Xy/Y8CmDdNBBWtYxUxRgEYJuWmMo
         YZAprMa5y23I7QMpWOubPJcSOvg56SuZCzd4C8/V6HKvKX7WVMDFInfW+U0Opc7eNcde
         lJx1YPmqeU8aKu+rE/CY9LX03aP4ifCeDelfZF7PltzWbN08qrSDMu6dVBeRg2JIxD+S
         DhMZ9n0oETM2NoZwZlCFYwCF8ZxmKun98F1i9mR4LASQ4+DUXYlYhD6GcPM2iyWcr/Ri
         rLQw6pzSbSVjoqMqUtvnUrpQiPxKq2RMx6kktNNs33v9JTjuyJMHhcb76nLLFA3xouNz
         Oj4A==
X-Gm-Message-State: AO0yUKUF5Jp7TI9ND3bx9Gw2HT4VowZK02roHwH2Lc6f+XxzsGMzeNcW
	ikjXlWgkdeQxPI/FaXuDlo3KeZ91m5PYgDRsKXQ=
X-Google-Smtp-Source: AK7set/ODJy/URBkGr9o1ZrujcLOio1cN277qos2Je4uRqqkh3LXE+/ZO3mxrgcpuWIkys8l/g7l1oOcUMKyfOatV6E=
X-Received: by 2002:a17:907:9916:b0:886:2823:423e with SMTP id
 ka22-20020a170907991600b008862823423emr4321388ejc.284.1675552036974; Sat, 04
 Feb 2023 15:07:16 -0800 (PST)
MIME-Version: 1.0
References: <8df4ceec-663c-dc68-d775-5caeb02c0cca@gmail.com> <1ce888df-6096-73de-a98a-354d086428d4@gmail.com>
In-Reply-To: <1ce888df-6096-73de-a98a-354d086428d4@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 5 Feb 2023 00:07:06 +0100
Message-ID: <CAFBinCDqkz_fXV8JGOn=6Zph_MNU7q_1Qb67Jfd+u4o6Gj_3Jg@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: meson: adjust order of some compatibles
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
X-CRM114-CacheID: sfid-20230204_150720_022827_6BBA3DCE 
X-CRM114-Status: UNSURE (   8.25  )
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
