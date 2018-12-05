Return-Path: <SRS0=v0PX=OO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E98C04EB9
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Dec 2018 14:51:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88B45206B7
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Dec 2018 14:51:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PhjedlZs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="d2YLNgZp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88B45206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJ12n5uZH9gl0ktkNak9n/K7xvnDM32PR/L8AgWC80c=; b=PhjedlZsV+tJJJ
	vaKffTTmek9goVRj9zXDL30+j7ipvOPgmNmvVSnBaWaLye8DsDbKvtDz2QHpF1uEpnhQC/mwjLw0B
	WBl27vyJQui7WohkCB8VFVIgoAYjyE0/THU49K1buzQfMJh7BRz9ZkqntT62VEhea5eufvOLmbJCD
	xSwEIPy5FskqUsswBUtZfQ5LhTyje3s6pjwhf7OnTEj8v9wp9UtBSybaWWt1EyS9QvWoeAaQGaDHe
	UY34lJxmQHwW2YQjPzrulnyYvFhuuQwr+vdVwpzm5AMiCUYBf9zzkHcaiVMIx3Jp7SEKhaHxTMBum
	7B3/QT9OOUM0vkECmvTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUYVw-0003Lz-NH; Wed, 05 Dec 2018 14:51:00 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUYVm-0003DE-6o
 for linux-amlogic@lists.infradead.org; Wed, 05 Dec 2018 14:50:52 +0000
Received: by mail-wm1-x344.google.com with SMTP id m22so13226485wml.3
 for <linux-amlogic@lists.infradead.org>; Wed, 05 Dec 2018 06:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=4EJRkB9Wt6wOzHmSHibiY7tYXFP2z+KuFu6wp2XHUxs=;
 b=d2YLNgZpvDaxpxHNFcSjCet9O1sp26Cc7VNcZjNQWd6rZoEgYh9+BDXsM9Qhlje8fk
 Pj3WabsBMopf6iYagXz5PE/ataFWpE40GaDz4h6480Ap5+7Rn2LVFn51hxtvJFY/DV/G
 lOiS3G9qqcpaeTbDdlVHAd1gWKWKj5aCtdWJQwKDETBmkAao0Ni2rw2zTXoBpB+EreMH
 pLmK4b+ocjnpAGmOAOUmBu25fGQ3aGwIzDFksirgk37Hy+lJg2wwWrk3yMrwT5DRGt0p
 Mukpq3S4Egwp8xXCOzjyAvdg4ISStLU57aNjyZdvK2I+xnWz/lpwAza05tjMPkmIEA7l
 ghXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=4EJRkB9Wt6wOzHmSHibiY7tYXFP2z+KuFu6wp2XHUxs=;
 b=gezBaKBEhr602n4toTZ1OOUoC4vlPZY1T5lUzQo7mx95ePY+IldzMO7sE+PoQHJy3J
 sTwjRc1g+NOW9VQKc1oTEf3eZrHblSgPQ4k1UromLl4NCFZiNEPRqtSgVM6pTMPQBiYd
 FXFIc44Ociq/+TqecZOavl/5E3WmYtfgScNJpmxmC/TWh8djzECsID6jCVClrP/cQNhU
 iERD1hCaVLkxu+RGuWTE52LqXv7m0xiiPxzahsbEC/6N/vlwiopEUPTgByg/NarMQxjn
 iXX2VE0FwEKv6aw5s2d0OdH/9eDTo/84W9gSVo1kT2pnlApX7GC0Zs3n6nacKvWfsyhD
 fX/Q==
X-Gm-Message-State: AA+aEWa5rBrFAWxzn7M4gHOUO2I2meXUHhuKI0VZoT5sOfNentsEZIQU
 LKwgefAZO5j+0YgAlN4upzsU2A==
X-Google-Smtp-Source: AFSGD/UDw5utdfFbYKvohR5I6dbOv7cxIYORvM0LvtdjDh4Kqmx+4idDFJ6reJZSIViW1xqIKQJPaA==
X-Received: by 2002:a1c:f71a:: with SMTP id v26mr13812333wmh.131.1544021436254; 
 Wed, 05 Dec 2018 06:50:36 -0800 (PST)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 a62sm11673725wmf.47.2018.12.05.06.50.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Dec 2018 06:50:35 -0800 (PST)
Message-ID: <809e8f9945d55cb8b9583f0a50f502c6922b35fe.camel@baylibre.com>
Subject: Re: [PATCH v2] arm64: dts: meson-axg: Enable GPIO interrupt controller
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>, robh+dt@kernel.org, 
 khilman@baylibre.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Date: Wed, 05 Dec 2018 15:50:31 +0100
In-Reply-To: <20181201164301.17274-1-ccaione@baylibre.com>
References: <20181201164301.17274-1-ccaione@baylibre.com>
User-Agent: Evolution 3.30.2 (3.30.2-2.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181205_065050_276707_9B003719 
X-CRM114-Status: UNSURE (   7.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 2018-12-01 at 16:43 +0000, Carlo Caione wrote:
> Enable the GPIO interrupt controller for the AXG SoCs.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Tested-by: Jerome Brunet <jbrunet@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
