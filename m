Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331C0C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Nov 2021 23:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BuaqhAo2rsxrznjo4mqnPKHyT9p1lfMN4NFXaNGkznM=; b=GBFI1FZADC8u4T
	JSp/+rBI68pHsbFmsbNFcTuUoY0yDhzTm3AcLIUb5TXHvZa5AuhhroirHOWqWjfRPZdyX+YEI3oTE
	IyujC11W6aSCV81p8vsxVLYBsCd3nps1VxmFl7UPjDYlc5aFU2mpwGIGJpitsOdf8fwmThrHpyZut
	45QdpJ0MqalJs+o1cF2s5NHIzv5dMJlTf5Hlco3P5ZgP+LVkEU1rtPV6RPyvrFtzLPcK+3V9nUo6b
	rBTkPrBezTqBhq+3u1hZ7APShF1MYxJzNXBO6GnSxE6ZQU08T8ypgUmxwTna2mDUCIgwABHrwKRVP
	lXqI4I3iCfAWyRcaJulg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moa8z-00D50U-Iz; Sat, 20 Nov 2021 23:51:41 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moa8w-00D4zo-Mg
 for linux-amlogic@lists.infradead.org; Sat, 20 Nov 2021 23:51:40 +0000
Received: by mail-ed1-x52b.google.com with SMTP id y13so59093695edd.13
 for <linux-amlogic@lists.infradead.org>; Sat, 20 Nov 2021 15:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lYJh43bo2xHXTh2noh4gGbHA058L8tZGc1wOJPe1jdI=;
 b=qp+o+sOGRqN/IjQjqTZcx81YCv2L16rjo7MPiwhbt3K2cWSTXNpazc1d6hwn5Fgvo8
 FOicp6PtJMYiJY513qp/I5rga4ZX+orhrkuxqfy/5Zxk4NDzDsyoUkbUrMEox+n0okEb
 P7LcF5vRvyK+9CmSVmEInhaCIzwy2NR1VgjrfEDp6icAuqJg0D9LHtkaeZYrK/ZL02vU
 iPP8RbUmsmy+lmb7FBFT0jo7WeweKNEbN49iSEXRkKZZ864tByVidePyzbuwk+FlT5df
 UmbGXLr0ey/FPs7jH6JL5cioiiMWkGjfve1ZAb4BVp/wjnon+7AUjD9WtdxTXNGIoydh
 NfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lYJh43bo2xHXTh2noh4gGbHA058L8tZGc1wOJPe1jdI=;
 b=x3nqXf17jtd0UyU9Bf7CHut3KdZeWt+TVZ8jggTPHeRw+As6PQBQXBgQPAGEprAwzk
 nK8PNM51AP0R70z87SxuDmQ6e+MB7A9F6KFUTD9gaB0663vWyJhZeH1uHgFQnvaJJkbX
 8eX1L+EvjUWCd1HhSDkPr89S1iIyN2IFCpsP+CzHcJjlrAG10lnxil4EODsWa597idSs
 4+//JxADr/nWHU4ZpaQP7IC7QCjaXw32KDu0LlzKwh6cViZogW3n/Mzttey5bRyhhg81
 XJB4TRHX9QhUT5hBFLeiVYah3H/rctZ2G9NwXjf08lxXMtqIYeBw0qOIJqzTCXZ7GciN
 mkyw==
X-Gm-Message-State: AOAM532Vnfn7sgDiNv2al4/PYQbCe5uhts5iw9WTMRfU1+2xeRJRNjIJ
 RWZiic7jwUJcX/SW3yN7csVzDELOb8T3jPAeZMc=
X-Google-Smtp-Source: ABdhPJy8DtMhHdjdfXbtNVR4nEHP0YIpJsQcWgtXf9YoPr3JEgOk0vFZaXb9K9e6p5FtqDSZPZk82XIcRvSmqQQKZGo=
X-Received: by 2002:a17:906:37d2:: with SMTP id
 o18mr24548013ejc.278.1637452294851; 
 Sat, 20 Nov 2021 15:51:34 -0800 (PST)
MIME-Version: 1.0
References: <20211112162827.128319-1-aouledameur@baylibre.com>
 <20211112162827.128319-3-aouledameur@baylibre.com>
In-Reply-To: <20211112162827.128319-3-aouledameur@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 21 Nov 2021 00:51:24 +0100
Message-ID: <CAFBinCDNMCT4KZjw8HnYer9NJBx09yF=KpguGm8Q4vKw8eBr9A@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] usb: dwc3: meson-g12a: fix shared reset control use
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc: balbi@kernel.org, p.zabel@pengutronix.de, khilman@baylibre.com, 
 jbrunet@baylibre.com, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 Anand Moon <linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211120_155138_802902_8058F1D4 
X-CRM114-Status: GOOD (  10.57  )
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

Hi Amjad,

+Cc Anand who was also investigating the original issue one year ago

On Fri, Nov 12, 2021 at 5:33 PM Amjad Ouled-Ameur
<aouledameur@baylibre.com> wrote:
>
>
it seems that there's an extraneous blank line here

> reset_control_(de)assert() calls are called on a shared reset line when
> reset_control_reset has been used. This is not allowed by the reset
> framework.
>
> Use reset_control_rearm() call in suspend() and remove() as a way to state
> that the resource is no longer used, hence the shared reset line
> may be triggered again by other devices. Use reset_control_rearm() also in
> case probe fails after reset() has been called.
>
> reset_control_rearm() keeps use of triggered_count sane in the reset
> framework, use of reset_control_reset() on shared reset line should be
> balanced with reset_control_rearm().
>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Reported-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
