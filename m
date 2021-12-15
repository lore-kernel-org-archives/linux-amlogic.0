Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C5EC433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Dec 2021 20:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GdGh4j5CU3ys1dypPUdENxoitfx2sXsiIN0uAX/aosY=; b=gD2sM0EEGvaOSu
	vlB0Wdj/VmZmFS6sxUWGf5z/W3k/24L6cAtIMWNjgtngpZD9uHjjdu9No7rx3WwrioyaCicDWJUPU
	8U+LmnjRaFSK5h4LeFo/LbWrTXxgGmCuEG+JltPkXj37wHCzspmLIIB0NQKmDSrG6FYP5rxkMWoyS
	+akIaUKnys3PigIRMUJml9U9QV3Sctjij2P7LpR+wOaJntqYJ0zsms9ECiF033LmMB0KICJIYBlE+
	sHkx01VwdaPpoYy4XXGt9BDRNEnl6B6Y+5AbqV/cJP70lRemDTn5PG+H6xOHwmk0siPfaM+fC8KAy
	xHTxz1GT7kPL1rufKC+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxauG-002czh-C6; Wed, 15 Dec 2021 20:29:44 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxau2-002cvZ-8Q; Wed, 15 Dec 2021 20:29:31 +0000
Received: by mail-ot1-f49.google.com with SMTP id
 a23-20020a9d4717000000b0056c15d6d0caso26301428otf.12; 
 Wed, 15 Dec 2021 12:29:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=agAmJrAHp4WJOo55DBZF6jiUaB3K9dubsfqlOWvl1sI=;
 b=O37zZlu3r8oj2KxCZQEcWxrmc7UcdBrUpCYnb0QzyFCBCWBAQDW4luzlAegT30Sfzv
 bgeP6JAT/j2en0zQkUzqbrGWBupIcxxSkMLmOc5w29ybq9vOyJW43QswqK/KqXnABdfe
 ZwFjZqeQdLSyM1HkZpjdJ5Pve2XAQAb86qZB5BHzh4fT31DHSfEgtEKHUjAbE38n2I0y
 OQoTxzoR4XTfcgSRuzE+FWulXZkP78oYFpA1LW9nZQc5Dua0KdU3gNkzPtMQ/xki7avm
 Q6t/4Vt1QNgvI75fQ2IogIR7grDicdp73rXOp3fhieigOlKV7RR5hFOR55sJ4R3m57Oh
 Gxog==
X-Gm-Message-State: AOAM530AjOGwrtZKPuN1YB+my5WoOQt8qoE5zCDOtHTsunYBFpnBGAcG
 oQq+XPudL+YnhDstC9zQsUTrpAzhAQ==
X-Google-Smtp-Source: ABdhPJz9yUol/9bNBhhW7cpZ2jGbw20gyt4RO4u1F4JQBcIkMG+mhJOkyFi0L7NloVWIsLaailAEMw==
X-Received: by 2002:a9d:77c6:: with SMTP id w6mr10382149otl.155.1639600169412; 
 Wed, 15 Dec 2021 12:29:29 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id t11sm638861otj.24.2021.12.15.12.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 12:29:28 -0800 (PST)
Received: (nullmailer pid 1784906 invoked by uid 1000);
 Wed, 15 Dec 2021 20:29:27 -0000
Date: Wed, 15 Dec 2021 14:29:27 -0600
From: Rob Herring <robh@kernel.org>
To: Qianggui Song <qianggui.song@amlogic.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 2/3] dt-bindings: gpio: Add a header file for Amlogic
 Meson S4
Message-ID: <YbpQJ3D6UrMckg02@robh.at.kernel.org>
References: <20211214022100.14841-1-qianggui.song@amlogic.com>
 <20211214022100.14841-3-qianggui.song@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211214022100.14841-3-qianggui.song@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_122930_323347_E3A8642B 
X-CRM114-Status: GOOD (  10.64  )
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

On Tue, 14 Dec 2021 10:20:59 +0800, Qianggui Song wrote:
> Add a new dt-binding header file which documents the detail pin names.
> 
> Signed-off-by: Qianggui Song <qianggui.song@amlogic.com>
> ---
>  include/dt-bindings/gpio/meson-s4-gpio.h | 99 ++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 include/dt-bindings/gpio/meson-s4-gpio.h
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
