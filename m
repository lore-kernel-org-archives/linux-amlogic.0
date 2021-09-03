Return-Path: <SRS0=UeA4=NZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1454DC433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Sep 2021 16:13:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA031610CF
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Sep 2021 16:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA031610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T4Av3DdDpVQCk9F3yw3QQiVcp1HWQnsdf0i6Mc79VW0=; b=k4ddgfs6ClxjPC
	C/Gbh0tp6ZD9d6c/aQcs9aL1YRsIVt8SPmRHaW4duONuoRXmxJyE/CSmQx8g7NSeqkWB6RQZry4Gv
	hO2lTl7NvCBYcAnt2aaJq4Nwz7akdVABz6D4GAd18RL8h9jkODD11C5P5NSo3WfYiZk0txdMMzQe7
	lR9xhzKH3NwALxXxz/85U2AWDjj3vFAQBwm09uc7eBiimIPzVRrNQeY4caGhodhfsuHAyOHoRVSMX
	a/4RmeUeL0Ip0AvIP25IQYs6uvwEWmuNSE0bgdp8JxwFK0cX608h8GjDM7m9ACj2KUFi35XHAqmAU
	dOWj5IJQukV25xUxwjlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMBod-00CO1m-Dx; Fri, 03 Sep 2021 16:13:19 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMBoQ-00CNze-WE; Fri, 03 Sep 2021 16:13:08 +0000
Received: by mail-ot1-f49.google.com with SMTP id
 v33-20020a0568300921b0290517cd06302dso7115820ott.13; 
 Fri, 03 Sep 2021 09:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vyBG+O0faZILcpfc2Nap4pRYLyuKC1OS4QzlPAPNwe8=;
 b=gpt1r8Od/Vf2kARlEiUyVTI5lyRkjdpVbjYPWqMOzevOVq5O0HjgzjtPwWLe2An7lC
 qgRnFap7kf6GVx6kVTummQIYdrofyXvptG/ruast3oio+gS9QVe+eTU87ArB3VBxlEbR
 zM/7no+qI7muwlvGwgj2YWrAGdm8U0VRsbkqlQd5ybJ2HtVcn9NQ/695WxXbcgmFe9Te
 0Yig5UOdqARcUXvP58MtLMy8fS2cdfuf0j73OKlj8k78LnT08frvlmwLofOOiU5UT75a
 hhqgQUFJbBImvtcQj02AKk+wje84Ph92sbe07a88kVdJRBh2iLxE5LOSEbm4WewaU3Zo
 4RXQ==
X-Gm-Message-State: AOAM531QZrD5nhH/MK+2ycGkFcM1sg+Nt2zzA6g0kIJPz4FtIV9D8A+W
 yEzilbIffO0XQbqdtJYcUR+NxEz7EA==
X-Google-Smtp-Source: ABdhPJxywJtBMAHkLKamqXPUIuQW64oaBOckS+nVxGRrAEtS4vXg4CG3vx5b30edXeBm4+N5z0B7NQ==
X-Received: by 2002:a9d:7299:: with SMTP id t25mr3830425otj.232.1630685582363; 
 Fri, 03 Sep 2021 09:13:02 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id f25sm1036421otp.2.2021.09.03.09.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 09:13:01 -0700 (PDT)
Received: (nullmailer pid 3033358 invoked by uid 1000);
 Fri, 03 Sep 2021 16:13:00 -0000
Date: Fri, 3 Sep 2021 11:13:00 -0500
From: Rob Herring <robh@kernel.org>
To: Vyacheslav Bocharov <adeep@lexina.in>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: amlogic: add bindings for
 Jethub D1/H1
Message-ID: <YTJJjAQkjYv1bKDX@robh.at.kernel.org>
References: <20210903060035.844758-1-adeep@lexina.in>
 <20210903060035.844758-2-adeep@lexina.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210903060035.844758-2-adeep@lexina.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_091307_075543_A3AEA484 
X-CRM114-Status: UNSURE (   8.28  )
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

On Fri, 03 Sep 2021 09:00:33 +0300, Vyacheslav Bocharov wrote:
> Add bindings for JetHome JetHub D1/H1
> 
> Signed-off-by: Vyacheslav Bocharov <adeep@lexina.in>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
