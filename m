Return-Path: <SRS0=I14R=SN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17ECC10F13
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 06:16:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BCA520873
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Apr 2019 06:16:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iuneI8P7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nextdayvideo-com.20150623.gappssmtp.com header.i=@nextdayvideo-com.20150623.gappssmtp.com header.b="QNi8RWvJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BCA520873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nextdayvideo.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=yJqDxDDycGkrvw6cMiwmdgBOi1CGNRPfNwGc6u9VMJc=; b=iun
	eI8P7rDhglK6e3e+N1vr0lyaUUqF3mEIFaidQngEBAyQTmKCVMCurnCLv+QK5vx3KBI/ryeOumJ3R
	WZtwK1yMs0AbCMNESVovsYUESPLJfBcLGs/jq8xeEiCnOH0g8Qkbn8m6/6LqZKY+WvL+a/3Wdv6zP
	KFcPwZvMRLq+4V+MiThw3ktgR5n2922F0qkKsFIKX2e4zu18Yd9VAvkMAj9iVTvdVUnaD9HjBYQvH
	nAsab7UmZPxml/pimhxJL1sOklcNmw2SP44OQ58bmQA49YuuyWyKTj0FUNQ3hjPrNIqYEWEpbaqka
	3Qh8V2rb/L2rXNnvRY4c3wezXk5h8Cw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hET0u-0003lX-DU; Thu, 11 Apr 2019 06:16:44 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hET0r-0003lB-Ox
 for linux-amlogic@lists.infradead.org; Thu, 11 Apr 2019 06:16:42 +0000
Received: by mail-lf1-x12f.google.com with SMTP id a28so3720905lfo.7
 for <linux-amlogic@lists.infradead.org>; Wed, 10 Apr 2019 23:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nextdayvideo-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=VB/0cFv5+iAiN0ffald8aWI/Mvajt87Gh9bb8fhteDc=;
 b=QNi8RWvJRR02605ol3MCAPvSaXw2bgyu6yt5XIth9WPJKC6VPTW628srA9uOnL0HMp
 e4Qkh/VPAKSWiOcWslb/idEQDkQ9/5LzVEPBVe7+qP8VFWKMo+MVyCpTllglHZE6OlI4
 M22iyFyAw84QhsGETHpZkRy1H08HLW06wWoTJawZfAqOkC8GzKD76+kfBsGIgLGZ8d8I
 UevsJ250TUOdIMmU/pWenNxnXi8eLoBKm40YldEwdhnKRS7/HRJvPjVgr+xxSrkcdl3b
 0E64uyafCgY8lQzjCwKPxXTSyvOOCRdUkApkSvuobdE+UjsLVS2cjvWuaNontahP2KBA
 GitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=VB/0cFv5+iAiN0ffald8aWI/Mvajt87Gh9bb8fhteDc=;
 b=QNPO8ack50a5KgPYOD4xgtpxuX4bYlIkIT87XdFcW7WuomCfO1PcANJM5IXyCan/NI
 QdzQaXp94tCRhhfFN5lH3y73/H+wShduLeln6s1bLJbLVEVpcrOr783FDTg5vu5iWK1C
 c25JjaQUcx2HVlxxZmCaUxy2Ku4w6+OaNKTN7LzDLXKMk3XbTzw7SWC050lSYRAD1rxY
 /19w/a5OlMF3WtnMTZBfwL4MVLupMswpkLB3tmTfOyaAuFefHDWhSHzI+2qmSGRIInjy
 tkjLqCyucIDMlUz60FVXy3JcP5UFkGqcg1QFQ7g4dnEQbpuGdEOcULceBEbjM5IrfhAQ
 GIEw==
X-Gm-Message-State: APjAAAXwCufVjcggjmFy2hgSXrE2rhQgTRa0ER5stR4ekefbYbp0EahA
 DyN30+vGI06lrYfpGZwMNGkuDO2hqestY+JuMvL30t4P
X-Google-Smtp-Source: APXvYqxFv/z3KfHWzYNrc26MC0WCYpRQ60AViIy3lDUDm/HAWckJlHlngqQmMerKD7o0qAZJFrgcDOIyIumUP+9r7k0=
X-Received: by 2002:ac2:51ce:: with SMTP id u14mr686316lfm.60.1554963399593;
 Wed, 10 Apr 2019 23:16:39 -0700 (PDT)
MIME-Version: 1.0
From: Carl Karsten <carl@nextdayvideo.com>
Date: Thu, 11 Apr 2019 01:16:13 -0500
Message-ID: <CADmzSSj+dm6siBGP-LPzJ=i1pZU3vK7z-VsR4Qf6HT2yu8Z-6Q@mail.gmail.com>
Subject: v4l error on stretch c2
To: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190410_231641_809337_726AC1AF 
X-CRM114-Status: UNSURE (   3.73  )
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

I'm getting errors reading a uvc video stream:

Linux odroid3 4.19.20-meson64 #5.75 SMP PREEMPT Fri Feb 8 10:08:40 CET
2019 aarch64 GNU/Linux

 gst-launch-1.0 v4l2src device=/dev/hdmi2usb/by-num/all0/video ! fakesink
error: XDG_RUNTIME_DIR not set in the environment.
Setting pipeline to PAUSED ...
Pipeline is live and does not need PREROLL ...
Setting pipeline to PLAYING ...
New clock: GstSystemClock
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Could
not read from resource.
Additional debug info:
gstv4l2bufferpool.c(1058): gst_v4l2_buffer_pool_poll ():
/GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
poll error 1: Invalid argument (22)
Execution ended after 0:00:18.608430528
Setting pipeline to PAUSED ...
Setting pipeline to READY ...
Setting pipeline to NULL ...
Freeing pipeline ...

 gst-launch-1.0 v4l2src device=/dev/hdmi2usb/by-num/all0/video ! fakesink
Setting pipeline to PAUSED ...
ERROR: Pipeline doesn't want to pause.
ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Device
'/dev/hdmi2usb/by-num/all0/video' is not a capture device.
Additional debug info:
v4l2_calls.c(633): gst_v4l2_open (): /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
Capabilities: 0x4a00000
Setting pipeline to NULL ...
Freeing pipeline ...

--
Carl K

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
