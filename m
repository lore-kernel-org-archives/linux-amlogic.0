Return-Path: <SRS0=v0PX=OO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33378C04EB9
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Dec 2018 17:10:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03E8C2082B
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Dec 2018 17:10:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rvY8HLSz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gbbeTV77"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03E8C2082B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uTpE0EUBeFTZ5VOc1BedIhF/HVckzsmTHXD4yRxTjvY=; b=rvY8HLSzuc8YZk
	d/Td4/gcMyIs0CVy/oLhQcVNUvJMAouEOeTFpn6s52Mb94Op+bpg31jb6lHyJwyqzylFi2gsOnvHA
	h6Dwvr5QYHXF2DOiWglWi7BjHKqPV0VOYCp/rSFc109iHzz6+EXcWpcAgVEHqwjX7f3kVKPtZ7225
	lDIvoQ65+57oNUFTqIv1vktEFVedp0xAMBYQY2+Ek/JNq2bldlaR8OqkGk0wpcu2VuH1Vvsto5aXZ
	Othk7QtyxbWb7EcsL7vkZQucj8L+EymI/eLJJcc+slET2hyV1UaA/A2FxqTomqmLjjxICcghctxW8
	AuXDW8G7oFH7ntvVHlNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUagS-0005Pz-Os; Wed, 05 Dec 2018 17:10:00 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUagH-0005Gg-9I
 for linux-amlogic@lists.infradead.org; Wed, 05 Dec 2018 17:09:50 +0000
Received: by mail-pf1-x442.google.com with SMTP id c72so10312972pfc.6
 for <linux-amlogic@lists.infradead.org>; Wed, 05 Dec 2018 09:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=HdIHSdWTFt3eFj0/ZApUX56Z/3w9BZvgVJif9koRvLU=;
 b=gbbeTV77bR8vlqTWidilXQWi8XbeNdlyu2q25sNUROsjU9SjbY5WLX3txSRKWNB0Of
 v9wMrYZ5n3SBnNFMyNGvNq9ZykeuVc5S/YH95WwhJIFUCMthu0Nsn3PP0NXH9Oicdu3x
 jB6J5Dn88X+qaU/GHOVa9Pe6M52H1BNIjDTeU1/oB40Iq5/iv6WYNZzqOSlBYhzm1FSA
 4CsyaaQs9VH0gXkZCHpKK7PZliKZWVhQYP0lK0iLuM9UYkvVgC0srELd0Okbu9gQ4pun
 McpOtt5TDHl5nBZtSUxXVZ+XNQAJIohb8ANfxA3neVEhrXAnDTQaHBp+lWgmwhqoNtuK
 eKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=HdIHSdWTFt3eFj0/ZApUX56Z/3w9BZvgVJif9koRvLU=;
 b=ks6G2vyS8vjJEHN6mQtP0a5laXzXSjJLeEEo0EEk+OLCeljodnFGkS0tg711Flxnzd
 PFPNRBAWP4tsmXDjyEBGiNMOjRkAc2eCcnnF364PRxnachyW4RAWxxdDRSVXaT32E62k
 3wQUQvSmQEhUoJxSihk6l/qSObCAYHEwYHWMZSD278MFqamlFzNBQY/d8G2yt1AQVYME
 d1wEjNQGVX4e5CEgMsx+Cql2w4UOG8Jdk3LoAYUIK3GfZMREBElUFVMSWoB+A4+/+gP7
 bbp1juudw267z9RDzWk9FcD3oB8qFd2JrhfxxghKUo/XC8P9cXfhAAROAHrWeUuMU1fN
 sNwQ==
X-Gm-Message-State: AA+aEWY9nZld1y+f1wyapC1qAmTAr2t2xgOBLnspd4xAGbGviklLWwPp
 39BMcEvzY6yIzwhSgW2koWVJ2A==
X-Google-Smtp-Source: AFSGD/X4KxgWev8Fizi5DfhHXkb0/69KlU2n3jL6Kx3FRQbWGoavWFE+cylRIe01+aDhxMu59eqmCQ==
X-Received: by 2002:a63:f201:: with SMTP id v1mr19764096pgh.232.1544029778103; 
 Wed, 05 Dec 2018 09:09:38 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.googlemail.com with ESMTPSA id
 d80sm71295445pfm.146.2018.12.05.09.09.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Dec 2018 09:09:37 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Carlo Caione <ccaione@baylibre.com>,
 robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: meson-axg: Enable GPIO interrupt controller
In-Reply-To: <809e8f9945d55cb8b9583f0a50f502c6922b35fe.camel@baylibre.com>
References: <20181201164301.17274-1-ccaione@baylibre.com>
 <809e8f9945d55cb8b9583f0a50f502c6922b35fe.camel@baylibre.com>
Date: Wed, 05 Dec 2018 09:09:36 -0800
Message-ID: <7hh8frlx2n.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181205_090949_381213_30D65376 
X-CRM114-Status: UNSURE (   6.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> On Sat, 2018-12-01 at 16:43 +0000, Carlo Caione wrote:
>> Enable the GPIO interrupt controller for the AXG SoCs.
>> 
>> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
>
> Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
> Tested-by: Jerome Brunet <jbrunet@baylibre.com>

Queued for v4.21 with Jerome's tags (branch: v4.21/dt64)

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
