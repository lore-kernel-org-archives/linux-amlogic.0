Return-Path: <SRS0=JnL7=XU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F43C432C2
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2019 22:47:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57C2620673
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2019 22:47:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DD5ww8+r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="QiOYkbRm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57C2620673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQAuE3OdrCxhk+DWb0bEhEfXgJDQf2wZrQ/U6+RvwwE=; b=DD5ww8+rEQwe6a
	oSdqpYT7ihAnBoBIBIZgFnr2oYAlwZzkxubLpHBJ3c9D54vNl2E0fcXrcycuqOl/HbKKyPKuxQcU8
	kCICyowDGYOTEViN8ItEXV0m9J8PkUov97G6jvtVoo5OPjapdwneXpwGn5+TxEnyfA/yxA/LwF1kl
	4QvYzgl18DHZsrYCRbPAyxJus3lGFncysJGwn1+mZZQ6u8yn6zFhIsy6tdZFcBmpqRvUpf7Ccw4R3
	/s/ars4HqRC52loGrf6NP7UM1MadeEBNyn+ysX4Sw2RFjMomNiCCm9fekJYpxu0+1ykqUhGsICdPC
	XqIvZuxUuM1iT25T5vUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDG4f-0007HY-6r; Wed, 25 Sep 2019 22:47:53 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDG4O-00075q-RP
 for linux-amlogic@lists.infradead.org; Wed, 25 Sep 2019 22:47:38 +0000
Received: by mail-pg1-x542.google.com with SMTP id z12so169419pgp.9
 for <linux-amlogic@lists.infradead.org>; Wed, 25 Sep 2019 15:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=i+W79Fs+JtLmvj8CWOzkvZTsSvzosH+D6ZGyUem3ZnA=;
 b=QiOYkbRmVsN0NOymJrZmyNk1Aqs67OzdvJqNVdBgR1dAcP4rnJgsfYdIiaSEoto46F
 Jz05CrdMfASGsfvx5uv5JpHJk/u8jtuxC7qN8ceDRcUwoV+tZQ/pzFDvo9ENX/IOInt1
 F21xWgdJ446psjlOHyUlz8fTjAqdrTpwK8msB0hKdgsYgf2cGR6fEc7iDCD3shAxGd1W
 aXm7YRXOtY4TbhADrjU9hMXBWsaEJVy+8InX35P8rxGIA/P+2i8iB6cLsaa9mxgb/GJb
 /QejV4k2p03XCnSOcWdeEaWORIHuF4vrHU1GFW1bVSrrlWcx/stVQYHCq0DIVxhfDffB
 Y/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=i+W79Fs+JtLmvj8CWOzkvZTsSvzosH+D6ZGyUem3ZnA=;
 b=EVtibyfi/AS9rsvGGr+Baya4grb2wXDQPaAhhwRK+aX7Rg9thM8GOP/dNqWNy+rhrM
 JYayJPshe25EDL2T7YxHOH5pk6rvn2TfSA3W7g7LVvpimLApx1VwSXJJriJBUMnCnJUC
 Lc3+VuA+Vcu0WJmGwCIJyiCP37zPnYhdN7UIV2yofURT47E/1bVBjRcySns1BFZlybxL
 nBEzm3gkN3gn138M6K9PXTus5fRyurJkDAsK6YOVU/7ihyg7ai6WW+bnGD8lXksq/ibt
 /dubln+waB8S79yUus9l/sUKQ1qnZP8iFvHelDnEZGv3LBEgVuoMEtf+BfhvDRE56nBf
 8sog==
X-Gm-Message-State: APjAAAVIlkuXZ3DKUZdRgUmWPAyjuhPOHZr18Aj3c5taFhEz7U1wckWF
 uyG4oF0drZh1lYMVyN/sB90o8Q==
X-Google-Smtp-Source: APXvYqz9kGKfiISSY6GKYU59WSD/o/ecZYyCnkLsLXzxHGjEjI0j1FcxGdHUuVDusWLEWSDsnbyIGQ==
X-Received: by 2002:a17:90a:d792:: with SMTP id
 z18mr106795pju.60.1569451655789; 
 Wed, 25 Sep 2019 15:47:35 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id bb15sm205894pjb.2.2019.09.25.15.47.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 25 Sep 2019 15:47:35 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 0/5] provide the XTAL clock via OF on Meson8/8b/8m2
In-Reply-To: <CAFBinCA0NaCJEDfNEg+LRfW3wxfNFGbXmGS+z7D5792TsupVAA@mail.gmail.com>
References: <20190921151223.768842-1-martin.blumenstingl@googlemail.com>
 <1jzhivs6n6.fsf@starbuckisacylon.baylibre.com>
 <CAFBinCA0NaCJEDfNEg+LRfW3wxfNFGbXmGS+z7D5792TsupVAA@mail.gmail.com>
Date: Wed, 25 Sep 2019 15:47:34 -0700
Message-ID: <7h7e5wt2m1.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190925_154737_041128_36C6ECCE 
X-CRM114-Status: GOOD (  19.10  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Hi Jerome,
>
> On Mon, Sep 23, 2019 at 11:29 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>> On Sat 21 Sep 2019 at 17:12, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:
>>
>> > So far the HHI clock controller has been providing the XTAL clock on
>> > Amlogic Meson8/Meson8b/Meson8m2 SoCs.
>> > This is not correct because the XTAL is actually a crystal on the
>> > boards and the SoC has a dedicated input for it.
>> >
>> > This updates the dt-bindings of the HHI clock controller and defines
>> > a fixed-clock in meson.dtsi (along with switching everything over to
>> > use this clock).
>> > The clock driver needs three updates to use this:
>> > - patch #2 uses clk_hw_set_parent in the CPU clock notifier. This drops
>> >   the explicit reference to CLKID_XTAL while at the same time making
>> >   the code much easier (thanks to Neil for providing this new method
>> >   as part of the G12A CPU clock bringup!)
>> > - patch #3 ensures that the clock driver doesn't rely on it's internal
>> >   XTAL clock while not losing support for older .dtbs that don't have
>> >   the XTAL clock input yet
>> > - with patch #4 the clock controller's own XTAL clock is not registered
>> >   anymore when a clock input is provided via OF
>> >
>> > This series is a functional no-op. It's main goal is to better represent
>> > how the actual hardware looks like.
>>
>> I'm a bit unsure about this series.
>>
>> On one hand, I totally agree with you ... having the xtal in DT is the
>> right way to do it ... when done from the start
> yep
>
>> On the other hand, things have been this way for years, they are working
>> and going for xtal in DT does not solve any pending issue. Doing this
>> means adding complexity in the driver to support both methods. It is
>> also quite a significant change in DT :/
> my two main motivations were:
> - keeping the 32-bit SoCs as similar as possible to the 64-bit ones in
> terms of "how are the [clock] drivers implemented"
> - with the DDR clock controller the .dts looked weird: &ddr_clkc took
> CLKID_XTAL from &clkc as input and &clkc took DDR_CLKID_DDR_PLL as
> input from &ddr_clkc
>
> RE complexity in the driver to support both:
> I still have a cleanup of the meson8b.c init code on my TODO-list
> because we're still supporting .dtbs without parent syscon
> my plan is to drop that code-path along with the newly added fallback
> for "skip CLKID_XTAL" (assuming this is accepted) together for v5.6 or
> v5.7

TBH, I'm big(ish) "functional no-op" changes like this are not things I
get super exicted about, especially for SoCs that have been working well
for awhile, and are do not have a large (upstream) userbase.

OTOH, since Martin is doing most of the heavy lifting for keeping this
platform working upstream, I'm happy to take the changes, as long as
Martin is willing to deal with any fallout.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
