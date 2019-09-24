Return-Path: <SRS0=mdkS=XT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAABBC432C1
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2019 19:18:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0B24207FD
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2019 19:18:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KUzOx9tA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="iN0dsE6q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0B24207FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h1V6uz8+9nvTfppJcDWthmGIfBMNBlCaFWEI1cIvxtI=; b=KUzOx9tAMrhi33
	YyeHFWX6S2esKCrxnfEYxBpo5MWICFNNL8tvfu9lxPeacpFm3vK0cstTzjqxvr9EI8rCDS1pFpfoa
	6y2OQCLCzoLStqq0zKJZGgg3PCi/ltOx+4UEkDcctwf8vge0glLdBcq5ZikWsJ4t6JTrOAIvdZl4J
	3NAvbcTKBNqZQ5TzkTv2h98g6Pb90f4Q2dyGoYgP471hkDQonTRk46qPsPTQSy6HzU8KUQPoWca00
	wyCodiDS+fzdAv5+gAzgAaIahzo6lv3yr+mrJNOaNVeiKkfKCtAr7QtgMvJIoVQrfzFw2ISxZ/Pul
	0edQqU4r9lmRBVkPG2Dw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCqKc-0007DN-NP; Tue, 24 Sep 2019 19:18:38 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCqKO-00072c-II
 for linux-amlogic@lists.infradead.org; Tue, 24 Sep 2019 19:18:25 +0000
Received: by mail-pg1-x541.google.com with SMTP id z12so1818750pgp.9
 for <linux-amlogic@lists.infradead.org>; Tue, 24 Sep 2019 12:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=a7+izJYYosgd7zHjanZYValds7ow3BOFmZCRlJjVnPA=;
 b=iN0dsE6qKEf18ktGqXha+auVSqp1K9xsRtMPakuGHFG5GXMgMn/FjaEvv30rbYUkvc
 KkvVYNIU1IoK1teGbHrMvl62L/bi5bZRkDyCGCT9Tq4N40wmOmir9d15H85r75snX3ZQ
 6ZoK8xU1dvXNRxgB5Wc9prpKH4IMjmwHXXdp226FIHRAHWhlZX2mGv+eypuYusoBhyoP
 +fWKmlso70BGBmLOaR5glrwv+xAWjHOHGQq9zREpORZRVIwGAo7L/AhoB/0gG8mfE9Sl
 rvIikkb0lAcHo+OGd0mgDOgVXdlAW77/eRG0CjgO7Ius8pMvuM60aupsVZ1rEgPI57oL
 LIJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=a7+izJYYosgd7zHjanZYValds7ow3BOFmZCRlJjVnPA=;
 b=svtfA96NC1TuV3vVUD/AS4vv1Moz8bcCAdWp5bo7c6N3DS7DlqEenJKw/f/prGnHPs
 t+Wp7UR5gpdEedtkzOew+GWj2bHV5O0mmGkhTgteFM+388MM9YdfUwnF1n3l7PTVdhOq
 thj9IvmgNfbWSf8VLRDBPu/+wZ48zUYoeL6tPh72mMbpQpKXlW6GkkFfFGfBN2xyFIxO
 7RTPZ/y6DEmm33CDoXWiUVnGZ5u5og7OH3he1HdZh5FkJhOx4plDhbp4vjfs/7ZKJnrL
 pmEUjUTY1tD8PR0z8KS0IDribjTyVvrFL4Bf5s6YsKzA+FrWz9swLMxfJmbPN/FF6L7Z
 rm+g==
X-Gm-Message-State: APjAAAV6myZD0zBZ+wDRrgKBaRYWU/oNPh/MjTA/ZU60ubZKwNM/8LtF
 yXBMeRYjmQVTvNooIWCbjbFkMA==
X-Google-Smtp-Source: APXvYqwUtX0FY4xf/0UwDn+yg9UjZNFwrHooHBidGhmXaRY+URNGLcdC2hpL39Xw/wCmWCAaTsx6Tg==
X-Received: by 2002:a62:1cf:: with SMTP id 198mr5251106pfb.31.1569352703005;
 Tue, 24 Sep 2019 12:18:23 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id v43sm4926886pjb.1.2019.09.24.12.18.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 24 Sep 2019 12:18:22 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/3] arm64: meson-g12b: Add support for the Ugoos AM6
In-Reply-To: <1569248036-6729-1-git-send-email-christianshewitt@gmail.com>
References: <1569248036-6729-1-git-send-email-christianshewitt@gmail.com>
Date: Tue, 24 Sep 2019 12:18:21 -0700
Message-ID: <7hpnjp5wqq.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190924_121824_602866_F8835711 
X-CRM114-Status: UNSURE (   8.43  )
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
Cc: Oleg Ivanov <balbes-150@yandex.ru>,
 Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Christian Hewitt <christianshewitt@gmail.com> writes:

> This patchset adds support for the Ugoos AM6, an Android STB based on
> the Amlogic W400 reference design with the S922X chipset.
>
> v2: correction of minor nits
>
> v3: address regulator and GPIO corrections from Neil Armstrong (using
> schematic excerpts from Ugoos) and related v2 comments from Martin
> Blumenstingle. Add acks on patches 1/2 from Rob Herring.
>
> v4: address nits from Martin except for the vcc_3v3 node as it's not
> known how to handle the vcc_3v3 regulator managed by ATF firmware, so
> it remains untouched/undeclared like other g12a/g12b/sm1 boards.
>
> v5: corrected some tabs v spaces issues introduced in v4.

Queued for v5.5,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
