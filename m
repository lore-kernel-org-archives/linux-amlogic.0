Return-Path: <SRS0=b0VC=J2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2615C433B4
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 20:47:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59F5561424
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Apr 2021 20:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59F5561424
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cok1Ru4aEyhKjybdGTnOXFIaF0QbBkf/wQ7anzxSV1Y=; b=aoCts2iXTb1Ew7Ez89GM8jI2r
	O5yMXBwVRmtS5XHb7j33Y7Yztr/k9F0dbBSt4eHwC/srivBZa+sjP9tgbhZX1p48ZZNmTPkXPSz5b
	pFVRUHWNv71+n88zOkbq4gvridxDeyxQMj++elnP3JzJNG/2PHAbG+dBlGUjg2MMQ6AipgmFTy1du
	rmf69r1CbAeoLKDP8OaTKcx1TU9JebIpDbPxq3g7Somoq6eL0EU8K7hP+vC8j18BF6LqfWboh89rf
	dx9sgazgAc3FckTSh8DjJa61yHLs+eR+h6cfzHEzkpoHFkCsIa+OxWLZhdb7YhzCROYFbUrP2oKig
	4FmW4EjoA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcDYq-006WAT-NJ; Thu, 29 Apr 2021 20:47:00 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcDYm-006W9f-MJ
 for linux-amlogic@desiato.infradead.org; Thu, 29 Apr 2021 20:46:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=WgLKTfF2m6aFVph8YVoLnHUhUC3a+ICHx4fOWtLtkUY=; b=qYIaLXUL+nNsfRnvLkIF5uh+IF
 1CeJk2T2DtlWqdPWEnUGiXjX9y9P9n/FByM3VClWZeD+pvnk76Fx88iXtHTAZOz74dLddTEO3+CtE
 tWXuAPP1Avc6i6mE/1t/BSCye0HdAKE0WN4TyLtAJBNkMwMGndMHbdGQhekAiQ3Mle0KCgbx93usl
 wr5u6HXvt4iD5iO+KdJxBgOKEwTA29WWKaq77usNhvZFv07E8ya3vZ/Z1Fh2MF/Z54yJRb7mb+e4p
 g6k2pxZbxJAITIlFbVdw4hh0RwOTS0DJbCZRBmsUgQF0q4BKJn3AudFcC8kD6XHt2u0F8U0Ow4rBS
 p7ByQPeA==;
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcDYZ-000y0A-Tn
 for linux-amlogic@lists.infradead.org; Thu, 29 Apr 2021 20:46:45 +0000
Received: by mail-ed1-x52f.google.com with SMTP id n25so8076006edr.5
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Apr 2021 13:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WgLKTfF2m6aFVph8YVoLnHUhUC3a+ICHx4fOWtLtkUY=;
 b=AhpGWuJY5why2oF/WmjGuw+62ZG3SETxkECzhYzChL6cWPmcLWlI1Skyr/iUzPxBCt
 DlCYYXSXAaDD2/n6HCgNrWeINejQDiANCBkjLQFlFG4TqzN4+ZARWcvTB+04eZRIYBVD
 80iHKrJZtHO1h6I8n21Qszp7BTWLr1evfopov7HDXdES7E6ooitwxkUixhHqHxKFg0ma
 bBP0vJaVlj7JYgIkgaFJv7wyEdR8taftme4jHBoTn2hEdwPIIl8tiPfKKDrw6ojjyzW8
 v0aCu06tL3gt7jPcEkWFRIENSt5/O3nHToMKUHnD99FLPE0hbYS+QSiXdhYXIsbcLEu3
 pYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WgLKTfF2m6aFVph8YVoLnHUhUC3a+ICHx4fOWtLtkUY=;
 b=tQJI/UftTQJVW2ABWhSuuy5gRbDGfrqDPbDeTxOaCVqubF2ysBM2vslp6Ww3ymPdc+
 +hR4bq760/xolUUcqxHc3CgU6NNYQEGUUn9/z2mZGZDMVMhejWTCEpnje+J1yoOwgBaf
 ogvVD50S9jQEfJKvyh4I7fvZsT+YgCZixJBbLaoYyCzTeEkowVk6LZArMOMKl7tMW8Dv
 GaAGsNYdkuLQSwGEVnYZmae2MX67Ckjl+3ERHCITYJgIOKHsn77tqMW3WgWJZcvd6qC7
 xZ+Pm4wnmKBlHfARy1jjeudiOoKF8hmqVEUMkwO+B8ECT3T3KCgWJ1kOL5zwJCnq9Trf
 fnew==
X-Gm-Message-State: AOAM532eV/SpMwDTyzNbU5dDCZmbZnHCgmQ5Pyc21PXlGakvDx0lMTh2
 lXmYjOOfl8bWgbRyj2eJta9OxvpO8dFZjN+SM1bURCf7zJk=
X-Google-Smtp-Source: ABdhPJwlHXvuI11WdJAA7XjJIqO9h0ktT1pkTTPYMdjmtZZ8L+mVogYy1p7mq+TRRFwUzzanEYOFqQR/TrDFTsyoh0c=
X-Received: by 2002:aa7:c957:: with SMTP id h23mr1745712edt.301.1619729202396; 
 Thu, 29 Apr 2021 13:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210429083823.59546-1-jbrunet@baylibre.com>
In-Reply-To: <20210429083823.59546-1-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 29 Apr 2021 22:46:31 +0200
Message-ID: <CAFBinCBdzeApU0Ai5i91ed9Ra6CB4pThuCHHwaPbFm9FDhq=3A@mail.gmail.com>
Subject: Re: [PATCH RESEND] arm64: meson: select COMMON_CLK
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_134643_993383_2F5DB88B 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Apr 29, 2021 at 10:39 AM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> This fix the recent removal of clock drivers selection.
> While it is not necessary to select the clock drivers themselves, we need
> to select a proper implementation of the clock API, which for the meson, is
> CCF
>
> Fixes: ba66a25536dd ("arm64: meson: ship only the necessary clock controllers")
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

note to self: ARCH_MULTIPLATFORM for the 32-bit SoCs also selects this

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
