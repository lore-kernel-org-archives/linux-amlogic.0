Return-Path: <SRS0=N67E=WS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA7A1C3A5A1
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Aug 2019 20:52:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB133233FC
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Aug 2019 20:52:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FcTI2k4Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="TfQcqPfS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB133233FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NO8P83ulDqk2sy+ItW+gbQsTlJCuE2RQKTnKz2yL/Ik=; b=FcTI2k4Yo5gOvj
	DTuevsoUWFr9glgYEsb3KCHi05oI1C0/mCBCyQfrfvyBu3sPZVTwhxntobgu4HqSiCj5qx0D2JkjC
	eY5ivS7mXyDbf254wRDvO/qEGqmK7nkhcNs9+0sbEBGjXXkDe+AHFnor1nq/qoJV11noB9wIyJhtt
	LsbI4+LNS5AIkvJHbCQNj0U5E1BkKlHc8lz16QJYBdViERrDcMNrCpwUsylYCpjvNbrEA/Msm0ktJ
	lXjER3EqXWyq3FJmRd20kkHl3ruj/Q3Inr1z6GPmyvbShVB2DgTszpA3MRg4c4Q1wizszlJF1i4q4
	syN8HMPRwH8PvHCc1VEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0u4R-0004zE-Vv; Thu, 22 Aug 2019 20:52:36 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0u4E-0004nx-3w
 for linux-amlogic@lists.infradead.org; Thu, 22 Aug 2019 20:52:23 +0000
Received: by mail-pg1-x544.google.com with SMTP id p3so4355755pgb.9
 for <linux-amlogic@lists.infradead.org>; Thu, 22 Aug 2019 13:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=3HAkNaLKaKugwacngOASUf+k6kAzcSQJHy2ytCwReZ8=;
 b=TfQcqPfStJ1Rc3oSQUxvkEqRBWDG9HKn7JCy2rHB5DN0PuVo/2rm7AkYB8v9zhwt32
 7WxgzDMUPZj8OrdgQWjlr/FftrFxJen5gmu+Bnh1qhCqZZVzGkKbP8Yb9Jf+9qS2t7tC
 etwh9sY2nf6bNxA8LercsqvFOB2Ad8OcLTPuJ6TCW8HwE0shfXidPqYTYTNXsF/SPjsv
 ztsUptGKPjzuyXnfDzqkJPe+44MPYZ/QK6vHYuqrF8n/3K4ZB09hfECawcU/T7Uv/QR9
 tBa7DNzGDRl5CnwWKSufuPdoyH9M7XxrnEbNzA6ruBUBpHFR1r0/HJBQavqLY75s9EMn
 6hNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=3HAkNaLKaKugwacngOASUf+k6kAzcSQJHy2ytCwReZ8=;
 b=cSAB939GVjQuEHut1ukSvcues1qSprrh2VWOET0smeZqX50E8YVEjHppRvbnD59QAf
 KDqHfLZYSI+XJ50RyY7biECFyh0qgNtGJvlEVZ7RQh9Xzoe3rG67cqOJEJVr7re23c3/
 Oa17lEmh8TEC0YPoRNawYyidBl6P5OPo3RLyz88bwMqf6yETwr5XjJv+QOiOx4mTeY4G
 WENHqdM4EosyeN8cntviPj197iPKuQi8yODawdkWdidYBl0Lc0xUWgoQ1dz5zpdo6MQt
 RKPEc1cGwK6Rz9eBcJ/OkjTFAzeucmVrMERS5/Ez6BsQOUvvRYHeen9Iq4h/wI5PXEDG
 waqw==
X-Gm-Message-State: APjAAAV7ZJgp93S9uMBnrSYfA9qJAM6SLTYGwPVJx3UhZ+3D6EmMouMj
 cvkyEylVS/m5MjvwIS3QjusYIA==
X-Google-Smtp-Source: APXvYqzbl0kNpLZ+an5214np92JENAgAW5dpKMeExC3ZhPt55rlZOMPNBuMztgy7PcT8TrcTTerpjQ==
X-Received: by 2002:a62:4ed1:: with SMTP id c200mr1221517pfb.218.1566507141310; 
 Thu, 22 Aug 2019 13:52:21 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:89d4:68d1:fc04:721])
 by smtp.gmail.com with ESMTPSA id e24sm174155pgk.21.2019.08.22.13.52.20
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 22 Aug 2019 13:52:20 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Kevin Hilman <khilman@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 0/2] rtc: add new Amlogic Virtual Wake RTC
In-Reply-To: <20190812232850.8016-1-khilman@kernel.org>
References: <20190812232850.8016-1-khilman@kernel.org>
Date: Thu, 22 Aug 2019 13:52:20 -0700
Message-ID: <7hmug03ou3.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190822_135222_164352_C84826C3 
X-CRM114-Status: UNSURE (   8.06  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Kevin Hilman <khilman@kernel.org> writes:

> From: Kevin Hilman <khilman@baylibre.com>
>
> Add a new driver for the virtual wake RTC on Amlogic SoCs.
>
> The RTC is virtual from the Linux side because it's a hardware timer
> managed by firmware on the secure co-processor (SCP.)  The interface
> is 1 register where a wakeup time (in seconds) is written.  The SCP then
> uses this value to program an always-on timer.

Just FYI... this was originally tested on G12A and G12B SoCs, but has
now also been tested to work unmodified on the new SM1 SoC as well.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
