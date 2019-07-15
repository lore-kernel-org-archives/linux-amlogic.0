Return-Path: <SRS0=hyhA=VM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF44C76195
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Jul 2019 20:34:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D884320665
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Jul 2019 20:34:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EaSUg7pr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="RpIk7j3A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D884320665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+gGkn+p/jFNDEsSjvAeAD54x7a/CO28UH1/8Tmzvvo=; b=EaSUg7prCkOwkm
	5NrwVpjr2p9nFIan+sXk6OcsAXWvbKkcs/mnFPYIhZTejD71wUxx2DVzYdN7K0Bq4vgNH8xh6bHwM
	5E9llNFSZMJG+mG2ZaE7KWccofWGNpltu3u+6qHhQ0kRmRQegvNQPr9W+BTXeDoxN4Jw995D3CuVx
	aVNdNRSurnXUGfu+OuAVgPZ7CySlst3ve4QsVEjtC0j6kZ2Y7u/UDy9mT6ipEQCOU20FSF60Kh5h1
	5HyrsBkiKypyiz5ZB2sGDuEq207aHEgzik4MWwX/tfJ8xr/Ak1AqsiqaQI6GJYAx79aCDUpQa2Yga
	a/uPanBmWD7XT2Yn7HpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hn7fy-0004LR-7i; Mon, 15 Jul 2019 20:34:22 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hn7fu-0004KQ-VO
 for linux-amlogic@lists.infradead.org; Mon, 15 Jul 2019 20:34:20 +0000
Received: by mail-io1-xd43.google.com with SMTP id i10so36227964iol.13
 for <linux-amlogic@lists.infradead.org>; Mon, 15 Jul 2019 13:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=AAx+KCYrMtY/ELRUUN49P20LRASTzqK4lZ6I/S93X28=;
 b=RpIk7j3AS+hWigOL4/NO0cAujJh97clQ3BtY/u3jVW6nPPtiOE+viFrVvz1BSw1jkq
 880IhXGdnLCoHPy7+X/IKtRH1i7P5ceG2u7W5MJbkzF2OztF7v4ydbwKsHWiTTMAK0SF
 iw4K1QKMbkgiintmdjECPloTU31lbV8Kobm9JhSUiPTFIVXKlebvDbx2ZRIyh/3IKB6a
 xZbNPDGZbCO+yXvorzfXx5/ieunWgh7zYy/W4s8BTzoUQBeZg7vEJPlqlM1A5X85zBsh
 iVh/hqli58GoSSj3JED7K6kjIoMdDJ3oFdKgUThYX03SmVwWru6AOF13fgiLF34Gbb1L
 yT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=AAx+KCYrMtY/ELRUUN49P20LRASTzqK4lZ6I/S93X28=;
 b=VrxaMcg2tucLPIRyCjXGYWF1oAGeU7XGg+QcAOzFKOd4HcHsF7miO3PhFD+P/6bcAa
 DZp6DV/7vbRWBJqVD6vjlYmuhBzwwlq9JoDE3V/lpGRRFKAecc2M/3GDP7sB/Cu5sAHV
 pzBCt4WfVtZajICXSN1xa0FLn6WBuPT3W9LNr8ND1NzWclgdHTyl/vdZd8HjPwoWS3aI
 aIJolz4i+nVp50Gs1s4YSG9BaZ3KADRnMRcasux2B085LsL/Lp5DUQuoAJ/gQ//Glq1H
 PBZIMw8c385EMYV9miIFa9TbUHYm7Umwo1ZIuSNnLIHZ186Y6CUNYxdquwNPUiNxljwP
 jp/Q==
X-Gm-Message-State: APjAAAWGD09Cn4DaEXKXmpZZGLycASXowZ+6+A25fgevPkuwtBQTPdRG
 UhjyfoHVgNGWmnxUQo7BYrIb7Q==
X-Google-Smtp-Source: APXvYqywZfe4luOYTPj2bKAQyrauUOFxlaTpfEZs9VJMfxXbS3dpLgxSPAbPdcnwrPKuMusn2uh4OQ==
X-Received: by 2002:a5e:d80d:: with SMTP id l13mr27309709iok.292.1563222857310; 
 Mon, 15 Jul 2019 13:34:17 -0700 (PDT)
Received: from localhost (c-24-118-241-30.hsd1.mn.comcast.net. [24.118.241.30])
 by smtp.googlemail.com with ESMTPSA id n22sm40057663iob.37.2019.07.15.13.34.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 15 Jul 2019 13:34:16 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH RESEND] arm64: dts: meson-g12a-sei510: enable IR controller
In-Reply-To: <20190701115724.15801-1-narmstrong@baylibre.com>
References: <20190701115724.15801-1-narmstrong@baylibre.com>
Date: Mon, 15 Jul 2019 15:34:12 -0500
Message-ID: <7hef2ryr3v.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190715_133419_063584_C7774D96 
X-CRM114-Status: UNSURE (   5.81  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Enable the IR receiver controller on the SEI510 board.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---

Queued for v5.3-rc,

Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
