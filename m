Return-Path: <SRS0=/OEX=PP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E565C43387
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jan 2019 14:05:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CA51206BB
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jan 2019 14:05:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eAanPupt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ErKD6PQz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CA51206BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xkA6UaTWs8Glefz6AMjojONy50kVRklHzZBS7o1nrSM=; b=eAanPuptkfY41Q
	6E2dNsR6N/kUZuatoBES5T4gOGUajHtSeo7zIpuR1HJtBsYntV7a+o78fQXRgL0chqquv04aePdJp
	ixKiEczwfaLkoCF6zdjrdV7xuCVodV1E4c1x1g7iELJdakxO/GP+sZu4fwKpJ4l6No6R6vjejF4wx
	afLcOCuxoAIJYu9W3iD/hglBzWOdQxjTQ2Iu6KgaKaC1oVeZfc7uAUkGaHWcPn4tHn+qzO2pnHelJ
	sawL+4sv1760q3x593GRS0iX154jVgLblUIzGCfIakchOpl08XrFmLgzXLp0hmlhivnlFjzy5u3Ar
	k5DJgtHGxJAbrWBajpvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggVX3-0006nx-HZ; Mon, 07 Jan 2019 14:05:33 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggVWr-0006eS-Us
 for linux-amlogic@lists.infradead.org; Mon, 07 Jan 2019 14:05:26 +0000
Received: by mail-ed1-x544.google.com with SMTP id g22so973013edr.7
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Jan 2019 06:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=W/2RBvXjOJQ952z/CyP4hTtFtFtTcbe06r2ruHrpECU=;
 b=ErKD6PQzmDOuMMgrMYYAyad8DrMFH6BJXeK9KQJzAcRiMc3fu4CWfdKgKytETlkK+c
 puMOTrf4qIWSjHqElJEdYkuUeixb+JC5tzmMLUdRwLIzRaCwHXwx6uvWwAuKTNdZadMr
 ifcZ2aAKAw0vdjlXqT5XY4MC2p0cbZSHPu5GSisEvYuVwbCKZS+Jicu+BG5UfwCzzECf
 PeYGDAs0NLeXCn6CGO9JANyupBE4+CevxjbqCAm7XoMXIGsQOVtpkqVmUA1Dj9yLZSy1
 xdItU8y8VUyB49qpFWXDgbVIbqqy3tYEr7p4YS5m/tJTAbv09gOyN9yUjATz0sBfqZoJ
 yTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=W/2RBvXjOJQ952z/CyP4hTtFtFtTcbe06r2ruHrpECU=;
 b=UbEAMf2rGGUZRL+j/5T7fzxF5fdJ/rYi+6D1iJaPjjnv8bU42MZNU5XZUxVYXqPfC6
 vZv/nuiXb0dc5aCYHqDyp9YUbTiqrJL3ixumDwSs0VooO3pHMMpWzxkfQGawJb/B3FMi
 TVbEwxgGpkmXWGDirkWNtwxAv52OR3/lHWq0gw5DywWXTn6/7WIJA3S74uRwvObpnKQw
 i7dxSEtgdQu+YXBywKA82qixlfy336HsFzUUNFHvueOepTEY7/att0NWgjgmUejc4f9Y
 i3rJ2I7xjuecDo4vWM0khCaNJ4t+Z9hEFPYAVNmzRnEiD6EJVTPKPsKdf1xtTExmaMuw
 VrEA==
X-Gm-Message-State: AJcUukdG3T0R0xp3k6eypkgx5WuyermNFaWbJf5bDu7JcjuhYvXlsQQi
 3uCZLgaEG5l2jdlY74C+t+cHkg==
X-Google-Smtp-Source: ALg8bN5z1IL+BHXTtVhNiCTkWGW8dsqCGok3DpycWh3r1VE1WmepCdiThSjEeTkTu0iH5CkWiUgpEw==
X-Received: by 2002:a50:8ad9:: with SMTP id k25mr11054301edk.189.1546869919451; 
 Mon, 07 Jan 2019 06:05:19 -0800 (PST)
Received: from boomer.baylibre.com
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a38sm35436997edd.44.2019.01.07.06.05.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 07 Jan 2019 06:05:18 -0800 (PST)
Message-ID: <6770759de6ed04ecabaa163eb550769d43dfc901.camel@baylibre.com>
Subject: Re: [PATCH] arm64: defconfig: enable modules for amlogic s400 sound
 card
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Date: Mon, 07 Jan 2019 15:05:17 +0100
In-Reply-To: <7hmusmvw6z.fsf@baylibre.com>
References: <20180828122735.28919-1-jbrunet@baylibre.com>
 <7hmusmvw6z.fsf@baylibre.com>
User-Agent: Evolution 3.30.3 (3.30.3-1.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190107_060522_000691_40AFFCEB 
X-CRM114-Status: GOOD (  11.03  )
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
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 2018-09-12 at 21:49 -0700, Kevin Hilman wrote:
> Jerome Brunet <jbrunet@baylibre.com> writes:
> 
> > Compile the necessary drivers as modules, including codecs, for the
> > s400 sound card.
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> 
> Applied to v4.20/defconfig.

Hi Kevin,

This patch was supposed to be merged for v4.20 but I'm still not seing it in
the 5.0-rc1

Could you tell me if there is a problem with it ?

Cheers
Jerome

> 
> Thanks,
> 
> Kevin



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
