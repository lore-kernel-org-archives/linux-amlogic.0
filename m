Return-Path: <SRS0=ULSD=UF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39943C04AB5
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 16:51:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C667206BB
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 16:51:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GFPAkY9V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DaczKw26"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C667206BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q5ZMgBUS/hBV764jt+W0SK2BMwuTuaDGQQBjfEMYcEM=; b=GFPAkY9VhFKBvo
	Ke0VwmRbud6S9TnnTqlUs9eMI5QrZPkxqBu8bXS24syCLemueEN74Allhu3b2X9zQvlOEOXL9XvIR
	noC+c7Q743r3MQxT4PH7vo9cWwCFrhkkGx07PTBZtE0ayxDRe2NRGtwPjRthpKYDkJHBo3t7Ree6L
	AmTeFpW96qevC9z5dh/wACx1Pwu6eS1DRjMQ6H8FjTkZlgGETxQ9Kal/lZ0vAfMi6benGJFcCL5QX
	UD6jBDxTG0yz35jF2OR4AYrI5pNvXBH5AXmP7CHWtmU45NnA25rUEx+odEvaMzxST426+4C2egKUU
	Uwu0I8DDeBUgone4/3VA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYvc9-0003O0-LI; Thu, 06 Jun 2019 16:51:45 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYvbv-00031f-1x
 for linux-amlogic@lists.infradead.org; Thu, 06 Jun 2019 16:51:43 +0000
Received: by mail-pl1-x644.google.com with SMTP id go2so1146452plb.9
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2019 09:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=aa8v2Ry0AgUyHqDSDkVaopTmArzSQkUiolk4pn2d3+s=;
 b=DaczKw269EV7LA54BQf75jZoNq5u89tfhtV1e6vBRU8zQDjavkM/B5+S8OlIYrhtBu
 zRH8KJfNZ6SVzujhafnICd+ZNaQPV4/8QuIo358hspBB/EagYVbB+x62egPUDT/JhNKv
 9e3V3l9q2a6BMyCyYGBeVLCvjHYdIr3XNvYQzsTbFciUxEEFGrpz5QhM2uEJlBQ5y4I1
 fPVGsCzLhzuSHn1Zj4OR7+kgIkt3FlwF/jdEnwlTk8YmlFaNX1Vtsk+Um1u8sd0cdumd
 b2KlyDEjmllwz6zSkUx/JA10Cfu3DmLno0xnQJLKue+RN9jjE86nky1JRkl7usEyBaZ8
 cEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=aa8v2Ry0AgUyHqDSDkVaopTmArzSQkUiolk4pn2d3+s=;
 b=Pb+BdWjGHNefO8kLSgMAZ4AWujXIm4/l2ny9PUzN9QeyNZWvPWDIUIALk4MU+av4Id
 K50PNwSkL3vWHjxsjyyCcukRmxvuA/5VASDZA4v43ayTYH4VDyzVq2/OVWmSBIw+YZWd
 +dhGXLa1G4nyKxppJywYjxRYXbbxbA60Dy/8NYG328/80cene1yt2v81WwomhN0u/BI0
 WTgCl4xy5YUaTfHj+X5Bkg8ELXh40LDChCAEkRsAuhWR0wlS973wL5453j4vY3i7SjfF
 eg+3zn0mebnOaaIIh7WWH0/mam635/IFzhB4m9bPRMh/akFwD5DCqUeEoO60NyDM0vNP
 8+AQ==
X-Gm-Message-State: APjAAAWpkUwRGcmAj7B2el0gzICPGZbUStnAMm6K91CCnRx5r3i7TZgP
 BmrVNw3ZaY3C7ZoydGAErp4DQA==
X-Google-Smtp-Source: APXvYqwf3kWtPMwOnmP7ZZOYSimryM81jqIIaWq+An6NiWUG8IxZBgCpaGSayfH926J5f/CiXcB0PA==
X-Received: by 2002:a17:902:b18f:: with SMTP id
 s15mr52670524plr.44.1559839890184; 
 Thu, 06 Jun 2019 09:51:30 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id r77sm2336028pgr.93.2019.06.06.09.51.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 09:51:29 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/meson: update with SPDX Licence identifier
In-Reply-To: <20190520142927.1009-1-narmstrong@baylibre.com>
References: <20190520142927.1009-1-narmstrong@baylibre.com>
Date: Thu, 06 Jun 2019 09:51:27 -0700
Message-ID: <7hef46fyi8.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_095131_528245_0F999236 
X-CRM114-Status: UNSURE (   4.38  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
