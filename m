Return-Path: <SRS0=eCnW=ET=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BEA5C388F7
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2020 15:13:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5669220A8B
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2020 15:13:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YjcjIovc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FBvYqur0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5669220A8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tzuKfaWl4XxTaLuyJZaZJM6L4JnAUbobJcUXKkwmOO4=; b=YjcjIovcTSpeOnGN+U65uh8Cb
	I9ZLxoJAjRTsO1kb805pVUjzhrkWPb4xde3exTxukBF08st1Q64SbHrdAvg3z4VnhYYX1d12hngnE
	2ragMPao6dXiXzIhp2Oi5q11pAdIJuVJoN0CktMf6zAYc+/rr3Ao0OqIdYwpJSHNhqn2KP1cAs/ox
	WRoiNdU4wC8Zs7Jb3A6UrLP+mhvchcArh932kHRaSlvEpMld+5QYs2jgF8muBUaPkpvHRrkPUgUXc
	JlXehn3vDQzb1EIO9qTPbfYa5j1ZKl2Rl5xOUiIAPs1BEu7Kde7OYBR1/gYrNCHznayFQ1fOBB33e
	hGm5BnGbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdalf-0000ME-7E; Fri, 13 Nov 2020 15:13:39 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdala-0000Jx-R1
 for linux-amlogic@lists.infradead.org; Fri, 13 Nov 2020 15:13:38 +0000
Received: by mail-wr1-x443.google.com with SMTP id r17so10315961wrw.1
 for <linux-amlogic@lists.infradead.org>; Fri, 13 Nov 2020 07:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=g2eWYS/TuIBg2trIPFi3kCqzhwEAZYnEwoucxK7S/uM=;
 b=FBvYqur0Qp9aKH4Savqs1DxgrKDoYMnR8YWxDPAVxtuXYCqgWdpzIWhWu/JwsCt0EE
 beqnmgnC2p8nLAoRTgy3jaFQ7Ffu9zPIx+qyJTmgHy/TbMRRunssqjjYWp1L+hF1GbBP
 smn55I2OgBZ8S6VUw6LunUkpQ40IXDnz4dNz5QYSR64PN/OwxCXh3A0ArU1KN8yoU5gM
 ffxa5co8uGs3dcOR0LmIr0syzogK4JhoGAqiPwGO7IZPzVnKg7jYnk2wr3U4aA+W8rbC
 7wBCheQRpyaL7YYAxgsVz9kDS5oTndz9WoEXfW64zphyNmpiUhCw6UEnyKT0LkuWYs5l
 VipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=g2eWYS/TuIBg2trIPFi3kCqzhwEAZYnEwoucxK7S/uM=;
 b=ntXh+TORi8Ug3AHcXMao4sQTzVEu3u5dhMe1Qt6SsVjv2Py9flulNUruhudVohJuYO
 GKIeta1ANw/+uwKxjrcsPk1p+59I93Dh/5MgcAR/ZqmAmqjpkhe11VnazijCwdYXeAYy
 pLv/LF51ZQ4SG8Zaf/dhaHRp/776gEEIUg0EJ8koB2GbbEqPjXbG0rsmHAwcYjT2AX2y
 dH2/WJUqTiIA/YdbFwvAhtCPrJRJOgumDs7iiq8EwODiSN3F/3c5EdchKnGwoTU0Nvxr
 1xK8tdtFUrTYyT33l0Ex92WHzL2Bkgoabhh515jBbsQhekvDZM4nAnLyYtpTP6oY+lC8
 bNCQ==
X-Gm-Message-State: AOAM5335E5BjIjSDZhesv3X04oZxzw+POuyWRBi+yUCTkl8KMt1GZPB4
 Bpl44XMWQD+HcmSMF4G2rjfXBw==
X-Google-Smtp-Source: ABdhPJwd+fiAbK8NZOBUneQcMTjdFObaHBrUXLOnyyZOiG6lbkh9XW68EclIsNXhMD8e3AYxJpBepw==
X-Received: by 2002:a5d:5048:: with SMTP id h8mr4074266wrt.135.1605280411764; 
 Fri, 13 Nov 2020 07:13:31 -0800 (PST)
Received: from localhost (253.35.17.109.rev.sfr.net. [109.17.35.253])
 by smtp.gmail.com with ESMTPSA id i6sm10790839wma.42.2020.11.13.07.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 07:13:31 -0800 (PST)
References: <20201112230043.28987-1-aouledameur@baylibre.com>
 <0f679c62aa48603ea43a8fa4819d688baa802d73.camel@pengutronix.de>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Amjad Ouled-Ameur
 <aouledameur@baylibre.com>
Subject: Re: [PATCH v2] reset: make shared pulsed reset controls re-triggerable
In-reply-to: <0f679c62aa48603ea43a8fa4819d688baa802d73.camel@pengutronix.de>
Message-ID: <1jima91e92.fsf@starbuckisacylon.baylibre.com>
Date: Fri, 13 Nov 2020 16:13:29 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_101335_062034_5952ED50 
X-CRM114-Status: GOOD (  14.24  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jim Quinlan <james.quinlan@broadcom.com>, Kevin
 Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Fri 13 Nov 2020 at 16:04, Philipp Zabel <p.zabel@pengutronix.de> wrote:

> On Fri, 2020-11-13 at 00:00 +0100, Amjad Ouled-Ameur wrote:
>> The current reset framework API does not allow to release what is done by
>> reset_control_reset(), IOW decrement triggered_count. Add the new
>> reset_control_rearm() call to do so.
>> 
>> When reset_control_reset() has been called once, the counter
>> triggered_count, in the reset framework, is incremented i.e the resource
>> under the reset is in-use and the reset should not be done again.
>> reset_control_rearm() would be the way to state that the resource is
>> no longer used and, that from the caller's perspective, the reset can be
>> fired again if necessary.
>> 
>> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
>> Reported-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>> Change since v1: [0]
>> * Renamed the new call from reset_control_(array_)resettable to 
>> reset_control_(array_)rearm
>> * Open-coded reset_control_array_rearm to check for errors before
>> decrementing triggered_count because we cannot roll back in case an
>> error occurs while decrementing one of the rstc.
>> * Reworded the new call's description.
>
> Thank you, applied to reset/next.

Hi Philipp,

Would it be possible to get an immutable branch/tag with this ?
It would allow to move forward on the USB side, without waiting for the
next rc1.

Thx
Jerome

>
> regards
> Philipp

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
