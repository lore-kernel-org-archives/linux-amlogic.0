Return-Path: <SRS0=Lc8Q=QF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 249F3C169C4
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jan 2019 18:07:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC83021848
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Jan 2019 18:07:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QXF2NGvF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="aA0lz5/x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC83021848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gvNskypeE8NPzi6JWPTemidhjJNIGwuSB5Ari/bCbjQ=; b=QXF2NGvFkxPh/N
	o15VfSll/HNeYTUStonw+1NLDW7NCtFXH6cnrm24W+c1H+cKYil/ZfFEBkfuOa3kHRqBDKOkKIt7l
	ujGtpH46jbSgi2V/bmzijCOC5Uzu06mddJ/9r1Ze2CgT21m4m3F8RaqCFRU936C39aIaRer87Kdej
	vaCI1W0zybJx983/hj2tgSMxwQfNJag0TfqbLBSTxjhvkEnZzAS4g1nmXlL39HPpcH1NnUjjgE6u2
	dSyy6eWbXY7+CYUWNKxh+nc5mx3yWoxTVbzGsUU5wDQ2iEeWJjGTsMqVe8t2xhOJbLlLpabPL8qSe
	vICiWVTmZ3YpyvdnM8nw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goXnB-0004bk-Hh; Tue, 29 Jan 2019 18:07:25 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goXmv-0004Py-BW
 for linux-amlogic@lists.infradead.org; Tue, 29 Jan 2019 18:07:11 +0000
Received: by mail-wr1-x441.google.com with SMTP id z5so23104285wrt.11
 for <linux-amlogic@lists.infradead.org>; Tue, 29 Jan 2019 10:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=NzDwDEgriwmCgRdcqLB9TL0tXHCXXVwXdPshYo2uub4=;
 b=aA0lz5/x4LFTqvA60ICnNMJoFbk39uJ7CnhkZYJOeb9pQcko04r2z8ek1EemQ/H7N1
 DUy0xRc7jeRdHJ/xh9wTj7kiZJdPNZElsZ+V07PNmqaHMoiEAZWO87U+2K8Bn7EV5FNE
 EuNgYshQBkNbbhTeKx0AOFK14Sx+r4G5w2+vPjpDkom9sVzpOEYuftscHANqhnIZHD1f
 xE8AtWvmRK1TYVbQ703NIGgw2zlj0baGYtivZ1NNsOVe2lQC2bE+f6p5ZsdwaBx9tAXK
 Z1pjWLVPX6Yy1lQ4iKc9hLMDuVYXAKSJEyAnugeho9MU9xZ4hnlFr29Rhmq27UR21i8k
 a3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=NzDwDEgriwmCgRdcqLB9TL0tXHCXXVwXdPshYo2uub4=;
 b=sDYgmnxc131DN18ti1DHvC6Foa2Wmvh7aEuhm6VavdewU7+NA9+D6DPDEHvVHCI36p
 Yf9cLGHUXzlJ3o6lEq9JQBu81ZZyhMBUrn97XU8aQzePfIsXhsTgdUCMh3aufKi/P+E/
 x41JT03CwDLFtJtZOvOilqfXRw54OLtj2YD1JLrnJEIrV4qZm7anZM0QvTSjA0BMSpJe
 U4R8NOhn6mc7m6IMbjPt3//xSFcarkNxQRQXtXlxsKSYxAJcqEQcQeSuqLnF2plmiykl
 rZ9GHj8MMVkgjJOmwVw1mrRdPNs0NI5cCON4EN8s7RiRcu8RqjjB9reTq0HeV82+9o+g
 ckFg==
X-Gm-Message-State: AJcUukdbLiClJl2KhDePvvWY1nUnleZZ+J882pBAEQ8BpyPqF3QyRC6m
 baZkLS2SF3CeRibnVERmntNoBQ==
X-Google-Smtp-Source: ALg8bN5xbEoQ1ihFND9bwxaeig6iPfJJ+zuvOJCox2vVkZ+I7GSjseFGt4qud2fkXGXnmTOQMBeqZw==
X-Received: by 2002:a05:6000:108d:: with SMTP id
 y13mr25818527wrw.135.1548785227162; 
 Tue, 29 Jan 2019 10:07:07 -0800 (PST)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 j33sm192878674wre.91.2019.01.29.10.07.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 29 Jan 2019 10:07:06 -0800 (PST)
Message-ID: <f85275321c93c00494c82a8af19a70c229887944.camel@baylibre.com>
Subject: Re: [PATCH 04/14] clk: meson: move MESON_GATE to clk-regmap.h
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>,  Neil Armstrong <narmstrong@baylibre.com>
Date: Tue, 29 Jan 2019 19:07:01 +0100
In-Reply-To: <154878509992.136743.15892625146758066106@swboyd.mtv.corp.google.com>
References: <20190128180430.28689-1-jbrunet@baylibre.com>
 <20190128180430.28689-5-jbrunet@baylibre.com>
 <154878509992.136743.15892625146758066106@swboyd.mtv.corp.google.com>
User-Agent: Evolution 3.30.4 (3.30.4-1.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_100709_442811_10640E5E 
X-CRM114-Status: UNSURE (   7.31  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 2019-01-29 at 10:04 -0800, Stephen Boyd wrote:
> Quoting Jerome Brunet (2019-01-28 10:04:20)
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> > ---
> 
> And also make clk-regmap.c a module? Having any commit text would be
> good.

Stephen, 

As stated in the cover-letter, this patch (and several others) is meant to be
squashed with patch 14 of this series, keeping commit text of patch 14.

Details are provided in both the cover letter and patch 14

> 



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
