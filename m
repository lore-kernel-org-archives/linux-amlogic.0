Return-Path: <SRS0=7uPT=WF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA4DC433FF
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Aug 2019 18:22:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34AED20C01
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Aug 2019 18:22:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QId9xKRC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DoZQM3CB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34AED20C01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5LU9bL6FZQAjzxvzVMvFvDu4xT2dehFbSiF2WiE8ZM=; b=QId9xKRCaRIknb
	4JZ4xxuCkNUNi+qsbpuOf2Qe3Z+jURe7xgXjCqritEmyjK2MIZYt629cCgaVPntYIrbGHUQUXHb4I
	naGgR9NROZmmrgxxTgU/YhvkDFHLc3hN+Y+T5nXgdNO/VZe1zJxje6sNKV7DmCIcyzlEO0l0AtF7m
	ixFIuzsyh5lsW7g+ORsIB36M38/h7bPSvdKRc2PiriF8Bc7+vouiP9bJnNuLQIVWileyvcMQHaSQU
	ye+D1FvoJrR7kgkii2e6tFC15yrLzbBEn9GHtQ7rP6fZaOLfbndToensY1bOzyRjgI4dyQrjhdjUt
	UGTvV36pKx1cYckTVSiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hw9WZ-0004VU-Kg; Fri, 09 Aug 2019 18:21:59 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hw9WM-0004KE-K5
 for linux-amlogic@lists.infradead.org; Fri, 09 Aug 2019 18:21:48 +0000
Received: by mail-pg1-x543.google.com with SMTP id d1so13427763pgp.4
 for <linux-amlogic@lists.infradead.org>; Fri, 09 Aug 2019 11:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=NoJS3EPA4E/Zez3LCtMYEWvxXoiMwupWncuL9aQv4k0=;
 b=DoZQM3CBR5/yXZ1WMe8/vQbS+GqyAmVL1BAEgCZz7s6gcMvJ9lvCGZh27xL4I98oBr
 UZpZv/EnPLXjGSuK+aH9AJCEEgoXXptR/WtBbhxqxjaDlsy+XLvZ+9gMAcpRyEAKU8iH
 G7NQrLUbsbIbeknuokH2wZBuy1TPlfCa9FDNxPHbC9W+hRDdDJDbl3wbMt7u+Bq3tuME
 2DMTxeA+rqV+2qb/ovRnbjOndxKjeuKWJVlKc3n9S/8CxnopAdDXLwfSe7t/B4W+O77i
 9STGtWhsZy8PRubMtpqDHycH0jJGdbAUfbWztJ9oeeXvd5SJi386nAeFHWfKHZGKSMZA
 KozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=NoJS3EPA4E/Zez3LCtMYEWvxXoiMwupWncuL9aQv4k0=;
 b=WGEclmJFrn1qi+dGPyGvjj/4z6i6PqyRztG9hJmZHJz5SOoiEjevt6a9XWcdAA8boZ
 7zhkv2jSdJofXaxF1MTsugTzTIDoPp6h4q0u8LrMs/DE0VJ9Ryp+h2XheZheEDR7Zz6+
 Ds5VVRcZCmZcPgSUS86IR9doHB5F4HIYdwos2GgHBRToNkLyLobSxexZ5T2gkIUucC06
 1519RrYOtTK5RmOIvPhjrmiHI7nswZJhc1j1GntOzJoOh5GK4iC2qKdw9LyPOYwdhbeS
 YMYHMF8NFhFln1BhU6mj/ZbDSnjXICn+RgrAqdGKrCYy2aQxlbkK7V9qCdjmlv/oLnU/
 JK9A==
X-Gm-Message-State: APjAAAUNLpjmEnh0RIpkoP5yqecTmUEnvEQZlbwS48plkPhzCvbsIxK+
 Yv+A3uvz+05mhOcwQ+PTjhhXHA==
X-Google-Smtp-Source: APXvYqyJVLva9n72E7jE6jYUxrqVOTKGDoQHkgCTXp4MT8/0tRLXX0iCYQKo/mt/9fdtrQTkogz0oA==
X-Received: by 2002:a62:ae01:: with SMTP id q1mr22290623pff.219.1565374905793; 
 Fri, 09 Aug 2019 11:21:45 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:b873:707a:e893:cdb3])
 by smtp.gmail.com with ESMTPSA id d129sm110949243pfc.168.2019.08.09.11.21.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 09 Aug 2019 11:21:45 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/6] arm64: g12a: add support for DVFS
In-Reply-To: <7hk1bn43fq.fsf@baylibre.com>
References: <20190729132622.7566-1-narmstrong@baylibre.com>
 <7hwofrh1md.fsf@baylibre.com> <7hk1bn43fq.fsf@baylibre.com>
Date: Fri, 09 Aug 2019 11:21:44 -0700
Message-ID: <7h1rxu42tj.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190809_112146_654842_7C790878 
X-CRM114-Status: GOOD (  10.70  )
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

Also now tested on g12a: u200, x96-max and sei510 boards.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
