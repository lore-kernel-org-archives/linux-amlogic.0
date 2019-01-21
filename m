Return-Path: <SRS0=UU9i=P5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81E1C31680
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jan 2019 18:11:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACB332085A
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jan 2019 18:11:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E2ToBJ/l";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IuV0TLGP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACB332085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+HmNbOBKNHmhOBJ4yd+/IrIK2bWOIibXMvI9fL6rm5M=; b=E2ToBJ/lZr54ZU
	ngviPsXJ3sELDkhhR3GEXGcr7FYkrnpKcspRNkuEwhSlGsgxON1VOdLCnYw7hBGlJEt0I5THlSzUC
	ogyjPFAnZ/Bj4kc6jfFwXuiT7+LOn5VyuQHybqOzYVq9r14CWr06lnk/YYTupApE9+mUe9yf9C0CK
	qhsb9jvKQm7J1NRGvnugNsCA29sUaGntPJAcCeNzGDQyBLbDTkAex3A5W1httXQdackpIGBSnXDxE
	YgmmEzYcwGv75kT08CFPWP0+Z8f/M4scbLz9VXZaT++bp37hQtInpuUwzDesS0ezK+CMF57RyOJdh
	MGptJR94InFLuT7qC1zg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gle2h-0004e2-UI; Mon, 21 Jan 2019 18:11:27 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gle2e-0004dJ-48
 for linux-amlogic@lists.infradead.org; Mon, 21 Jan 2019 18:11:26 +0000
Received: by mail-wr1-x442.google.com with SMTP id p4so24490363wrt.7
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Jan 2019 10:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=x+oFH5CfxZ7C6Sua9d+gUiEAtXOfmj2np6FmFpROcok=;
 b=IuV0TLGPNLZBEiui1KPY3bF9vJuak24t6isOW0k7zS3IcRYyxEc1pDfRD+beif4a4/
 Q7whpV7QkMpjyVaexdQWMvcu7bBZEikaNKz7t6cIxUK+wcZApRtvw4QBLBT61UYgaC95
 FsPH7shnpH7QQSIOkunQc9WrdmLPO4yLzWR3lHrQv/oyYY1PriCn5BAdnW1LXhSy/E+b
 kbHppitqfNbl+7Xi9Fx5c1DiGmtCmpcDgDTOAdPoFMaAyhMhEHL4FCof9O+3GbZD0qI2
 w+MJJuNQx6juzgaBIjow9XoDU9xSdRPH3Pw3o2qNxOzky9foBUhGvnVwbM5JIEubysoM
 Y7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=x+oFH5CfxZ7C6Sua9d+gUiEAtXOfmj2np6FmFpROcok=;
 b=T7dIow1qfGEr4YJdc/n0GpOLBWPhr/vumr8hyTUsuHY1cySaSH3cuZEl+L5lcg8xJY
 1aMz7WNgtHeFC2Ot86Nkgr+vAqd69EV2gS5118tSccxW7r6FW8XEHK5hPNc5POTdfTXB
 cKH1HEMXV6PPc36H+Dg/VzsoS7rkvQQkWe1sbvzgSKGV2cG7lFTYNUugvG2+x5U3tXsx
 8R5fpvRbK2tnNj1/RxLz8lXslTUNwvQOLCT5Jabrc34JYvysuk4gamBAWVcdY1+BDAvo
 plyqAAm1M6hBj3TV2fDG+Aiz0DIzJl5kmK1UTIVlSEazYqNJ1tB01M0DgDDr4JbdEzb4
 /BNg==
X-Gm-Message-State: AJcUukdHYqH5taxNhkN3JiAqhckw3YMlwnnYb8WD9cQ12tsnNUhmbUJ7
 iZQAa4aXQMXFXkMM83MEi8W2cw==
X-Google-Smtp-Source: ALg8bN6foyjYeieuxE9FmRK0G2uxi0S3Trv/iVPOIQh+IpwgCIwTu1NOhk63eyWUt5Qr05zldsV0yA==
X-Received: by 2002:adf:fa05:: with SMTP id m5mr28517335wrr.155.1548094281780; 
 Mon, 21 Jan 2019 10:11:21 -0800 (PST)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id k15sm127918568wru.8.2019.01.21.10.11.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 21 Jan 2019 10:11:21 -0800 (PST)
Message-ID: <d8b4eaa459108471ceaf821937dc857c83bb8487.camel@baylibre.com>
Subject: Re: [PATCH 0/2] arm64: dts: meson: g12a: enable pinctrl
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Date: Mon, 21 Jan 2019 19:11:19 +0100
In-Reply-To: <20190117103151.3349-1-jbrunet@baylibre.com>
References: <20190117103151.3349-1-jbrunet@baylibre.com>
User-Agent: Evolution 3.30.4 (3.30.4-1.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190121_101124_173164_C189F12E 
X-CRM114-Status: GOOD (  10.34  )
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
Cc: linux-amlogic@lists.infradead.org, patchwork-bot+notify@kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 2019-01-17 at 11:31 +0100, Jerome Brunet wrote:
> This patchset enables pinctrl on the g12a and adds the necessary
> pinctrl settings to the u200 uart
> 
> Kevin, please note that this patchset depends on the:
> * dts bus fixup: [0]
> * pinctrl region fixes [1].
> 
> [0]: https://lkml.kernel.org/r/20190116165236.8330-1-jbrunet@baylibre.com
> [1]: https://lkml.kernel.org/r/20190117102315.1833-1-jbrunet@baylibre.com
> 
> Cheers.

Hi Kevin,

Please ignore this series. It is missing gpio-ranges.
I'll add it in the v2

> 
> Jerome Brunet (2):
>   arm64: dts: meson: g12a: add pinctrl support controllers
>   arm64: dts: meson: g12a: add uart_ao_a pinctrl
> 
>  .../boot/dts/amlogic/meson-g12a-u200.dts      |  2 +
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   | 67 +++++++++++++++++++
>  2 files changed, 69 insertions(+)
> 



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
