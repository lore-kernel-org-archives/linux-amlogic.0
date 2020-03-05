Return-Path: <SRS0=MYl2=4W=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 812ACC3F2D1
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Mar 2020 08:22:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 515702146E
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Mar 2020 08:22:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AozLbHET";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XQhSxSzu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 515702146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=724KRAdG7qeCR9dCYX/IVh4AnaLcqkNPdGDtKPp/z88=; b=AozLbHETGrN+YTpLr2i/MAjYgL
	oBQ02lqlUWrYYgafwkP9BlxSc/K7YNspdmU30Jy93sCZZxcGdhezWFiH3r7Jqzb/tMALxl7i8MjXL
	6estFpcOWwTpMvrWeJhPB4NoREP+FShX0znc8qlxcaxelcigvdinqSnRIAMHiuCXla5Q65aXHU8cn
	2W+qBaSrILO067/iUgf4Dqazg7m3qNTzu3L8ZStjwPMX4IQ9jt7J5Xg4SQEFOPN4IhooWSUZzWDyO
	8ns8kZfErirouWbcY3+wjhvfaQ1WgILZ6adLUKHv1B6Vz/1TSb8sY+CAkmv0kgG3JyqnKIuftw8Ki
	Z/79rj6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9lll-0005zK-BO; Thu, 05 Mar 2020 08:22:13 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9llc-0005r5-Vc
 for linux-amlogic@lists.infradead.org; Thu, 05 Mar 2020 08:22:06 +0000
Received: by mail-wm1-x344.google.com with SMTP id a141so4656061wme.2
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Mar 2020 00:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:subject:in-reply-to:date:message-id
 :mime-version; bh=wy8PG+5094H0kwoE9azcIFtGBXe17DljDLj1gap6KjQ=;
 b=XQhSxSzu+98TQDBaQbX8qV6wCsTohykSPQpUarrD/+uUdM2OhBCJRgfHiQgAeL2bqG
 G87zQyeBW8INB88/a53JTOHfVNbpSp170zFo6ePYkoaYwrIkfClzdYU/ZE072Pq2MwIZ
 Gm1D0BQH7FmM5AiBCcb01izbcw1l1h42XG0YJgv8L9V0og6/XIQgYZ8AQ8mGWH/HAM3a
 cZHIb+VqXxsktjtO3C4zj7LMmWlcHd766DKDxx+7HwWMdGqV5C5Nfz3aJBhl9G60u4ZM
 iJ2Nzj+6dVprj7KACOhkfYoW0JHDsxB7scJbNkpoq+xbFn94AW9l5OBu7i1aWpIZEQv9
 PNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:subject
 :in-reply-to:date:message-id:mime-version;
 bh=wy8PG+5094H0kwoE9azcIFtGBXe17DljDLj1gap6KjQ=;
 b=e0Uj7i8eU1cGCWDtRtAANuhpkzqMbaM4oZxz0GX70Va0XJhfZOI7A7hCcVTI8GF34g
 g16s8EZI6W8ugbzYbpnPC2gp7BV5lQi5Vlt5LA/EKMzceTXSn3IKQO+j3OEegxRp5V9m
 0HditVqbFvyw5lmIw34ewkNaaW6DAjZTQOFsfB0pHwZe6hVkXocIv696t0/HN2/c43F1
 toY1pyO+mkYQaExUX1Ojayg40wsovBrhyrtSFc/Od+0UX2fH0vlsDxP7g0LSVEQPFfA5
 Dav0ildqr6rY1A/VvUywghZSnU/INzLwhsONaJIXvVhCnh2wxfWgKV7cqCaqZFQ8q2OU
 kymA==
X-Gm-Message-State: ANhLgQ3xpxkXUYvGF0xhty1+fljG7lGCAvHzYSGO/LosiTOdo+6eBQzi
 5tKfcXHDsTUzMlvq+p//JeeOZw==
X-Google-Smtp-Source: ADFU+vtQyU4UfDH9d2/TXDERF+INdtSbx2/ljMK+EMqmPS+JCjhE5+wuGnUWn9fPAey5YSeP3jbcRA==
X-Received: by 2002:a1c:dd45:: with SMTP id u66mr8644559wmg.154.1583396523188; 
 Thu, 05 Mar 2020 00:22:03 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id m16sm11943105wrs.67.2020.03.05.00.22.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 00:22:02 -0800 (PST)
References: <1582985353-83371-1-git-send-email-christianshewitt@gmail.com>
 <1582985353-83371-3-git-send-email-christianshewitt@gmail.com>
 <cc4c54c8-aa7f-8755-dc35-94e32d0019cd@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: meson-g12b-gtking: add initial device-tree
In-reply-to: <cc4c54c8-aa7f-8755-dc35-94e32d0019cd@baylibre.com>
Date: Thu, 05 Mar 2020 09:22:01 +0100
Message-ID: <1jftencity.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_002205_022275_B3B90002 
X-CRM114-Status: GOOD (  13.06  )
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


On Tue 03 Mar 2020 at 15:50, Neil Armstrong <narmstrong@baylibre.com> wrote:

> On 29/02/2020 15:09, Christian Hewitt wrote:
>> The Shenzen AZW (Beelink) GT-King is based on the Amlogic W400 reference
>> board with an S922X chip.
>> 
>> - 4GB LPDDR4 RAM
>> - 64GB eMMC storage
>> - 10/100/1000 Base-T Ethernet
>> - AP6356S Wireless (802.11 a/b/g/n/ac, BT 4.1)
>> - HDMI 2.1 video
>> - S/PDIF optical output
>> - Analogue audio output
>> - 1x USB 2.0 port
>> - 2x USB 3.0 ports
>> - IR receiver
>> - 1x micro SD card slot
>> 
>> The device-tree is largely based on meson-g12b-ugoos-am6.

largely indeed ... Would you mind pointing out why the am6 dts can't be
used and why this one is needed ?

Maybe I missed something but they look the same to me.

>> 
>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
>> ---
>>  arch/arm64/boot/dts/amlogic/Makefile              |   1 +
>>  arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts | 557 ++++++++++++++++++++++
>>  2 files changed, 558 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
>> 
>> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
>> index eef0045..1fd28e8 100644
>> --- a/arch/arm64/boot/dts/amlogic/Makefile
>> +++ b/arch/arm64/boot/dts/amlogic/Makefile
>> @@ -3,6 +3,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-axg-s400.dtb
>>  dtb-$(CONFIG_ARCH_MESON) += meson-g12a-sei510.dtb
>>  dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
>>  dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
>> +dtb-$(CONFIG_ARCH_MESON) += meson-g12b-gtking.dtb
>>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
>>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
>>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-odroid-n2.dtb
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
>> new file mode 100644
>> index 0000000..819f208
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
>> @@ -0,0 +1,557 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (c) 2019 BayLibre, SAS
>> + * Author: Neil Armstrong <narmstrong@baylibre.com>
>> + * Copyright (c) 2019 Christian Hewitt <christianshewitt@gmail.com>
>> + */
>> +

[...]

>> +
>> +&spdifout_b {
>> +	status = "okay";
>> +};
>> +

Again, not support by the HDMI controller and not used in the sound card.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
