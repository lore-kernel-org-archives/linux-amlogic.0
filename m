Return-Path: <SRS0=0xNA=W6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A5FC3A5A2
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2019 19:08:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28B6D22CF7
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Sep 2019 19:08:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i3MJ7uAo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="RWHc3SRb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28B6D22CF7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NvxUlN9UJK7LNQux3NQY+8BWFbJsdvLX/3NYyBFe3uA=; b=i3MJ7uAoY+8rx0
	MubuPWe47s/rFWleXGt3yx7wxcYMgHLHfOkYAmJrbGW5boK8i7Rrzcc2FkF1r2rZnkFvPehL/+s2P
	mggYj6eTK+f823lv5HxAz8C1B/q+P9OC6l/TuexzxeFnjOLgt4ICWzYTH7Zu+WSPembzHkDrDG2S1
	F3Qh43DY7QVRvbha3/Cc+E20pZDbOJFIXsYwQ5ME7YHAu/beE4lCPV4zOeFU4420pWXtNw7vszoeQ
	lEeDF/5e6sFQpAQkO7I/Ophl1+UxmzWj16v9IgWQ2XrqucKVfE9g42xRxuNLOBLS3rm34zJuQUwZk
	hsZGEYw/kr9/Uq7Hdf6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5E9x-0002rF-Hv; Tue, 03 Sep 2019 19:08:09 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5E9i-0002g5-7D; Tue, 03 Sep 2019 19:07:55 +0000
Received: by mail-ot1-x344.google.com with SMTP id r20so17930122ota.5;
 Tue, 03 Sep 2019 12:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p3aev7x2FcRIqe6J3Q1VipxXTWXY2gzdFLeKEuyXyxo=;
 b=RWHc3SRbRf5QRAyWscodVJW+0S24fkLuby1zUP0KJ2evYT4MuYyJVvDvhtCv94QE1E
 /Uz1SOL5M/Cdqpk0ecIJA5VaRb8gHQCeGBJXFsmftSOdIoOpoGUdvDljHcNNWIh2jhYQ
 SSE9+TR+lnXwuf3HClCbH7pRSsO/eZrPWRfrE54N/rTfKOLMBc4JInagPEAmuJJcBktJ
 0/aRZMIhe+kp+C8v/nWZHMSJwcG+f4pPpdsJq+HO0x+vkHZmQE+cFhi4srB4KE+K/jLg
 LdtyrfqDRa5afybHrxgE+emhUsLuambMWuxdaJX3YbvEwnqlDf8gaLRh9p9EWbxLHUp+
 2/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p3aev7x2FcRIqe6J3Q1VipxXTWXY2gzdFLeKEuyXyxo=;
 b=H6iTNcxb46gpMLi1N+Cp2k51MShLVX3Fv8UKJMHQT8oo2ud7rh3+99S/rNATZFXTEw
 /ZTdXj9iSN/ZUXXYAfMzKL7aAKSl1GNNFrf0KuXx+BtitUAoYLu6fHoCCvuajMe7sOYO
 qf/C8usMYIqYWKlPiMEKsbSEzHzfZDFm45TUKhE5wvzat289NXqS1EIT4b88Rg5/HD0/
 DEEshHNfVMHtnr4uBut/EgDAliAroUyoPVuQ0wBcIa2CGjNNZ7t3OTrBHgmjWtrn2alb
 lKeQK+M0aKkaPBuRVtrtjFg4K5ZkkvXEDwFQrs+ctxeeUfMuTW7ijiUAHTZSTdTrAEIR
 nWxQ==
X-Gm-Message-State: APjAAAXvMBEL5vXofapXy/Q8vWK9PVA23Rar3/xHc67iet9W6LVEtAOm
 AIDlWaXyJnVdUGoHszB7WvpQVIWRNc4Fk1hdT6s=
X-Google-Smtp-Source: APXvYqx4cEcKC4Pu7goYArzcWb/HJXhNTrOtWlDYALGS5Yz4pLIh9S3YA3UNWoxmkLOmC9OR33nyeXRzwkdcKmC+A3k=
X-Received: by 2002:a9d:1d5:: with SMTP id e79mr621031ote.98.1567537673321;
 Tue, 03 Sep 2019 12:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190828202723.1145-1-linux.amoon@gmail.com>
 <8c40f334-c723-b524-857c-73734b7d0827@baylibre.com>
 <CANAwSgShr-K-44UzdxFC7pvpTye_pbEMdS6ug1eWwYhnsVNGdQ@mail.gmail.com>
 <101a12ac-1464-8864-4f8c-56bb46034a08@baylibre.com>
 <CANAwSgQwZg_AXAnAY4KwDzHpwcSA9up7SrR6jyv5Bem24wtaJg@mail.gmail.com>
In-Reply-To: <CANAwSgQwZg_AXAnAY4KwDzHpwcSA9up7SrR6jyv5Bem24wtaJg@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 3 Sep 2019 21:07:42 +0200
Message-ID: <CAFBinCBY9SJKOaVYCV2HzDOrjngtcreM4Ftvk+hgr8KAGV_V+Q@mail.gmail.com>
Subject: Re: [PATCHv1 0/3] Odroid c2 missing regulator linking
To: Anand Moon <linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190903_120754_282821_1BE8183A 
X-CRM114-Status: GOOD (  11.71  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Anand,

On Fri, Aug 30, 2019 at 11:34 AM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> > SCPI works fine on all tested devices, except Odroid-C2, because Hardkernel left
> > the > 1.5GHz freq in the initial SCPI tables loaded by the BL2, i.e. packed with U-Boot.
> > Nowadays they have removed the bad frequencies, but still some devices uses the old
> > bootloader.
> >
> > But in the SCPI case we trust the table returned by the firmware and use it as-in,
> > and there is no (simple ?) way to override the table and set a max frequency.
> >
> > This is why we disabled SCPI.
> >
> > See https://patchwork.kernel.org/patch/9500175/
>
> I have quickly enable this on my board and here the cpufreq info
[...]
> Almost all the test case pass with this one as off now.
I suggest to send an RFC patch to (re-)enable DVFS on Odroid-C2
I find it easy to miss a DVFS discussion inside a "missing regulator" series

with a separate patch you can also get feedback from other Odroid-C2
owners who can help testing
coincidence or not: on Friday someone asked in the #linux-amlogic IRC
channel why Odroid-C2 didn't have DVFS enabled and what to do about it


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
