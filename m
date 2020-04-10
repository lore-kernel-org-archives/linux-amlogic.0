Return-Path: <SRS0=/zDn=52=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A6A0C2BB1D
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Apr 2020 17:39:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D77732064A
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Apr 2020 17:39:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FFNCaLm2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D77732064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vGMqymOn++w/3njMKYe9hlmzqHibR6TtpBJHuM8Lau8=; b=FFNCaLm2fe9pwt
	5jtF5MMyFLNvi+gCYTOX3IbbT/iD9sxdCm6KtvZE5K3S16qCd9LB/3mp0t1/cGbInWesMXa2YI7Mo
	BhNgATTC2vj35abiyj+ts8HqFh3pJpiPl9Pm6llaq2QYcgoANaSSIth0faqiH/f9n71E2a4N/oYDi
	MulsbG8qDrFMlMcwL7C6ALp5d7RNoprygYkU4Lfhl+iZVYDWCUKumlVQEwKBIrgJ8681K3H/39yCU
	ykXhI2XlcWTAuA3ceDEoO77HXMRM3COyHa/twdzhqaatFn8sEC+VMWqOXTBkhp60dT4M9wbp6sybf
	vf+Nv9wgZmYk6oeJX+pg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMxcS-0006ks-Dz; Fri, 10 Apr 2020 17:39:08 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMxcL-0006bL-E3; Fri, 10 Apr 2020 17:39:02 +0000
Received: by mail-ot1-f66.google.com with SMTP id q2so2495106otk.7;
 Fri, 10 Apr 2020 10:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9dA79p/fJYP1exJyfDyndCj6b9oBdHgsFtR15+WKLmA=;
 b=evAAPR/C/Gk+YNIoSsdZsqbEkwTVQAjl3drDApazuwpsK38xzSDljTovlPiV4EOfKv
 Ot8Qrw4NIFbzfT48BobX931ZgE/HS5rM4++CrdS18dv7iKaNqsh40FeXQr1u4tsEq/iD
 NY++JQjRqWlWPMvRxHQkNlLY7iwXSJ7dS0mZ9PhidgDUZ0UkJiMgPNvK2MpvjBJeosQ/
 z2Gwq3uUyck+Zm6idZ6z+hGgK9Lbnk2owW1O8ld5uAOQa5Pc/2i2QS0/XvPnEYyi3ith
 9KEsluuJpj1qGg9uC3OWB+hLpmAZ4kcM2k0aHvJKKJgg49CuEe5q33bCl2Zh/gvv1aQv
 efBw==
X-Gm-Message-State: AGi0PubO/dphov9cz9DLpUeJz+dY3jPFZmaIBW9lv5WCFEjyM+ut9vJr
 iGmw+IQHdwTiW5WsVibM2Q==
X-Google-Smtp-Source: APiQypLnV0lWs3/a0m0yM5wOMFXyJ6eGdqLn+x7dWPvHkUdeb3HuMNfRq1B+n0WGttYYQQyMwRIjFw==
X-Received: by 2002:a9d:2056:: with SMTP id n80mr5211844ota.281.1586540338638; 
 Fri, 10 Apr 2020 10:38:58 -0700 (PDT)
Received: from rob-hp-laptop (ip-99-203-29-27.pools.spcsdns.net.
 [99.203.29.27])
 by smtp.gmail.com with ESMTPSA id x17sm1544589oif.28.2020.04.10.10.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2020 10:38:57 -0700 (PDT)
Received: (nullmailer pid 23157 invoked by uid 1000);
 Fri, 10 Apr 2020 16:37:18 -0000
Date: Fri, 10 Apr 2020 11:37:18 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/5] dt-bindings: sram: Add Amlogic SCP SRAM compatibles
Message-ID: <20200410163718.GA22705@bogus>
References: <20200326165958.19274-1-narmstrong@baylibre.com>
 <20200326165958.19274-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200326165958.19274-2-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_103901_504438_39A38979 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 26 Mar 2020 17:59:54 +0100, Neil Armstrong wrote:
> Add compatibles for the Amlogic SCP SRAM memory zones.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
