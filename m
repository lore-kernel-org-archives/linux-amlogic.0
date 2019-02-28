Return-Path: <SRS0=GxHq=RD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFF1C43381
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Feb 2019 16:14:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CD442133D
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Feb 2019 16:14:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dzm58LmO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CD442133D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fveMMaTxIPKU2Yhrw0F4GNX8X8Cnp+pZhC7yz9N40WM=; b=Dzm58LmO/Ab4sA
	WuVAo5+tsStA3vvvt2vYYtWrOhbgWml5RHYatelLOoQa9gG5sfczyZ9t9FsUqgZp57oaMuBn6YbRP
	ppJRh95m0dDtoS8DAVqhLKPLQN9ipbL8sEGoiPUzvjY+5gdSm2ZcC2Ycw3D8zzNfuwm3snsvIls/j
	cqxpkpALj6QTd2MTHVvDAfQKG4BUib7VQTmnsZ7NAHvV7ykimX6xyY2ssvsTjK7MS+xjcnnowR5TG
	h0svTqbRhJWnDRSeYtgjQnpSrYD1r3tyRhrCBFMG01YTsWk9ye1gh/opvhMjFHgHXr9VIfbXoWfQO
	mw35ieLlp6EGLwxm04zg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzOKH-0003B1-87; Thu, 28 Feb 2019 16:14:25 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzOKE-0003Ac-Po; Thu, 28 Feb 2019 16:14:24 +0000
Received: by mail-oi1-f195.google.com with SMTP id g16so16951341oib.1;
 Thu, 28 Feb 2019 08:14:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1yCi+l0d1N6btSY7Y2t5Y16kw8CGpCXoapPCxC+MkEY=;
 b=As67LnW5Brj/myDZblPhUp2EQdJ3vQRPIUk/cN4dnW8sIsD1NffkXa1qQqk+Mck6ZL
 VAHtXpqI8l9IiO6HD8aifRhV74P+aphd0YOxAc3gcMb/SDEiCfnM2Reqz5WIXAvPesOo
 cIvJCajNOkEOQzEpPcfNYGb0hCp0NoJ3/NYwQjsCBxtvkW+V9xdwzaLDeaq6fTF8MMqB
 fFCLCX/WbqTK3+MxFvEXCEjVhoKRW5n/L++hGFgO1CBL+awvA2QDeTTzPJcMESvUha5h
 0dqznFkSmfAdgYtVFHRJCZLsZyBIq4EI+QsJb1iGYEfx4oGtMmkbkGfMk53wH1quhmeu
 0wjQ==
X-Gm-Message-State: AHQUAua4zCUkJIoLzaWar70dwPhq9S8L2f+IlEAObosURRsPnZP4slWr
 891OjYQc7drozdc8dwaCEg==
X-Google-Smtp-Source: APXvYqxRQNXOjRsvjDpIrKJLiOc4GbYNNivGHurUh9td6dPe4XeFtFVT7nqTOS0r6w/SfLVNMP9D9A==
X-Received: by 2002:aca:7201:: with SMTP id p1mr283553oic.159.1551370458595;
 Thu, 28 Feb 2019 08:14:18 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m65sm2837868oia.15.2019.02.28.08.14.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Feb 2019 08:14:17 -0800 (PST)
Date: Thu, 28 Feb 2019 10:14:17 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 3/8] dt-bindings: usb: dwc2: Add Amlogic G12A DWC2
 Compatible
Message-ID: <20190228161417.GA31632@bogus>
References: <20190212151413.24632-1-narmstrong@baylibre.com>
 <20190212151413.24632-4-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190212151413.24632-4-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_081422_832714_E3FDEB88 
X-CRM114-Status: GOOD (  11.02  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, kishon@ti.com, hminas@synopsys.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 balbi@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 12 Feb 2019 16:14:08 +0100, Neil Armstrong wrote:
> Adds the specific compatible string for the DWC2 IP found in the
> Amlogic G12A SoC Family.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
