Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5BBC43457
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 12:34:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29ECF22265
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 12:34:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jFyJA6vq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29ECF22265
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A1TCLuP/IBQZXQC+uXXsCL3TSqNfeHF1ZTHK2ysSma0=; b=jFyJA6vqQZMjS7uHXsSS6qslq
	NKE25xdzQlYiNBL492tGsy/qoLC3EdWoyhjOEzriquv7ZYg2S16/YImfyEY9JIZ4tDHgap1paaHc0
	9+OjHLwIyRJnESKp/GWZOoJZMeKqKIXjOQjrwapfJsFgvmrRwy4tpNlbi+Asscl5FSrqXdvYy/1sv
	XEf3DQ45np+AABfZDee92HHtV++FkNv6kZfUuBOYw/f0lmC8PWb+UQhD+GViTaxSSby1aOej1/xHv
	zYdvV+cKVJSP0A4up3GQvf5pkWtJLJW3k/dWN7BjeSrMBDnkv21Ed9kIsIAAXAEn63HK9zU3GBo2d
	db3ifSY+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUqqE-00076n-7B; Tue, 20 Oct 2020 12:34:14 +0000
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUqq9-000757-JM; Tue, 20 Oct 2020 12:34:10 +0000
Received: by mail-wm1-f68.google.com with SMTP id c16so1681831wmd.2;
 Tue, 20 Oct 2020 05:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o05XnIP+Bg3BaL7qnMAypA1wj6djC3Q9AjunxR2fiXE=;
 b=btjC6zU3z8es6a7+PNqMngrRD4IsTFOmLGUVGwknEEZuw5CQHelbWAYz48xAqL/thy
 Fh51r3gFqQqraoFPtG8FTJDi0M/d/qxq/TeaTuOTtifhOOYLytHUrMxBRiltdUCIC3Nm
 V5NYOmA0Bx7ohGyV+JDKkCwwmYD0nlwMB4LZ99eOpUKJmOkCkAY4mz+j14uCF4fCqf4K
 RMa322GAjJ0C6NmkBHwfz7S4AgRjvR2B/h8dfRqJqQD2Os7AXH4KAZ6fb0f27CE5ru9v
 6pal0nWzFAJSZCUgOPJvr5ZK/jhmoAVX2O0OfvbLzI62oMrl7aM2bgBcUzluafur5PIK
 aIHg==
X-Gm-Message-State: AOAM531PU0KizbFEd/W9bfbQf0tNMDna0pQILJuvg2WBYDGJddfA93rL
 uyP/ykNN3A85a1PYMAv5D7w=
X-Google-Smtp-Source: ABdhPJwBRAsCi93ZLg6efPLo+MWBmBwBPiFAgJGSZxHN3kxdrnWuhiAWc+LcQZlxoXTxlsITeFwVpw==
X-Received: by 2002:a1c:9949:: with SMTP id b70mr2762243wme.116.1603197248325; 
 Tue, 20 Oct 2020 05:34:08 -0700 (PDT)
Received: from kozik-lap ([194.230.155.171])
 by smtp.googlemail.com with ESMTPSA id n9sm2774115wrq.72.2020.10.20.05.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 05:34:07 -0700 (PDT)
Date: Tue, 20 Oct 2020 14:34:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 05/29] arm64: dts: amlogic: meson-g12: Set FL-adj
 property value
Message-ID: <20201020123404.GC127386@kozik-lap>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-6-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201020115959.2658-6-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_083409_637446_56346F8A 
X-CRM114-Status: GOOD (  11.07  )
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
Cc: Felipe Balbi <balbi@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Oct 20, 2020 at 02:59:35PM +0300, Serge Semin wrote:
> In accordance with the DWC USB3 bindings the property is supposed to have
> uint32 type. It's erroneous from the DT schema and driver points of view
> to declare it as boolean.

I think the driver uses it as u32, so what do you mean by "declare" in
context of a driver?

Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
