Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B93C43334
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Jun 2022 21:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=swBY173x0ACwcpHiqFAUH1CxFzDsNVRcx0U/vfShtug=; b=Qmgn7W9eaHJO9J
	xRMc6U/LynFGYPWMzmz2z+76uhs7r8sAtuQzjUV+Y8qPqEjlBzQcMb64FIiz4V9wFrptvfkxusO1M
	RndgQtCc3WnhxocmUh75RibVDBh/aNlsL6CAbc1zW5uJAWQLJ4k+s8IUS396EkgaqS/QfRgXvPE1l
	r/Sdkg4hvlo7on6WMhfstSTCGmjtYTZSsng3eLDrWo4UwDaYbM2v1TRlSFFcnDXX64pyMkBN5n3Py
	T6HqS4xmqktAcwThTV5Y2Wm81aUvjCwaJMsYTDI4HAvzgPc1RwMOw7d67K4cCTjsGHe3/uB9o6Yu7
	IvO7WmyB5mKcPIbUhZxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxyBD-00FTOk-GW; Sun, 05 Jun 2022 21:53:03 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxyB2-00FTMl-LH; Sun, 05 Jun 2022 21:52:53 +0000
Received: by mail-ej1-x634.google.com with SMTP id q21so25655246ejm.1;
        Sun, 05 Jun 2022 14:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jqTk340kUGoNwvIFE+KUlemPpmjVQ4n06NM+Fh67geI=;
        b=S7PqYSet+vFl8kirvv4A6Qj3FyqLfBo228GfA3RfabMvlQmLo/s3OVoof1ooAGwJ3O
         unGBnwV4EiXcgJxpynVgRcp4PSZjjn8j13ixj5R9mEka6MDWqepLy8A66iXeuAPsufwX
         mHoP0ZSAxQv7Ge2g52W057FMKljiqg3+xVVN1IUAqd49D+Owx1ee/15lRWRnoU8r07l/
         d5nFwzYjK+kq4TI7akEb9KUteEikzmQBEaKkJH0Tdwr6/4MI79G4E1mp9xlNHBMz9q94
         SU4L30TKJX19OYFXv+UXJT0ADC9gpd/Dos+m6tZk+X778Ca+QMozAZhDGC232x3Z1qQZ
         pnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jqTk340kUGoNwvIFE+KUlemPpmjVQ4n06NM+Fh67geI=;
        b=uiCy8mazFGRbQYfnHckX6roOAJnyQuG5eba+5PB5dHikQA4gismuJEFyF32SkndyeL
         4Xxw9Mdc+ZxdGt20xu0NbCP2j9VRHeAADwbwC1Q3NkRsH/tjQas4fI/JYV+z6Ft8HvhS
         6AAkxKmWRdjZ8XEVsG51tJwpcIIIyRcgGeJ8tHi1waRSbE95bZ9yRcKa8KczECLT1WSQ
         lfaR0f4qAOIMn/l8zCzjiau/8EXy+OZL28x9s+w1nbkdZPc4dfjGSzWtNiDtNcP/t2LZ
         sxZ9jSQ3E5nYE5kICWe5MbXsGvDHQ6YwjxQrQGFQszQBVQm5YhTZstQ5Ysv3pX5eM/yo
         76zQ==
X-Gm-Message-State: AOAM5323xOEcC0qjrUdfrmBJPubqGiqaWnKoFw5aWkQbhg6JZpjrmmC6
	56jfe0UfcX5DCnwmhrGA3vMtPvr/8fIwC04mG38=
X-Google-Smtp-Source: ABdhPJyajjoGEdHfoyCFfJ5xd/VGskW7hkoSyT1FnOhazKlHAmOLujiBhmJOBWa5cnZ57m/vRbQEmQ7U9GhZYiWGRT0=
X-Received: by 2002:a17:907:7f21:b0:6ff:10b:9cee with SMTP id
 qf33-20020a1709077f2100b006ff010b9ceemr18748924ejc.302.1654465970323; Sun, 05
 Jun 2022 14:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220603100004.70336-1-andriy.shevchenko@linux.intel.com> <20220603100004.70336-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220603100004.70336-2-andriy.shevchenko@linux.intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 5 Jun 2022 23:52:39 +0200
Message-ID: <CAFBinCDJm=hvbE3gy0H-3rQvnxOO6bnQe-5yir9=aMG1BiXVuw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] iio: adc: meson_saradc: Align messages to be with
 physical device prefix
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_145252_752194_775DAF06 
X-CRM114-Status: UNSURE (   7.81  )
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

On Fri, Jun 3, 2022 at 12:00 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Align messages to be printed with the physical device prefix as it's done
> everywhere else in this driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
