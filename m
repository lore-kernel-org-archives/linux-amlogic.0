Return-Path: <SRS0=7v4i=DN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC6EC4363D
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Oct 2020 22:28:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCF54206FC
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Oct 2020 22:28:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qWwCDxf5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCF54206FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RfbLKdtEZmpRGoPvxs1jCL9kmVaKRDxzHAE+DoPRppY=; b=qWwCDxf5JB+Xqsb5mqpUW7MQm
	m1KEHDmKB/ZwRyNmBP2de1f8B9cspyg6eQGHQE0QtqS8DavvjFLdxg3df6wC6P7GGOkIF05HEGVcU
	XwFKXZq/zSLjOR+XCOjj6R2APwrSln6OKOhItChCBYHtOcky0DCd2tsIIyuy4yB90PpDkOZ1IyTa2
	EObqwii1CTwq8I16szzI7CggiC5CkXtniMrgUSliIyBpe2+i+k3/nce1JO8pPAN0sgkTjEu+FCNuo
	RpgAlbsXyJMyMQWQ269G30ikxNgO+N7xUu66jIqlLEFozFBkP1UpYYIU86qG89Ui5Y13gnEMCgBix
	0ceV5nyMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPvRb-0001V5-4o; Tue, 06 Oct 2020 22:28:27 +0000
Received: from mail-oi1-f193.google.com ([209.85.167.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPvRZ-0001U7-Ia; Tue, 06 Oct 2020 22:28:26 +0000
Received: by mail-oi1-f193.google.com with SMTP id x69so303399oia.8;
 Tue, 06 Oct 2020 15:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BK9fnoo1uA83BhzEQ3W88lbLalesaiwBhSmKSbszAEo=;
 b=INzXsMTAP0lzwNHeWAZHpPVOL/X47Og3biEKnGQZ9YRt2ErouNqDJGAhASdYtmlRHU
 /RSrafeVC23SHuEtg3x66sa/lzzooViXetiIxxczEOizRs8/KL+PZAyY+JWsA+LJZ6mF
 MOf9HOPtpsilZTGJSXyxbxOGKdUpDEE5UiuqtWEJni9LTOMV7dee3MG+nn1XXz0BycdI
 VPE2f3VMY/41xjPPNJIh5fU4i63rZVaLldzAUEozbjHnv668BjH2K8ZWMG3h74ErP4eP
 4gZ+6aMHTHJrRQf9W47ZypHNZxvHEHxyJ963HZpg5RZfLi4bnuhF2SfsCpi+xLrkcL1i
 +fWQ==
X-Gm-Message-State: AOAM532yfwLynNVaQFlYUaPIH4MWxOIJ/I/w7ZGkNbMR4VBI2SKwx7Ip
 qXXmXOYii6973KYUunMYKQ==
X-Google-Smtp-Source: ABdhPJxoVcEzp/l6VNBrV6AdkDsAonSUtV210T7j1H1LSoBOsP96XXbUFBTHpRVqHhawYzCR0qUyPA==
X-Received: by 2002:aca:af07:: with SMTP id y7mr298067oie.176.1602023303569;
 Tue, 06 Oct 2020 15:28:23 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k51sm86028otc.46.2020.10.06.15.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2020 15:28:22 -0700 (PDT)
Received: (nullmailer pid 2970094 invoked by uid 1000);
 Tue, 06 Oct 2020 22:28:21 -0000
Date: Tue, 6 Oct 2020 17:28:21 -0500
From: Rob Herring <robh@kernel.org>
To: Alexander Dahl <post@lespocky.de>
Subject: Re: [PATCH v7 03/12] dt-bindings: mfd: Fix schema warnings for
 pwm-leds
Message-ID: <20201006222821.GA2970040@bogus>
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-4-post@lespocky.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201005203451.9985-4-post@lespocky.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_182825_643830_8D1BF419 
X-CRM114-Status: GOOD (  13.92  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, Alexander Dahl <ada@thorsis.com>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 linux-amlogic@lists.infradead.org, Jeff LaBundy <jeff@labundy.com>,
 Lee Jones <lee.jones@linaro.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 05 Oct 2020 22:34:42 +0200, Alexander Dahl wrote:
> The node names for devices using the pwm-leds driver follow a certain
> naming scheme (now).  Parent node name is not enforced, but recommended
> by DT project.
> 
>   DTC     Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
>   CHECK   Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml
> /home/alex/build/linux/Documentation/devicetree/bindings/mfd/iqs62x.example.dt.yaml: pwmleds: 'panel' does not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
>         From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml
> 
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> ---
> 
> Notes:
>     v6 -> v7:
>       * added warning message to commit message (Krzysztof Kozlowski)
> 
>     v6:
>       * added this patch to series
> 
>  Documentation/devicetree/bindings/mfd/iqs62x.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
