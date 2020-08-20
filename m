Return-Path: <SRS0=HvuL=B6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF0CCC433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Aug 2020 19:33:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AA76207DE
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Aug 2020 19:33:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NIo6WwN1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="a52ZRAy6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AA76207DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fOSEvCYkWsxg2i15xeo9ADeVaHTi9giKPP3hStvYUI4=; b=NIo6WwN1SrezpGVcsWYRyXa6W
	oYdcmos134Wsweaj+e+gWYxxFaxnMXuQ8RxjJCIUHFj6NeK2Cf2FG8nd2MQHkaTVWJ6AW8aRsyv2C
	kvCt0/jDZCTHeT+MGKG6jOT+5KjwqZeUEpnU4noxXaq4BOmJ4oXaUlLLkOUOuQ48judvvjF5RbZCn
	d3rR/5PxD1iY5kXycEWRMD2x/FAi4mUSuzYe+PimfRurKqEZAVBx+cOUyHHDo4035y4Ru8CcuhwYk
	28s1P7oPEbj3QqF/OsuV7kYUhxicmTKYYp5FtLjN31lD8Pj+pELAcK02BIxMmEfSwnsaCgf8ukL4R
	JkDpJwDtg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8qJS-0002a0-9f; Thu, 20 Aug 2020 19:33:26 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8qJO-0002Yf-GF
 for linux-amlogic@lists.infradead.org; Thu, 20 Aug 2020 19:33:23 +0000
Received: by mail-pf1-x444.google.com with SMTP id m8so1542701pfh.3
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Aug 2020 12:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=+NH/EVilIs+rc2YfZDn/KduJaW1ughyXrixoRfqTCIk=;
 b=a52ZRAy6tM+mLgU6pf1voK51zdKMcXLuFfrZMPaNRAmgY3Rc2pCWMQLyex+qSiiX7p
 O8kHKxTBNXujlNeS4jq8ONBrjXFYgfUkDIJbkunM5Gh/nsXqDNthTC3rLa1czC+qKzb+
 aNrbPhZl2whNRdYJXCONnQzIDe0rdBXyZA3p1vbIb+HATQU2AsLHELWGEtW/0j6x7Mhu
 TxUuDL2zQ4Ka1c1kSZv4r4gSE/5wzSGe1Hq6WyRGfcG9mAwogqMjpmsfBcpBaaLnb/pF
 MXwqsHYI9FmAVFjg0PR7kUHZ2l8M07otXKANO/0dhQl4OEFylr8xrPb5PErnoGddMGNJ
 v5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=+NH/EVilIs+rc2YfZDn/KduJaW1ughyXrixoRfqTCIk=;
 b=nOkYVeWStRlsf+UlyzXS6qzwCfW4mJ72ki3IfloAuLJY4ulg0ozd69uJra7HNO2n6Q
 hJHzXkKzmfJRruv1dgjh0MokqRTsb/nT+IUaAd+LsAX3AC+jYbg35D6XmHkCTZTGqqan
 UmkKEnwFr2gWGCYzF2YOUS7wvlWyFgXq3jrNPFdtFUdrRjrr5QKoOP6qGYSpP+/TxdlT
 9J4fWimMYvM2z5+nTpjO4t7/OnnNS+cEffgjNN0CHvX8mfowZyyCdSgP7Z6sPt8jqYXQ
 hKDBqVppmmsBhV8wx8Q4GuJQ8VRDRyxyaMEeEqddUM/Fyhk1dGig/aeoZLmOnfOHtS9v
 mgYQ==
X-Gm-Message-State: AOAM530NYRoSiOui6P7LOdHT1XhGwszD12JTUcAPNPX7Xgm+U4G0ftOB
 OadZtKy8vycLD43g8CuDOdTl3g==
X-Google-Smtp-Source: ABdhPJwWDh+QCKjM50OxojdKZ7o5q7ckFzlrT8jwHIcJG1vtl++X4ANR5i4yapkZVKF8T+UexxbH/A==
X-Received: by 2002:a65:60c5:: with SMTP id r5mr208358pgv.283.1597951999356;
 Thu, 20 Aug 2020 12:33:19 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id w16sm3457029pjd.50.2020.08.20.12.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 12:33:18 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Anand Moon <linux.amoon@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
In-Reply-To: <20200820121323.564-2-linux.amoon@gmail.com>
References: <20200820121323.564-1-linux.amoon@gmail.com>
 <20200820121323.564-2-linux.amoon@gmail.com>
Date: Thu, 20 Aug 2020 12:33:18 -0700
Message-ID: <7hlfi9xgch.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_153322_590686_4B3FABD8 
X-CRM114-Status: GOOD (  11.58  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Anand Moon <linux.amoon@gmail.com> writes:

> Enable RTC PCF8563 node on Odroid-N2 SBC, In order to
> support the RTC wakealarm feature for suspend and resume.
> Also assign an alias to the pcf8563 to rtc0 and meson-vrtc to rtc1
> timer device to prevent it being assigned to /dev/rtc0
> which disto userspace tools assume is a clock device.
>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> Changes V3
> --Drop the INI GPIOAO.BIT7 pinctrl.

Why did you drop this GPIO?  Isn't this the GPIO that the RTC uses to
wakeup the system?  If so, this should be included as part of this
patch.

It probably still works because the bootloader configures this GPIO as
input, but the kernel should not rely on the booloader for that, so
please include as part of this patch.

Other than that, this is looking OK.

Curious how you're testing this?

When I tested with rtcwake (from buildroot), I'm getting this:

/ # rtcwake -d rtc0 -m mem -s4
rtcwake: RTC_RD_TIME: Invalid argument

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
