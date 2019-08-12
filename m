Return-Path: <SRS0=Dn2N=WI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2AFCC31E40
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 20:55:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91E6120684
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 20:55:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EtKtjxyF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="2MsEqrq6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91E6120684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WL/hqk6w/H3bRJIHM5WgWywvS72RRNpQV8Pc9PxkuxU=; b=EtKtjxyFk0eE+/
	QbDrOC/ge+f33rQbjmPQ55UlzrLocwjA7MjjB8bc/dzcph7GJvZ32m6Pr12zlrOttpgQxzL/4oSbv
	repchFojZXs44WLn8NgB8breaMMpfgi1p5juEgt8zp7shVWfh4pvtVzRh5cYO6mTY11W0xJ36+eFG
	kUwebCBDPe424px798I9wbuf+jv/9o9CMg/eoWP0lmUrGaPKSKUmDTmBlgOF1yUMm4DHqzZaH7CVj
	jLgUU/qqDXTIoI5Fyu/uEbKmHd7nyezuwt7QKMllQVj6r3XZXecd3gU6pADVx8vpPc7fdpnXffjuk
	WF8Ab0oxw0IqZHwm/tdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxHLW-000725-OF; Mon, 12 Aug 2019 20:55:14 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxHL3-0005cS-TW
 for linux-amlogic@lists.infradead.org; Mon, 12 Aug 2019 20:54:50 +0000
Received: by mail-pg1-x544.google.com with SMTP id n190so9275370pgn.0
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Aug 2019 13:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=G96ttrylkozavtp+GkCFPZaZpJ1CXYrccgmyLzpILSM=;
 b=2MsEqrq6jeAHonuDnFidSEMvA40eV2EV9rHP09a8PVmfQV2q1l2rUXiOBofFeJytCi
 yI+eiJfH2QzC7hIdvHRPsVJrkoZa71GBYet+8I26skuXpSKSI6mp1hI99ctHa29GprZ2
 D/4QHSTBBh999SSdtRaZg4Rga9dfc1HV1AYHPPnxvfQKvLeYaRfUTi4mGfAxKSdbp0xQ
 xRoZd/5mUSybTsWNHCDHg3TkIxncgGBdxcipbrzEf7yrtBKbhoA2r8VNePoJpE/r4e0E
 Y6Id0y55Va4n6Rzm1NfozTcxT848JRvEm9+JoESTp70CMatneEjveslZJC4XPk6RIZqy
 O17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=G96ttrylkozavtp+GkCFPZaZpJ1CXYrccgmyLzpILSM=;
 b=ZqAfy0U4v+rbZeazibbmZ0CQStCnd7GzOI7nKfAY9wh2xhMqwVNjHr4MKK87UUyaNf
 xUte9+PfnjD4pawmS9IGLTwqotqfI+eyPh2pdUk/FAtXK76cbamNjofGtCCv6JoTcONw
 e0KdSIsueZU1g985zF1sffE5rwBZ6xxXgN0KnfE0C+pqKUtxgtMU8ZbhuxnEjT4qNnqA
 cMStBJ6/CSa1ztxg8oGhuY91KLbTpO5QMS14+1NuJ+YeIcVqgd88xq9dOQUbkf/16D3f
 0bqMehFvJasifU/oM2kUowelnXWT9fC8vCcQKuc5yGoipskL7wH1wYF3JpE38VR7ROaw
 VknQ==
X-Gm-Message-State: APjAAAXh0lmWivBKL6XKDE0s+CVM0B6wz6WGxBHDYKOr6APhOw6CutSx
 Idks/jAR74G7A0N2eL9WaYt1Hw==
X-Google-Smtp-Source: APXvYqzbET0UNtAEOW/tFOjsj6Fj901cwmJjrYlflO9pmbo1TxhTMwyLzIaz0Ye07PH9P2f/B/glkw==
X-Received: by 2002:a62:f245:: with SMTP id y5mr3845900pfl.156.1565643285235; 
 Mon, 12 Aug 2019 13:54:45 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:14bb:580e:e4d6:b3a8])
 by smtp.gmail.com with ESMTPSA id cx22sm405480pjb.25.2019.08.12.13.54.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 12 Aug 2019 13:54:44 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/6] arm64: g12a: add support for DVFS
In-Reply-To: <7hk1bn43fq.fsf@baylibre.com>
References: <20190729132622.7566-1-narmstrong@baylibre.com>
 <7hwofrh1md.fsf@baylibre.com> <7hk1bn43fq.fsf@baylibre.com>
Date: Mon, 12 Aug 2019 13:54:43 -0700
Message-ID: <7hpnla14vg.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_135446_000811_9BFF2FAE 
X-CRM114-Status: GOOD (  10.65  )
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
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Kevin Hilman <khilman@baylibre.com> writes:

> Kevin Hilman <khilman@baylibre.com> writes:
>
>> Neil Armstrong <narmstrong@baylibre.com> writes:
>>
>>> The G12A & G12B SoCs has kernel controllable CPU clocks and PWMs for
>>> voltage regulators.
>>>
>>> This patchsets moves the meson-g12a.dtsi to meson-g12-common.dtsi to simplify
>>> handling the G12A & G12B differences in the meson-g12a.dtsi & meson-g12b.dtsi
>>> files, like the OPPs and CPU nodes.
>>>
>>> Then G12A & G12B OPP tables are added, followed by the CPU voltages regulators
>>> in each boards DT.
>>>
>>> It was voluntary chosen to enabled DVFS (CPU regulator and CPU clocks) only
>>> in boards, to make sure only tested boards has DVFS enabled.
>>>
>>> This patchset :
>>> - moves the G12A DT to a common g12a-common dtsi
>>> - adds the G12A and G12B OPPs
>>> - enables DVFS on all supported boards
>>>
>>> Dependencies:
>>> - None
>>
>> Not quite.  The last patch to enable DVFS on odroid-n2 has a build-time
>> dependency on the clock series that adds the CPUB clock.
>>
>> I'll apply the rest of the series to v5.4/dt64 until there's a stable
>> clock tag I can use for the clocks.
>
> In order to test this, I noticed another dependency needed for the PWM
> regulators to work:
>
>    https://lore.kernel.org/linux-amlogic/20190729125838.6498-1-narmstrong@baylibre.com/
>
> With that and the clock deps, it's working well on my odroid-n2.
>
> Tested-by: Kevin Hilman <khilman@baylibre.com>

After merging Jerome's tag for clk DT, I've queued this for v5.4,

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
