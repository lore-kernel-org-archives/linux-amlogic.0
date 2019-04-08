Return-Path: <SRS0=BDF+=SK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017F4C10F0E
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 02:38:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3F7420883
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 02:38:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UflJASn6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SPn2RGmu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3F7420883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DO4xq+TjSLkriBRfg4uZD9zvvNGFaji5rj6ofUFJb3g=; b=UflJASn6u9Bg+b
	/h7v/SVNxZRSu/TwBQwcc+j8SHfn7vZM92XKyUv3G5uQ45zYynASiRlVwKo40pzXu0lN3anxrf7Vv
	H1Y76wtpvYHemmmEPUhl8mETPaJEpdeO93YUFd+BxcPzFMoDTHnea4mMUeXAsKGgDmOHUwbayxtXP
	aI6D8OoCsNbcHIfQ+PZ42WrteG6KVF5m9go8fPxiJO660s3ACfIAK3l9wN6jg1TlWbM/vHMHL+YI8
	cqjesjURJWzz09Kj0EyhZYKUkGNY8Sdvw7B9YClDAi0UGLCHMVPo1ShYkV0iLG9jNgJriqZxtHS2b
	/PAYWjdH5RT2w5H0xrOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDKB6-0004tG-3a; Mon, 08 Apr 2019 02:38:32 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDKAx-0004lG-Cs; Mon, 08 Apr 2019 02:38:25 +0000
Received: by mail-pl1-x641.google.com with SMTP id t16so6423421plo.0;
 Sun, 07 Apr 2019 19:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QOaiSBgUtrP0Nzu2mhtUPDrwnQAuQijJq3uBYzp7jUg=;
 b=SPn2RGmucLcowteNtPbB6ju3RXN/MQx71KdkgACuJk3jR7eMPgkfm01zbQOCD+5MFU
 2UlVd0rbQjpcW/ei1121Zo7igrmYNLRq60x2wGChsb4msnL5EFqLnh9/ONNjLGMi3g9S
 hKyJ2psOA9yfFo2VDXcj08IJk6tffgh02ymDeGgxGRGIp2BS1LhcIwqQ31lwIjggP8l1
 +yxfr3Kk3WwzEmZppK/K2ykCkN4wwlZ7kIXEHdTilSJL98KxPDw7nslXm21jZ3zvJL9q
 LFBK9pXr+oZfAh+nuPXTRbrYIPyUKabGzxjdvuvquKPQThcAeQ6caXJjFlAqoQuAyD15
 BT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QOaiSBgUtrP0Nzu2mhtUPDrwnQAuQijJq3uBYzp7jUg=;
 b=k0f34jFZ1XWiO5cfCHWtf5H5KTb8eYGAMO+kfIbWUkwVxh9pcCEa3FuS4YrtWABk3L
 X1ohRt9cv46UuWRjtZLjPdH8KcERfW9NU571xNAEpU6vtyeUg9S155161zQQSVwUFp4j
 HVbj8tpJ9AuayMvrpm4gdbbz+bK9me3xEbZGT/C+TLplXtfdLPgJDHocAPzin2wkqZaW
 E74S0UvKs6Jdab/ACfHQhPb50PIwnAe6yDcymNCHGWunIjHruwJ45aqQUeXvhhxqGOQK
 CR5rHxkYXSSaWlOJCpYmooD6HzjU/K5U3n9BCLTeBXzyec0KT2u01QvsS0wck6ijmJdX
 k3JA==
X-Gm-Message-State: APjAAAXfE6sdgeUmhNW2wKsEzypzDeqPq24nYQfn/CNIxO44LXArhwag
 6XdL0BeF+WM/cP02kC9hQKo=
X-Google-Smtp-Source: APXvYqyzgX1FtBsH1D512UipzE0fo3E21n34ZkbMvGPySLSYBL8njdqr0gmQEEeexM0VTLpdZ5uHNg==
X-Received: by 2002:a17:902:2e83:: with SMTP id
 r3mr27515390plb.153.1554691101990; 
 Sun, 07 Apr 2019 19:38:21 -0700 (PDT)
Received: from localhost (c-73-222-71-142.hsd1.ca.comcast.net. [73.222.71.142])
 by smtp.gmail.com with ESMTPSA id f63sm42265732pfc.180.2019.04.07.19.38.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 07 Apr 2019 19:38:21 -0700 (PDT)
Date: Sun, 7 Apr 2019 19:38:18 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH net-next] net: phy: switch drivers to use dynamic feature
 detection
Message-ID: <20190408023818.lmwxtjcqju7p7i7f@localhost>
References: <0cc96fab-e102-c0d1-ade0-90e3e06dc9f1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0cc96fab-e102-c0d1-ade0-90e3e06dc9f1@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190407_193823_464809_DAF9744B 
X-CRM114-Status: GOOD (  10.63  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Scott Branden <sbranden@broadcom.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 Ray Jui <rjui@broadcom.com>, linux-amlogic@lists.infradead.org,
 David Miller <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Apr 07, 2019 at 11:57:13AM +0200, Heiner Kallweit wrote:
> Recently genphy_read_abilities() has been added that dynamically detects
> clause 22 PHY abilities. I *think* this detection should work with all

Famous last words!

> supported PHY's, at least for the ones with basic features sets, i.e.
> PHY_BASIC_FEATURES and PHY_GBIT_FEATURES. So let's remove setting these
> features explicitly and rely on phylib feature detection.
> 
> I don't have access to most of these PHY's, therefore I'd appreciate
> regression testing.

How about testing first, then merging?  I suggest breaking this out
into individual patches that can be Tested-by.

Thanks,
Richard

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
