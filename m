Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACB5C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 21:16:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 133F7216B7
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 21:16:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V0ymt31F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1RqUfQjz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 133F7216B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YjGQpcvF3j5zezo4TCDwHyG1sqoHfbP3rZpCM3I6Ld0=; b=V0ymt31FQ7O+R/
	Xf5jR3aZouQvHOaewMH55I4MFFd70775/fJkFmddCOrpAln2kLrBN9SY7j77FXJcp/lsnM8K0BRJR
	j0mVW2X17XSBdyAsSoQJHRNJjG0g6Ekv6Tpt4tPhMRAg2frKUzFZvXMiItIs3upD7YACdC2BldmBR
	zkBXlEbF6SaeF6dHCDN80mdZ886pp5VbGSnLXfhvxUfvL2VpGMykAd3f6wmReKpcMYs2v2EzcWIqm
	P9G1IODLf5anH45b5n2gmsqNtrlF3WemCVGmOHrv8d0wpAmVO7uB4wKk3mg+uiPNlaOt7BARP+Ssu
	1LZ974hsbq5NKpJjdYYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSpeI-0002DO-0b; Mon, 20 May 2019 21:16:46 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSpeF-0002Cw-1F
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 21:16:44 +0000
Received: by mail-pf1-x442.google.com with SMTP id u17so7840438pfn.7
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 14:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=mSeWmAuOKlZVmpo2pczi5ZmRRFlzkHQwhkOlfdVHPfk=;
 b=1RqUfQjz3U6YoLJOOFgB2FdZaaMQEWRYLKKg4UDiBW+LDw81+lTqX3N0SidkIp5zCR
 nbuDu9D4+f65KyqesYzFHcrmL/Uk2swKnm37G9oiveD8Aao3tT7PeHfyxRmJj59Rd0r9
 J5+WUVAkF41l1EuEWZMqCP2EnOPUPcCuFUg+xdNOlM0juOESc2cH0h+jl4zVPa80h7t6
 ug6NNZXk6kg+TZdpV9SRwZQZSfJ7RmEaRCZb7JG2vSkWk8Pjz17BVAc/VnTDKewSuQv/
 Y8Ngygm52u4d7g9IYPGmlQUWT8xaHEC8zw5KF3V0QiI9GDT+SsyxZkO2OEIYwWjO1EHb
 jUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=mSeWmAuOKlZVmpo2pczi5ZmRRFlzkHQwhkOlfdVHPfk=;
 b=LF0c0X8tYnWzc9aNmnvY2wLtueWc7zInft2dexfIrlhZC9aJF3rNONwqneRmEgq6CS
 DJ12JTcU8nPX1PCbseRipum4jiE9TAnHkzP6uqoQXEK80JF/jvWU7JmXcXvotykgVHwY
 8zv3OoX2PpvLLhfd1FQ1z2BtW5uww5L1TGiN94jHQbGAWsmWeYj57bX5GnO6Xu4mH9WI
 4IYWvebIaWw8yMcFsdbXWCBXEtsvxpA2p8iEwO7/NRuU7ezexIXzAlJmLMHJTDdmESR2
 IxBsjbhhQbt+h828tsqz5V/zJXe94gZ8kVCBWzDH4PGyzq8Rg5uSYF+57lC/KmmwTA46
 Dnpw==
X-Gm-Message-State: APjAAAU2iZ6EvAwmzDkgPyUswhbdIWSuw09FBUBNSha1iIkUZD1/QnYT
 RNn3ZgRfHkcxWZPXcHKER9TxC0Oe2GmikQ==
X-Google-Smtp-Source: APXvYqxGMg21ATGkIdFaHGjIbfxae232bkGRG8oHvdyiiN419sfsu9Uihg4c/RC/H/TL6S4zC/VVMA==
X-Received: by 2002:a63:ce43:: with SMTP id r3mr2349874pgi.368.1558387002476; 
 Mon, 20 May 2019 14:16:42 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:e483:1cc0:e2c2:140d])
 by smtp.googlemail.com with ESMTPSA id u66sm21840095pfb.76.2019.05.20.14.16.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 May 2019 14:16:41 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: sei510: add bluetooth supplies
In-Reply-To: <20190516071355.26938-1-jbrunet@baylibre.com>
References: <20190516071355.26938-1-jbrunet@baylibre.com>
Date: Mon, 20 May 2019 14:16:41 -0700
Message-ID: <7hv9y47rnq.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_141643_072855_727CAC34 
X-CRM114-Status: UNSURE (   5.02  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> Add bluetooth vbat and vddio power supplies
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Queued for v5.3,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
