Return-Path: <SRS0=XJ9a=TZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C01C28CBF
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 May 2019 11:09:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ED5B2085A
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 May 2019 11:09:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WEE0QZvu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="c67OmT7B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5ED5B2085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g8iN1V8ULoDm6RuEwEg5Pvgf0K45bWy52OzpxDGHwHg=; b=WEE0QZvunKcVfb
	509I3c7nH02aTpd2jHJBrwKPgy4opp9UpCOF7IBFfpWgZ0vxbd8NvSLO2UpE1UVZ48fCrZhe3qIAV
	jZzHxceLSk9MabdqnJz0N99QnXRV7s+m6Exx5TxlrA7ZMlO1TrOQgzgPjDFSTsI+7aAfpwrkUTv/M
	sgL9oxPbOVINgiHyl0qYHJUPWDo2WYDg1fzJlpd3h0VPiQ77UzAWFs1FZI1dj5KfkFTlz1Hc1xopH
	agUy1/6+UwDe3uWP4XTXJcNQb34OLr2NbYLOENrjh8PX8wJRc46VSP2iqSzva9IqSXwOF+evNF0T9
	0pNxfaiG3uCp3QcfohOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUUY3-0000dm-T1; Sat, 25 May 2019 11:09:11 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUUXy-0000d7-1h
 for linux-amlogic@lists.infradead.org; Sat, 25 May 2019 11:09:08 +0000
Received: by mail-oi1-x241.google.com with SMTP id q186so8883549oia.0
 for <linux-amlogic@lists.infradead.org>; Sat, 25 May 2019 04:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fa2wab8YpKsUwDpZ6LomoWPNcWTcG/N9TaMQ1o+zIL0=;
 b=c67OmT7BgSIatc+fEm5zkVjKvMjEwSFy5vAdHSlzMFO25BVsv0RZjruxNDkuzn2iLx
 klGHoFDq4TNqHvQ1LKtjckQh2sN0bJ1riF1s518ZE7aQtAZJT4/6SkFJcNS3hU6EJS40
 V3SrTBSGSQRf6tg3FUQmIJz6f5BJOLv6nGUUWxbqZpLyjO3b3QNugBptVaawlsUmjMb4
 tNmUb29hf5nj7bMpPfgbEkLEf1nQ2J3QSjxvQMQqZKA0+fVgzQx/mbzW9bfDLxsuEUrU
 YjN57innUMc3zgo620zmAMjqZPQ6GEhoIXqNGLnSaHAFhs+q1HQYUG/zq4T20X8MTle9
 jUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fa2wab8YpKsUwDpZ6LomoWPNcWTcG/N9TaMQ1o+zIL0=;
 b=Eb+1PWzBhlSGlBywlm2wtBehDBoH1nOTsiPgB5mqsncn5jN6qATqhjz3FWku7wEoRQ
 JHoUtv2wKQ0BrLQrgcZVOV0VnHqawq0jEJfhXFvirXzZUNRrW6fJyZQTfYo1WKPy8xz2
 GzyRCA/HCzwUMRxu3bhyU+9FWtMVU8TXezW5P0Qepj89fnhtF3eyMrkX34SLvh422fHk
 qITMlfVFJDk2b/W2f2k69Xxezew7M3tVX3BFhGUTBSVoS/d4YW87ShnUC70dHFgwXkRI
 fMjRop2i8sPxzivYQJaAJFe4P9nid5lGZIP0S/vg2KJK2wbAU5K8QCWijvfORJC5WF5C
 0ChQ==
X-Gm-Message-State: APjAAAXLQ8uh6yXv3t5lGmBYy2qq/Tpt9JPYsN6wN4i7ngnl7Qn0GWIq
 J2vT2NQVBM7tNFRL5rITK+W3ACq2RwsSIyY5wEA=
X-Google-Smtp-Source: APXvYqxC8ae50HwEo+Xc34XhxDEEcl6oJoQQN+XKJjwNIs/j8rmSnhxVMwtlaFf+eLf3WdRuGsP210KJP9D4bZIv480=
X-Received: by 2002:aca:ab04:: with SMTP id u4mr2626924oie.15.1558782545011;
 Sat, 25 May 2019 04:09:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190524091532.28973-1-amergnat@baylibre.com>
In-Reply-To: <20190524091532.28973-1-amergnat@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 25 May 2019 13:08:54 +0200
Message-ID: <CAFBinCADSKoDc3cUofAtFxDMeQ819FsXe=ULtCmn1g0drSmtTA@mail.gmail.com>
Subject: Re: [PATCH] clk: meson: g12a: fix hifi typo in mali parent_names
To: Alexandre Mergnat <amergnat@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190525_040906_138155_FA29865F 
X-CRM114-Status: UNSURE (   6.13  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, baylibre-upstreaming@groups.io,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, May 24, 2019 at 11:16 AM Alexandre Mergnat
<amergnat@baylibre.com> wrote:
>
> Replace hihi by hifi in the mali parent_names of the g12a SoC family.
>
> Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
this is "obviously correct" and double-checked with
buildroot-openlinux-A113-201901, so it's:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
