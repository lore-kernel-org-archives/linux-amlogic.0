Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8BD3C43219
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 20:02:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 857E22064A
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 20:02:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GwgUgZ7I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="QYGEcdnS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 857E22064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nqs6s2ehBqhykkXDx7syx5aE2cNLLGMASZz3Wmbvf2Q=; b=GwgUgZ7I9T8aV3
	Ha6u91ljz7xxcngANF8Hh2wPOxYR/Z2pZVfh8hpi/n9V4orJSsDPJpnsYkzlxipVuQpw8/NImRSuV
	fgwEu7TCK2Si/Ld4OnFqMetLLVNBm1gPuJeb3OQIyq5uamQMCK/Aa+QF3r5bj5Bmp3hyTdOewz+bS
	I0sijJBmdWt3tdD+rRVyzfgyZA1CNXMKL0bGDLOKVT+2PppRf2PK5rQCSBSKDsaVIot/NKzw0c2zS
	KWNUUPfcMwLqETmAR7hONcplVdRBcFO/3bMDMNykvaLylIekvvFAH2Xde/DAR9xHJuAMvpx3fS0VD
	oGHmLv+jovhRyAg7Qutg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKTWx-0003q1-UH; Sat, 27 Apr 2019 20:02:39 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKTWv-0003pg-HL
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 20:02:39 +0000
Received: by mail-ot1-x343.google.com with SMTP id g24so901354otq.2
 for <linux-amlogic@lists.infradead.org>; Sat, 27 Apr 2019 13:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+DipmFp1I1M/+PsE+4WOzewTntx09YJZcDX8IcIeWLI=;
 b=QYGEcdnSBmMm7z7gJVr+Xlwl1NYqmWnEJqZWsU83NADpAN+7o1ub4UeyREQJyr0sjp
 1goWQ0mLzMv1A7cFcDzpiB4mLPf7UtxCA04sWAxw7ztvqPOB5KOyeP8fZXaqb+HsGoOL
 3u+Z0G4GUOtFqTWHnJYgwEtILHsP/2nxmhcxqM0Zsa/aZwwnjO33am1JzGEEDM4WMeD2
 FdPHoEnETQvYYPMEVtccOJ1GXolJNug1KFNqb3gcxWO2WCH9OSUxUMMe16l69FAYxzIb
 atNRN1TGQNUn9MQy2x5Yetr84FBW6FXPNUMuDTq6SPSfvLY+4nZ+EbP7rqob6xtI9c2a
 Ay8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+DipmFp1I1M/+PsE+4WOzewTntx09YJZcDX8IcIeWLI=;
 b=fkzkjzuIAZ0s+EcxTqOPZxcZjryUZPQc6+96XTmQd+nWVzILJPZpaag8fGgwBJ2yu5
 1EP91gIGozozcMQv4g1Idt8s63hZyfaL8M2d8//9y043qLbBCRN01bl4MPnLMTBJ6oYr
 6KDOzSRukvNC9hXgXk3ccaBUY5dfhvpPAkhI378dJ0EiRFIXi05NUlwHMFCBZfO9e7qS
 8ZoWaLJ7Jnv2i2ou1hWA7OB1Hp84bpcd/I86FsDJ086Vbf0WIRrJ70Vw/M26Gfnl6k4E
 tUn9+J6m40ObtqhKGcZsWbZ3g+tHr9d5HQ4CvuUzaXdUThSmdsIeZDz5WJmBNlvuCoki
 GHFg==
X-Gm-Message-State: APjAAAXxLNl3cIYmhnSxBZinDKhihO8SmOV8sXL4qtoDsawRJv0CKUXk
 5uhxgSKyImxLoYzEZg2OaT/kQ3rpugrVTgXgav4=
X-Google-Smtp-Source: APXvYqyWFBsHpiYMrNgURil0/MoUn5q2xT9KRfhqcd1xxDnVzpyel0AJfWbDBjMiL7yeWZzq/nndt2iC6mceML6bQOo=
X-Received: by 2002:a9d:76d5:: with SMTP id p21mr31464805otl.308.1556395356561; 
 Sat, 27 Apr 2019 13:02:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190423090235.17244-1-jbrunet@baylibre.com>
 <20190423090235.17244-5-jbrunet@baylibre.com>
In-Reply-To: <20190423090235.17244-5-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 27 Apr 2019 22:02:25 +0200
Message-ID: <CAFBinCCf8fkBPR5aoPMensjhYKpan_UzG+HCEB5yNaYs+mB8OA@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] mmc: meson-gx: disable HS400
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_130237_602890_0E626C0D 
X-CRM114-Status: UNSURE (   8.64  )
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

Hi Jerome,

On Tue, Apr 23, 2019 at 11:03 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> At the moment, all our attempts to enable HS400 on Amlogic chipsets have
> been unsuccessful or unreliable. Until we can figure out how to enable this
> mode safely and reliably, let's force it off.
last year I have seen issues with HS400 on my Khadas VIM2: [0]
have you tested all other patches from this series and HS400 is still
not working for you?

I'm curious because this patch is early in the series and all the
tuning fixes and improvements are after this patch.


Martin


[0] http://lists.infradead.org/pipermail/linux-amlogic/2018-January/006251.html

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
