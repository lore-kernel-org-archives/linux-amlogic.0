Return-Path: <SRS0=8H3P=I5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49530C433ED
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Mar 2021 21:44:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A098F60FE4
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Mar 2021 21:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A098F60FE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uF2mlvjsxXWCl1A5CR+PXLgv6NJID8frfkGK2FbVQ8w=; b=CvleS6RRhXqxI+N25SWwqcxtp
	Dn0dDWBtFf6pz2t8q0dWw5KS0ajp5GlFB8WCWbHY391cjDFB3zrrGY47k0caFhEjZsAgCyheeIfdg
	jB2dmHcFVUN7mJlhEah+ogdxHazrFXOgWQ7wPhENvW76Iy4XD+hYe+dgTjSRebcYegY0MIuwQe7WJ
	LOB+rX/iPKSptY7tEmg4JYrx/R+VsvRKEA9IyuHAJnqQp5JXGKi++7nw9+XlQZNNmSIVIkWzDnPkq
	cg6hVdzsSoSVh4mpgFAsunmbE2Omopne9nkX0OfUD2XUkxbK2BFgjyW81YRA0FXY+30c3YylI/hJc
	p9Co7l63A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRid1-007juf-BD; Wed, 31 Mar 2021 21:43:55 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRico-007jrQ-16
 for linux-amlogic@lists.infradead.org; Wed, 31 Mar 2021 21:43:44 +0000
Received: by mail-pg1-x52c.google.com with SMTP id y32so213384pga.11
 for <linux-amlogic@lists.infradead.org>; Wed, 31 Mar 2021 14:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=cnHQL6nhksmECTngumtx7isJMVbBS3FZiWqfUCFPpaQ=;
 b=h0VijdokJCZWQXC+NNjYXjooYVjHgngBMYAexJDmHByRhIka/TzFeuz4hsU1v/4n2K
 MiAo1Jp+1n57o6EwxAwlNqiHt94OIFjvMYWYDaAPDpp8t2ERnv0Q51XxMpQZUgyuXB7n
 JIn7LdKvyhqlMO3DvzF4izIlOANTN43s5GB3uLBuqrkLZLl5oBtqqQc1Zo2sNm9WTlNL
 fCer96+6PzzGPEuQAL9204lP+78h5GxURnlMSjsTL7kF8lzOhs3pUiEfIeNU7KYv43ln
 SbprkpSGs0Hl2D6rHGO4MFYMpHx+0hrWQ+57m4H9FvpXvooIxQo9ROFyp7YSfpqQpXo7
 lYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=cnHQL6nhksmECTngumtx7isJMVbBS3FZiWqfUCFPpaQ=;
 b=Iz8z7i4olnRUT29sOTL3cziG5Wf8xOXC31dxig1IwxM5XE8axiBye4hvFRHWv6VswD
 HGl8J0JerEs/w9bY3LMw5UhzgySGG8LMyKZx9G9O3BXAF+G7yuo7KMBlHnSlj9tD7MO7
 pz5FXGzY08ToKfThzKF81iCb63QNemCsCCkduxTx1COmlUhBTF7eRO9O3og/AxxH/xCI
 djIRKnMj5vYdReZWzPNvN6M7K0Rl+GTqUs4DLuclh/40XS+p5LWSv7svr/MMA2igkSaM
 1DHROqcTxxyUHWs8+Y0pFHn7J8N4wBD/1TYHIvleWbqLiKcxPJbXmXlalbGeomLDbLmv
 E05w==
X-Gm-Message-State: AOAM531NBWXRvj5ybJ322O78av4uxuhQZvV5xh7zjsC8CP+/Yh9fL8ML
 shtsftUw6zQxUxJQ5A7TmdPPmg==
X-Google-Smtp-Source: ABdhPJxhtefXccGOWGfyA0tfM/FxbU7D/svAKPT0QzP01kIfR1fvcZUFpKyPx4kReSZxgv3ylQuwUA==
X-Received: by 2002:aa7:9614:0:b029:1fa:e77b:722 with SMTP id
 q20-20020aa796140000b02901fae77b0722mr5009269pfg.2.1617227020445; 
 Wed, 31 Mar 2021 14:43:40 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id 143sm3421730pfx.144.2021.03.31.14.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 14:43:39 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>, Drazen Spio
 <drazsp@gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: meson: add support for MeCool
 KII-Pro/KIII-Pro
In-Reply-To: <20210329154753.30074-1-christianshewitt@gmail.com>
References: <20210329154753.30074-1-christianshewitt@gmail.com>
Date: Wed, 31 Mar 2021 14:43:39 -0700
Message-ID: <7hzgyjatis.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_224342_386929_593820D3 
X-CRM114-Status: GOOD (  11.23  )
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

Christian Hewitt <christianshewitt@gmail.com> writes:

> This series adds support for the MeCool (Videostrong) KII Pro (GXL)
> and KIII Pro (GXM) Android STB devices. These are quite popular due
> to the embedded multi-standard tuner card (which is sadly not-yet
> supported in the kernel). Both devices closely follow the Amlogic
> reference designs with keys/buttons/LED details taken from known-
> working vendor kernel device-trees.
>
> Testing was made by Drazen Spio via the LibreELEC forums [0] as I
> don't own either device. Since dts files were added to LibreELEC
> nightly test images I've seen the number of active installs grow
> without reported issues.

Great, thanks for the new board.

Do you mind rebasing this on top of my v5.13/dt64 branch, since it has
some conflicts with the Minix NEO U9-H series.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
