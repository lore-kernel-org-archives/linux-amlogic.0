Return-Path: <SRS0=M/XH=JE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BBB9C433B4
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 16:18:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C613761130
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Apr 2021 16:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C613761130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wiAUg8w3U+qMbQJRnN3GWkHwjjz2q0djxt14FI43/LE=; b=ZRkPVwFXRWIZEBFXA/dRSPNqD
	7QV9F34boaE4CM9qahhTGhLMk9ysQkCClvlXDobX4Dy3YHFd84Y0QaKOteGHj91UnBpWwMDR8AHXR
	dD3sgI9SMYO674rT8DkHDZQ1h98Jg+40yucUUfcyz0LBfNdMQRLGjLEhDpBqEWiwtBXl400oeFTRh
	1R2LrLtoPEB53U4SWzgCkJVd1jJuWfbHuXBWpQB3O+yuGYg1/y/50/4alJlq0I8ytbt6ubdX5gLK1
	a7+Vss1Q83Bv1nwgNBi++huSmQh4PyuFKbD+2sOEoIOckQ9JOpdOqKBJuHU/8IzbbMKpeaylb4HoA
	zQDZ+X+bg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUAsK-005RCl-Hi; Wed, 07 Apr 2021 16:17:52 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUAs5-005R9r-OQ
 for linux-amlogic@lists.infradead.org; Wed, 07 Apr 2021 16:17:42 +0000
Received: by mail-pf1-x432.google.com with SMTP id x26so6521478pfn.0
 for <linux-amlogic@lists.infradead.org>; Wed, 07 Apr 2021 09:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kkQmVpMRcrPLSpRzP7dgecYRXq//RT6p4q1X4WEKNnw=;
 b=aOFaiO1sq92U5rT3rqHZzy0CqSci1sKFt1gzalxF0j0IiPHSkXRWw4ZMP24yMCfe0m
 DhS0TL7UDg+53OGmzKNcxcSmzONzd+FFFqypJeqzYhh8U2g3zfclpKnr0h0B0nTvNjtC
 LTsYqs6lDJwfYYZZLDFlRUdYcapUon/T5nNz1qoQvEPhsVFuQ20CsgRb9pClWb349j2L
 H8RvAfInuvthmM9p65Qs2Fu/NlEtWtRdmZciuZpgW6F7726943MGZw8O7bUe0WfEX3WN
 Dl2soYywUEJ38mI8xkzDH8GSXCqBYeDk4e03UnBJkYCK+mYwHTnbyirgaLjLI1tvkvWN
 PEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kkQmVpMRcrPLSpRzP7dgecYRXq//RT6p4q1X4WEKNnw=;
 b=YO8+X8O0TZYRQW14InC7PI0mvcSBcYMFgroQ9euRvYkzYwWeegeRT7gESJIQuYZOOM
 21zkys+iu6+YpFSkya12zJi61xi8HcBWEtYcp5KRx8qIVyWnC+U4ONuFv9XPZiLRZHl+
 zqhS7UZk3M/++Q7Fdl94R7VTpIYY5tiGtzg4nlM8xwmIyTY3+mQ3hGM+z5U/Ux0vZLXN
 SnmZFsTsRWf5fL7+tTcvLEzqc0i8xiJBn8s2clx1Llu8ACIYFcN59p0pJJB0D1K4ige3
 H3FrhS6XllyGnX2UUbuVzbTPkwA55Fp7rTrgG81oGq8H1CMDVo7gN2xRwyMSIBkpRx92
 khhA==
X-Gm-Message-State: AOAM532OxWDkQDwdPJnZs1DiRsUXXRGjGCnbGSd7tLvrh1ykjjBEbe95
 9gQKXEEQgPX2VwoT6p6AYi+UZA==
X-Google-Smtp-Source: ABdhPJz8tD/aoietkR/S+yJ5l3waT2txM2yHKjP7dEAdhaToxJ+HWpYCwyYfF3RNpOgdmtyM4sNDLQ==
X-Received: by 2002:a65:4046:: with SMTP id h6mr3933614pgp.345.1617812245675; 
 Wed, 07 Apr 2021 09:17:25 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id x2sm22778587pgb.89.2021.04.07.09.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 09:17:24 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: devicetree@vger.kernel.org, Christian Hewitt <christianshewitt@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Cc: Drazen Spio <drazsp@gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: meson: add support for MeCool
 KII-Pro/KIII-Pro
Date: Wed,  7 Apr 2021 09:17:23 -0700
Message-Id: <161781223326.25927.5710421341360861748.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210329154753.30074-1-christianshewitt@gmail.com>
References: <20210329154753.30074-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_171739_464217_060C15B2 
X-CRM114-Status: GOOD (  10.31  )
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

On Mon, 29 Mar 2021 15:47:50 +0000, Christian Hewitt wrote:
> This series adds support for the MeCool (Videostrong) KII Pro (GXL)
> and KIII Pro (GXM) Android STB devices. These are quite popular due
> to the embedded multi-standard tuner card (which is sadly not-yet
> supported in the kernel). Both devices closely follow the Amlogic
> reference designs with keys/buttons/LED details taken from known-
> working vendor kernel device-trees.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: amlogic: add MeCool KII/KIII Pro bindings
      commit: 0bbfea7c0469cbe0914c1800b70f607ed7638870
[2/3] arm64: dts: meson: add initial device-tree for MeCool KII Pro
      commit: d5454e7ce24a28bd22beb2fc02f1571b5748dfbb
[3/3] arm64: dts: meson: add initial device-tree for MeCool KIII Pro
      commit: 727d93ed3ba67307a82c3ac5ebc7e335265e8b9e

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
