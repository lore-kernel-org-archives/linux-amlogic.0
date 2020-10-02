Return-Path: <SRS0=twEQ=DJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 593B9C4363D
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 18:29:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE48D20758
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Oct 2020 18:29:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FkQZXXvR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="csQSw6MR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE48D20758
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pWEHsMGdiB4NaWLM1o+ZzGDOeZxGWTsHP6Yf2RxqQYQ=; b=FkQZXXvRRBtJ8QbZAfUAm6puS
	9HEOqBxluAkX5R2yUaDleMn9/UEz1aweqfSYr3IcE5sgAC8kCLMUUSGcPJ7NmopB+1HeV6A5TTCXe
	HWQHyY5c+N4MCKl6uEQijuCk+49CTwgWhslQSFNqfBtSAEpkK/3DR35vHCFFj1JxKjvXWPEuhqZmN
	vijW6hsg8hsEbGNK3FAZTFc85Q3DklhoiU20RMtpgRngyMLoFJzTjHJm0MOrmewy4fc9FqHmcf2xK
	MyU/EW01v0iJe4WhQ2KAt239PN7fiyGYaI3KrPgFXsAP46uvIpimt9iNWCTV/ItUUzM5yM8fPVd5U
	OG4YdR/6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOPoK-0002ap-Oz; Fri, 02 Oct 2020 18:29:40 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOPoH-0002ZS-5T
 for linux-amlogic@lists.infradead.org; Fri, 02 Oct 2020 18:29:38 +0000
Received: by mail-pg1-x52f.google.com with SMTP id q18so1328731pgk.7
 for <linux-amlogic@lists.infradead.org>; Fri, 02 Oct 2020 11:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=sfHqLZf2nv9SkEaSma+fmeDrDPHstMI9otrw857K/6g=;
 b=csQSw6MRVPHQeqxqB/KwBhjwUrG0QqBbH8d8WC5gdVk08R4lh/91tBrbrelyQrc2E6
 VJsnSVuzqiCc6Ow+ETOxkvMp7ltI4ruJ6gV0XcwyyDubiBajsUpfFDnBAAss4H3Lh2xk
 3YIiFFRjS4YqwgpoReBprCdkYRfUsVrH2FoFfHOrxbFNq9g9Av6an55aQVt85GJDBQR+
 VLMn6rS8xKo0++sVDwiCytVsmyjAUH1zY0sKUJBSxeARERKZlHDk+kYJFKvgeT1Y5lKK
 P6kTe+10uzqyItQUY6OTL56PKGBuMasoAQzRkHlrl1kr8Tuej3+5HhIFqUbPZnFpWZXV
 KgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=sfHqLZf2nv9SkEaSma+fmeDrDPHstMI9otrw857K/6g=;
 b=fPaGwG2wIxNyMmN66tYSsdfEhCNSLY1kiZ+L9L8yK00Bo5pgt/JHBRXDqKgIU/KVyf
 64+BEp2S8IG2fvggsIQPSFCEAYHFofbj+m4efL1roc2vOC4tkvoj9kQV921tL3mNWvxd
 3P+0/DXeS8QUb2DXfUB+yGupNJ/CE93efJ/fyX47arzqYI4Tdr2Tg1QoHG0GyVvoBlXd
 6tv5ILu/8KsCw8Dd1vuzPIhcRksYaN36ncQ+HtRt5BZLcHePbm0pfHaiTvuMNd0MkzVE
 qColeCWmyIuDgrMAQuDs30S7GUmS/IpmwKGJOvHFTxpGhLME0MGJrYZDHYZxkcYBNkuv
 XXjA==
X-Gm-Message-State: AOAM533E4W+cyDOMTS/zrJM7dV1zACj+1O6vh/VniiiP4DjgLDuBcd4e
 3Rps1kRY+EOdJPT5USZDyu3IcQ==
X-Google-Smtp-Source: ABdhPJxgJ98K+Rw0bnjUuIFWMdd7exfZq0mIY+TYb59j5UER1wmonXlgj69iPqZXPcg0D0fi70RzSg==
X-Received: by 2002:a63:4854:: with SMTP id x20mr3555150pgk.220.1601663374957; 
 Fri, 02 Oct 2020 11:29:34 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id m13sm2497574pfk.103.2020.10.02.11.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 11:29:34 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH RESEND v1] ARM: dts: meson8: remove two invalid interrupt
 lines from the GPU node
In-Reply-To: <CAFBinCCrbVzK8A0s-=Q++n4yUFO6+Wm_Ayh_vdxkATJh7oSx1A@mail.gmail.com>
References: <20200815181957.408649-1-martin.blumenstingl@googlemail.com>
 <159830380185.24712.3464811968459073992.b4-ty@baylibre.com>
 <CAFBinCCrbVzK8A0s-=Q++n4yUFO6+Wm_Ayh_vdxkATJh7oSx1A@mail.gmail.com>
Date: Fri, 02 Oct 2020 11:29:33 -0700
Message-ID: <7hlfgomqgi.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_142937_232615_0D5F8963 
X-CRM114-Status: GOOD (  11.35  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Graichen <thomas.graichen@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Hi Kevin,
>
> On Mon, Aug 24, 2020 at 11:16 PM Kevin Hilman <khilman@baylibre.com> wrote:
> [...]
>> Applied, thanks!
>>
>> [1/1] ARM: dts: meson8: remove two invalid interrupt lines from the GPU node
>>       commit: b468412409c0e5752ad3396b147cac563ff8dd3b
> this one still seems to be sitting in the v5.9/fixes branch
> I don't see a reason to rush this, so can you please queue it up for
> v5.10/fixes?

Yes, sorry this one slipped through the cracks.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
