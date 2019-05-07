Return-Path: <SRS0=hY+l=TH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7814EC004C9
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 May 2019 15:45:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 474EA20825
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 May 2019 15:45:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SGPWUtOT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Yy5jMJ2Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 474EA20825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cD4ryBH4fUmKXuyNO0dEW/osgkVUhK45TmUI52e0N60=; b=SGPWUtOTYPJXJM
	4ao5HgW1PlIMwH2ZfwABs69AjZTCl8z9iRUGzWc56hyyjhQzL6/QaWNVD30R6gRYOQJABJ+0a1DRc
	faoKra9biGKI425Dp3AFmWCgbpYNqVU+XN31PNK5SYWN9x7r7hjJIr/L4w8VL/741xbqebx8xx96d
	rZzvnnfZuOLlxV03kvjbVTjMLB5Kgan5wLSAp2s4GlOHLXiNb6Pib9bdZWY+vXtr6Lf904OiHkws3
	I7Ieitl8FzNNQASe4tReX5OBgs/sWqYGGXuhuBkkfe2g6w1fk/3HBG0AmGvoMWuRNDDn3UmVkQCwC
	N7LTCh3PxM+EiInRAEKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hO2HF-0003uM-N3; Tue, 07 May 2019 15:45:09 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hO2HB-0002tC-8u
 for linux-amlogic@lists.infradead.org; Tue, 07 May 2019 15:45:07 +0000
Received: by mail-wr1-x443.google.com with SMTP id v10so10755942wrt.6
 for <linux-amlogic@lists.infradead.org>; Tue, 07 May 2019 08:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=2V0KRw1X58VA1zYEdAPk5xBLtGjEZfqDlI4myBarUq4=;
 b=Yy5jMJ2ZIGJeG404RpP9WoYgNRTgrT7VYEhcrexMSkT2UlStHDAKro9YhHqIU9PMMQ
 Gj0SWTbwWOp4k85nkWe7AQCbG958G/t1/tkf7FGVNOnmc6lx6fmKUSQ725yVo6vlNQQr
 JUc02nMsvq2nbCmnvR0IpehTOl51duBRK4067ahnaSB7cu524DKutjAnFW6aOK0m1+2P
 joCLhf5ig8b2ig9oPswIWq/l35IWziGT4chI8F6xifOvS6ZmGwrZoxGQdqufYa+sluUY
 UbG4F25wQqcAbHbdKrTjr1aXfJYhXqcdlRPdNUnV3/MqAC+xOw5aW1Te1jyHXl/tNDh7
 CpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=2V0KRw1X58VA1zYEdAPk5xBLtGjEZfqDlI4myBarUq4=;
 b=bLMCm3+LqFyMEDOZv8te2CtfPL2XTPxQzTRcdehPnn7tHlPITuK1tSXP1ra3RO1ylh
 7rJTfOKpPhLX5J2NyYHkpih1BvxqS1kj/3nBYmEP1jTUxzVZZMzg2FvZTjMXXOAX6VMY
 UMnI/ve1WSCCL/X+3B0UrWhVwLQilQLqR16xkKA3Jt8IA1EPe8mgFwtGuT3FrtStU3Xt
 SzcrBT21AiPACwfY1XTOz/Y0bhIJZMThWb1XToEX3g8LsH6qcBFE4V5SyoTeYUTDoySb
 e6//tXe2zr3ul5L6D5TkaQVWZESMBqZYqrpSXaQV/tLhN6n3+GOWfbxBB0rtj0XdJO2z
 VP9Q==
X-Gm-Message-State: APjAAAXVUFrwrrTimW+iv2YGYfQJMeT2Xy6kJWVFsFse+umc+vsUoUHL
 ZQaj+toW90Kio6wJ6qh+kVoiEg==
X-Google-Smtp-Source: APXvYqx1ZgBnmf0Vh3kreTWGa5/FxgkWxJQ/j0gdArM5OEkyd7Azus61oAFXyJvB3HAhrbHjJgvz7Q==
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr18766060wrv.79.1557243902842; 
 Tue, 07 May 2019 08:45:02 -0700 (PDT)
Received: from boomer.baylibre.com (uluru.liltaz.com. [163.172.81.188])
 by smtp.gmail.com with ESMTPSA id j71sm14285280wmj.44.2019.05.07.08.45.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 07 May 2019 08:45:02 -0700 (PDT)
Message-ID: <8c4776976c1803d4cd944d88dd73e2b414fe1201.camel@baylibre.com>
Subject: Re: [PATCH v3 0/6]  Add drive-strength in Meson pinctrl driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Guillaume La Roque <glaroque@baylibre.com>, linus.walleij@linaro.org, 
 robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com
Date: Tue, 07 May 2019 17:45:00 +0200
In-Reply-To: <20190507115726.23714-1-glaroque@baylibre.com>
References: <20190507115726.23714-1-glaroque@baylibre.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_084505_377035_1868C43A 
X-CRM114-Status: GOOD (  14.84  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 2019-05-07 at 13:57 +0200, Guillaume La Roque wrote:
> The purpose of this patchset is to add drive-strength support in meson pinconf
> driver. This is a new feature that was added on the g12a. It is critical for us
> to support this since many functions are failing with default pad drive-strength.
> 
> The value achievable by the SoC are 0.5mA, 2.5mA, 3mA and 4mA and the DT property
> 'drive-strength' is expressed in mA.
> So this patch add another generic property "drive-strength-uA". The change to do so
> would be minimal and could be benefit to other platforms later on.
> 
> Cheers
> Guillaume
> 
> Changes since v2:
> - update driver-strength-uA property to be compliant with DT documentation
> - rework patch series for better understanding
> - rework set_bias function
> 
> Changes since v1:
> - fix missing break
> - implement new pinctrl generic property "drive-strength-uA"
> 
> [1] https://lkml.kernel.org/r/20190314163725.7918-1-jbrunet@baylibre.com
> 
> 
> Guillaume La Roque (6):
>   dt-bindings: pinctrl: add a 'drive-strength-microamp' property
>   pinctrl: generic: add new 'drive-strength-microamp' property support
>   dt-bindings: pinctrl: meson: Add drive-strength-microamp property
>   pinctrl: meson: Rework enable/disable bias part
>   pinctrl: meson: add support of drive-strength-microamp
>   pinctrl: meson: g12a: add DS bank value
> 
>  .../bindings/pinctrl/meson,pinctrl.txt        |   4 +
>  .../bindings/pinctrl/pinctrl-bindings.txt     |   3 +
>  drivers/pinctrl/meson/pinctrl-meson-g12a.c    |  36 ++--
>  drivers/pinctrl/meson/pinctrl-meson.c         | 177 +++++++++++++++---
>  drivers/pinctrl/meson/pinctrl-meson.h         |  18 +-
>  drivers/pinctrl/pinconf-generic.c             |   2 +
>  include/linux/pinctrl/pinconf-generic.h       |   3 +
>  7 files changed, 195 insertions(+), 48 deletions(-)
> 

Tested-by: Jerome Brunet <jbrunet@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
