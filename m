Return-Path: <SRS0=I14R=SN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A2FC10F14
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 15:26:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D3882184B
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 15:26:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zi6TuFoh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nextdayvideo-com.20150623.gappssmtp.com header.i=@nextdayvideo-com.20150623.gappssmtp.com header.b="trGg6798"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D3882184B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nextdayvideo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OvRHAN533xuEDoWZO0nFapnWo9GB4D6KWjlyDJkTGCk=; b=Zi6TuFohnQYd68afphoX54qjLi
	hRLouySQljgODQilD6mUL/ANewM1AMvXtPgcRud8cooa6FNpoAX6uetNj5+ccQDiVjlMzYkfUjf49
	OPKXERo2K+ifkqPmQ0PNI39NVBejoT7lO7b0GYg4BLc0QcjhYtdLVH+H/DZMe8nCANHvtPpKxzp85
	7z5yIcwngO6ajcvpbIhhT27aekjTEBsordSJv1u2335RtfcewbZ4Gmpt12Kr5DgF8l9tKM+5pDPv9
	73IIMc2iPP4iDPMRAf5tAiwQKxz8dunXIvRWUeFzOJm4c85pnH2LYWQQEORJp3PrAzgT6QM+/pNEf
	sKz87bKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEbal-0001ni-H7; Thu, 11 Apr 2019 15:26:19 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEbai-0001mk-Ev
 for linux-amlogic@lists.infradead.org; Thu, 11 Apr 2019 15:26:18 +0000
Received: by mail-lj1-x22a.google.com with SMTP id h16so5896099ljg.11
 for <linux-amlogic@lists.infradead.org>; Thu, 11 Apr 2019 08:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nextdayvideo-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=HbnImI/6jmkA1nEq2/FJVlnNBLTjau6kVBCsh7sJ8P4=;
 b=trGg6798TFub8R3kROwwI35jhg2MTgJMxznI3//6bRsFfe+UjttFOQDtOgVztgZSdj
 vXJ2oDGqcbEQk0KUlrlaYuUfDsT08Un7ms+pSVsO2GwLl+EKUicKenIjmRNLkH+9BZYt
 LVqrvFdH2amGnts4OxfcmlVrWVT/rXKffUY+puDzR+cKQUbmzx1xioNQY8NgCGY20XZJ
 AgdIBzPWRSrOrGkBriJ3ZwBL44sQ7KBZdCQvGGvfEm7glJPEzNUSLMgQ7rmIXNDS4Qx0
 z/voOTceQBlyl6SlmIPq1jTgjcL6LZ1kCgVTlE/thTzHg4eoavB2/jvS6JD3JWEKV+bH
 UCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=HbnImI/6jmkA1nEq2/FJVlnNBLTjau6kVBCsh7sJ8P4=;
 b=AcvNPju4sisK+TvbDs2d2Q/PjgdGGqHc7WYnSpL/1wldGKOGEvU8VPS7vAt5ZSgCAu
 YLrj0qn470ivY9ncKaN/Oe5+/28CCp9hLWqLW0DC6cVSh5vEVJDWgrLcuoyTbm61g6VO
 pSWx4gOQiRjIA1YS+DzJhV5UpsnQKQvH4XMquA+ajY9GGzESP8KhCUpeiqHt/ZoWO8tC
 kLRBvt0br3NqMXst7cygyXqoioXbFI7bJ18q8ZsWQnKP6wjqr9EPl0XJdybaCUEA0EjP
 G4ptok5FY3GArFhEfE066Iw4e+qlN8WiEaBUKzYLPfjoxKduNAJN/gbZhQiHt5FfFwY4
 UPjQ==
X-Gm-Message-State: APjAAAWIzNhNgRxQiV5bto8Xzxpb1g4VnB5MQCqyBxEfxqlhGSs0iJwt
 z0cGehvQMql/VeANga/9QUGFRU6kFto6LHQRepLSueVD
X-Google-Smtp-Source: APXvYqz/z5hlv1YszamA5no0+BSG7jlC1jAl0A31ee7jLbUshs20xLhRU55v0euOej34l3P6a4em8dH3P9Qz98HZge4=
X-Received: by 2002:a2e:8316:: with SMTP id a22mr26617353ljh.171.1554996374356; 
 Thu, 11 Apr 2019 08:26:14 -0700 (PDT)
MIME-Version: 1.0
References: <CADmzSSj+dm6siBGP-LPzJ=i1pZU3vK7z-VsR4Qf6HT2yu8Z-6Q@mail.gmail.com>
In-Reply-To: <CADmzSSj+dm6siBGP-LPzJ=i1pZU3vK7z-VsR4Qf6HT2yu8Z-6Q@mail.gmail.com>
From: Carl Karsten <carl@nextdayvideo.com>
Date: Thu, 11 Apr 2019 10:25:47 -0500
Message-ID: <CADmzSSjwqDgabEbzq3Co3oRVW=kJRE4Dnyyqvzw=RxBDTr7Z+g@mail.gmail.com>
Subject: Re: v4l error on stretch c2
To: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_082616_548216_A3C2B549 
X-CRM114-Status: UNSURE (   8.13  )
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

Hmm, it magically fixed itself. maybe.
even after a reboot.

here is baseline of what works when the v4l device was erroring:

More info:
https://www.armbian.com/odroid-c2/ Stretch

modprobe vivid
dmesg
[33294.994948] vivid-000: V4L2 capture device registered as video3

root@odroid3:~# gst-launch-1.0 v4l2src device=/dev/video3 ! fakesink
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock

(no error)






On Thu, Apr 11, 2019 at 1:16 AM Carl Karsten <carl@nextdayvideo.com> wrote:
>
> I'm getting errors reading a uvc video stream:
>
> Linux odroid3 4.19.20-meson64 #5.75 SMP PREEMPT Fri Feb 8 10:08:40 CET
> 2019 aarch64 GNU/Linux
>
>  gst-launch-1.0 v4l2src device=/dev/hdmi2usb/by-num/all0/video ! fakesink
> error: XDG_RUNTIME_DIR not set in the environment.
> Setting pipeline to PAUSED ...
> Pipeline is live and does not need PREROLL ...
> Setting pipeline to PLAYING ...
> New clock: GstSystemClock
> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Could
> not read from resource.
> Additional debug info:
> gstv4l2bufferpool.c(1058): gst_v4l2_buffer_pool_poll ():
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> poll error 1: Invalid argument (22)
> Execution ended after 0:00:18.608430528
> Setting pipeline to PAUSED ...
> Setting pipeline to READY ...
> Setting pipeline to NULL ...
> Freeing pipeline ...
>
>  gst-launch-1.0 v4l2src device=/dev/hdmi2usb/by-num/all0/video ! fakesink
> Setting pipeline to PAUSED ...
> ERROR: Pipeline doesn't want to pause.
> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Device
> '/dev/hdmi2usb/by-num/all0/video' is not a capture device.
> Additional debug info:
> v4l2_calls.c(633): gst_v4l2_open (): /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> Capabilities: 0x4a00000
> Setting pipeline to NULL ...
> Freeing pipeline ...
>
> --
> Carl K



-- 
Carl K

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
