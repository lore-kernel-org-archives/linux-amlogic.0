Return-Path: <SRS0=ULSD=UF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B1CC04AB5
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 16:53:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08F5520693
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 16:53:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BOqfoqGv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BSqi0C2Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08F5520693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1Cb3M5icIy4XsXbt/57sH1QQ7XM6zGR7RAK465wHbQ=; b=BOqfoqGvuQ+kqF
	OvbVEmtBPiMY/eM5wuJmlnKOTUrDU1e6bCI7cJ/WEyU3hJCCCDsXPgv/hA6i1cLOWEF3uhibTHliu
	F3SwfQI5uhwbw/UsBXcPWsDmu4MHrOKZoA/jEfH726bYtlLko3dXt3M/ac9NRyV0YA1tBeE5tbCI2
	gXRSc1jVlYc4jmvFWAY7QpDwtC99hLzmJw2TkOOsmSNvE0TN1frVHHbBUTTy1cBbDqhpYzQvU60m0
	teaVSmpWHiO80s/J7+O+lJNqswMmpUn7uGe73PJzKRsFfN0u75m3ax706JOndU2t8VK0wndALRWm/
	zhMsVnzkMTikMgt+3ARA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYvdq-0003ni-Aq; Thu, 06 Jun 2019 16:53:30 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYvdn-0003mi-2Y
 for linux-amlogic@lists.infradead.org; Thu, 06 Jun 2019 16:53:28 +0000
Received: by mail-pf1-x443.google.com with SMTP id i189so1849962pfg.10
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2019 09:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=zGrqsmVewnpRBL6cgILQS0mdV4kn0nEbbTIMAtPnZ+0=;
 b=BSqi0C2QpXTjyH/B1kVfcYczMGoJJzapcHSKvOz6LV0IIIDSFaGv+EF8ULJghex95X
 bVVg8Q4OJtZf1ZNH/uJZKqEHDQwdjmZSGofFxXOhMFsizAuOjtaqb55JrX/Z3M1qADiu
 XOpO7NAcmvvb19l488bihdEov0+9zp2MoK124Gji15egxg4QRCYgCBUFpUZ+8enfpnZK
 oSS0k+dDTj8R8SO2spVt422LdwjFCYu5kih9OGSm1GFN5vWDElPfetT4y7tJJR+6GrRG
 M241gxaRtBUsB0irpw5n45jxZJJj53Ufa1xDc+l/CsYU81gvk+bc7qmWx2RsnyAxJ5pX
 Fxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=zGrqsmVewnpRBL6cgILQS0mdV4kn0nEbbTIMAtPnZ+0=;
 b=Oa8wpTfqFFRfuYz+temW4K7KYhay3wIDd2Yp1oUiU7ohix7jfKpgk45qNWt+U6DH9P
 QQVdtw7yDbPb7OwiMxskCjdjnuSU8pJsbhblOx5/q4xxognPNBfuGKkept2B0j/NaCmj
 o/CVu47QiJe1QzxvtKhsiypd43ogYzlYnHIZ8H33hNmYZL6jRPTNbSBue24lYWEpk5Sf
 NOKdXxFpVZMebik9h2CXwCPAGeOVdVw/GMPeSaganQJ9Ed/rUfDaiE/jXao7quddnnLa
 VSSIXahPxhYfN0jjQUPvD/ogT3ZgkUUKnIYF9aGMMDO694eLw2gVPQe3aiazN6ORqI/8
 jeLA==
X-Gm-Message-State: APjAAAUpAFFUrGeW2D+Zm5HY6oYlqhzPgZKhfrn5ywUvCTzvAjsTv68r
 OgPQk0T/s5cz2aAs3kWbqiaZnA==
X-Google-Smtp-Source: APXvYqxZ4JQdtqCpus9ijZY0A4itD2/gcxz6vva8D0mzSp8j3sFAes2+/v8tO/ZWyHXyyw0rHJanlA==
X-Received: by 2002:a65:520b:: with SMTP id o11mr4270398pgp.184.1559840004995; 
 Thu, 06 Jun 2019 09:53:24 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id g15sm5711877pfm.119.2019.06.06.09.53.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 09:53:24 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/meson: Add support for XBGR8888 & ABGR8888 formats
In-Reply-To: <20190429075238.7884-1-narmstrong@baylibre.com>
References: <20190429075238.7884-1-narmstrong@baylibre.com>
Date: Thu, 06 Jun 2019 09:53:23 -0700
Message-ID: <7hblzafyf0.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_095327_113289_ECFDBEA4 
X-CRM114-Status: UNSURE (   5.81  )
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

> Add missing XBGR8888 & ABGR8888 formats variants from the primary plane.
>
> Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controller")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
