Return-Path: <SRS0=t4U2=FJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24143C433FE
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 21:43:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8D33230FF
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 21:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8D33230FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=85Essz3eshOg9mcKzlVtSzE497jXN/pXmeBFGz3Nph0=; b=O5uwnyXdbuw9ZpOe7dwbyJLyt
	z5MA/JD/xw3ucArbJe2sI14I0VoTGOyF3nludaZG/8a/n+uSyG9EZUdenO+ArNoeZpcHiJYdd4ZDX
	oDb1en+1eCwQsA3T8FRslSOLk4gTCUn/swU/G3Ec6gdOfLVkYb4Z1AmMR3ifPfMouxqS8Bb2/eyIZ
	xT2GMCotmOA5/q4O3KYsf4I0ciV15gJd0raBvtvH/aZFUXdKMG+qOpSO9ox/V9aScfVfOtt8cvr8V
	afzUyOUptxbeqRLm2k/UqrU+CmhfmCEXU90Qkjc+CP+kiN6bxC/eF2u8Nf//J8aG5LhuUFekSg7iX
	sFGrKy0kQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klfKR-0006QM-8d; Sat, 05 Dec 2020 21:42:55 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klfKI-0006Pg-2F
 for linux-amlogic@lists.infradead.org; Sat, 05 Dec 2020 21:42:46 +0000
Received: by mail-ej1-x642.google.com with SMTP id n26so13915304eju.6
 for <linux-amlogic@lists.infradead.org>; Sat, 05 Dec 2020 13:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BcFwvccBZsNRXg6tthMMYxCZiveruOlpyGXOybgngvQ=;
 b=jiOiKlaZJLpwxmeKjTWxcVGZCEkUHCWFjES5nFUbk1CJYTGVEBHGjg29kLi2I3rTP4
 m9uZo8fJZqILlx2qptuTXKjm8L3+xYj0ur8Il1W4lB787lPdbAJBSoBcbQDDNpwq8utp
 B9n8Qaa0mIJMAnY9riPCBaVcPSeTQc6u7VB8OWzVTPBk4QT9ecKg857smbCm4YoTwDJ1
 UkHuSfQPCQ1y4sKVFAnCgb9Ms/9dFyvn1N57jUS/WTHmsLxa6JCRlLCvd7YlKffUIsXl
 xPNVSYDHhQKZQJDOkaMPjS7RteEZNrFy7lY63xLz9S7MaWT8F9cXKDpLPWTQD5+SIa54
 FdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BcFwvccBZsNRXg6tthMMYxCZiveruOlpyGXOybgngvQ=;
 b=L9LPnAn+zoKh524Z1WtzOg/21uMoZTXtyRJiwPyiVlQmzoLoyXfW0y3IH8Np+KIdzK
 bWJDn+tbLjFIm6XWxqNLm6I71g0Q2gvaKlIOemT/EiO40Wc7TEwBSftinSBaCpLQZUrs
 3Y1KVuwY5lshM+v0yKQw+OQnIBYHo9c1VrgnTWpojKsEAc8XUtl7NQ6eMwec/5UZBsWx
 A8k2Hci1P2rc/CrKDw2Qi62xOS5FWjcGCjM6qzhndxwM19P7peGGZhXkRwBnTpXas4fd
 6+Zjwbt2Tl2lPUIzM+78fDk3Rc0UiOMQaxs18oWlXcbNqRojKH8XrnWi3K9XfRGa53sW
 BziQ==
X-Gm-Message-State: AOAM533nOaBkpgMsEeE3SDqU/A1ufn6hvYN7FDWvlLiXEkj7CPyt2jiG
 blhLmZBGbM6mJ4USTahy1fkZV/zm4iQOF+sN8NU=
X-Google-Smtp-Source: ABdhPJxdspMQ0M3QTYFFajPX5yAwsG+t5ziDkySCbO6inXMBWhcmZmm1k/Sy3ZAXbtQ06tz5Fln037XnGixiih6SJP8=
X-Received: by 2002:a17:906:447:: with SMTP id
 e7mr5694784eja.172.1607204561424; 
 Sat, 05 Dec 2020 13:42:41 -0800 (PST)
MIME-Version: 1.0
References: <20201201190100.17831-1-aouledameur@baylibre.com>
 <20201201190100.17831-3-aouledameur@baylibre.com>
In-Reply-To: <20201201190100.17831-3-aouledameur@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 5 Dec 2020 22:42:30 +0100
Message-ID: <CAFBinCCovB9e1_AwXv0Jcn3p69LN5KAdzttfZcY+=_TEZTCn6Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] usb: dwc3: meson-g12a: fix shared reset control use
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_164246_160014_551DFC4A 
X-CRM114-Status: GOOD (  12.35  )
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
Cc: Felipe Balbi <balbi@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Amjad,

On Tue, Dec 1, 2020 at 8:01 PM Amjad Ouled-Ameur
<aouledameur@baylibre.com> wrote:
>
> reset_control_(de)assert() calls are called on a shared reset line when
> reset_control_reset has been used. This is not allowed by the reset
> framework.
>
> Use reset_control_rearm() call in suspend() and remove() as a way to state
> that the resource is no longer used, hence the shared reset line
> may be triggered again by other devices. Use reset_control_rearm() also in
> case probe fails after reset() has been called.
>
> reset_control_rearm() keeps use of triggered_count sane in the reset
> framework, use of reset_control_reset() on shared reset line should be
> balanced with reset_control_rearm().
I think this should be updated after [0] is applied
The goto from that patch needs to use err_rearm from this patch.


Best regards,
Martin


[0] https://patchwork.kernel.org/project/linux-usb/patch/20201111095256.10477-1-zhengzengkai@huawei.com/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
