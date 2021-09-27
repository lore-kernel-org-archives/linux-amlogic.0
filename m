Return-Path: <SRS0=QVii=OR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A29C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Sep 2021 20:10:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B22DD60FD7
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Sep 2021 20:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B22DD60FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/B2LaGFsW7AneMJHsmi2vas4VOsjyTJBGbWqUjYrk+k=; b=ZBl3Wyb9h3hks0
	t/3qkfKNToueBn2g7q5CGJTICk9cn/SpR987xhlGmj2yr9YtP0xTbTRJ0fM3h3MyyCjDRzwCGeBda
	y2N+SDzQpLWhdSBbpj3LLJBpy3Q1cZ8fv0NlxuJj49/SPjNthqdfkXe3XbZv/6CBw1gR8T/mHK0wO
	GwZoYL33fDkiE0fvxSxje3m9tQLLn91YhMBNILGgrvhCT5nAKzPdmVl08ZU6AWfleYgyUmlguOurx
	jV9okdFORw6TYMTguBLXZ/iiIqXyIBGKAcDKWurlGZyX7jPGUcU9+YjgSGMoQGY+CM4peCl+4dv0o
	JOVcId3TpmseFyvPTl7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUwx4-0047m6-V9; Mon, 27 Sep 2021 20:10:14 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUwwp-0047hG-Tc; Mon, 27 Sep 2021 20:10:01 +0000
Received: by mail-ed1-x536.google.com with SMTP id b26so25630470edt.0;
 Mon, 27 Sep 2021 13:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vWCgs3XZtqQ75S4Sam0oUHvtow8EHQKNfWFQPQcnRsY=;
 b=CjCqPN4lsrmL/kgXYQ/RxflbFh56hSOKqIeyX1W/oIBfrq4g8nLspVD4sQMrn+40Rh
 Rx4viRYm7QpwSajB8/nS9I5EnOQAzL0pUBz4lQns538q/Qteac9sWhcfIIrmfsOSKzsU
 M/PAXh8x8DmXoA/RtTV/ChQhPTk8C8Id1hnlJcijflS84t+U/LfK3VqO+GuY2jbR/wSS
 Jeouq+xThsOnrcpcRddG2ODCpZRewj156How3JR4A1KMdpDZs7HuWvu3b5Y3uekBZh/f
 anAzLHdRSEeqsXP37MCrOfOLFAdqYOJXZV5OWmUogHnZBCe+LfWz2FGRBS/GFuXNmIlm
 9OmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vWCgs3XZtqQ75S4Sam0oUHvtow8EHQKNfWFQPQcnRsY=;
 b=BupUFt6RonNvJQF3QzYcduoiYcSVw7chtI3EWL4XO0H+eD+XxqPE1LqRHJrkfbY52a
 sQo31kOPFCtACkwWsXjLbtL/9M536b9/3emIWOyWdvfvZjyrHKRmZ/qzRByve4vajdcn
 idqoupa9noo83JwYAwnKv9cz6W3wfYLwnc83iXH6hcr7/M72VfRbgkBUx8u6ee/fsl86
 HuhMibpiLdZCmPpnDE1s7Kvl2M7F+MuJlQfoR0HT4hfrYPRukE7ldCgQk4r/RgY98yVw
 XGjQk3/0edFMaX+rJ1v46fVLIgTwBqJrbmZXjeBqSW1l3xd7oWjDVOWZ+vxf0E+BNXk9
 02Vg==
X-Gm-Message-State: AOAM5324j+3c+eIHxXjxxWx/YKGtHYgLxzeUrF74pzsCj2XliS3ZPcbr
 H7jxpaw8+qw/8Gq7FLeZv6hrRA5J4fDb8HM41HU=
X-Google-Smtp-Source: ABdhPJzCjvA/IcL6veR1cMq/hHfeR/9BjzJWC1sc8TXInJGO6uEWxkVIvtfeGVw/Xg4fYEEF9aI0SBlYG9XiAfkPmrs=
X-Received: by 2002:a17:906:f92:: with SMTP id
 q18mr2161486ejj.353.1632773397700; 
 Mon, 27 Sep 2021 13:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210927081426.762-1-caihuoqing@baidu.com>
 <20210927081426.762-6-caihuoqing@baidu.com>
In-Reply-To: <20210927081426.762-6-caihuoqing@baidu.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 Sep 2021 22:09:47 +0200
Message-ID: <CAFBinCAatVy_9abUJ7A6frbsOqDqAzVe9oDJODOS5MC7aCcDVg@mail.gmail.com>
Subject: Re: [PATCH 6/9] iio: adc: meson_saradc: Make use of the helper
 function dev_err_probe()
To: Cai Huoqing <caihuoqing@baidu.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_131000_000305_D65CB58B 
X-CRM114-Status: UNSURE (   9.21  )
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

Hello,

first of all: thanks for this patch!

On Mon, Sep 27, 2021 at 10:15 AM Cai Huoqing <caihuoqing@baidu.com> wrote:
[...]
> +       if (IS_ERR(priv->clkin))
> +               return dev_err_probe(&pdev->dev,
> +                                    PTR_ERR(priv->clkin),
Is there any specific reason why you put PTR_ERR() on a separate line?
it would still fit into the line above and be below the old 80 chars
per line limit.
For priv->vref you already have it the way I am suggesting there.

[...]
> +       if (IS_ERR(priv->core_clk))
> +               return dev_err_probe(&pdev->dev,
> +                                    PTR_ERR(priv->core_clk),
the same question as above applies here as well


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
