Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 161AFC43218
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 20:09:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D85CF20881
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 20:09:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SkjumZoV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ahByQctc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D85CF20881
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bBVxevj4kYbJjIckkUJRrAqDY5bWwz5ixBGgIbAnsug=; b=SkjumZoVlVKKpg
	p+nm4SvQkKLWErcuBZLakHmp/OK2Fe+3bfmrm6jxCsk0XDf3DIkM9EJDiZUsYy1ziWec/c+h2X/wZ
	EihaL0Lk5S2nPiXmX8YD4Q0aep96ZhQBgZb++yyrFgj0Ot7jEBH9rcVUkerBUxH1P9DNZSUaSD4aq
	qLPlZ5LK6ib+ZjocfBt5/ofsWCUuMpsN5zCAM/1C5stqNTOT71C2v1+Dp3gdn6fsKYX1p1PUEOTtv
	5btmIGRrdb2n4mUguZd28rEpwhlKguYpovriP7woxLV7USmCTZCF0+4x0/XQ9aD1gdI9m0aL4aEYF
	7LHi/5HMJxv/jXJXUpXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKTdo-0005nT-Fs; Sat, 27 Apr 2019 20:09:44 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKTdm-0005n9-7N
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 20:09:43 +0000
Received: by mail-oi1-x229.google.com with SMTP id t70so1160oif.5
 for <linux-amlogic@lists.infradead.org>; Sat, 27 Apr 2019 13:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hhsMH/X03raw9aMWA8APU3MELLU8bVy7VgvUJ5xTuQQ=;
 b=ahByQctc83TUY/CQh/dPlAaavJHHUyzHS85EJUSSaZs/0yKXkeaH+KC0K5EeJlmJlP
 /GnMqEVO/GvrdLsJ0x1xW461cPFCXN1k6KRSAU2GZJNpFYDZJfn4A4UoLNdbF5acfyar
 UaymDSi8P6LDrBAnvvqK8GQ/5Vt7kdhyhz+yvRvhdwUSwOOSVhfaafpzeZiCb67mi6j5
 YvyblL0MKBnXryvzfZe8Wlon1UnfUFgbP/HWh7ejJjiqBl/WPKk1z7K6Deg3fAci+ctN
 mH1w0W7+V6uQXw/uWu+CicN9AUQSLLCmeoKR9KQzqqmNvagiqkv1Bf2fsPF/v99XoS71
 f4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hhsMH/X03raw9aMWA8APU3MELLU8bVy7VgvUJ5xTuQQ=;
 b=ZTbZTnMt8ZlQh4BNF9vCeyDBI0SXtIeSKx7gxkTDlWW9NMNIlzShDYqjubR0qHX/tJ
 BvdXqI0QuHk6/yfIWPW67/wKVkv2FRaygOPmZFzA11iP4zF6U2qTBjbV68nHSLZ9w7J1
 kX+EdFLs+F/FB3jLf4Q71mdLXSBMQ2aZW3E6Hz7jDR+DkDlEydvxbm4uVaIMhi/O1LFF
 1DXnPj5UQokwO3ylU1F5WxuQL62v+IAf6K/U7QnqQmgcDe6GJ9Ud5oHRW+delBRmrned
 DFh1jYt+uIXXbM0BP5cdi2efacFixgDmgybWHJJfucWh1nEIZGqCKhyOtRgEEjUXlvN8
 RQxw==
X-Gm-Message-State: APjAAAVbgBDbVqZNVPFEKwHE+4RfLfAxnzK9B9rsCOejjOMkUD86Spk6
 exHdU9RI4nb2sdRZyGkvxKkUwif0LlxSnYc4X038OKtl
X-Google-Smtp-Source: APXvYqyw/N9NTESkuor+2z/IpAyy1XeCCxc+w0NMyAXNuozuD5lok5KS2ZvFbHDoVbRRbeeopt3j5qvzedSocw82urg=
X-Received: by 2002:aca:5b06:: with SMTP id p6mr10591975oib.129.1556395781412; 
 Sat, 27 Apr 2019 13:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190423090235.17244-1-jbrunet@baylibre.com>
 <20190423090235.17244-8-jbrunet@baylibre.com>
In-Reply-To: <20190423090235.17244-8-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 27 Apr 2019 22:09:30 +0200
Message-ID: <CAFBinCB4BC01=ryTPAc77RbKucMRhQNUN-9C++=pM_u=dFYK6w@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] mmc: meson-gx: add signal resampling tuning
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_130942_359880_D2B3C1C2 
X-CRM114-Status: UNSURE (   7.18  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Apr 23, 2019 at 11:03 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> Use signal resampling tuning for the UHS and HS200 modes.
> Instead of trying to get the *best* resampling setting with complex
> window calculation, we just stop on the first working setting.
>
> If the tuning setting later proves unstable, we will just continue the
> tuning where we left it.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
[Khadas VIM now shows the HS200 eMMC]
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


BEFORE (no patches from this series applied):
# dmesg | grep mmc1
(no output)

AFTER (all 7 patches from this series applied):
# dmesg | grep mmc1
[    2.945155] mmc1: new HS200 MMC card at address 0001
[    2.957737] mmcblk1: mmc1:0001 AWPD3R 14.6 GiB
[    2.966278] mmcblk1boot0: mmc1:0001 AWPD3R partition 1 4.00 MiB
[    2.976114] mmcblk1boot1: mmc1:0001 AWPD3R partition 2 4.00 MiB
[    2.986354] mmcblk1rpmb: mmc1:0001 AWPD3R partition 3 4.00 MiB,
chardev (241:0)


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
