Return-Path: <SRS0=ef8O=S7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 103AEC43219
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 19:12:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD5B720675
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Apr 2019 19:12:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J6/SRYxv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VaHFRdDR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD5B720675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u/09FBhw8BzoC8NKZXHrlTDYuOGJ2cLBZSvDzYrrmzw=; b=J6/SRYxv/E4LgQ
	H43zL7Yp1ERO6sShqGy+gSI7MCerPb8ll8odhOnDdHqYkximwmAYcP395HI5p0XGeOzXKCH00TCVt
	NQBGrePhfl/xC4ixEZ8VY3LzxGboL+iSPevog8rKGlI3ABJUrIP6CQ4dAtTGVzL5f8Lg/YHprQZXv
	MtsrudCzkle1GoABJlLEsO43E8IWGUhBHoIlqTCYECU9kP1rZ54W1b9UjwRcx1Pnb42xAWFW4txJo
	pLyaTcAbzI9q1Yvz15kMq7OskJGdK/z9kG5e3psW58GO/O3LiH4qE6pR4EkoalJIe3wWZZ/oPMI9O
	eMieAbcF8Oa8B6HDRUDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLBhs-0005H2-Lx; Mon, 29 Apr 2019 19:12:52 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLBhp-0005GL-Iu
 for linux-amlogic@lists.infradead.org; Mon, 29 Apr 2019 19:12:51 +0000
Received: by mail-pg1-x52a.google.com with SMTP id j26so5617438pgl.5
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Apr 2019 12:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=I+Vwh+aj8i01Aoc1va0F0AKmwtckh5pIZyNVc/ubEjA=;
 b=VaHFRdDRj6eJOVFiKIr/NRI/A3CmYY51cWuDmljwcipcSkk9RAX15gqcfXiWrJl1Ru
 emAWKKzrlBq+t8cdY6lOPlvKuq3yhDe7dKqtfcJXJG3iys7N7On6QtchJm/gBaigOn8E
 LwY2bdmB7p7Nn3i8xS6ycyXdP/LyEzqyT573AQBm8ONdienOep0ZnsZ6S9qc254wr4f3
 hH0QJ0QYBrYth5M5Q88XC/GrGyd00QjVFh23+P0Fgz/vKAItIGfNfvMtAaiz6J3MFlNT
 QVJhZklgjYiuw1U3U7svnW9w97PB6OBuF77wY8gVWDYpM8mv02iXSi3cLzlhH22xbnC0
 x7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=I+Vwh+aj8i01Aoc1va0F0AKmwtckh5pIZyNVc/ubEjA=;
 b=KD5hi9gc4z+txBAfJSPtGe+nEhgPKmKfFsKsDYsX5Y7rbI0DlOkceh/f40+mFd7mHV
 LBhLOdaZxG1CZ0qE6EtUfTP3pvOX1Fbm0K7c60+TpLuIHv+msJxus/ytrvCeavbIizuN
 T/5aeCP9fYrt6PCFVLj/v9foTO5qtgt0HIS9yn8+UQTb3cogntMhIinRVbAoE7gHaPQa
 n+X2YQdzl0jT9AfA2mUJZyabZEpMWjP+V0NCL+zowQR2689tpsLsFQGhBPETNs7/cd3K
 5t7y8VbRwjwBHHrdWwZ/sVLGrmave6mmFWpuighXfnwE9zj9zDKOz1cZ5WSaHLei/Ef0
 0d/A==
X-Gm-Message-State: APjAAAV8GfANlA607bH+hg4YkLDAt+QDL4eYZGu4/QSMjy9nINojBGjO
 +0dAKdDKBBvzUFVwa8EV+yPDHg==
X-Google-Smtp-Source: APXvYqwfpP13ENa3/d3PDzljfX3CD44ZmLJDWwRIZ1vdZggbfqA1LXOkJGHBQJhUusCrVAuzyQhPGw==
X-Received: by 2002:a63:8242:: with SMTP id w63mr12207839pgd.169.1556565168285; 
 Mon, 29 Apr 2019 12:12:48 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:f580:39a4:9be7:1974])
 by smtp.googlemail.com with ESMTPSA id
 q128sm51546066pga.60.2019.04.29.12.12.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 12:12:46 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v2 0/7] mmc: meson-gx: clean up and tuning update
In-Reply-To: <CAFBinCBGU53h9063jj8n8q3whT=eZ9y6MPaYYqU_K9UXssK_nw@mail.gmail.com>
References: <20190423090235.17244-1-jbrunet@baylibre.com>
 <CAPDyKFoQyPKERckAdU+kkw3go=161PWc+5GAkz7y=xWMGbq+SQ@mail.gmail.com>
 <CAFBinCBGU53h9063jj8n8q3whT=eZ9y6MPaYYqU_K9UXssK_nw@mail.gmail.com>
Date: Mon, 29 Apr 2019 12:12:46 -0700
Message-ID: <7hwojcr5g1.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_121249_626303_7F02BB58 
X-CRM114-Status: GOOD (  13.14  )
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
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Hi Ulf, Hi Kevin,
>
> On Mon, Apr 29, 2019 at 12:45 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>>
>> On Tue, 23 Apr 2019 at 11:02, Jerome Brunet <jbrunet@baylibre.com> wrote:
>> >
>> > The purpose of this series is too improve reliability of the amlogic mmc
>> > driver on new (g12a) and old ones (axg, gxl, gxbb, etc...)
>> >
>> > * The 3 first patches are just harmless clean ups.
>>
>> Applied these first three, postponing the the rest until Martin are
>> happy with all of them. Thanks!
> thank you for taking the first three patches!
> I am fine with everything except the patch description of patch 4 and
> 7 as noted here: [0]
>
> Kevin, can you please also have a look at this series (if you didn't already)?
> you reviewed earlier changes to the tuning mechanism in this driver.
> it would be great to know that you're happy with these changes as well.

I've reviewed the series, and am happy with it as is, including the
changelogs as is.

Ulf, for the series, feel free to add:

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
