Return-Path: <SRS0=UcGz=2G=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ECCFC43603
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Dec 2019 20:00:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02B712146E
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Dec 2019 20:00:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XsSBspnF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SiecKE/U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02B712146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMc7OBB/BALwYQ5yLeAkWLpnyCab/M09G50fcBC6CYE=; b=XsSBspnF1j2PoE
	knndfm29xJnaJBRSLlI+1/k5BPb1NMuyf+Ucs2h4jHbjrEg/m2rpcsXGT/SnYki8k8s72cjxH4p05
	JVm7VWUXe25l74diriIgVg/LJpUCbcQqiYZ5CP8gxWzxCLqgWXDoLQIH1V5u/KSMnnct6TUsgl5Yy
	mGBQV5dWiunHdJoRDcjaIiZlazhjsAyNobshxRds9/Ez0k3faCJCjW2agB0cOZXGoIO/2BMYDUXRb
	JI2zE5VUeRofAmauP82ce4Zdqgnrscr3WdASqUiVTjp5pYk4+Bpd5p+jhnOZyRHiMXgxNNwtL0nwP
	GRe01debl7Y+kMwBNn/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igwY1-0003W5-Qs; Mon, 16 Dec 2019 20:00:53 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igwXz-0003VW-Mp
 for linux-amlogic@lists.infradead.org; Mon, 16 Dec 2019 20:00:53 +0000
Received: by mail-pj1-x1043.google.com with SMTP id v93so3467231pjb.6
 for <linux-amlogic@lists.infradead.org>; Mon, 16 Dec 2019 12:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=r8qzmMdF0D1xC5nnVedyWP2XlI7Ve+rZ+9sNoVRjFRw=;
 b=SiecKE/UinzqpLyQBs+yEgO3QpPJoOPtp160dyqWGW7bkIkYt2+fQaO7ZWmjsdE5KQ
 5rZL1oiQCatsGNcXX+Rgd7f3Xl7eoyOq+y+UWsuiZfhjz/8fapz4Uq3HS8xGRKnI+zlm
 sCrkRDidlxktRaEchXVFGeR8s0WIyMww7MLEMcq13ETN2EGNppzgilaxR0lpU65XcszA
 GX0J4Rw0z7NkfJ4rsnyZtbKB3IfoYHLWV2o6wD0wf4SH8kP3+GCyCvoACKdRXjO5kR5y
 OI0A6t7dx6ihTp03L0gcOgCAHXmeYuQAWED68jLrSpsu318xbd4wz5zy/JL3baS7x2kj
 n7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=r8qzmMdF0D1xC5nnVedyWP2XlI7Ve+rZ+9sNoVRjFRw=;
 b=WM984oJe4sORca99HFgKx2TfIFDMXU0QO0XIiQtbO3jP89uUwxkynap5u7GZfJhMv3
 yZXPgHe6qMUWkbSi/5ZkO/tC+zoxETpP9Lkhi7I51gbiwJI3S+yWsrVgBNa2uBz+VBEb
 /SGQ323a7tL5QZZBftBPwD7yEryIa+BwEWUrXBcz2VJ9Tmr+Z6vIva0ZCocXbz5hRAEO
 Lo8pC2GOhdrPgd0ZaG8FyJGJ0e27SgE/MHI0NkDmfIKqvYaBOJnpkP/WW8jcLNRIPx6e
 NYsbcna5xrN3uLMnM5g3pgOeY4fbz2FYN0MONtL+uejgHLsK6SUvaDYiv1MWmxaJ7RkT
 zjjg==
X-Gm-Message-State: APjAAAXA5aQDmZj4RVuwNkO4z9u4f5ZFpVspluWnRYic2eTY27+26em2
 3quFkqXhTYrfhwoynoFCbu03XA==
X-Google-Smtp-Source: APXvYqwT14DfCQl2bxHGgAYukZ3rXhtauf9/AST8UjoLC9sNuSdmayerLCZ+paOEtyNXBmIlumodKw==
X-Received: by 2002:a17:902:b48d:: with SMTP id
 y13mr18664296plr.215.1576526450635; 
 Mon, 16 Dec 2019 12:00:50 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id 73sm23416974pgc.13.2019.12.16.12.00.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Dec 2019 12:00:50 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 0/4] arm64: dts: meson: add libretech-pc support
In-Reply-To: <20191209143836.825990-1-jbrunet@baylibre.com>
References: <20191209143836.825990-1-jbrunet@baylibre.com>
Date: Mon, 16 Dec 2019 12:00:49 -0800
Message-ID: <7h5zig82ha.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_120051_741571_5C89DE59 
X-CRM114-Status: UNSURE (   6.03  )
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
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> This patchset adds support the new libretech PC platform, aka tartiflette.
> There is two variants of this platform, one with the S905D and another
> with the S912.
>
> Changes since v1 [0]:
>  * update adc keys
>  * add phy irq pinctrl configuration
>  * update leds description

Queued for v5.6,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
