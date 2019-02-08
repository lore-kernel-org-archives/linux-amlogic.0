Return-Path: <SRS0=3vaB=QP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D78C169C4
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Feb 2019 18:11:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE29F21B25
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Feb 2019 18:11:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ScwjjUxB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qWCuRQU7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MkTQf5pY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE29F21B25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a7Up6zbJ7KK3F6FAx8uF5ztjOavdTFFROYoDSuuPVcs=; b=ScwjjUxBpefSEI
	lguKUi/JAKOfZs5vClRme7/E7j5WWdzSu1HVUaMF6WIrzI7SuVEOMF85CsqnYyMCqDGW+749dESgC
	7TS8RgkB+SM8mS4+GorUzIo8GqYl036gGSSoyw+7TmC7L9UGTOvgkr3iw3pyHmINtFnKHeZl9B7B2
	/wRO9H5qPE8DsKTlOlf+QM656X8q8jaOmpQ/vQsZ9K1LV3E0xIRhySMjBGucbjMvN6l7hYf+R/2XI
	QUUJThzZJyOWo8NNcL/7ToF7ZhqbGnV2w9gUTLXKfUn5Go+tCP/VKblMF0wDxEhZ5mdqw4nrVpnX0
	IWOvEmaCDXgOkaL8yyag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsAc2-0005Z1-Me; Fri, 08 Feb 2019 18:10:54 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsAbt-0005OI-7P
 for linux-amlogic@bombadil.infradead.org; Fri, 08 Feb 2019 18:10:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:MIME-Version:Message-ID:
 Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8qlp/xAnLxAOjV4wYTNej8P4AqA27Ps7vMX0JSJoLng=; b=qWCuRQU7GEl0nlKEp/ZTttCjT
 DlNRe65QY6+YrB6woJgeAgRI+bkdpqi9Tqh9aTtpQS6a2WwPOJq+wu//MbUZCeEqCBonuiT2S1mAG
 0eLPhVuOtRNl7lcM6gBhUTgTmIS5RZhSGo8+UFcd/MjlOALDOkTdjqt3L0GLZ260RD6n9OxurIXBG
 Xbi6NRq4ELTud8jIahp1poyfUbf9EYExuHod4Q+vs9P9fv1qOmp6m8yD2A+r77S1SyzYBLdIODljA
 JB6UnVzGFbHthERSdQ0qbxn47QfvCaRXyRuN0DXxQl0mdZMzmJqFdy1rMJq3NqKNWkhdaS2230GHD
 o4FjHREhg==;
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsAB4-0006BZ-4c
 for linux-amlogic@lists.infradead.org; Fri, 08 Feb 2019 17:43:03 +0000
Received: by mail-pf1-x443.google.com with SMTP id n74so737278pfi.9
 for <linux-amlogic@lists.infradead.org>; Fri, 08 Feb 2019 09:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=8qlp/xAnLxAOjV4wYTNej8P4AqA27Ps7vMX0JSJoLng=;
 b=MkTQf5pY+FM2kNGLWUDj92xIebBxnlOjXVjgquZYYNsfaX3ahhiBc48k/QjE0oorjR
 +Qhx/V3+sTFwZwhEjrpwvGCPIcWnFVo+/SdNOB5wlUUURsfdSDPoW4SGHvQHGuuqTX34
 xYEGFFk2wSYsTdF6uwwHx9OAsZFo04c7O5nd6pdQUlO0FxXM7K9nFYOWhlWO8PtlrVDr
 +nM0lyIWIHYEza751xg34Ud2fGbssXO9Yh9p9PAr4xw2PEDa1FQRJ8sSGhAm2zyencT2
 QLEy8IjGtzFrobWfD3EVdGCUtEJCFejSjCzjG29Ulkv+6uNSp8Z91vjaA3lr6TNrN3Px
 olDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=8qlp/xAnLxAOjV4wYTNej8P4AqA27Ps7vMX0JSJoLng=;
 b=Mdob0iIhgeTdzI79zEyG2QPGYRonR/7w5pgRxogrMH4lZ8z93/7C3tPulrJ8ertulm
 bz2i+9mK8q7QMl8A6Qq6cKxT5EFaATQAjri4d/2rtQ9hcaOA09lDCobvaChtfeQalPLj
 RG/qLITfXCoqf2pf9dr42oWZS59RuiwqXOgllD1p84e5DDee0HAgtba40Qr9ZuhO+JXe
 HdYjqz2IbpZyIgjFpIt/7oI+BG0Rmv+w+1aclob3/XPmsrhdkd9y2xi1Z/6rOp62cNhZ
 TmfINkbogKnipDrejP5ilZB9V4/NZ2kfR3hROnXlFa73wgowouWBy+EKMwo0LItSWCra
 UARw==
X-Gm-Message-State: AHQUAubtizS9W6DNm81z6HScSo0ZBxvzyC9ffmYu9tEuxkRlM/FiUsxA
 Zk2R0cRauVfY4ypOC7lsumyrcg==
X-Google-Smtp-Source: AHgI3IbEMM+ggW03aYshu3UHusVMXPCZA+pNgaJy2Yeg2QaRHGd5A6XRwRSkf3NZE4Uho3P5QdJsxA==
X-Received: by 2002:a62:ca48:: with SMTP id n69mr17099411pfg.162.1549647778039; 
 Fri, 08 Feb 2019 09:42:58 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:551b:c3ab:6b62:8b9f])
 by smtp.googlemail.com with ESMTPSA id b26sm3844333pfe.91.2019.02.08.09.42.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 08 Feb 2019 09:42:57 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 2/2] arm64: dts: meson: g12a: add peripheral clock
 controller
In-Reply-To: <20190208101405.25699-3-jbrunet@baylibre.com>
References: <20190208101405.25699-1-jbrunet@baylibre.com>
 <20190208101405.25699-3-jbrunet@baylibre.com>
Date: Fri, 08 Feb 2019 09:42:56 -0800
Message-ID: <7hh8defa73.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_124302_185962_D553AB0E 
X-CRM114-Status: UNSURE (   5.66  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Add the peripheral clock controller to the g12a SoC DT
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Queued for v5.1 (branch: v5.1/dt64)

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
