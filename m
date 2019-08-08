Return-Path: <SRS0=t7Bi=WE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB0E8C433FF
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 23:56:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDED0206C3
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 23:56:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ion1pfvd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bs5i/HLm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDED0206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rgIM68b8+xvku2PfyxjeQ+3tp4wU6i+uxojLD1uk5Xo=; b=ion1pfvdBjMQKm
	yPrsP8OoXvZ/EgY7Ry+Q1F9DyKOu1+PkMykHL2d41/STghviqEkpJeb5aCB5rqvIZ8wzIm4K5UMOW
	tnHO4X8Y56PbTS5xsNalLDnjif7Wyc2AqlAYW+utuExqW0xx01fXNlV3JJd3cq6aWZdjS22MBV5M3
	exBFMlW34YF6A01gJTNe1ImSWExKvzw9uru3Vl5sbNmD/jwz1P8FnUeItNb299qiH0c3qoPZVsuGH
	huSvi48ZmpsP7Y0aCS/8xVUAzegjt/MNWSPLbFc4IvPFprAgY8nJa4AGLkLhig0Bh7ofDFSWRTjxd
	OpmPqNvz9BX/kST68a6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvsGb-00040Q-7S; Thu, 08 Aug 2019 23:56:21 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvsGQ-0003pW-VM
 for linux-amlogic@lists.infradead.org; Thu, 08 Aug 2019 23:56:12 +0000
Received: by mail-pl1-x641.google.com with SMTP id m9so44045652pls.8
 for <linux-amlogic@lists.infradead.org>; Thu, 08 Aug 2019 16:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=biT4M0YoucThQSlA/K5VgSiTRUXRF7LeVpBHBAObouA=;
 b=bs5i/HLmqpFLNfigz0Plz7De8d6lkN6hXwBWct8V8PSzTT1gZmybZTTSaBX2gcQz1v
 v+7+2uQleyUr9NGkcELJe3PZuhNx3AsEC/S1wtLUp/oqgHJGfSCL+kZAfe403EZ0iOCe
 azgHd3tVGBsX1d6DBelSeXFm62Bh1g95sWpPcBua8YwMfpdyLVBcgR9LF76ZyhwBxF3m
 C24AakAWdz7BY4zFnxV4GkBN9U6qMBYkKu9X5km6u7ECs7tXBSzZZ4Qk/ZLt5264adm6
 MhUQF+1Slcha3iS9i5kCM0BIBkkTfEW8+DF8B6M3mEy55X1AmkuKRcgq8LX0XDlU8PDS
 UFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=biT4M0YoucThQSlA/K5VgSiTRUXRF7LeVpBHBAObouA=;
 b=bKQQvHb1OeMFwv4zabzg8IqMEThjY8h9CiEDJEA8yFXpzQJuoXdVVBo9r2tY4lT+yv
 zQzLPzLZ3DRKvRwoEmcG/nrpK9y9xLi0eN4EEyC9ngsI9pe9qm2iOHufe+hwrncYc3Yj
 U+ZWzqfBpkg0mUfzL+L3ELAZJA/qN+NrOwjWK5LhHBcx+/20XkZzVa2YgIBR4vEb5c9j
 X+meJb2y7YgjKLuONK6pGr6M70SQJ9sItFAhUutDtkpZInJ5uFrGl9YNBWcPHrBLn3QA
 FBN4SgfWY+4lB2JeLnBzLKmnsCAM45iSQFG4L7aVUehSm33Vym/4B7XIbmpdppZY3/8k
 H0xQ==
X-Gm-Message-State: APjAAAXsJ4tqTvwnM/AhSD++kbNzO7kcTxb5ZVRxcDeYEYSnsCuROpTc
 oOlEXuV6B8qddld55GuymeruK1xd9TyfCw==
X-Google-Smtp-Source: APXvYqxps1OkwzB/X0vvisKNGQAqs8R5cKyD/OoIPRFmJS3FKuqkJGigsszmdTGeScs7OS0FWzmHGQ==
X-Received: by 2002:a17:902:b713:: with SMTP id
 d19mr16472342pls.267.1565308570262; 
 Thu, 08 Aug 2019 16:56:10 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id h14sm126117376pfq.22.2019.08.08.16.56.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 08 Aug 2019 16:56:09 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 0/6] arm64: g12a: add support for DVFS
In-Reply-To: <7hwofrh1md.fsf@baylibre.com>
References: <20190729132622.7566-1-narmstrong@baylibre.com>
 <7hwofrh1md.fsf@baylibre.com>
Date: Thu, 08 Aug 2019 16:56:09 -0700
Message-ID: <7hk1bn43fq.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190808_165611_006844_0314A3AE 
X-CRM114-Status: UNSURE (   9.77  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Kevin Hilman <khilman@baylibre.com> writes:

> Neil Armstrong <narmstrong@baylibre.com> writes:
>
>> The G12A & G12B SoCs has kernel controllable CPU clocks and PWMs for
>> voltage regulators.
>>
>> This patchsets moves the meson-g12a.dtsi to meson-g12-common.dtsi to simplify
>> handling the G12A & G12B differences in the meson-g12a.dtsi & meson-g12b.dtsi
>> files, like the OPPs and CPU nodes.
>>
>> Then G12A & G12B OPP tables are added, followed by the CPU voltages regulators
>> in each boards DT.
>>
>> It was voluntary chosen to enabled DVFS (CPU regulator and CPU clocks) only
>> in boards, to make sure only tested boards has DVFS enabled.
>>
>> This patchset :
>> - moves the G12A DT to a common g12a-common dtsi
>> - adds the G12A and G12B OPPs
>> - enables DVFS on all supported boards
>>
>> Dependencies:
>> - None
>
> Not quite.  The last patch to enable DVFS on odroid-n2 has a build-time
> dependency on the clock series that adds the CPUB clock.
>
> I'll apply the rest of the series to v5.4/dt64 until there's a stable
> clock tag I can use for the clocks.

In order to test this, I noticed another dependency needed for the PWM
regulators to work:

   https://lore.kernel.org/linux-amlogic/20190729125838.6498-1-narmstrong@baylibre.com/

With that and the clock deps, it's working well on my odroid-n2.

Tested-by: Kevin Hilman <khilman@baylibre.com>

Thanks,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
