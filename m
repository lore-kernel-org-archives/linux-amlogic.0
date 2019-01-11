Return-Path: <SRS0=DVbv=PT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E41AC43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 01:19:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1F9F20872
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 01:19:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iTgiiW/0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="2FcMdIQY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1F9F20872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nb/W0QgT59T0QTyP0TeqDazz29vGOadEA9snLSqD5aU=; b=iTgiiW/0Fl1hSr
	UkMVsfQtUZkivPT24nZook4rFXH6TWqoeuOx5hktRsTK44eZZ53leBmqnrVZyvVvk8qdM+PwkB5ck
	K3i7957p94SmwD73E4KrElPxwRxrZkU8VO0T1iVBDtEaWfD7jSJzWBPtdTswNJqMOBS5BY1gPSPbV
	66x0RfYPHwlCtbBGmM9DDAjet6SS2Ju+aFQd6k4CBx+AR2bwTGWwrlUnE3RcO7NSaoULFRaeEicr/
	rcMCSOgTjJEDQP00SjCU18gqlek8EJYzPcI3HrY/AVKddZ/rAYabdaW0DLuzmlXoshacWzUeaI512
	7Wh2jLaC83UleJkaxLJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghlTT-0005Wg-R8; Fri, 11 Jan 2019 01:19:03 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghlT3-0004yN-QD
 for linux-amlogic@lists.infradead.org; Fri, 11 Jan 2019 01:18:43 +0000
Received: by mail-pf1-x443.google.com with SMTP id c73so6116128pfe.13
 for <linux-amlogic@lists.infradead.org>; Thu, 10 Jan 2019 17:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=PdFKV1KT3Neq0x9XFt7j7MB+9Y5E+sjJdGX4nWC217o=;
 b=2FcMdIQYFYVpyDlOJSYBN3FyLjLXakq71Ju5sgmV2QIYdj4c/vLIV903fwtaWKhlDN
 Uh0AxG6JFMfQPcO/seLY51abwBKz0p7B9xEjswovQJUc2ZvEElvOlcSoFVckvl+d12Cq
 mceH5Zn+BVxuSThy+HEp05U0SoQjBgaK7AXU47otd0cj3qxob1xqB5hou3BE/LQyheo0
 33sfESGp6A8sTrNOtSjH72itm7Z4twTDLIZVr8QopWFZJioEUxk0c25iVl3RXLW5MIJ1
 mVgRXAV0akzU1URYC86tKPCTh3MZSwLdChHLv22C7DitQWJ5lXWX+jQGiAwqrkGn4bnZ
 awXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=PdFKV1KT3Neq0x9XFt7j7MB+9Y5E+sjJdGX4nWC217o=;
 b=OxAGIB3kPI+wBBXmSQbpVJaQEFyZn8YwCAYeD0/XNG8P9AvcukOZNQmc817JbfsJVj
 gLQaH3NCY+xXCPgfpO//KIuhwPMXX/h4i2jjJv+JCSaKE3+0iLfhqm2ubsGqTWHmzGRb
 uGEwEyMmqdR3XefU0guS7v7p4g3FQdvqhQm14cseqNXno+Hp3w6KiI+L7u6Nu3qopJmZ
 Gjv76XsKGtIJoFec+xxY2nzRhK4PsUImwnjjyBY5SmswuRyN8ImQ2uByDlvr8BWkVfbn
 n5vLujY/7ZkbOMqUqrlc198117qv2LGKeTW11hmGRJ9si2k6noZvZgDc9tbrvYRbnps1
 nRTA==
X-Gm-Message-State: AJcUukefh9TdyQn27b/RrgrR0imXhdWXOWvMjbOMz3ofL1ULQyseEZJE
 zEFeU9vlUMtgQaY8DL/x3/MipCqX7Hs=
X-Google-Smtp-Source: ALg8bN6axzqsgERZKU63LGGSZAcaAO0zyWxhNsChPHZgxqtArfSmr1l12BAtv928Jsy1NnkM46hvzg==
X-Received: by 2002:a63:77ce:: with SMTP id s197mr1396406pgc.89.1547169516617; 
 Thu, 10 Jan 2019 17:18:36 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.googlemail.com with ESMTPSA id
 x26sm112702953pfn.50.2019.01.10.17.18.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 10 Jan 2019 17:18:23 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linus.walleij@linaro.org
Subject: Re: [PATCH 0/3] ARM: dts: meson: fix SD card cd-gpio (pre v4.21-rc)
In-Reply-To: <CAFBinCCpsy40NuB124TqDUWy9zogeMrLsCGCanbbvpfd-yVDdQ@mail.gmail.com>
References: <20181229125711.5205-1-martin.blumenstingl@googlemail.com>
 <CAFBinCCpsy40NuB124TqDUWy9zogeMrLsCGCanbbvpfd-yVDdQ@mail.gmail.com>
Date: Thu, 10 Jan 2019 17:18:16 -0800
Message-ID: <7ho98oouuf.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_171838_522575_C1A7385E 
X-CRM114-Status: GOOD (  10.11  )
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
Cc: linus.luessing@c0d3.blue, bgolaszewski@baylibre.com, balbes-150@yandex.ru,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux@roeck-us.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> On Sat, Dec 29, 2018 at 1:57 PM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
>>
>> Today I noticed that my Odroid-C1 doesn't see it's SD card anymore.
>> My board is not the only one, Odroid-C1 on KernelCI suffers from the
>> same problem:
>> v4.20-6428-g00c569b567c7 still sees the SD card (mmc0): [0]
>> v4.20-8955-g903b77c63167 doesn't see the SD card (mmc0) anymore: [1]
>>
>> My Endless Mini (EC-100) is also affected by this issue.
>>
>> a git bisect run points to this commit:
>> 89a5e15bcba87df5120d4656e0ff33d4f7cd6152 ("gpio/mmc/of: Respect polarity
>> in the device tree")
>>
>> and indeed, reverting it makes my Odroid-C1 and EC-100 see the SD card
>> again.
> I started a separate discussion for that topic on the linux-mmc and
> linux-gpio mailing list for this topic: [0]
>
> comments regarding this series are still welcome!

Like Linus mentioned, fixing the DTs is still important, so queuing as
fixes for v5.0-rc (branch v4.21/fixes)

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
