Return-Path: <SRS0=czMH=V4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 268AEC433FF
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 16:56:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED7F8208E4
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 16:56:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mwVdMuw7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OSG11j0o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED7F8208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AyI5vug8v0RH6OZx/63AYAHFZzJROfsRx+if9mV8gE8=; b=mwVdMuw7G0wyvp
	xwLdyXqKcTBCcFjk4je0Do7X6n2CVYl/+VRfcs378Bpexq6D+Bmk/eHyHNZiGBUUP/L56mABkYaML
	5WFfZO5AE2Bvm3fMJIcWsMIWCQcDsX4BcI6EJA/fdGSw5Ac8++Z6nafnDdUl1fVWA5ylBzw8d9JqT
	IkzwORT8aUAsZThLNs0ifoRklH+k97fXeP2FAZH7aDJLKA1GCJ6LRW0M9nmPXLzRoevzozr71VAm7
	bhplJcBQ4H2ZOD6F3DeTBzZycElhKUZ7wQe0/egjZQUKg3PuDLuwcwyi0pmXA+3a9sSQwIftqO8r8
	YyZJlyJZGcA4ubbnI52Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsrte-0006cz-IJ; Wed, 31 Jul 2019 16:56:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsrtb-0006ZS-N9; Wed, 31 Jul 2019 16:56:13 +0000
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F72C20C01;
 Wed, 31 Jul 2019 16:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564592171;
 bh=Cic2JrM+YjcNDGZKD8kvKDZrx7id5Fahrh8aT8NyBT0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OSG11j0ovXBywu0fX2l8W0z5qMeemjGHn+yizDeOCR2IWH+d/iXJtJ4IK0/KdsbiJ
 tkgSY3sEjP0BzN3NIDeknh+o1MxDvRgoruqQgvFUUBuSPN8DDZFqijJpS52YAdN+Ej
 sT49EcBWZ2gxc/nz/PzFCsjRdfSsQhWbSIWkp1uQ=
Received: by mail-qt1-f171.google.com with SMTP id d23so67319401qto.2;
 Wed, 31 Jul 2019 09:56:11 -0700 (PDT)
X-Gm-Message-State: APjAAAW4N5Ihx2pEKtsUAlGnyZHJtc6kxGBACEkEB1oq7Lf2uGN3SrLj
 LSkR/kRZzWmDLJ6uDv+Bi52zCDNYR7NDzGi+Cw==
X-Google-Smtp-Source: APXvYqyq5aSqkMkY1jRWObJcHd+QJppxe0Gfq8GLINw2AdMyUd2oGDpfDfAN517bLe0isUjhnIa9VYbJPYtguO8ywn8=
X-Received: by 2002:ac8:3908:: with SMTP id s8mr41133202qtb.224.1564592170319; 
 Wed, 31 Jul 2019 09:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190731124000.22072-1-narmstrong@baylibre.com>
 <20190731124000.22072-5-narmstrong@baylibre.com>
In-Reply-To: <20190731124000.22072-5-narmstrong@baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 31 Jul 2019 10:55:58 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ=RtSxw8m687X_zWKY_V5X9zqt3xrq5gjF8WcEZspg-g@mail.gmail.com>
Message-ID: <CAL_JsqJ=RtSxw8m687X_zWKY_V5X9zqt3xrq5gjF8WcEZspg-g@mail.gmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: arm: amlogic: add support for the Khadas
 VIM3
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_095611_802153_B3A7CA98 
X-CRM114-Status: GOOD (  12.54  )
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-amlogic@lists.infradead.org,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Jul 31, 2019 at 6:40 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> From: Christian Hewitt <christianshewitt@gmail.com>
>
> The Khadas VIM3 uses the Amlogic S922X or A311S SoC, both based on the
> Amlogic G12B SoC family, on a board with the same form factor as the
> VIM/VIM2 models. It ships in two variants; basic and
> pro which differ in RAM and eMMC size:
>
> - 2GB (basic) or 4GB (pro) LPDDR4 RAM
> - 16GB (basic) or 32GB (pro) eMMC 5.1 storage
> - 16MB SPI flash
> - 10/100/1000 Base-T Ethernet
> - AP6398S Wireless (802.11 a/b/g/n/ac, BT5.0)
> - HDMI 2.1 video
> - 1x USB 2.0 + 1x USB 3.0 ports
> - 1x USB-C (power) with USB 2.0 OTG
> - 3x LED's (1x red, 1x blue, 1x white)
> - 3x buttons (power, function, reset)
> - IR receiver
> - M2 socket with PCIe, USB, ADC & I2C
> - 40pin GPIO Header
> - 1x micro SD card slot
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
