Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA60FC43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 20:03:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8704820851
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 20:03:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oldcHB3l";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OHUDPdBs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8704820851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hL6+B13U04mgJeVBBh4gF+De4MICJgVrCInoCIJLFMk=; b=oldcHB3lpWXxwD
	WsEv0DECdMNXj5eoWTWHOEq++/eU8tkCf0lDe+ZB30Dfl5n9fugDMQXN6OKBYMzkK61poXVkhe04Y
	kFE0hoC6bUWkRGmb0DqSlMqq6MBbMSQ/BfzpWQUEgqNjouWvnDbF3CCmbZ9tdP7yb89Ds2Ql46+/i
	CrRKyvpVBRrn0HiC317TQ3N0Z6Sv6BvdxcdH6rbNQFXzNTSn0A+i4B6qbl/4FPQcWqBTcX2o+QlsZ
	eEy047pV9ABkUMkoDaYri0NFUOw+av56KQX9NtHHMUJwDqoamqdxfiyAEzC2GbbmUtXojysCkgdzF
	vHs8fpmNiA8BgDdCT4/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkDtD-0005hw-1Z; Thu, 17 Jan 2019 20:03:47 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkDtA-0005hQ-JD
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 20:03:45 +0000
Received: by mail-pf1-x444.google.com with SMTP id q1so5348532pfi.5
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 12:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=qwZJUgpwArcYqTNlUheNWb60xm1WHexmmM4IJW32JdM=;
 b=OHUDPdBsNo9GmlFAqXB0smBY/lIdrq9H0h6k1ABkxT++YpcB1rV2kG4J3f5cv6Aq0i
 SZWHB/9xgsyensRvjc45Y6z48cxvsp6rtHPjoaIY5E4FY+FNv6nnMgefGn4o8y7pkXYN
 WsjXJeAZSfUI/V3pnIErP0OnA4k1NYm75gAhZxTRIWbsTg09V+LuY5yJHN3WyQFhPa/r
 flpKdG+CsOI5nsNJqAt2xocXqIFj5GWryM4YB5G/EbE2LesUcae8MSGhmwdBtPNUNNad
 3n4HhlJ8aB1/+NW50nkzs4FBBdBZrE4ENT6QLBHXI8kuannCdsbZAVnRKTsBlR7T1rgi
 CRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=qwZJUgpwArcYqTNlUheNWb60xm1WHexmmM4IJW32JdM=;
 b=TEzotrZrcdO448QeuiPirFioWylC6GOWglCjNv+3IEqy8ctcfmdd9DDz6bGDCIMo/L
 584BULfnR+WZWTqQc0Ttl1CXQ+JAhuzCAntKE29zRKsBNc9tCuDzVxYbnEbcvhYuo8tN
 kJUhfBMxvxqt96hBwEmXS4wUjkWBCmrzD0SDsRMBFilf9SdYkb9haBEF9jh/DUMEfHXS
 aYjkTP0RnuQchN0yjXDlcFYNKTi4p2JfFa4nSqdUViMnCIsMN6MHnSNyChk2U56HMI7T
 ez/9rzwnP4gT69V1DobqjCQ6qhqn6khxj0aTML9MTMqo4t2pydcJmyPyFOZRpQ1y9fAc
 flJg==
X-Gm-Message-State: AJcUukeHrttAWeyaVlhEuiPqRTled0+2vNMAO/AiOF/GBpQNGx8sPE+8
 HHfK/DZUwPyeegvRZL8nIWRdKw==
X-Google-Smtp-Source: ALg8bN5FdbamzsRdYz7zzTszh7hifTI9+iTUYb3bEydV+6vx55bv7HRZt5HqRJncx+rqLeHQ89muAQ==
X-Received: by 2002:a63:e5c:: with SMTP id 28mr7517016pgo.369.1547755423975;
 Thu, 17 Jan 2019 12:03:43 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:e076:9fe9:59e2:1e0b])
 by smtp.googlemail.com with ESMTPSA id 85sm3452328pfw.17.2019.01.17.12.03.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 12:03:43 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: s400: fix emmc maximum rate
In-Reply-To: <20190116175947.6093-1-jbrunet@baylibre.com>
References: <20190116175947.6093-1-jbrunet@baylibre.com>
Date: Thu, 17 Jan 2019 12:03:41 -0800
Message-ID: <7hr2dbaw6a.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_120344_635938_37C56013 
X-CRM114-Status: UNSURE (   6.58  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Limiting the HS200 rate on the s400 was just a way to mask that the
> tuning setting were not correct. This seems to have been fixed with
> the recent MMC driver update. We can now use HS200 at full speed.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Queued for v5.1,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
