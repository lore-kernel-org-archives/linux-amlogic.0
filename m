Return-Path: <SRS0=svws=A3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA9F6C433E7
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2020 21:29:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8459820787
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jul 2020 21:29:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zQB7F+VW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xTAusJWg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8459820787
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KBvuJXyBq+1zfVMGy9g/xzK/fQjwaxQh8Sha2CkLsHg=; b=zQB7F+VWiSQ6qMXKD0uWpLesw
	DGGHu56m9JFIaj2dhFE/GWLwIIBIDblnMrAAnkm9u1ScrPzyCTAEJkE7V+R6RUi7W+2JIuFG/YGWZ
	29Vb2uWhphBBYij3UAdGm3rISK25v6/0N+o5Fmf13X9GCOwpV6Y+KJ+oThfEKyO74GCEWY1y6fn39
	BRzbmQ1sHUwr31EtL/T8y1cFoeZ0rEI2Khqm4jM9HK00+RdSpBC/SSlbtAdyoQmh5VTZ9aSN1sBHg
	dcLXrnhD2H4XH80I7anpzqgbj8vLINdgtHfc7+RIME8FGjSJhRQOnwG2jSGOC5B+K9af3oIYLNeUF
	F6fA8HXWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwBRC-00078U-F2; Thu, 16 Jul 2020 21:29:06 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwBR8-00077I-OB
 for linux-amlogic@lists.infradead.org; Thu, 16 Jul 2020 21:29:04 +0000
Received: by mail-pl1-x642.google.com with SMTP id l6so4428910plt.7
 for <linux-amlogic@lists.infradead.org>; Thu, 16 Jul 2020 14:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=J6Y0MfVHAU4+ZgY/mepQU37GPL024rjIvlsLsAsgOa4=;
 b=xTAusJWgf6D79cQ/B0ekFnBpDtdUrtkP1aQg35prpLr1pwJx3AmVZ24SZxfwx03hqv
 hBlmCAF8HI3laFfGzMNK+NSjuhq7nxVB/D951yhkBKkdXgZk88rI2U9cuKUHL8GmYqoQ
 ANeU/oPb0Gr7BAVRxJSbDduT9d1M0cRsEH26mA2wDIetOBzZPu4OYcW7jYerqq0yunxB
 JEB02Hv8odPsmDUWkjzT8V76+iLzq5sS3LEQ0qdB3IdA8HmaM3LPjFGb3HPkKs7a/LoN
 BrelG+oZyEN2AbUqxQiUHuKWfFCYo9mpKp2rk76GJ6b6X6ECx0O/mUu8JUg0JQ7WJnRU
 9RBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=J6Y0MfVHAU4+ZgY/mepQU37GPL024rjIvlsLsAsgOa4=;
 b=NiVwqkTo/2TRuFuEAcqNV5tH5hv5Ir81e5C0axz71qNAVMmVQSOpL25Tqf5XJVb3aO
 WLE+prT4uq/UzARAQDBoOjFwF88usl1Gy9pWCS9vwpvqoiH/3NT36blCwPgY/Wo+EH01
 +HBwS/p+VNeqb3Njdl128UFOxn8bc1Riv8rT0TaDpGdXe+fcOdLOWi/OIuVo+Qg3I8uI
 qK7N4cPnrxI7f4XYZR4v8TNmDhzLaqsL4+3xZ8ELlBL7R4CL9q0ttfYtiJJHx3s166M9
 L4AO9E7NABvHubqqSGXCs/1U6UmG13UVcmpGfEtdZRs1pxpdV++zeXeEcXMfwsflEoBn
 B8xg==
X-Gm-Message-State: AOAM531eV1mdvNjSiDnJkFaJX5Oc+QuEKWihl7H7q6sO+iNxCMsu9u+9
 CXv0m4djrjKOzGecgiWZOJUBdw==
X-Google-Smtp-Source: ABdhPJz73I6mt0zkjhR/MvWi4S5nNWwIcspRU5QvWTWCL6CNuOkaP+j8UFV0E8pijfMGw6CBWKVlUQ==
X-Received: by 2002:a17:902:8d98:: with SMTP id
 v24mr5096592plo.301.1594934939634; 
 Thu, 16 Jul 2020 14:28:59 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id x10sm5470069pgp.47.2020.07.16.14.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 14:28:58 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCHv1 0/3] Enable RTC on Odroid N2
In-Reply-To: <a7e9b154-ceb2-3915-454a-a53c9b65622e@baylibre.com>
References: <20200715160209.652-1-linux.amoon@gmail.com>
 <455f5dcc-3be3-45cd-4947-50f261a502a4@baylibre.com>
 <CANAwSgRXLUqqSqnguV2pgPdumMi8i6T9rh6hNQ0Y03mv_j7V-g@mail.gmail.com>
 <91fbbe36-d839-d864-7666-5483cc643a5e@baylibre.com>
 <a7e9b154-ceb2-3915-454a-a53c9b65622e@baylibre.com>
Date: Thu, 16 Jul 2020 14:28:58 -0700
Message-ID: <7hh7u7f8th.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_172902_835595_6BF84A6B 
X-CRM114-Status: GOOD (  12.27  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Hi,
>
> On 16/07/2020 10:20, Neil Armstrong wrote:
>> Hi,
>> 
>> On 16/07/2020 10:14, Anand Moon wrote:
>>> Hi Neil,
>>>
>>> Thanks for your review comments.
>>>
>>> On Thu, 16 Jul 2020 at 12:35, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>>>
>>>> Hi Anand,
>>>>
>>>> Only the vrtc is able to wakeup the device from suspend,
>>>> the external RTC is not capable.
>>>>
>>>> Neil
>>>
>>> Now I have two RTC driver registered
>>>
>>> $ dmesg | grep rtc
>>> [    4.737315] rtc-pcf8563 0-0051: registered as rtc0
>>> [    4.738763] rtc-pcf8563 0-0051: setting system clock to
>>> 2020-07-16T08:00:46 UTC (1594886446)
>>> [    4.790206] meson-vrtc ff8000a8.rtc: registered as rtc1
>>>
>>> And there are two nodes
>>> # ls /dev/rtc*
>>> /dev/rtc  /dev/rtc0  /dev/rtc1
>>>
>>> So it seames an issue that /dev/rtc0 is not able to handle wakeup events.
>>> How can we resolve this issue?
>>>
>>> # time rtcwake -s 30 -m mem
>>> rtcwake: /dev/rtc0 not enabled for wakeup events
>> 
>> rtcwake -d /dev/rtc1 -s 30 -m mem
>> 
>> As Christian reported off-list, it may be necessary to keep the vrtc as rtc0,
>> so you should add aliases in the odroid-n2 DT to have vrtc as rtc0 and the on-board
>> rtc as rtc1, but it may break the hwclock tools, so the reverse may be better
>> but you'll need to specify rtc1 to rtcwake.
>
> While looking closer to the Odroid-N2 schematics and U-Boot/SCP Firmware, the external on-board
> RTC can wake the device with the GPIO_AO 7, and wakeup is enabled in:
> https://github.com/hardkernel/u-boot/blob/odroidn2-v2015.01/board/hardkernel/odroidn2/firmware/scp_task/pwr_ctrl.c#L143
>
> So, something must be missing.

A couple possibilities come to mind (without looking at the specific RTC
driver):

1) pinctrl for that GPIO needs proper settings
2) DT node for the RTC needs "wakeup-source" property

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
