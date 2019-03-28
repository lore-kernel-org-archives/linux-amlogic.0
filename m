Return-Path: <SRS0=2qxk=R7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0210FC43381
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2019 15:18:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3FE420823
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Mar 2019 15:18:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hV1wD4A3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3FE420823
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GpQ/toqGr4CR9KD5k06nWVO8V6TkJxJhJbJ1QSUcm7M=; b=hV1wD4A3sH4BMk
	J0CyLvyST4U7WPe3zMC8aN3BftKFHMEi8FLhiH53kUbHJd3fxRiPMF/52qbR3TLGsFJcaeBUrsrEf
	EZ6iTdH2uEuXoMCPBN3huR5QHjUHt8dckUXNrZMY6XiI1ENJ/kJLd0kBs+24Pw7WElMEF2tSjekPa
	gom8wFLlX8ltJvfTV4L8L3vMaQ5yIHZ9F+wZE1QSi594azoDlan5Zd9X5ds3UBhnJmxzUgvWS70qp
	XJ2WWOq9Kb6RQkRt1WPL04fQGwl1q7b2MBW2j838JeOWcEpfeqYIVH+PJWebYTvroW7doY2nlZeCk
	WXadX322Mf+TK/VUluPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9Wna-0000jl-1A; Thu, 28 Mar 2019 15:18:34 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9WnS-0000Yx-50; Thu, 28 Mar 2019 15:18:31 +0000
Received: by mail-ot1-f68.google.com with SMTP id e5so18631471otk.12;
 Thu, 28 Mar 2019 08:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rlz/E9aBeERHaafHlYwwHyQhxL7ccMisMBW6pUe7jeY=;
 b=A7ohr05dLUFmx4IicpZpL1WVcT/RrrGeJJ3+AsjtoxZ2V11Q7mhbFRzB/wszGz9hQ4
 5trb4ICHqTIUK3WY9VS3VE24c+UjU+6Ag9N+HgLXGXto5pjVOrSOO7UbxKu2mzcsPH3z
 P/GnXRCZ5vxYc0ny++ZDEo90g6KzoRQ3qBYfk6nR9OYZUYcs+/+jQuu4X63HIa87exE1
 rd7CON5UVhXIOJXF/xQVfobgbRmlDj0DibWHl/6nhAktXMHZFrDFsc+1JbLO3LcZFNSt
 eCDpaxnBqeKaIhkU224fRnbwbfYAyG45e7MQ5Y1yHzN5LjkBY9mLDrL4vqjuRd6U7Tj2
 o/Og==
X-Gm-Message-State: APjAAAXVtZChL6Gp5Kdp6Kvz4e2xDwhG1WqP6xKxEJG8ymdG2FFGLJMW
 ISU+RTlHpK/zjCQWkGRJSw==
X-Google-Smtp-Source: APXvYqwr3b7VafRWAumXZLC9gA9GInZpHjQbI13dhw21ZjdvIo55Ghj5gaSk7JMPpTvaDS6vWR1K2A==
X-Received: by 2002:a9d:7359:: with SMTP id l25mr29811751otk.189.1553786304840; 
 Thu, 28 Mar 2019 08:18:24 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o18sm5447627otp.65.2019.03.28.08.18.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Mar 2019 08:18:24 -0700 (PDT)
Date: Thu, 28 Mar 2019 10:18:23 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 3/3] dt-bindings: power: amlogic,  meson-gx-pwrc: Add
 G12A compatible
Message-ID: <20190328151823.GA22216@bogus>
References: <20190313141030.5958-1-narmstrong@baylibre.com>
 <20190313141030.5958-4-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190313141030.5958-4-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_081826_559273_0DD17CC8 
X-CRM114-Status: GOOD (  10.78  )
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 13 Mar 2019 15:10:30 +0100, Neil Armstrong wrote:
> The Amlogic G12A has a slighly different Power Control, but uses the
> same address space and sysctrl registers.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/power/amlogic,meson-gx-pwrc.txt       | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
