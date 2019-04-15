Return-Path: <SRS0=/mSf=SR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6159C282DA
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Apr 2019 22:22:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A269620854
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Apr 2019 22:22:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sn8T17X0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ktgJc5kt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A269620854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qvtu47MC9Y7drmh8VTW/cXwfV88Y/YrHagsQ7cv3JlE=; b=Sn8T17X0Jro6yz
	fPtR+wxFQUb4ysAffULmYEwv2r5utYC20Zf1tdWsrKwBdLFVL28ONCyuMdmELWhG6OCTnd3MM+oSx
	gq8wLzCBZgLTjdRDKuJReAhWO1Ht8O/8OsIOJj/B6mH6XK96stWY4xErLDyk+EnmSq/TZvhUd7Djg
	QApKrkdUDgbEDALMWNLlScUATnsn64/YnsLADW/+zdn4+9SDOUvBWHRBIOTHvDTCMu4Ijgv2epR6c
	CoGO0dFUGKojdlJ9CSPSv46acKv1Z/1FkSBskXA0nyF14KnH5V7unA/Eo1SODfs6VbcdOQVyJLV2d
	cFwDHdaaAfYzcZYkKWVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hG9zV-0007hz-Ie; Mon, 15 Apr 2019 22:22:17 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hG9zN-0007b4-JP
 for linux-amlogic@lists.infradead.org; Mon, 15 Apr 2019 22:22:11 +0000
Received: by mail-pl1-x642.google.com with SMTP id cv12so9280148plb.9
 for <linux-amlogic@lists.infradead.org>; Mon, 15 Apr 2019 15:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=lptdN09AWw8dqNZlD1qBwSSlbgj7fwHxdKofOcd3HoA=;
 b=ktgJc5ktdUWFh+RXzUm3uAD2p0pZ7YvBmn8+INN0V/yPjPTLgukY0JCxi0O2IHt9aE
 xygetAonU1mVcAYctyiGDPNY1U/NutMYzxap7XXc3WCK+W/lAgBL50Qj4ZiIQpgkh60f
 /Q/Bi0E7bHQQ5MTMrryk9X2JxI0W6WAKoiflMA6JSQ2KXROZU68RffwtQiFphPscPGtP
 MA5UXX49z8+CUwkRhlUF+txMUN0zIfN8D7RumqEZm326KZRt6HIQ0N4T53trNaVY6hFM
 ItcFLJy2iAtD2q+r5QjszjVttq+ZjOUqD/xAkjoA75K+6nuNRIq8b9DvmPcKC8V+2YAi
 6DvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=lptdN09AWw8dqNZlD1qBwSSlbgj7fwHxdKofOcd3HoA=;
 b=miNYFgeiOonP2PE1mtWXAfM0i6jc/vsPSE9zKJiR/H/Dh4ItBymtDcck+vRi3AH2W0
 A9EiMMYjg2lYCWv0zc4shCWw4sa8D4q153VryqcYQzgurrrNncQtvDtyREONjdyq9NRY
 aVwG/VSi85C0Eh3c3GYgcZCo6Opoj2oQkx7kfMqa7C5+G+t1oGilWs5CCjpVCvRcXrAM
 CLkRsTxLYf825lqQmXhVoHPj15pbRSnLqDmn5VStcD1wi9BzYYoRaPxNyHBhiCKGSM3F
 ySW8kn53AnUNBa6x/Yhqx9ba1iY3M9KjSs+wvw5fWA8Zjed2N8qMIuRaeefcJ3fwx9xc
 sNhw==
X-Gm-Message-State: APjAAAWMKHP+WYrC1oL5f1/fjAmSGtCfSWtU/ElhI+nSicalRfq79Yt5
 Tfzcls+tE58lCvJov193MTJ+sr5RxMs=
X-Google-Smtp-Source: APXvYqwfyYWiUTTXxdFaINioxbue02XqHvTyGmZQgmfWUuefcgJfNNTp5gxkt4ieJZ3H12wkQMDn5w==
X-Received: by 2002:a17:902:1003:: with SMTP id
 b3mr76226418pla.306.1555366928363; 
 Mon, 15 Apr 2019 15:22:08 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:c45e:7ed8:c242:3563])
 by smtp.googlemail.com with ESMTPSA id 128sm38039859pgb.47.2019.04.15.15.22.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 15 Apr 2019 15:22:07 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/3] dt-bindings: meson: Add G12A display bindings
In-Reply-To: <5c7c873c-0535-0342-26b5-6cb29df9859b@baylibre.com>
References: <20190313141030.5958-1-narmstrong@baylibre.com>
 <5c7c873c-0535-0342-26b5-6cb29df9859b@baylibre.com>
Date: Mon, 15 Apr 2019 15:22:06 -0700
Message-ID: <7hmukqrjsh.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_152209_643836_666DBFA9 
X-CRM114-Status: GOOD (  10.88  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> On 13/03/2019 15:10, Neil Armstrong wrote:
>> This patchset adds the G12A specific bindings for the Display VPU
>> and VPU Power Control.
>> 
>> The Amlogic Meson G12A Display module is based on the Meson GXM SoC
>> with an updated Plane Blender, thus VPU architecture and interconnect
>> is the same.
>> 
>> Implementation then DT nodes will come in a further patchsets.
>> 
>> Neil Armstrong (3):
>>   dt-bindings: display: amlogic,meson-vpu: Add G12A compatible and ports
>>   dt-bindings: display: amlogic,meson-dw-hdmi: Add G12A compatible and
>>     ports
>>   dt-bindings: power: amlogic,meson-gx-pwrc: Add G12A compatible
>> 
>>  .../devicetree/bindings/display/amlogic,meson-dw-hdmi.txt     | 4 ++++
>>  .../devicetree/bindings/display/amlogic,meson-vpu.txt         | 4 ++++
>>  .../devicetree/bindings/power/amlogic,meson-gx-pwrc.txt       | 4 +++-
>>  3 files changed, 11 insertions(+), 1 deletion(-)
>> 
>
> Kevin,
>
> I applied Patches 1 & 2 to drm-misc-next, can you take Patch 3 along :

Queued for v5.2,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
