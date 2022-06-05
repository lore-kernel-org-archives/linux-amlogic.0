Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECA6C43334
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Jun 2022 22:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TytaFP4+RKTDTCfXStNzZiEa0wuQiFGJAsOIDattkXM=; b=UZr508JgP/UQaY
	EQdJld8ShDiE+Ex4osdYqsYQLeJq6nrggB3EZVg9+sroPFdRZGt13IqRkL6rd7ML+5vZ+Ulvyy0Mm
	9zOf0qi0MieRAs2M936bXE1RZyZy5LHq7w4oTe5tXq/H+Kfc6SSss9lYqOMuga1CbIMcz+mFSyvhC
	92JVshIz7OJdyCtW4dCgQ+0y7cSUmaSScRnsMG/O+RkICz8SqDWm/ePuYXKDsoiHnYYitpIkW49qB
	fppSRTmNfbuIdM3tAZXGSz1DRO6tcCOvzSPgxLue7qGiZpfXD7VWpByMWgMq8BYVUcnW5CudQyNTT
	xUmZOQMg1F0JUUaPR+aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxyJb-00FVQI-53; Sun, 05 Jun 2022 22:01:43 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxyJQ-00FVO3-FS; Sun, 05 Jun 2022 22:01:33 +0000
Received: by mail-ed1-x536.google.com with SMTP id h19so16556838edj.0;
        Sun, 05 Jun 2022 15:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ondmjgAxGqeDp2XUj67mZ5IMErGHUjY8POluActOZu4=;
        b=o15HfI2ya/YqfCZmacZk6vWWDsMjeMvsdoXSdUJUeHBM55SMmT/QL61V1qtYVrjI7l
         HJKmEOMSEapIR0SlBZoJcogMOM8TzSehrSQUhUJpIdVpX7B6vzoqLV/OI/a1YtFyoaGe
         WjP6aAGyD4EkZiwW9CDNhBKkvVZV8NJB161x1jWc/brVZhlsNPqQ0P9JLec0Xqs/tB72
         JD75JIYfLRKop3mcUc3Qf+5xOq6zNbKWYUc5qdWUW9p77SlH6qr9nLO15Ftl5kXHwQj1
         vPGXPJAlNUPwPTrdazKqOhcAazGWqPa3U00bbM3ye8HhsbUZx1V8V+f259OzKPQy8KhQ
         B9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ondmjgAxGqeDp2XUj67mZ5IMErGHUjY8POluActOZu4=;
        b=qRr3SRcZYxJAQ5jEhOY6o+SmiXgN54dtV0jFY77cqrBTsNVEcB6DjYYX1EEmH5v8gw
         y8gT5PgJjTgEeOWXLgEQhDwIiehEztUHz8YbZYUll5djODGUMdBCNxQB/cvJDVBydXdo
         z8DMi6XnCckueGUucS+nLpOJKTfhTzema1vKjEwfVC9yTbnEKdAOfN4Jjb1y6Bbue49y
         vFyIK3gl2IkqeFYaG3y/r40EVucaskY8tcndmRcbaUJsKzdGAAlDbxRliAw6x1J0DmU5
         qWYGDDDtx4ve7/2O+0KZFMghjbyDYU9F7E2ZXCN+MSZ/cax7rTqhkiU7YNvY4rZnNbKQ
         7gDA==
X-Gm-Message-State: AOAM5334wRbt2VRCU+aOfpDZ9IxSWvpxXbM55cQxOlC6SxUFNpoFYAN/
	4Y+jtmAn3RRogo0lmli9HAONncaNTR84E5LjGqUM4UeszsQ=
X-Google-Smtp-Source: ABdhPJw0y2gMZT2vCjg6zrUbB5AGvgtdID/sngMlUbkYXPcY4C4in4ED2eqnJP4rnunQfBbV0b5xYKN7YlS1W1T2jzs=
X-Received: by 2002:a05:6402:1488:b0:431:56cb:bbc5 with SMTP id
 e8-20020a056402148800b0043156cbbbc5mr3353146edv.199.1654466488698; Sun, 05
 Jun 2022 15:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220603100004.70336-1-andriy.shevchenko@linux.intel.com> <20220603100004.70336-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220603100004.70336-3-andriy.shevchenko@linux.intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 6 Jun 2022 00:01:17 +0200
Message-ID: <CAFBinCDV4Q9Ma2LHV7gSj+17Do6SZmTMFLr=7D0DvRpRsgSOJA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] iio: adc: meson_saradc: Convert to use dev_err_probe()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_150132_554878_80EB3E64 
X-CRM114-Status: UNSURE (   7.58  )
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
> It's fine to call dev_err_probe() in ->probe() when error code is known.
> Convert the driver to use dev_err_probe().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
