Return-Path: <SRS0=mf6+=ZN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A24C432C0
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Nov 2019 19:37:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB65D20672
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Nov 2019 19:37:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kYfRJLTl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="iI8Elo/j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB65D20672
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BuHDhlVcHUgDXmClJ79M1arIcEidGh1b5yRQrnK1In8=; b=kYfRJLTly8wyBb
	VigoJpGWsbt9rGIBbcZwtrxZOEL6jO0TNJbYTpw0P79InbuoSlWVRSrZ+B9apvYgV2jHCbSURXc2p
	oEGfKKHrNuKi7Ovxb9QAJP2FTl1EQlK96ISp+LZSsbadSnQxP4QTjXhcNXH4c3TeS+QNli+t8pW6X
	UP7hgB+moCcoHfQxSFc2vvv4vujy2w+wTE3OYKuHk9xZwsiF1yu1LzHEWOrSD3fEBLnxsu5k/EenK
	iJ+kJIPLSYBiZFbzkvSVb2GhDvQnct4vSRSl9pG63Vn7/6/MzpIadh8uXNkCY3vazvZjYdH8NveHr
	cQoRwdAbxaWevyLhXkGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXsGZ-0001Xn-4R; Thu, 21 Nov 2019 19:37:23 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXsGU-0001XG-Pv; Thu, 21 Nov 2019 19:37:21 +0000
Received: by mail-oi1-x242.google.com with SMTP id e9so4287747oif.8;
 Thu, 21 Nov 2019 11:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qzwKa2zLIpMlDKu3Bp5xTkJZYB2ESwxtfDs5w5UuCFY=;
 b=iI8Elo/jZ8WYOqSvkTjrgV15kGRYIBLerzEtZUD42YZLEynkprwzj++GJKEZFAL7Qc
 dtXEBeHqDd5KPgAqJer+FyfpRrrrNgwmeTVY4mG3iFrE+AWuEb8et/8JwuaBcoyuEMk1
 /72DOvZoNmBTWa2xYf6rVH05JdXfj+CauFalky5oCwaayqdYbrO43q105SyqS0XJn1fe
 gf3cc4X9qekTMPlY5U+8TAUJBDewYmc//kqseAw05ZoQPXcwWWuTpOHNlgqDaYbH1JjO
 82t3EOom4/aqqBphcLpn2pqkRs4n7vYSUL7bckzhm9YPpaWHo5eyfp6GDGTgfsTTo4SU
 EZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qzwKa2zLIpMlDKu3Bp5xTkJZYB2ESwxtfDs5w5UuCFY=;
 b=gidQ33d8qxIcTpReUFASTaOXqOT3dJNWu3hN6E5YV4YGmY6nc2/O3Vm21M9Xx7RlZB
 BW4ZbaC9kg80eUOoUrUglb5vCnfLaX9AHj1CvL6/hxcGwUVRfxvSDGmVbKU/ammPriPP
 ZudEBFp3idfcmtDtp/d/6XbLIuLgj32vk+fSTabGzrTtr8s7SGYUZoid8YfaBcPfdqoK
 zKjGIgbjskZvch58k+aLcl8ph/0UFX6rmHgZI01P3PcXTa+EZYZ413wqfwipVqdxkG8t
 +voVmnceDXWnEPq+1PA2Kw/gLNyg0roFDWeOiktVHKmwVEIugz/37i2QS2KjTgFnP2rV
 xYAg==
X-Gm-Message-State: APjAAAWdVZyt3jfp236nSHnQI560vpEAXMf1LzB57o2vQJfQhRBPBi0y
 LIacJc7qkfw4PIOQW10d/VBczmMX7QvID5b8YP0=
X-Google-Smtp-Source: APXvYqzXgwqaDQZUKygaOcWTNp0jm2ToJqajtKYV4YnKaQGWRhZqCLBQ4dy0JtuVjiCNBfPeJsLY7sIOQFZNuK38Fto=
X-Received: by 2002:aca:110f:: with SMTP id 15mr9323792oir.47.1574365037293;
 Thu, 21 Nov 2019 11:37:17 -0800 (PST)
MIME-Version: 1.0
References: <20191121183711.19785-1-khilman@kernel.org>
In-Reply-To: <20191121183711.19785-1-khilman@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 21 Nov 2019 20:37:06 +0100
Message-ID: <CAFBinCDYbHW-7XOo1O1M-ghNj-7R+A4j6Y1skenuz6-TG8e9wQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: meson-sm1-sei610: gpio-keys: switch to
 IRQs
To: Kevin Hilman <khilman@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_113718_841719_9E021749 
X-CRM114-Status: UNSURE (   8.42  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?B?SsOpcsO0bWUgQnJ1bmV0?= <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Nov 21, 2019 at 7:37 PM Kevin Hilman <khilman@kernel.org> wrote:
>
> From: Kevin Hilman <khilman@baylibre.com>
>
> Switch the GPIO buttons/switches to use interrupts instead of polling.
> While at it, add the mic mute switch and the power button.
>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
(I don't have the schematics of the board so I have to assume that the
GPIOs are the right ones - based on that)
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
