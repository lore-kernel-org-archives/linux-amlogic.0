Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27284C4363D
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 18:53:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE42F20758
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 18:53:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I33LhRtx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="TbmjMQuB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE42F20758
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/NU1tm+PAFVbw9RxVA3eP1JWytYhlMgjXNC/jDeh15E=; b=I33LhRtxqG5tsZYBOSRf7nsO7
	vMmTZ3cadXbNFgAd9voq1C32HYNiNOlv0x3nw2tpxoO+h+L5m/A4OjH6Jhismwpq3DX/FyrmJxywd
	wpwZXJAf1ZQRafhPzj/zDQh+WSSG6TZalHky08pmedHpX/jFSgVFvR8rEuEzsZfJa9qET2IV5bKPk
	eCkFc3/VIAhvOBJgCI9UOtoAPLdOMNL+OS6HWvydC1QVOqks6ZJoB9iUVQiVIZQhKHGPAiz6O/tJI
	AL/a7IICC7zEKAirPOHWiR09F1/ca9Hy/M6csTwJPr7QIBY6rv9wP8wA+FzNmhlf4+3rsesvinW65
	jfCCvz3KA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOQBR-0005P5-EF; Fri, 02 Oct 2020 18:53:33 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOQBO-0005Nz-Jj
 for linux-amlogic@lists.infradead.org; Fri, 02 Oct 2020 18:53:31 +0000
Received: by mail-pf1-x442.google.com with SMTP id l126so1898185pfd.5
 for <linux-amlogic@lists.infradead.org>; Fri, 02 Oct 2020 11:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=iPAQMAMc1hYTdFsccictID911P3trsdKp6hSOQvOeKM=;
 b=TbmjMQuBlCveAwmWwmy0rJQ/hA6alnl0KmM8J0ZZ58RmP01IE5DTu2H3o8e5bX6+6i
 0YwyoLs9btHGeslavZk5eR6mazSh0Vp56XipFnfOSms2ZLhxONKw1FBfgQUmT7N0OHeO
 0Qmsf5V6Dfx/L64zKA4I+egZpuHu0tIpULzjvF6KJIgs3+UEe7vhvxb50hmLE30oCTJJ
 z0sqXQx19yAtu78ZbE66rGH8j2v7WPhXkHGfJcFSJCCNuY8eATn0k0r71+mxZn0DJiiu
 GANK0TBCTARGx7mLBm3ERcQkqwVWH6HUggvBkiEa0pztkARv5aN3GdSHv+3Iaf1YwO1Y
 sXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=iPAQMAMc1hYTdFsccictID911P3trsdKp6hSOQvOeKM=;
 b=SYlv3HiSYdLZZ4mp8ZQFnKKphr2NDK/+HnEG3kRPRrxJdcIWZ88Jl9Ru3vpaFBETwn
 K1xAf0rLkh2iASpqaje1UU1wldfpWysxpNLPvQaVTRBqc10RUSIxQjBhLtXMO1uNP2ug
 F02mIZY11MyvzjjbdqXfGHgR8N8PSw425OFWsmr1Rz1CJoTjdVsmiOPZ4lI0+9Q50Nts
 WyQI5Vvb9At8JHYGyQPbMTxrFInUfkRml6MclMJSjf0iCp0IiPV3Hl0ZCxOXICkXIVlU
 kMKtIAheA/yYcgS25bYYEP/OoykNAeXmE6BSYWNStnaxfL+DAZPFxJb0+thqHMZLj1pZ
 GpBA==
X-Gm-Message-State: AOAM533/I0+s0OcaT/WE3+mMoI/iUbl8SlVLHS9XrKdC2zpozYycYnz7
 45oii4nxYgPXXx4+TGN9AhxsoQ==
X-Google-Smtp-Source: ABdhPJzg9saFTkFjFL/6YScANuADv4CnZG6bZfHBk7SDK2lhxGXr30RQbFBKLPsfKq04zJHatQgCWQ==
X-Received: by 2002:a63:fd0a:: with SMTP id d10mr3374536pgh.273.1601664808545; 
 Fri, 02 Oct 2020 11:53:28 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id b3sm2798336pfd.66.2020.10.02.11.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 11:53:27 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH] pci: meson: build as module by default
In-Reply-To: <20200928163440.GA16986@e121166-lin.cambridge.arm.com>
References: <20200918181251.32423-1-khilman@baylibre.com>
 <20200928163440.GA16986@e121166-lin.cambridge.arm.com>
Date: Fri, 02 Oct 2020 11:53:27 -0700
Message-ID: <7h362wmpco.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_145330_664661_6C949A4B 
X-CRM114-Status: GOOD (  11.11  )
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
Cc: linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Yue Wang <yue.wang@amlogic.com>, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Lorenzo,

Lorenzo Pieralisi <lorenzo.pieralisi@arm.com> writes:

> On Fri, Sep 18, 2020 at 11:12:51AM -0700, Kevin Hilman wrote:
>> Enable pci-meson to build as a module whenever ARCH_MESON is enabled.
>> 
>> Cc: Yue Wang <yue.wang@amlogic.com>
>> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
>> ---
>> Tested on Khadas VIM3 and Khadas VIM3 using NVMe SSD devices.
>> 
>>  drivers/pci/controller/dwc/Kconfig     | 3 ++-
>>  drivers/pci/controller/dwc/pci-meson.c | 8 +++++++-
>>  2 files changed, 9 insertions(+), 2 deletions(-)
>
> Applied to pci/meson, thanks.

Rob pointed out that the MODULE_LICENCE wasn't the same as the SPDX
header.  Could you squash the update below before submitting?

Thanks,

Kevin


diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 7a1fb55ee44a..35b167e907aa 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -604,4 +604,4 @@ module_platform_driver(meson_pcie_driver);
 
 MODULE_AUTHOR("Yue Wang <yue.wang@amlogic.com>");
 MODULE_DESCRIPTION("Amlogic PCIe Controller driver");
-MODULE_LICENSE("Dual BSD/GPL");
+MODULE_LICENSE("GPL v2");

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
