Return-Path: <SRS0=v0PX=OO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC8BFC04EB8
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Dec 2018 00:23:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB50920834
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Dec 2018 00:23:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R78Jps0G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UNd0vZvQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB50920834
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4CDquunyIIXEcby9wNHK1fL8k8sCWnW5jPZRaDgG/0s=; b=R78Jps0G1owOf6
	Og0TR3SNZ9QvYzORXEBD0Y9D2pVJplTPFSjPKxdRTP5W7w2y5o00KNO32IZs0dPIgpTn5FdyB0/0j
	Ovn/YDIxVQbij3SqjDSCyBwwC6M4TTn2aXCDt+mhaDcGmcKSh1dWjSLBR/+gXKnH+C2RyVn8CDtBG
	uA+B6rE9VOBe67Ovzbgn1CZnJXOz5FxhtKG/T/PYPQcsKwplL0c2AKk2HwUGw/MjSAsBorFef+tAw
	jMrUE/xLogy+OAN2KIWRjjQgfk/enJIaSykAsdp+IEn9F4SriGiv3HPaa717O0fWHSXdesFPKilTM
	XSsDkeW8ZkJ3+wnlfh6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUKyj-0005cN-Qt; Wed, 05 Dec 2018 00:23:49 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUKyf-0005Qd-Mz
 for linux-amlogic@lists.infradead.org; Wed, 05 Dec 2018 00:23:47 +0000
Received: by mail-pg1-x541.google.com with SMTP id 80so8139961pge.4
 for <linux-amlogic@lists.infradead.org>; Tue, 04 Dec 2018 16:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=rXz3U3BB2qLVL7pDyi7g6ArLmKgfu6RB2C9y2sIyQss=;
 b=UNd0vZvQx46EpcicD+JD3WZrqKRZgMmW0+NfSxRx6ZOsPWgr93gbFJHwv86Co7x1Jn
 p9NN8tpcSLd1aV8vfa6kwFuxTjfRwyBuVnUfwdhwKOkpWCyVYeAt3Id8LhZ+QZ2aK7jF
 17JXlnclsppDUhQozJ7gPyQ5Jlb+diavl0oMF0539qPEROjmnTBVWC24wQYqX6jDSomF
 D0CXkgaOo/ocrB/pNYEylbPzKMnkW1fs/WFNGYR2xSsNAqWZqiGWAa8QtPdk6oyv/kxK
 TEnihlIbZbkKsfGOhd0xPSp0wD0cn00cKyIqyDetuqb2CjKHUxpBTSr3+HUeCpVG2Wlw
 94LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=rXz3U3BB2qLVL7pDyi7g6ArLmKgfu6RB2C9y2sIyQss=;
 b=h+oReuQfGjNbFcxXKwVZJcmadl9D0mjyqy8Uc7h+W9yTvgEySlCzMdS3vHImwmN895
 FxdWX14e/96Efl+r6cxupD6ZGswgOpBjnsC6JHgSxWAStegme2ERvuhFCHNXJIwedIJE
 FDlExwa7JFi4i+voYGvAHLy1vopDhZLrqq297sitK2wsMS8o7K6H/Vt4BuT7dAQo6ZDa
 pIygeAwvCUm/cG1w9/mNSZj9cLpUgDHT+I3ytR681lSa/xfu/+t4Wc5X3MqMr/nPiOdQ
 Vl1Hg5o6Q9fmJK1fFn3m6685ET6mgIDIXw8jGA/LK6h3SAE0so/TJwEPR/byoEWMBTHI
 Ttpg==
X-Gm-Message-State: AA+aEWYRqsh5qxcqyxb1v84QUfa4902FHR+ZObjIvO0lMaW7Ag0XAkPb
 NNpmH1YHkbiqa7RyrL7M6IfZsGYIvnw=
X-Google-Smtp-Source: AFSGD/XGJhD03HWOsr+Ai1mk71eWDszLqTXBQnA1uSfWhbIxF4GaeH+M9b0XYGvsM2ojZLlr9yKLDA==
X-Received: by 2002:a63:f34b:: with SMTP id t11mr18681172pgj.341.1543969414116; 
 Tue, 04 Dec 2018 16:23:34 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.googlemail.com with ESMTPSA id
 k129sm32765272pgk.29.2018.12.04.16.23.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Dec 2018 16:23:33 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: Remove myself from the list
In-Reply-To: <eaf25e588c5ab78c607e7168e22871464e7ec8d7.camel@baylibre.com>
References: <20181201151749.10932-1-ccaione@baylibre.com>
 <928e27de-cb7b-cf40-b8b6-2aa43a69ee39@baylibre.com>
 <eaf25e588c5ab78c607e7168e22871464e7ec8d7.camel@baylibre.com>
Date: Tue, 04 Dec 2018 16:23:32 -0800
Message-ID: <7h1s6wddob.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_162345_753655_7CAFF116 
X-CRM114-Status: UNSURE (   8.21  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Carlo Caione <ccaione@baylibre.com> writes:

> On Mon, 2018-12-03 at 11:21 +0100, Neil Armstrong wrote:
>> On 01/12/2018 16:17, Carlo Caione wrote:
>> > Kevin is basically doing all the work. Remove my name as co-
>> > maintainer.
>> 
>> Sure, but couldn't we move you as reviewer and add Martin as reviewer
>> aswell since he is dedicated to the Meson8X support ?
>> 
>> Or maybe add a separate entry with Kevin as maintainer and Martin as
>> reviewer for Meson8X ?
>
> This. At this point I don't think I will be going to work on the
> Meson8X for a while and Martin proved to be the right guy for this job.
>
> So, let's remove my name from here first and then Martin can add a new
> entry for Meson8X.

Queued for v4.21 (branch: v4.21/soc)

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
