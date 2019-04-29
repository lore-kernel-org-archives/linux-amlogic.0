Return-Path: <SRS0=ef8O=S7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDB0C43219
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 07:31:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED0D52063F
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 07:31:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hmgg0tIh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BApoV7mq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="fZPAINdq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED0D52063F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ili6apw1F/bBH+XqPMDEXXn0zVNdqv7vPkfUaoQiCfU=; b=hmgg0tIh/WTNpI
	2T0gTeXrbWte2UpwZRGXV9ifGJjPOBJitoS+X6fh29mbE9PkAQrfLSXNVfhvr2IrAv6jq3MzT2Zp9
	PJXW5YSdeaidet9tsErB/FmYY0UJYMajMRk7R0REi/wSIjUPobkFZx3hQ7J9UIDBrjhiFh6w3NUEY
	C6J0eYWypMiZGW1OH7Uf1sMHhW6coGOjTJMZKbRAJR9FdaqYt5D30PMlfmA8YstWc6U8UMnCAZC8O
	bEJuJoVBUw+XQU3miU+41vJArX9DKQ8oxGVcxxtn86ycoE3DbaPicLHouhnpVkRp+rmEygBjk9Xts
	DL18BW4XrudkMVFt+dMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL0kc-0007I9-Ua; Mon, 29 Apr 2019 07:30:58 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL0kb-0007Hd-Vr
 for linux-amlogic@bombadil.infradead.org; Mon, 29 Apr 2019 07:30:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cNiynyKRK+6NofuA5ESyTbqlxT6F8CVlPOs0I0hIaNY=; b=BApoV7mqK9QnA92wh5sfaOs8z
 WpmER7n7+ZiJ0D0vNdcmb7xuH69LvH71hNtuIQtPSTkAjcK8i206Au8fr0xkEOXsMr73DJDwWcRBo
 KcUF2JFZSdu+EQs6IcHN2AsVjEwWEp7HWNY/OPLfWyfihV+kKDMaz8w1R3oDudbD0bxfVcpFBMKPZ
 6aECgJs1AlBeKtd469JGa6NWltSbiycw5m/2TDSC4ceXbonaC/ljNvU2bmZASf5FSv+VvzfGRuU/U
 xyTVRdIOhC9OQRoaHaWS4g2XvKXcl9V9oY+3uvFEzCkiok9OLjjCm6RMmg3K01gcjEy/kSReQtOXH
 RNe7va9mA==;
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL0DJ-0006EZ-PP
 for linux-amlogic@lists.infradead.org; Mon, 29 Apr 2019 06:56:34 +0000
Received: by mail-lj1-x244.google.com with SMTP id y8so1902827ljd.3
 for <linux-amlogic@lists.infradead.org>; Sun, 28 Apr 2019 23:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cNiynyKRK+6NofuA5ESyTbqlxT6F8CVlPOs0I0hIaNY=;
 b=fZPAINdqdX5BVZp0syZ9egbOY4oyAfzmKcQER0uvV2G7c0R4FFxrs3HKnq/Xowrk0G
 YvHhGGkFKQhYL9Fie3epjCDwCfjbQqtwx0HRqlChob3vNuH1ZABZLA/DwXJFIzosayj4
 x369xndNWcdpnWR9zxM2ItQTZaudpvXx5tFAbll9QPWSe2hmZWq9BzIKV81h1Cv5a4Q3
 fILO5Qf/yx95Dm3V9hAI7EJ2uXF71x++9qZzoYi6ZfRxjyDhI4vxD7iUL6yiTv9bTjBG
 kRT9kPG0QatqdJY0Qhfi6NRAoLVkOowDi2ElXdYlEe3D2I7MfyFOH2NbSXbUEBBg26Tq
 Rakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cNiynyKRK+6NofuA5ESyTbqlxT6F8CVlPOs0I0hIaNY=;
 b=Q/QmF3BdFukjWDNGzkFJnf4yeu4uDLIKdzt6BHfTV2ohSBhBwDrtiSUrCPATwNRyFg
 8W6FdRTXhbxWwjldXHgdm3MERj8TVPLvC2WjGVf6CJ5xtcsgmXA4NY1IadLSFgkM0nib
 3yqdAGzsINU6hNiRlqzoQWEf0dQHy3ZSz6Syy3GnCVCZsM/5Sow5MJjhBtYF6eVTEo28
 MZ4XB2IqHYWIGU0rVUaw5R8WNpW/waMCw5j65NgOiPmpTX6xpAgFqR+1cxcKkHY6aRee
 raEG2w2OYIPqeNvv/1qZsf7KuEAcJWK9vQP1iaPy4gFPqelivh7eNJT/GMtSd8K6j56U
 g1sw==
X-Gm-Message-State: APjAAAUf1exQ4HUhF3weqQsnT6JWrtOjZTpSkxSFVxnr99fkvCFuyVUX
 S6DfOt8OHH2B1hfNSr3MtXvtrw==
X-Google-Smtp-Source: APXvYqwiQ8deQZirgfFJHIjf/B0x0s4k0KDXPLq/du0lkV0l+EX0JlZhHGtP1SiU/DnV40iDGzeiHA==
X-Received: by 2002:a2e:9dcb:: with SMTP id x11mr16048936ljj.123.1556520987023; 
 Sun, 28 Apr 2019 23:56:27 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id e10sm136357ljf.5.2019.04.28.23.56.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 28 Apr 2019 23:56:25 -0700 (PDT)
Date: Sun, 28 Apr 2019 23:44:30 -0700
From: Olof Johansson <olof@lixom.net>
To: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [GIT PULL] soc: amlogic: updates for v5.2, round 2
Message-ID: <20190429064430.bmjs7q3x3smvbkw5@localhost>
References: <7hy343a098.fsf@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7hy343a098.fsf@baylibre.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_025633_850008_671B93EB 
X-CRM114-Status: GOOD (  11.65  )
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
Cc: linux-amlogic@lists.infradead.org, arm@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Apr 21, 2019 at 07:41:55AM -0700, Kevin Hilman wrote:
> The following changes since commit fdda0a6adc33536ad468f07db27325423703c5bc:
> 
>   meson-gx-socinfo: add missing of_node_put after of_device_is_available (2019-03-18 09:07:32 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-drivers-2
> 
> for you to fetch changes up to bb1dca3a3900a00b881286c96340d6ab85eafe0c:
> 
>   soc: amlogic: meson-gx-pwrc-vpu: Add support for G12A (2019-04-16 11:09:53 -0700)
> 
> ----------------------------------------------------------------
> soc: amlogic: updates for v5.2, round 2
> - VPU power domain: add supporg for G12A SoCs
> - socinfo: add new SoC and package IDS.

Merged, thanks!


-Olof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
