Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7BEC433EF
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Jun 2022 21:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4T/mZEVVlDEwtzo5roYwG1UHTHdkQY/QvFX/yh9Jpg4=; b=BtB6qn3KhGt7Qz
	WxIVVu+HgzaGiRn6hLf8wL6q+618SHTzGshykr7ryk7Zjxo94EWAVvpTFRvbKkEDPwW7O5KQ6Ho15
	EK8+Kg1IiEG33EMBkOsrY+qjTeBwjc/axbZdrLrwdJhs5PT4kaB47WWKxpik5OonFc42Oz+Ntcoe3
	ni/gbIZ4I8cErojtwjGc5YNGnbhvO/dDjhTQ7oLhLaYJILfXWooZVwmOvhCm4biWiAaoXk26jgOOu
	jDinRKJEpD9SMIBK94XA7XDiP+F0mv8EHBXPWnyjMMAG4j2CjmQ0vct9k9VpxrBcEclBs7KVpcmgN
	OAXVkJRTxDbUMJJx13HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxy5O-00FSWI-8d; Sun, 05 Jun 2022 21:47:02 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxy5D-00FSVN-MQ; Sun, 05 Jun 2022 21:46:52 +0000
Received: by mail-ej1-x62e.google.com with SMTP id gl15so11737139ejb.4;
        Sun, 05 Jun 2022 14:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZEUtBzgO4NZOQwhouRlnr+KmdLlgAtaO1quMCtr8kN0=;
        b=EzNZbIqzqAxHvlOfdJQ4Q4/+Bz6oT6H3mPwe1M2NMDVkrm7+FuCtLHzzlYlpZnxF43
         7N7AwmxZEGSG+u1bGnwd4lusykPGVHLesUaxGiH1VOLojeaVTIvw8fQN4tYBtMRlis2O
         qNCjFANiUanA18+qqgGU+0ewDk8Ze/0Aw69lszx0KeGMHsccYc2L2cAE36jZINAgVxcz
         QZ9y4mAhJTVi865OgpSrPBszI8M2KdgpsIsmzEXmax4INKVJLZbRYPZqxC/CcMMvqGg+
         ImdX4Mcqo8V0Wy1x/6icRPuHqswrluFbOEX1w0FjNaEeznLR0eS1DGLlOoGPqLaZQ60x
         kktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZEUtBzgO4NZOQwhouRlnr+KmdLlgAtaO1quMCtr8kN0=;
        b=G5BGNsYJcPNpkEdJhouozaEgSSmZ/RShOjsHGiytE7bTpfJaIw9fCZlbM0/W/Ufxfa
         UC/hY7ajH5PHcvlp1OsMOF2mir+F/RA5LQSwXlgFVWFrRBc7sJ0hka+iW1Bk4m7JbI4u
         LWhglOmGr/m+yPIBggZYQ+HnrA7J4hsHbMTk8SFrBnp55P1zSAjQmzQWso5zOY42H4fk
         K0SKsZqdGTQ1byjDIvqCAEcw8q6S0pI/xKpFHiuR5FlZDtMT53VnFnjCrRySoBLTDnLM
         Ch3x/uYTcesTQppMMslgIJ9CFnYkqjBiEFfPbhahTqqWGj6RCRRnmvXr4enHAfU/Yt7L
         LRVw==
X-Gm-Message-State: AOAM530NDbT0sLgv5DlRbN773Wt4OBVZ+axTtflNz5MH78WhbVAAiBbr
	od5svfviH4rHLIiIGCqdMZfN4b3qxa7+4gqvtSGAW7yOY5Q=
X-Google-Smtp-Source: ABdhPJw4MafiBKxna9+gCyvTQb5jcAjT9aT9fXw1fhtlbfQJhud3ireSbEz74FWDSxvgX3qA6LoS8DFqFY8L0qleilY=
X-Received: by 2002:a17:907:7246:b0:6ff:241f:200a with SMTP id
 ds6-20020a170907724600b006ff241f200amr18547956ejc.543.1654465608121; Sun, 05
 Jun 2022 14:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220603100004.70336-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220603100004.70336-1-andriy.shevchenko@linux.intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 5 Jun 2022 23:46:37 +0200
Message-ID: <CAFBinCDe=k+4YcSUqz5dpAtJ3NTqsHe9Krt0O1pAS=L=rVKCrA@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] iio: adc: meson_saradc: Don't attach managed
 resource to IIO device object
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_144651_790362_03FCECAF 
X-CRM114-Status: GOOD (  10.15  )
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

On Fri, Jun 3, 2022 at 12:00 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> It feels wrong and actually inconsistent to attach managed resources
> to the IIO device object, which is child of the physical device object.
> The rest of the ->probe() calls do that against physical device.
>
> Resolve this by reassigning managed resources to the physical device object.
>
> Fixes: 3adbf3427330 ("iio: adc: add a driver for the SAR ADC found in Amlogic Meson SoCs")
> Suggested-by: Lars-Peter Clausen <lars@metafoo.de>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

I am also fine if the Fixes tag is being dropped - please keep my
Reviewed-by in that case.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
