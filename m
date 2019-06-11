Return-Path: <SRS0=5QiQ=UK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BF1C31E44
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2019 23:32:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5987A21721
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jun 2019 23:32:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SRM7diky";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OWHL9uXM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5987A21721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=psMy5CG0LOZU7fhOFxI+tkfU2LyVh/AiEIOzMpPJXVo=; b=SRM7diky/igjz3
	0MZcLtV83A+cZAlkNkc07of+iVMx8SJRJodATPJKDpoRKJPn352w3emHnPdDGQXDB25UDg9BRyAo7
	rJ6Ys4SQjzlEZZ+U2dOWC5sk4thYkrW5fPDzwGAiAa/1deZ/H0Nvu0UraqDZbfBLEbveyTAnBxK1K
	P0NICECF8SXXXRi0yjyVjvR0VHajEAc2bYI8iu1/fvDspUWNePayj1CWBVZBrZUUsapV7SPZqO13s
	E3PyHNeWV4IahY8LvYqwoNUGMW6tkGAhQFUWcBX8HXoZuE0Z1G4dPHqu6Kp1QyYMmVnfdgJnTQioa
	e8WDSiKPTHuQx0zBk8GQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1haqFS-0002vl-FT; Tue, 11 Jun 2019 23:32:14 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1haqFQ-0002v3-1d
 for linux-amlogic@lists.infradead.org; Tue, 11 Jun 2019 23:32:13 +0000
Received: by mail-pf1-x442.google.com with SMTP id a186so8402682pfa.5
 for <linux-amlogic@lists.infradead.org>; Tue, 11 Jun 2019 16:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=n4utO1qIjYj4MGuS7hIfGXs+tpiAYsWzBnQD5g4fpBU=;
 b=OWHL9uXMvXBp4WyP6XbYf8ngdd9BOGYtfKlznowe2eZXC8BTT87VlB0/rYBBnjrDKD
 pvCvc3dKtXEt2ccEl+5tO3LuvjVUteL52BK0k4m/G6hGBfSyL8JdLtXGCfGhVgHD5/hZ
 zXTEVipfe5LP1ChUjH+6SDLz2sScHI72x/NfbZmtV1mznhwunG7ogeC3xqpQwsRHsAud
 Lr6bHi0YxzMX7vIUYMvbbg/Bvcxz7PYvRK3hGd0DnhD285skUhCFS+YNvY6WycsnwuwC
 SLC69nfTolSPUMIXbkdaINLayG9V2CC1rDYPMC2S1/r0245/ibabd9IxaQCT86cP1u2D
 irpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=n4utO1qIjYj4MGuS7hIfGXs+tpiAYsWzBnQD5g4fpBU=;
 b=gTuuCVAyWW/NvVWo0ywuStKiXxVXDQ60oem03RGbMKde63DfGijWGkXoglJzx2Ov1h
 Fb2R855nQVvky3TfN+G/e7LZETET5v9YuqKOQ/m30HuA6dmgdzJa1f0+nlTWVFCX6zK0
 1a5Z/aYwoeMy7J2Xtbx6zAaBjBAn7RzCXZr/eVF9LUW/rx3O5mTaEwC8KZTWHo4PAEh+
 c2m3qPcCDK5Qu15IWPX17S4RasHTHuOboKDHZhp5G/z6NgHi7Gfq2Lw3YjNRUxqUAb7R
 tX4wrPTFL1FAjePv2jwwUMOXW52o5HR3kqN5O1sX/oyIvcRgVvUx0FH6hhI+WF5Mavxm
 jOog==
X-Gm-Message-State: APjAAAVZ5cmG3VFL3HI9/wVlrJsmsWaLrOXlI9k73kBvHPyjT4ZFQmyv
 ErbY29AeNUEIFG3mXnNKtkqg0Q==
X-Google-Smtp-Source: APXvYqwWX/bN3QMS+ZSVHnHRL4KnDn8A/IIaaCNAM7jGCzy6OnJYRwGBmJaNVgi34cIXq1tip8qnTw==
X-Received: by 2002:a62:d0:: with SMTP id 199mr51540334pfa.253.1560295931319; 
 Tue, 11 Jun 2019 16:32:11 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id w36sm14250463pgl.62.2019.06.11.16.32.10
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 11 Jun 2019 16:32:10 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 0/4] ARM: dts: meson8b: add VDDEE / mali-supply
In-Reply-To: <20190525190204.7897-1-martin.blumenstingl@googlemail.com>
References: <20190525190204.7897-1-martin.blumenstingl@googlemail.com>
Date: Tue, 11 Jun 2019 16:32:10 -0700
Message-ID: <7htvcv3dhh.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_163212_089033_5C49A7B1 
X-CRM114-Status: GOOD (  11.36  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> EC-100 and Odroid-C1 use a "copy" of the VCCK regulator as "VDDEE"
> regulator. VDDEE supplies the Mali GPU and various other bits within
> the SoC.
>
> The VDDEE regulator is not exclusive to the Mali GPU so it must not
> change it's voltage. The GPU OPP table has a fixed voltage for all
> frequencies of 1.10V. This matches with what u-boot sets on my EC-100
> and Odroid-C1.
>
> Dependencies:
> - compile time: patch #4 depends on my other patch "ARM: meson8b-mxq:
>   better support for the TRONFY MXQ" from [0]
> - runtime: we don't want the kernel to change the output of the VDDEE
>   regulator to the maximum value. Thus the PWM driver has to be able
>   to read the PWM period and duty cycle from u-boot. This is supported
>   with my series called "pwm-meson: cleanups and improvements" from [1]

Just FYI... unless I hear otherwise, I'll wait for the PWM cleanups to
land before queuing this series.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
