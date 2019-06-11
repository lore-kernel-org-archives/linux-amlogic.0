Return-Path: <SRS0=5QiQ=UK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 864DFC31E44
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2019 23:21:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B6CC20872
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2019 23:21:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uvPlzCSV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="UjB91fpf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B6CC20872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gSBk+ftNabOKejo9+hdsUxBWX3tnr+2VOy94Gwxwpyk=; b=uvPlzCSVIzdPPB
	5DOn0qanxeGfDV9uDi3XrT6UEn4H5Tt5r4NTQxQHe63M+CgkXi3sniviEinENRh/TsqqgwEuOTBra
	1rAo7SNMd4rMPPez+e3zMp5p/xblloIsy+DsNXoxY9djpfKh/A9S3LFNzgAAacr0geQ+pAzUxwqeF
	u+mjfQAjW2kNdXzLQRQFLvkTrYRbx6gPEmmZPmenprNKjvQn4RtK5/IMrv0WHCAQTzP/LjmPrwnqW
	X6RvgjYgGJd1UzTaizpMHFtbyJrt+7mToU6HVUGzkfdUhyILF8+RHSLQcc8g9oBD3prxNfrohhSXB
	vTApiZs+NoIof5EHoXFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1haq5D-0007Ch-1V; Tue, 11 Jun 2019 23:21:39 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1haq5A-0007C4-0H
 for linux-amlogic@lists.infradead.org; Tue, 11 Jun 2019 23:21:37 +0000
Received: by mail-pf1-x443.google.com with SMTP id x15so8420378pfq.0
 for <linux-amlogic@lists.infradead.org>; Tue, 11 Jun 2019 16:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=6R5z8ssQN4qiGOh66dhDcOUdNqdVqqfHxJdMHqWe+6I=;
 b=UjB91fpfYVxjokEfklWaFtD6ieDpdjzJUDy2doUa03GNp+vrleOmMXp+3L0bglIZl4
 QfrTlKqAdgOa5u7GEqHAkY9gmpQ54qirFCrJxZWOgzvMbYy22//uWOtY+fnejFcy+Pgi
 wpqqoezOaW50ME7qgQhMeFk4SZ9XV4cj57rBGRy0aPoUjK27dKpiaBbUKmcpgBGsqms7
 oL9S/ldKM4kXj0n2a7K201mjCpdNItVSQP/41iYU4GTTjUNkTXU3VNz+oaKZNE9FUdmK
 w8B7B5Oxb7YfbEq6roMJ1EeFl9ufp8uFWJ8t8Dg158x9a/DFLOIjJ51iSOWbUGVj8kT/
 2Y/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=6R5z8ssQN4qiGOh66dhDcOUdNqdVqqfHxJdMHqWe+6I=;
 b=GIFp4TMpmJm2BXBV86e30RvxJvz1RK+XFXE6D5wSdeFNg9iSI5/4gUrLtXr00fiRUb
 iU7g+ZzCM35roan4Q2EuSln/BM/X0Yy0CSMf5CPVz0Kur8Ekl/NeTB/o0bOxKQ4wylei
 dpnjLq0T9VCOe5rCerZYChHiaIiinGEaFr0yzKfQ7aQr+ftx0yvDK+lNu65PU/LbEJUe
 lIt1Lrrp8uXVY2edui5TDoAMVaaGU0m1NcHo8xH7DIGuDTc1kNZi1uK7aVLeul58CUjK
 GvP+l49Xa1UiERakI2AxfqTOgXM0CPUphdUqLbvlipkjpWQHsVtuEmuYN8Y8+dLsCPZu
 N2pA==
X-Gm-Message-State: APjAAAVgJ+7+jq/Ks9SyyN+Arjk2WnNiEGnZpqH2bKG64wtNx77hhIRV
 dJ5gaycxkkwryW9rusV/r0gyng==
X-Google-Smtp-Source: APXvYqwJJDMRep94gko5n4JSC8Vapq9gZn4ceppzlT2Q9WhxcgWkcdYxSrkQpzkU6piKWsKdi83mFQ==
X-Received: by 2002:a17:90a:9b88:: with SMTP id
 g8mr3482693pjp.100.1560295295171; 
 Tue, 11 Jun 2019 16:21:35 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id 30sm1795537pjk.17.2019.06.11.16.21.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 11 Jun 2019 16:21:34 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson: g12a: sort sdio nodes correctly
In-Reply-To: <CAFBinCC4g1WVFyTgQrDUcYs13HDYp7Ggn=eSQ+X=LnpEoGg--w@mail.gmail.com>
References: <20190610124931.17422-1-jbrunet@baylibre.com>
 <CAFBinCC4g1WVFyTgQrDUcYs13HDYp7Ggn=eSQ+X=LnpEoGg--w@mail.gmail.com>
Date: Tue, 11 Jun 2019 16:21:34 -0700
Message-ID: <7hblz34sjl.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_162136_052492_C2B9B359 
X-CRM114-Status: UNSURE (   6.78  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Hi Jerome,
>
> On Mon, Jun 10, 2019 at 2:49 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>>
>> Fix sdio node order in the soc device tree
> good catch, thank you for fixing this!
>
>> Fixes: a1737347250e ("arm64: dts: meson: g12a: add SDIO controller")
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Queued for v5.3,

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
