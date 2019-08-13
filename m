Return-Path: <SRS0=/wkT=WJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 458A6C32750
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Aug 2019 21:19:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1479720842
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Aug 2019 21:19:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kIis9HuX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="crdeyHeU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1479720842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e+0OUIkpF4Kp7M0go5gTUeVJdXO2Yv4pymGEt9qnMmQ=; b=kIis9HuXjRs6P4
	eE/U/LWBfP5CsE7eBcWk3zOBW0f/FX1/meV4cWMx2AGGumjhUKhz8Zp46+Qg3lmHG5TsZmf7V+bXP
	Bt47N+CKZ+mvxgn+rqqvDo4bJ/ccD3VwRqeCOqqMoHg/k0kOgGkEq/9RgBsjURUGf0wB2FOMDWj+f
	o6j/W1yMX8Pi6V4ewGDrj0w1D+/f+1Yd4ZJ5pEPazVxgZSkDj8NB3FjLtmeNEZixx5Jbnc8DiVtJN
	PyssQ7yK00yAVU3K4SpPBJx8UuZ4KWp1BwDDqMn/+peyiSVjF5VZSZCPsnfOOowAnn/KR63eARN7Z
	jdFngqMG8y9dx7B05WUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxeCN-0003Cc-Lb; Tue, 13 Aug 2019 21:19:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxeCK-0003CA-G9; Tue, 13 Aug 2019 21:19:17 +0000
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 758A620844;
 Tue, 13 Aug 2019 21:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565731155;
 bh=JBsXkG9yjV9pbDty8DqzOGotTUIFrOYtaCE16hbum0E=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=crdeyHeUCm2qAB/OFjwFqysrHfSLR+UetxBzbXV/OkhxIzZfVtCcy8QUXWO3fAxFd
 2KmAbggtL+55hUlR84ISmfdKkirvhsBnEQBoP/uxSi32b2CwTR1v2IV+trggF1jN+B
 8eECl3mkn8psCrRYD3Xw2D9PO80/YYBYHiSRZJFw=
Received: by mail-qt1-f173.google.com with SMTP id q4so10742519qtp.1;
 Tue, 13 Aug 2019 14:19:15 -0700 (PDT)
X-Gm-Message-State: APjAAAVaNsI4i5fgA+H9eRGVmR9ZsaJAZ7kHJQZKND2kkdQbiqqF0ori
 w5nkUvQmBmtZXIfslLeYgSTEfKWuxkOZlXZ/wg==
X-Google-Smtp-Source: APXvYqyYbgP4TBRZegMhEKfIghK9abGk/VBtufyF+J98q6CTeTofBSY0orANz1i3T/gclh3hbfmdnJ7cT6pao2tVfEA=
X-Received: by 2002:a0c:acef:: with SMTP id n44mr228291qvc.39.1565731154671;
 Tue, 13 Aug 2019 14:19:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190808085139.21438-1-narmstrong@baylibre.com>
In-Reply-To: <20190808085139.21438-1-narmstrong@baylibre.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 13 Aug 2019 15:19:03 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+rBUWCBo0CnhnJX91o+8QF4gO5cJYqFgKEJeekAeuVxg@mail.gmail.com>
Message-ID: <CAL_Jsq+rBUWCBo0CnhnJX91o+8QF4gO5cJYqFgKEJeekAeuVxg@mail.gmail.com>
Subject: Re: [PATCH 0/9] dt-bindings: first tentative of conversion to yaml
 format
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190813_141916_555997_F70DA46B 
X-CRM114-Status: GOOD (  11.24  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-spi <linux-spi@vger.kernel.org>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, Kishon Vijay Abraham I <kishon@ti.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Aug 8, 2019 at 2:51 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This is a first tentative to convert some of the simplest Amlogic
> dt-bindings to the yaml format.
>
> All have been tested using :
> $ make ARCH=arm64 dtbs_check
>
> Issues with the amlogic arm64 DTs has already been identified thanks
> to the validation scripts. The DT fixes will be pushed once these yaml
> bindings are acked.
>
> Changes since rfc v2:
> - Collected Rob's, Martin's, Philipp's and Guenter's tags
> - Removed mhu maxItems: 3 to leave only minItems
> - Fixed flash@0 in spifc example
>
> Changes since rfc v1:
> - Fixed bindings according to Rob's comments
> - Added commit log
> - renamed yaml files using amlogic prefix
>
> Neil Armstrong (9):
>   dt-bindings: mailbox: meson-mhu: convert to yaml
>   dt-bindings: rng: amlogic,meson-rng: convert to yaml
>   dt-bindings: spi: meson: convert to yaml
>   dt-bindings: reset: amlogic,meson-reset: convert to yaml
>   dt-bindings: arm: amlogic: amlogic,meson-gx-ao-secure: convert to yaml
>   dt-bindings: phy: meson-g12a-usb2-phy: convert to yaml
>   dt-bindings: phy: meson-g12a-usb3-pcie-phy: convert to yaml
>   dt-bindings: serial: meson-uart: convert to yaml
>   dt-bindings: watchdog: meson-gxbb-wdt: convert to yaml

Series applied.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
