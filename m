Return-Path: <SRS0=e9JL=KO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0174DC433B4
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 May 2021 21:36:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B35F9600CD
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 May 2021 21:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B35F9600CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZxUBPnJGnycS3aIxSwdeHxK0a/xoEg9wb0MVaZEjh3A=; b=fYekbg2A6RXOL8OSt1O48Ophm
	jPWTAtRtbzKlsB4prv65HQ9pzqMqfmw3AX7Yu6R93cP9cnU26teha3XKg5z2frEja9kHlQ/a36wjk
	Z0FMSImbVj6C+u/leVhSylJlO1mdP0UlLqBnvoznL5dWIorDp6+mBSdYrQ/tQ3BNl2L23UJC9cDVr
	b7xdokDJvQjAiAUK4neenS1SqO5sHjKavrix49Edr71+bZjXzuZuU0rX3gceoRdvnrSnHLZZ4GYKp
	+AYM798+5TzBpge2nQgiIEQMtIqjIvjOoh8npUpcCX2Cug9ittngr4rqfUGwLy6fqs/3f7wK+OvBC
	X1k2TCc9w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljTrh-005AGs-Rg; Wed, 19 May 2021 21:36:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljTrT-005AFJ-Ut; Wed, 19 May 2021 21:36:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=b9AJYfJ17q275zL0Tl68tue+i0tZohtAZ//tG0ipyj0=; b=dokd0B82Ur+efeoLaOAehdt6xE
 bRV6VJ92kYq/w3YJo8srW39KLR0qNqPDnaAK8qOUU/wTIHtcfUhM51kDUxuyQMxU6kpJjGUkNb/Wt
 RDBDUcN7wrlCC/jM3MYD24anyyZDVJLc8vKtWdpu59jaP8br37lq3B1SqY95F5oG5NyejM8DG+aFw
 6z2/01SiC4FZLi+A7wlR9xAWxeMbufiFPRElFyRPxJ8XG38xsCjbAD7PdjqCTKZx/lG05Gjr6IPBC
 DPh6SED5qxc5FBvfvM/MkD2fCXDFT7akF112OlU8cLwsCGMzFTllx03xynSyp2uf6BqK0aoTqW+gB
 ECUw2j1Q==;
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljTrR-00Fnqb-5h; Wed, 19 May 2021 21:36:14 +0000
Received: by mail-ot1-f48.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so13067580otg.2; 
 Wed, 19 May 2021 14:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b9AJYfJ17q275zL0Tl68tue+i0tZohtAZ//tG0ipyj0=;
 b=C+8Iubp7zZ3mHJAoHY8mwsgkLs7xYrCCLxgCdthqtBMxennXNsSRPN37BuhfnjihsB
 RFCd/R728JjsBWmKK2W0R5AP84caZ0FW4kXxTlhhDi/B7z3vtDgnupESXrqCk/TATZp/
 h0BRErBjVoAScaBiNvTGlhUzKuVaW1lQV/u9IoZLLkTUljuhMJ4uLYAz1MLFP3AMdUgc
 55VGSE4nSYkTvc/gWdHBwqk7yjcXmw6FvPyeZaIeoaIgtbIlNHRxX2j3aCbl6X5i8WmF
 b/51LW9bYDx4UzWBQ+rByVYyM0svB5E/roTrsWdfiQkzyMRb2D552eqtCFprbkdhhy4u
 Y8pQ==
X-Gm-Message-State: AOAM5313OWGyQkNjw2KNcX1gCzuS+aPnRVHyPnIlj8+d8nswm1eMYajB
 rW7RAmtmZI2UQsW1qvB9Nw==
X-Google-Smtp-Source: ABdhPJxXixBAzcyGcAsCCerVC9LDjQpLAHkBT5dxCqS6Pefn0cVnqYZorqDmnq7LW6vf2TlIkcyvog==
X-Received: by 2002:a9d:39e3:: with SMTP id y90mr1309416otb.257.1621460171829; 
 Wed, 19 May 2021 14:36:11 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o14sm166119oik.29.2021.05.19.14.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 14:36:11 -0700 (PDT)
Received: (nullmailer pid 3697882 invoked by uid 1000);
 Wed, 19 May 2021 21:36:10 -0000
Date: Wed, 19 May 2021 16:36:10 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: jirislaby@kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: serial: amlogic, meson-uart: add
 fifo-size property
Message-ID: <20210519213610.GA3697605@robh.at.kernel.org>
References: <20210518075833.3736038-1-narmstrong@baylibre.com>
 <20210518075833.3736038-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210518075833.3736038-2-narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_143613_231616_A09DAD76 
X-CRM114-Status: GOOD (  10.84  )
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

On Tue, 18 May 2021 09:58:31 +0200, Neil Armstrong wrote:
> On most of the Amlogic SoCs, the first UART controller in the "Everything-Else"
> power domain has 128bytes of RX & TX FIFO, so add an optional property to describe
> a different FIFO size from the other ports (64bytes).
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../devicetree/bindings/serial/amlogic,meson-uart.yaml       | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
