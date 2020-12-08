Return-Path: <SRS0=YCAW=FM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B9D5C433FE
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Dec 2020 19:20:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 373B323B85
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Dec 2020 19:20:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 373B323B85
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p7YZN3NmU236zvAudztXIzpGs1o/k0+GE1HdBs+w16A=; b=0gn/bLecgl8uKqQu3eYKVdYBWe
	AX2Griq6+Z5Y8Su8uw9OqnxgMnCCAQ/0aogsAY0emDfk8k2uN9+4L3wx194Dgd7ucVtkRK90Q9jfi
	3J9PL9aVwFURaXk2VTdwmzyhChG7FIFfD9CC9SpS/3iv1sCWzXPjgsdfowyV/0dRXIWXnxZ80Qlzp
	yRP8oHlebmJNheuIvFsPyi8G0ZTDKdzywu4ERItYsCd0tk3nKgwEH9gBfyKZj94m3avSZXyVK7GdT
	yBgPOPiuW2tLp8jhKIPMxg9OLrJhXmWnTNJ193MV9s5zhFK6f8QnzcI4YN/o2YNezqg/XczqejIVb
	iLVj1ChA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmiWy-00066d-EH; Tue, 08 Dec 2020 19:20:12 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmiWt-00065C-FG
 for linux-amlogic@lists.infradead.org; Tue, 08 Dec 2020 19:20:08 +0000
Received: by mail-pg1-x541.google.com with SMTP id o5so13066897pgm.10
 for <linux-amlogic@lists.infradead.org>; Tue, 08 Dec 2020 11:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cOsptZpbaXZdyHeq1KoGUWDMF3slisUiT0yak+RYvVg=;
 b=V1HJf+WKm8xtLqwvNnhsLkSQVipGbGBajM1F2ZUQcrOTQ2iu39pW4KdaTgszCgwjnq
 tGzWVJdaHcBvZzl5aaqYttQ5TUOZCZZeqIs09s44Q9oB+hsnPkOAZotzWpI8i00QVucJ
 ZkqvlVBVZSwtlbZua/brIaYJZ/+yexmmd5LKCv3G/Ku5t2DBPxqLPlTYem2pm7/BQHwc
 Y2739VDQ3AMdHUYiNTI4cIVwWH1a3RA/iMrBvYTFlKq7M7ehhFBWisKxwf1Ty4u4bQp6
 Q+maaFLNMOJu0B6hXcWTKH/5A8HPZ32RGxpfIbbSJvjpSfD8VZYPzolUFR9zjcbs0rIx
 4beQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cOsptZpbaXZdyHeq1KoGUWDMF3slisUiT0yak+RYvVg=;
 b=MkscaXTzxVtMcPpHXlUxPXtjs9aNXOiQ0eAglRp1KGgklxf0cwBDhKJTzKCXE+PKjX
 Eq0ZLrHFlHxr7ZRlyFFA98EQUMtMnAOdxVyl6o+2ZjJPlzh+cAC9nFd7aBY01DlekjBm
 0fJGFfKR+BPD9XmsSehL9yxobuKi4rxvUR0LRmad/DmK+9iByCpin1efPjUIyFvw9tkr
 TFDn1vSPxZoYGuX3cY4Rz074nlwU3zr7qbcDLHXydAbTa8ca71hLBFW9gFkSPVVV5vhl
 lwOiHrVM/qyliN2Is/4Zuj6V4oPG0wvAgtCILRYSvyFav6jAGkYWMJ38d0smab0TjkMh
 gPUw==
X-Gm-Message-State: AOAM533vn+6lGNlMDPSYdTepjM2Daf3Rm7WcCB28GqRJQ3m4yY11nI8S
 ui9lDu93Z9bTcXz0Noxt6jFfiA==
X-Google-Smtp-Source: ABdhPJxyhjHPDKKo2JqsB/7HDITrAO23pyfmgSy+gat1GDFvuRxWeDGk6joJ5fCWRlKZVFhCYSjLzQ==
X-Received: by 2002:a62:7693:0:b029:19d:92fb:4ec1 with SMTP id
 r141-20020a6276930000b029019d92fb4ec1mr21819903pfc.4.1607455203885; 
 Tue, 08 Dec 2020 11:20:03 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id i4sm16499994pgg.67.2020.12.08.11.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:20:03 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: add i2c3/rtc nodes and vrtc alias to
 GT-King/GT-King-Pro
Date: Tue,  8 Dec 2020 11:20:02 -0800
Message-Id: <160745519765.13209.7401462503756984105.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201201062135.18241-1-christianshewitt@gmail.com>
References: <20201201062135.18241-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_142007_563372_BB31A9FB 
X-CRM114-Status: UNSURE (   9.68  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 1 Dec 2020 06:21:35 +0000, Christian Hewitt wrote:
> The GT-King and GT-King-Pro boxes have an RTC chip and power cell, so enable it.
> 
> GTKING:~ # dmesg | grep rtc
> [    5.237245] meson-vrtc ff8000a8.rtc: registered as rtc1
> [    5.261869] rtc-hym8563 0-0051: registered as rtc0
> [    5.265016] rtc-hym8563 0-0051: setting system clock to 2020-11-30T09:16:54 UTC (1606727814)

Applied, thanks!

[1/1] arm64: dts: meson: add i2c3/rtc nodes and vrtc alias to GT-King/GT-King-Pro
      commit: 7704b100719cf0fead976a1bc839c60ee552d045

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
