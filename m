Return-Path: <SRS0=YCAW=FM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B0AEC4361B
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Dec 2020 18:01:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E051A23B3E
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Dec 2020 18:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E051A23B3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fcB8NJvnxEqyTR3tKQAf+GygQgfGlRqqiysc/ELgSoQ=; b=gniwwFRndM7vdhuZmxP3t0eWq
	3jaRA5CRT5e/fnbMfKlUbfIuX1khk+a9VvNXdXUs6LqlbH0u+fhzKrZkqAU6bvyPwG95Qb1rLsmD6
	RMQVAZiyN01J7errn4jjztL1gX/v2njS9Iafmz6xIkSLn1Hiqy5usssQIQm5WNl5KQFaZdLyyx0y+
	m2XTMv1SyICKWM3lrfJ5TEOFXhsUwZwCXuQXZLHDJUNz7AqBnwW7N5f5zl5PVvJQ4o4rpThxcgmBu
	kR/SU6P4f2s/WpJwt+uL7JtBgADlSyVTQLH1H4POtRn4ga0Y4QPoflgu/CFiD0bfwaL2Bu7XHi8ou
	b+gIEPaOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmhIv-00082a-Fp; Tue, 08 Dec 2020 18:01:37 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmhIr-000822-Uk; Tue, 08 Dec 2020 18:01:34 +0000
Received: by mail-ot1-f68.google.com with SMTP id 11so16601382oty.9;
 Tue, 08 Dec 2020 10:01:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EStUUTvh3gp4V8APChCzjiNJU0x+/orbSyMqoClOXF8=;
 b=TE2cagu3PkzEnkOHzV3ibkHIasjEtxZgehnlhMIKAs0Xt8Q4GWLhMKHuhpg483ximf
 nVnn4L25mWmMRb7xflHFuqe8ibUJB8Mbihue3h8zswYjjw45AM/dQr4yrfjW+cP+0SpA
 M9aHU6/FXUPJbJeb3mniXq8ysC00Rx5vPahZqjdyuUe6UuQwqicOE/9RsyaE7TglSFQt
 nadJUWivEriStUbbpkcjdvfUUrz7Ifs8foLsylkFbuBPhlrMWRJdtItleYfIP0zq8p2Q
 cvqTUJHKrVLZFjwqfGWX+bGWD+xkPrczIavfFYR3rj62ht7MJ2aQlkL7vpRNNI170JGF
 08+g==
X-Gm-Message-State: AOAM530NqJTXTlnJ6ytkTx+xYerfIlj0cUMAa4smKJrhy9c2zd8FvhPV
 4OugvpXbczZUGgLFcSaXWYLzfPHTNw==
X-Google-Smtp-Source: ABdhPJyRrY60woe6VcB5XH36i8axPXXvsfRJfoGCwZ8ZImYLpvSP7fmnKa7i5UZ88Gtu9oOPJpzcKQ==
X-Received: by 2002:a05:6830:2371:: with SMTP id
 r17mr9623632oth.236.1607450493097; 
 Tue, 08 Dec 2020 10:01:33 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n22sm346849oig.32.2020.12.08.10.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:01:30 -0800 (PST)
Received: (nullmailer pid 2795569 invoked by uid 1000);
 Tue, 08 Dec 2020 18:01:29 -0000
Date: Tue, 8 Dec 2020 12:01:29 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clk: g12a-clkc: add DSI Pixel clock
 bindings
Message-ID: <20201208180129.GA2795539@robh.at.kernel.org>
References: <20201126141600.2084586-1-narmstrong@baylibre.com>
 <20201126141600.2084586-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201126141600.2084586-2-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_130134_019896_F37CAF44 
X-CRM114-Status: GOOD (  11.41  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 26 Nov 2020 15:15:59 +0100, Neil Armstrong wrote:
> This adds the MIPI DSI Host Pixel Clock bindings.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  include/dt-bindings/clock/g12a-clkc.h | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
