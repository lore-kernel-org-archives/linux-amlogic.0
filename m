Return-Path: <SRS0=9eFL=AY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E23AC433EC
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 19:03:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00CE02067D
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 19:03:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d54Sv16Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wEJSeMZ/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00CE02067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A9hXpQDdZ0QmqdeblwfdXKg6S+CYxazhyVg7nB4MRZc=; b=d54Sv16YH+dmRsxmsJjpgKyEI
	63BcX5XyMiN0bRSrQwfYU6jZwksSTnzKmk49xr5UOj3UmSxQwNZcQbEqiW3CbBTmJu4l2LZHHKj3q
	zE6QhUWTygCvu0xQK/c0qkYfJSqkqXMFUx+SgmlLGwhclraAUcdUQ2z+appnCS37hMtGURa9Ld7U+
	vt5l+BwcsDm/UfQTs0Kn4UJqvxM7KtOlGhFMNm4VCL03xvrx2z+N42NcelNoDpSvbSP17eoIETKYc
	t1BbdZvJsf15cA3uqck52krRwGCMzlsrz7QTM5Xgs1bAIxRHwpNV7HB+1rRyBpWJvUnR025ra7SGz
	5LhaddTtg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jv3jr-0002vE-OW; Mon, 13 Jul 2020 19:03:43 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jv3jl-0002rO-04
 for linux-amlogic@lists.infradead.org; Mon, 13 Jul 2020 19:03:37 +0000
Received: by mail-pj1-x1044.google.com with SMTP id gc15so258038pjb.0
 for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2020 12:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yuh9r/vcKnoP4S8jfRWymeU60PiF7dA7Uo0nDY5Yimo=;
 b=wEJSeMZ/nR4O1K1ZmVe9XVOvetEoZZQw9MW1YNjeALTQXRCwAjXzL0cvq64nWSxAiv
 Que0no4WeuEAPO6SWZ+dWDqNdJ1T2f94cCJQ7n/muZhqLWymNTV9INnyumLNOCYvZ9UU
 F5DGMXddGxBHVQNz4BCHX6f2DgpkD6Ve8tsxbGNW/3vaLfDcE/98IfHUeJV/rjGRQjtf
 4b4k7dOqazt59+UBEls8u179WhkJgELPZYG2GwdsKHJ8YuCiFAJL8+2epC3wk4JTssq7
 5xMwu2OMrofrRMZdOLSEmy6zFE/GJAyGv1OKSN6vwWKxZGy0Aq2xbc8rJ24FMg4KO45J
 nLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yuh9r/vcKnoP4S8jfRWymeU60PiF7dA7Uo0nDY5Yimo=;
 b=oemOvbYk84F3RI4sjFo3Aau6RlGNPPhoT4ZvFuRZGCLuCxTQ54oYNm38g3LJpAKdb8
 vR8xxCUkUw8Zz/1lpewp1zMw4qlRlQtqHwy+Jj7tOYdrWBwAXsr3oR30VUMaWYL0kt+d
 rgg3Fvn+6bghGi0z7qow4WGUxkBgFIfdR4XDDw7UsmFKvLnzTG6R7RlfXuFeMjdwvpoW
 EyZ+YpMXvzeFLkKJki1PnqcGGaSGXeptSX+jxzi/UvACTMstXSHh3tZBDs01lOvgiw2o
 Jo4B4zKbA//L6IizlnlMIfte859Dy+CI8hbLy5amFMT9xA+Hsrlxx7SFP8LgmPX2qJWr
 esGw==
X-Gm-Message-State: AOAM533om9BigsznTNLjl3OBGuh/MD6lFWFadkQr0+Anc4E4RUAGQT5H
 buBCj9zKYr6BYv0ZEknqFG8Rx4gSC6DutA==
X-Google-Smtp-Source: ABdhPJxD+16ysBInyxc4PodHD/kcp1NFQSeNXqDpN/mFByIa6Gtuci4hSt90tC/fPtjLrzKIVb2cTA==
X-Received: by 2002:a17:90a:1a83:: with SMTP id
 p3mr753530pjp.113.1594667014734; 
 Mon, 13 Jul 2020 12:03:34 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id d37sm14020809pgd.18.2020.07.13.12.03.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 12:03:34 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 0/3] ARM: dts: wire up the power domains on Meson8/8b/8m2
Date: Mon, 13 Jul 2020 12:03:30 -0700
Message-Id: <159466696385.22745.1661245266792495941.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200620161010.23171-1-martin.blumenstingl@googlemail.com>
References: <20200620161010.23171-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_150337_111218_0DE00935 
X-CRM114-Status: GOOD (  10.22  )
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
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, 20 Jun 2020 18:10:07 +0200, Martin Blumenstingl wrote:
> Now that the meson-ee-pwrc driver has gained support for the power
> domains on Meson8/Meson8b/Meson8m2 we can add it to the corresponding
> .dtsi files.
> 
> So far this doesn't fix (or break) anything for me (probably because all
> vendor u-boots are enabling the Ethernet power domains unconditionally).
> But at least it's one preparation step which is needed for video output
> in the future.
> 
> [...]

Applied, thanks!

[1/3] ARM: dts: meson8: add power domain controller
      commit: aecc72b14d11327804f7ca1fc76ca88a22cc1136
[2/3] ARM: dts: meson8m2: add resets for the power domain controller
      commit: c5d3d3cf00d5ed74359e71f7b5d003cf34ba014c
[3/3] ARM: dts: meson8b: add power domain controller
      commit: 9960cacbaeb1ccc1b2d9840cadb18844d48a337b

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
