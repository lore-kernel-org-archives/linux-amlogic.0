Return-Path: <SRS0=GxHq=RD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 822DFC10F00
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Feb 2019 15:18:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 523C620C01
	for <linux-amlogic@archiver.kernel.org>; Thu, 28 Feb 2019 15:18:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="itBeb0j6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 523C620C01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R8kEimimNRdkRjYgHKrjOB3hipafZBzj0iJhSAEmwpQ=; b=itBeb0j6oXBelf
	jG0TCFYXdkGZmvmkg0iDFMUkQ7yepIusZFQzG6iz2lmpJq3bCNxylxgN038HQiRu2mNkiB1L5OlNv
	ZcLlfNrYrDlFBhc86tbNqNVeWE1ZZehGQUrQsUj4QAiEGEEsdIU6qXOqDhn3vOARZDtSvM5IgUS+l
	nwGKem7MbImtLj9bkDh8FksceMYf2LqnqO4lpycEn7v45hpPq7Q1JaMNEd8KsypGVSdnem70hd9D/
	08wPDlz4Dts1+uIkNJoBQnWEEmJUXidgd7CZMam85ftSWZq0Gu0l0tJ/qLbqsHdTADJkUKXLPVvxX
	bMYI9coePLINYsJTKQSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzNSA-0002Mk-4O; Thu, 28 Feb 2019 15:18:30 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzNS7-0002Lx-Mj; Thu, 28 Feb 2019 15:18:29 +0000
Received: by mail-ot1-f65.google.com with SMTP id z19so17984806otm.2;
 Thu, 28 Feb 2019 07:18:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rrUI3DpLUqlevhHM1+N3cZFDvFtGfUPnpY6hijSO1bI=;
 b=mndyhABnSr0y+DiMNFURsHq3BeBRCzrDPt21kfvg47arCFtQc7e/vgLneBwJFLjC8f
 MB4anlRLjjzM3mqbXdUKZOcEtY9Prkro3uakvLQyr6VK9fdPPOlPn8urHvvvAXA/wmj2
 lQDCWCmlSJY51d+MFm9wNcnVlkolGAFpVJ3haTitNP5mYOuaiTwfA5Tm/FEOrZei0FHy
 6P5EaTJ2hDQLO9ANA5jPLheG85IYDQ6bTnPiawxpuUBHoKCEiAr54Ab1wGpUYoDSrPN/
 62s405wUS9H4S1H+82MmaabADMH3zQYTVJdYqwmBl8h4BC4qMuAA2G/nRVecYixICEDW
 vAig==
X-Gm-Message-State: APjAAAWIsx8UdLvvXf7tBzG/JKdUHLXq5vrL5kKdH1WAjolKqHu98BMM
 +eESlGU09HvkqwCZUS+MRA==
X-Google-Smtp-Source: APXvYqytrjuxaDhpiDPmXoWwVGNogQTyuG2It+qETpx4AEGr1RmtQ7HG9aDgctV/KQHPUwolG586vw==
X-Received: by 2002:a9d:5906:: with SMTP id t6mr59309oth.308.1551367104931;
 Thu, 28 Feb 2019 07:18:24 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 9sm1680046oid.22.2019.02.28.07.18.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 28 Feb 2019 07:18:24 -0800 (PST)
Date: Thu, 28 Feb 2019 09:18:23 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/8] dt-bindings: phy: Add Amlogic G12A USB2 PHY Bindings
Message-ID: <20190228151823.GA20865@bogus>
References: <20190212151413.24632-1-narmstrong@baylibre.com>
 <20190212151413.24632-2-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190212151413.24632-2-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190228_071827_736450_A78604C9 
X-CRM114-Status: GOOD (  10.55  )
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

On Tue, 12 Feb 2019 16:14:06 +0100, Neil Armstrong wrote:
> Add the Amlogic G12A Family USB2 OTG PHY Bindings
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../bindings/phy/meson-g12a-usb2-phy.txt      | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
