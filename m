Return-Path: <SRS0=LXOD=TG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2776C04A6B
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 May 2019 23:44:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2A5E20835
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 May 2019 23:44:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LBhfXpFc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="z/yx1XwW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2A5E20835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J7R6YTGoFr9eLDlRMwq5ecn0t7tyyeejzj4I5i37bT0=; b=LBhfXpFck9XNTP
	H+eJY98lzKjMgPiaC5LkUd9zJwscxUdNNFeey/bTAkPsGDogLChHUmYDXIbC79ZHo7Vqb/VXKuzPw
	ERLUi/QjUxtIge/RiURjlm6NjrJHkAj8x/qfiF0hOrK5y77KmgfC8ZZlgHsRE6hMiZJsGyImrcv+6
	wxrKHp/Bs9aa07NRMrMvglVug73J4zy1VdtWzfgXyplkKsfYDQItDzGgx6OG3w6oyg2UD86ABOH0z
	IQ9qG1U6a/rY8k8hsh7TqZ+kmKpM/PidtorzNDoqGhRAfgwzoqTjrFXTbMKDBhG7gLtWTaIHElGRC
	+nNUcPI8J63Y4CjomhwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNnHH-0003SD-M4; Mon, 06 May 2019 23:44:11 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNnHA-0003MT-0O
 for linux-amlogic@lists.infradead.org; Mon, 06 May 2019 23:44:06 +0000
Received: by mail-pl1-x644.google.com with SMTP id cb4so3229121plb.3
 for <linux-amlogic@lists.infradead.org>; Mon, 06 May 2019 16:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=lf5H4shj95cMGbwI5GeOOvJ41LL247SrQDRLfwxX94k=;
 b=z/yx1XwWFksdPj8nGuPJRGqifxeYvbRRuHNzzITSEsyMPKaCPf2neKw46ja9IqbVhJ
 NQ3XmgAp3P68euubnKEOgGd7P0LokFRIf79dma2U5NJ5NXHNmQifsX1i2yzZ9RE8HHPY
 H0vBzUTa7wtX+Pa3aph0WMfsN8QkQbeBU05s1BcH99yT5R5T1c1P928FwFuiELh8FPHl
 cvYNBVtrjH6mGMVqJm1qC1sA9EYw6E9S7BHlH2jmrdaxUaRCVOKpeNHdzeaxCsg5K9y7
 URVA88/ttt7i2Ejb+nQaO/It5FtZDTinOzHtoRJ6lmpahs5QAQ44h2jxC0WuU2Kn1nbY
 kbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=lf5H4shj95cMGbwI5GeOOvJ41LL247SrQDRLfwxX94k=;
 b=Mbv5OnMqvhkJotKQ3uIn2sukOaB0oyjjRv6qPYCah023HKlu2djyMFbnkhZi2dIHju
 dGZqVYJQSOuQJ3WaE6y/z3xQ6RbxnOs/3aQjqMvyNwKTtI8QjnrGG+aDAlgAI4utG8Ao
 TWFJkhHYY4SV4j+fP5bCNr2PfFeBZjMRfaIC+7N8jOV20O8QwSTo+EJOva7BCHA9EHfs
 vrRzyp8mUwoVcrVtl1+EqSakaRofJUmoT/dRmxj+4+W5trByq8rsHzx4h3hhwP0sb4bc
 z07ev3Q2bMxXnoABOnGZ1ubpGufPSsYwvgN2zoU2XFPyDEs1CZrfi/mKMz3+Tl1815m6
 wA9w==
X-Gm-Message-State: APjAAAUefoAzhA7fAXMma8YI4nXLR24eqwo7WV8nIpaYjak9Z+zREBsx
 /6Sc4+PMaLvhNQVlR9nbUBJAbr+r6UxQvQ==
X-Google-Smtp-Source: APXvYqyzqVtSCvpVcNGboItbSbGRFBLEFuZnBKsL/llWeGZMPyX01mLCmCdAamq9cDUznsqt/wEbKQ==
X-Received: by 2002:a17:902:e512:: with SMTP id
 ck18mr35142629plb.251.1557186239423; 
 Mon, 06 May 2019 16:43:59 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:a864:57af:5348:a6ea])
 by smtp.googlemail.com with ESMTPSA id 132sm15433855pfw.87.2019.05.06.16.43.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 May 2019 16:43:58 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 0/2] ARM: dts: meson: two GPU fixes
In-Reply-To: <20190420093258.2012-1-martin.blumenstingl@googlemail.com>
References: <20190420093258.2012-1-martin.blumenstingl@googlemail.com>
Date: Mon, 06 May 2019 16:43:57 -0700
Message-ID: <7h7eb3kv2a.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190506_164404_097595_3B04DB12 
X-CRM114-Status: UNSURE (   9.88  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> While switching over to the main mesa git repository I was testing
> kmscube again. On my Meson8m2 board I noticed that two interrupts were
> correctly set up. This didn't cause any errors so far because on my
> setup the lima driver is using the "pp_bcast" interrupt instead of
> ppX and ppmmuX.
>
> While fixing the interrupt lines I also noticed that I accidentally
> left the switch-delay property in there. That was needed at some
> point to run the out-of-tree lima kernel driver. It's not required
> anymore and it's not documented so drop it.
>
> Target release: v5.2 (if possible because this is where the lima kernel
> driver will land). No need to send it for v5.1-rcX because there lima
> driver won't be part of v5.1.

Queued as fixes for v5.2.  I'll submit when v5.2-rc1 comes out.

For now, they're in my tree (branch: v5.2/fixes) and included in my
for-next branch for some broader testing.

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
