Return-Path: <SRS0=cBSj=7B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23112C433DF
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 May 2020 23:42:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D70D020809
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 May 2020 23:42:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WPSZnhMG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vTfMJ8Pt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D70D020809
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=WOz1uG8CoUDKXLiOf6gC7MhLRuxgM3yLvIYQxuIhmd4=; b=WPS
	ZnhMGIgbksZq6bargazoJh0L0RXoF2PxsW2OjmF0z+QiCFY8NZPkB1WsSPUYwpy4Bo5sW0BRjIOub
	UmKb2szgpC+0TT9rgM3vjgBtNps0VST3xeV1GQtg48J7rhOsJU9O5sKYcsze0IixNwVqUUjZ6ELPI
	S+WKejDWTfLGMpprZkIcWmHmsynxtj4GKRNGSGHGXAZtYdDkaAZwKQGRemKACpUeRRHN/hHZzQ9Gm
	o5aFRzmMkbdzSiDF7+3cjB9P0+c/ehlLRoJfcO6PaNO782WAMJJgLZMhl+VmbElx9M20leKxkZcNB
	rQn68zmyLn5wBavVwJZAzjHnnnKVt+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbBsi-0001dm-R8; Tue, 19 May 2020 23:42:44 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbBsf-0001cc-9L
 for linux-amlogic@lists.infradead.org; Tue, 19 May 2020 23:42:43 +0000
Received: by mail-wr1-x444.google.com with SMTP id 50so1214771wrc.11
 for <linux-amlogic@lists.infradead.org>; Tue, 19 May 2020 16:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:date:message-id:mime-version;
 bh=MmIqjO1PtTVd+rdNu9nNb4mADvKA71b2ZrcUks1uRJo=;
 b=vTfMJ8PtHJc/TjzQRTrRhPNVRyHHYycwdoNu7rn6SwqPvWLZ6+03X7Pq1xlTAqKfbq
 pSkz8erEmZbl5NEC7ffg1vjDBeV91vWIi/UpMblVVUXG7fICkxan3TIDYjBEiTzCKrUw
 qVb0ilGsCIYZu/z62LoRz/O/WEvNJUKhVB5XjQyTGwvbc4x6bXh9Iqiq500D+DFFVuBw
 XiFkgIHC3IELUdOO7nHfyfTiYvRDM/6Gaj0O0ZJynaFsDQR93goRr1Ox957iafchATMC
 74fwNFO/J48rEQSFBTg7/aNrT89cUvNxZYrb076WOjRmwcY4hot6ljnVFsjINyEJnk9s
 Q7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:date:message-id
 :mime-version;
 bh=MmIqjO1PtTVd+rdNu9nNb4mADvKA71b2ZrcUks1uRJo=;
 b=R7NCVv4BRZFkeGa0lgWuaTDgu8vqtbzr1irsvoACwWCD/82of+zpq4R8BADok1oPmR
 758T+iqQFj0B7xj8I3eJ+GsdExjXpX0uoVa7ogD0nE9XbKOrQurKXbxeALvJaur2zf/S
 JAvZSV/7unax+gLaN7vQRKgYb5JmgLQZbWVwDynl8vlkLO4EatfRkR9zWihrVXOsjLoM
 68FKaYa8bGsslx8OhIUCeMdvV/w5Ln1a8DO7Qaeg2sW9wiyj4rCu54ra/W5dgb91gbo4
 2ejs8U3TTPcSe6YAEL8t3M66i/9Mrf3KDOS+V5JIpA55k165TT4WR1ZkavbucLpHlNFz
 9jUQ==
X-Gm-Message-State: AOAM531wRKp1xYJX91au1qyYk/qYG3X37e0z6FeMgMSbfZRCNbal4lXG
 ipg2OjN4tId5ouMiahkeuaar2w==
X-Google-Smtp-Source: ABdhPJzYYXY2GYO9fXGwE5+SEib2GsKVQjkMTferPikSHMR/G5SF/9GqcN7uN6IzDDLc5LOSCjL3Dw==
X-Received: by 2002:adf:f102:: with SMTP id r2mr1249229wro.376.1589931759860; 
 Tue, 19 May 2020 16:42:39 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id n17sm1010174wrr.42.2020.05.19.16.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 16:42:39 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] arm64: dts: meson: add W400 dtsi and GT-King/Pro
 devices
In-Reply-To: <20200518023404.15166-1-christianshewitt@gmail.com>
Date: Tue, 19 May 2020 16:42:36 -0700
Message-ID: <7hmu63trtf.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_164241_327144_C9228469 
X-CRM114-Status: GOOD (  11.50  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Christian,

Christian Hewitt <christianshewitt@gmail.com> writes:

> This series combines patch 2 from [1] which converts the existing Ugoos
> AM6 device-tree to a common W400 dtsi and dts, and then reworks the
> Beelink GT-King/GT-King Pro serries from [2] to use the dtsi, but this
> time without the offending common audio dtsi approach. I've carried
> forwards acks on bindings from Rob as these did not change.

This looks good to me, thank you very much for reworking into a
w400-based include.

Unfortunately, it no longer applies on top of all the other stuff I have
queued for v5.8.

Could you please do a rebase on top of my v5.8/dt64 branch[1], and I'll
queue for v5.8.

Thanks,

Kevin

> v3 - amend author full-name on bindings patch
>
> [1] https://patchwork.kernel.org/patch/11497105/
> [2] https://patchwork.kernel.org/project/linux-amlogic/list/?series=273483
>
> Christian Hewitt (5):
>   arm64: dts: meson: convert ugoos-am6 to common w400 dtsi
>   dt-bindings: arm: amlogic: add support for the Beelink GT-King
>   arm64: dts: meson-g12b-gtking: add initial device-tree
>   dt-bindings: arm: amlogic: add support for the Beelink GT-King Pro
>   arm64: dts: meson-g12b-gtking-pro: add initial device-tree
>
>  .../devicetree/bindings/arm/amlogic.yaml      |   2 +
>  arch/arm64/boot/dts/amlogic/Makefile          |   2 +
>  .../dts/amlogic/meson-g12b-gtking-pro.dts     | 125 ++++++
>  .../boot/dts/amlogic/meson-g12b-gtking.dts    | 145 ++++++
>  .../boot/dts/amlogic/meson-g12b-ugoos-am6.dts | 410 +----------------
>  .../boot/dts/amlogic/meson-g12b-w400.dtsi     | 423 ++++++++++++++++++
>  6 files changed, 698 insertions(+), 409 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-w400.dtsi
>
> -- 
> 2.17.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
