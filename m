Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F36C433EF
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Jun 2022 22:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rAm/KBHg4tCkAbEolBTAKxVUhIDxbIHNrznPErIK4i4=; b=ZPy1KWgJaxSJMO
	/OiqQ0RLs4f3VbEWF9MNstoxz5ojGJ6ZiC5MAjAePai/tFh33OY4vrOvXJ02TyLfDRo8R5DmOe4n6
	0fVyo9IIIQqOP98i1t/LQCmmohdWrOEjpQoGrp5C+tnv8UHwFd1oFa/k07JiIjQayWncjDSYww2ap
	AP05+VSbELtLLiyXdpQ6QV8ltrSCVs/eAjs3Rf21kwzRD4nuAff2XWR8MPjZkMUiLH1Ps0j4PHeHX
	8LC/msqI5lqVHQDwecBFAn3B2XmY8uY3huSa3Vo9H4FTuwqPfbLyKCpV6OVXERl80QEbZ9tskOdDm
	gg7nsKoeGlQ6iV8k+xog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxyID-00FV8B-MB; Sun, 05 Jun 2022 22:00:17 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxyI2-00FV6G-KW; Sun, 05 Jun 2022 22:00:07 +0000
Received: by mail-ej1-x62d.google.com with SMTP id q21so25671975ejm.1;
        Sun, 05 Jun 2022 15:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/nXs+dOt3qtz5Rfpk6unyzsXwut+ijWDQ38kRxpMpj8=;
        b=FcC3JidIshj4EA0fVIOWBbVSVLLqvUJhH+YNW/bHu2KmUkSoxIe1SiHDeWStNnFxWG
         VkdC1Or2gXV72tgxnPZWIssM4auPVUoWiLkaF0RaSx+DkuldZ3Akk2LrcDkLE7WcWkEG
         ZExQG9TRkZzCcVeVoDuE+jtspC+Scd4mlMGXQGD8WpIkrMGlogGjxemSj95k38/rUi9S
         zU2tjWXA96GXVY0DAXczJ61XiHSH+o7LUSrkgHpB2PuYXQBgDtTJmbVJYd384AR9+O80
         cX3QvrIwHkY8t59KX7+bQzfUM8u3FqFMrN9XZTOGKjDsr3nwwRB7Yw3rfz3Ey2NL0OJE
         0j+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/nXs+dOt3qtz5Rfpk6unyzsXwut+ijWDQ38kRxpMpj8=;
        b=DkGBW6ZSujTS4g98VAsaRrIdRePaEI/7c7/dq/h6b057bIu4kjwjKWYnMEg/raNz+X
         lpaiEX2DbtG8HfwOzn6gkfxClafyC9tT5gFtlUrk+EI236GBi0QHIRd53ODRkBnAGjOH
         s6jCXRlmCzCmKHql6yxr04nQ5uMxypCYKZW5fZcZKgM4Ht4VRP8D8N71MpkxuwjcaJWT
         4PrnBXaxWSo99Ear+oWklXyBR9nYLVR+KigMS7H22Kky67GPXyQlDL2SQshuD6xgdVdh
         ZnlgMYjlwZLHK/6dQa+EnxgDWA30vVyH+ZUav1g8BU3NrjRd+hsWjo6ayXpgw3upPh4m
         J1ig==
X-Gm-Message-State: AOAM530ccW0OUVrInTUOHm9yADJWLcrr/01FxmUoy/wB0JsLnUJzPAZf
	glZCJDA+PH9ARDtXmnWSI2Q8FUQq7sEmL0nVqwg=
X-Google-Smtp-Source: ABdhPJyEym4B73mVP1FoOMoa0kohLjIHNbohmdWKyDfl/jaxeraMjTh9uFMTqi4GbH8CzsbLtA8iHTi0XfsHx4wnEUU=
X-Received: by 2002:a17:907:7f21:b0:6ff:10b:9cee with SMTP id
 qf33-20020a1709077f2100b006ff010b9ceemr18764852ejc.302.1654466403949; Sun, 05
 Jun 2022 15:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220603100004.70336-1-andriy.shevchenko@linux.intel.com> <20220603100004.70336-6-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220603100004.70336-6-andriy.shevchenko@linux.intel.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 5 Jun 2022 23:59:53 +0200
Message-ID: <CAFBinCD1cn19uf0pyUF-Af7_thP81Ehih+X4F9+rO8tzeUm+Ow@mail.gmail.com>
Subject: Re: [RFC PATCH v3 6/6] iio: adc: meson_saradc: Use
 regmap_read_poll_timeout() for busy wait
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_150006_731541_CE0D730C 
X-CRM114-Status: UNSURE (   7.74  )
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
> Simplify busy wait stages by using regmap_read_poll_timeout().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> v3: new patch, but RFC, not always the read_poll_timeout() can be used, would
>     be nice to have it tested.
and also:
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com> # GXM VIM2

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
