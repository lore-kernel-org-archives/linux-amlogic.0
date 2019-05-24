Return-Path: <SRS0=5BKV=TY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B4A6C072B5
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 May 2019 19:53:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 411FD217D7
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 May 2019 19:53:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E87gFyIV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="EPJpKkUk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 411FD217D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=491peczP3+wndET2Y+BRzInxn1MalzOfWEsv3qqbBZA=; b=E87gFyIVbp5Lbj
	eQ+aGShg1oQhbrtK/4iDr2M5T0IzfzZPN/eFOvLXn2LyAhOmnawZRuax5Hy0g5L1tj0oiWoi7X01y
	y+5a7kkVoGM4ACzbWoD2U3gEmeSR0BVCKT4rKYJU0d4951NCRbmfs/pR96BhGtSQDiY1nAke8Qoc2
	/u5WTjsdhanKUwJCTG7eBoKL4dR9LPiOgqWVTMkVLwqqHCtZYfBuzfbfxU3/TkEhHqBMMU27Z4QFq
	dtiuoPGv/C+XmKBb/2Y52QRNNKnFanAyNRTRF3zFgFl/LXxBIMy+OIeke0kX7GmmBuiB7K6OycEi1
	1QNnZVlqG2yAnJz7JUcg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUGFc-0003S8-3z; Fri, 24 May 2019 19:53:12 +0000
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUGFZ-0003RQ-G8; Fri, 24 May 2019 19:53:10 +0000
Received: by mail-oi1-x242.google.com with SMTP id y10so7900857oia.8;
 Fri, 24 May 2019 12:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/KUgll3hSEj/FU/ezNNzycl4J+PKbwr5l6FIma0m5Sk=;
 b=EPJpKkUkNZi0HQkddOgj0vcBeOyYhQyV2IWdV8FvZv/s5rSSbzfQectenhyOnmrAku
 aFgH24HdcfZnEJnXLoxqxbVDLIUtW7cNpqpwB9dXhhNX52eXylf1KC//2Zj8k5P3G8Ne
 1R0QUwMuSLKCSmH8v07lXlQ9j/bPUJA6kDVIp5rvMRoZDVJRGIN8wmM/j0YTcdWdtp9l
 FY91Y1A43POToBpe2cV+Ypwu4WMSbYsH2vPEfSxMGdrYc9oCxqzZycJnZGfCBU1gI0fq
 KU8no2evP/2L48FC2NVKqx8YpbRsnneHZXwKJZ9kCnk3yX6O4jw6HZmsEC/jIT2WZkya
 OuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/KUgll3hSEj/FU/ezNNzycl4J+PKbwr5l6FIma0m5Sk=;
 b=dgqKrF+3jcFLUoRnT9pJ2KWadQnN1iDxdl1DlVTHHKVHUKW6c6WonDzUJuj8RxdxxB
 gjPSt1gLMCbI5+OLwsIWR5QTzQR+gHsXAHO8G6HAuqaD7j6ySHzWisgE+PPoLG4TRIPe
 odulwKVzduz8Kncfwp+YhlZAzwfGQ3EVPCh6FGClSFCSWUA70XHX+cU1F/mhk2IB8iJ4
 CGpWP83z1QQHF7gvduI1DJLkd4TBB77hC7PK6eVBiaZMK/x6YJF3fP5KmZXGCiYEJ7kI
 5XRUChEGaziG2o8bgU07daxfNUv1KaUEz/0Uvbq5ZifT//x4f2OXg3Mbp6zYEmppMK//
 5yww==
X-Gm-Message-State: APjAAAX7VFYcVih7JYsYvwaYpVH0wyNpMcQXh2joSo/USyojBwYPZjxQ
 vWGA8GTXxgVzGBKJ7KKLY7w335qb429vdF50qwI=
X-Google-Smtp-Source: APXvYqw9p122eNIr2+xbjUdUHyP6yQjFHu1ATd8aLdpOKuGyZ6p25J+SPof/YcZhERZnyWKHwjzNawD0xZ3t6obdee8=
X-Received: by 2002:aca:ab04:: with SMTP id u4mr830724oie.15.1558727588184;
 Fri, 24 May 2019 12:53:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190524181936.29470-1-martin.blumenstingl@googlemail.com>
 <7hblzr1vxm.fsf@baylibre.com>
In-Reply-To: <7hblzr1vxm.fsf@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 24 May 2019 21:52:57 +0200
Message-ID: <CAFBinCAueC3EKQXg-o5ennbPmfQC17+z8YKQ3TXwvxq1m9HtNw@mail.gmail.com>
Subject: Re: [PATCH 0/1] ARM: meson8b-mxq: better support for the TRONFY MXQ
To: Kevin Hilman <khilman@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190524_125309_562409_992BB11A 
X-CRM114-Status: GOOD (  12.07  )
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
Cc: linux-amlogic@lists.infradead.org, hexdump0815@googlemail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, May 24, 2019 at 9:42 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:
>
> > A while ago a user asked on #linux-amlogic about the state of the
> > TRONFY MXQ in mainline. I did some research (mainly downloading an
> > Android firmware image for that device and looking at the .dtb) and
> > updated the mainline .dts accordingly.
> >
> > I kept this patch in my tree but didn't hear back from anyone with one
> > of these boards (who could actually test my patch). That was until
> > today where I got the following message on IRC:
> >   any plans to submit your latest own version of the meson8b mxq dtb
> >   to mainline? it works really well for me and the one in mainline is
> >   too simple to be usedful ...
>
> Any chance of getting a Tested-by: from that IRC user on the patch?
I CC'ed hexdump0815 so I'm hoping that he can send a Tested-by (he
left IRC before I could reply to him)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
