Return-Path: <SRS0=FFcv=4T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26164C3F2CD
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 23:48:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB6072465E
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 23:48:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g1U00Lv2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB6072465E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yieSfa+MpyCkGicvC+UQTc6L7c/nT97VrP5ZcUtyfc0=; b=g1U00Lv2W3HHjQ
	yM6Xv+uLVGQdvDHUJoUTdV6fvSQiKhKs9YwDaRXBsfgd8wGh7c/9uxUFYi6+UqUnWW1Au57HXr+QU
	VuZWBWQUab2ImHhGk5ORKk22E6aoumfmEa4R/mohluhFf5sJyuybHG0lVA7M24opjLf76TM9AYf5i
	LiYR1PL7LYFqsunkEdMpNLylgE508IJYNZcFleO1Y7WSPRXjjyC4yXRK6xEOdoKPuA4E8wQT6kZxe
	z/mYbTX5MOh0bue3NtW+Kp8ltP1DQ86v8PuGI6xDxv/QIrvc0YX7uR0Nfr+jrUNXW8q37hHmeaYQN
	s4DTgOfYA1vvSWhuko4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8unk-0007Pn-Vo; Mon, 02 Mar 2020 23:48:44 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8una-0007Fy-Ai; Mon, 02 Mar 2020 23:48:35 +0000
Received: by mail-oi1-f196.google.com with SMTP id d62so1090284oia.11;
 Mon, 02 Mar 2020 15:48:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IRKRL6bsVR25jdnkySlY9nrjsKRKvfWFUdg3jJgqhvM=;
 b=B1wWZd9C33pCYT7J9R5R0kHhI6v5RHWeXeftr/TJKI+ttYA0bLgMAAdYwPHNAonx0x
 SX/c8no8S6rFE1NMEwDvInBWi9KmJzryurijeY4h7o+R14b8+iAHELqB+6FZVGWJizkM
 WafxS3O2+aMFZot9eo8bmuK4sreq+zPOZQRM3ctQTqbYC/sahZ0GD/3PpM9ntD/QKFya
 9J6KbvnRbnO/GCyxXAz/IIMhkt5/eNLzd9GNJCh+DW5ftRbN+OQCu4sgpEh+RDqy/L6L
 CppEG/4HB1JRON2OyoLeNCf7fuoAElxvyVdcPbVY4ekgnnE4QU05jD3LiB0zxxbtkaSS
 I+jA==
X-Gm-Message-State: ANhLgQ0lw8Chyx+5KpzbF0EPVjzIj7ObmurBv1dzRH69MOL0R/FYxndb
 NoJJzaWW/O4qraNwV7JRLg==
X-Google-Smtp-Source: ADFU+vt2I73Ny42c4sY9uLWCMSp6hK6ClCvDil8321kkwWDH86USwR7muQDsWqWnRb7qcFSntFukew==
X-Received: by 2002:aca:1011:: with SMTP id 17mr678618oiq.72.1583192913409;
 Mon, 02 Mar 2020 15:48:33 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z19sm4129288otp.81.2020.03.02.15.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 15:48:32 -0800 (PST)
Received: (nullmailer pid 31830 invoked by uid 1000);
 Mon, 02 Mar 2020 23:48:32 -0000
Date: Mon, 2 Mar 2020 17:48:32 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: add vendor prefix for SmartLabs LLC
Message-ID: <20200302234831.GA31775@bogus>
References: <1583036241-88937-1-git-send-email-christianshewitt@gmail.com>
 <1583036241-88937-2-git-send-email-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583036241-88937-2-git-send-email-christianshewitt@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_154834_371266_2F586181 
X-CRM114-Status: UNSURE (   8.04  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 linux-arm-kernel@lists.infradead.org,
 =?iso-8859-1?Q?Jer=F4me?= Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun,  1 Mar 2020 08:17:19 +0400, Christian Hewitt wrote:
> SmartLabs LLC are a professional integrator of Interactive TV solutions
> and IPTV/VOD devices [1].
> 
> [1] https://www.smartlabs.tv/en/about/
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
