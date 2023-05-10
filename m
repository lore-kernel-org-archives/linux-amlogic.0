Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D0FC77B7C
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 May 2023 20:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8skUV3nSb02Xl80xcNkCrhlLMSuvyXvJilU6GfcbPYo=; b=YPPTtkvi5gbUqiIHueR02Q2Dhs
	E4BtVlL3Lt+dIT65eroo/x36dvysJ6JJaHCcjF13KvcqlkOfKLWQChI4AasUJIhSK+DhpPhMJVyqO
	yx9U6TYxd0VqKPnbuAVgD89z02BXCLIKOA9STHbyBs+nB8xy6yu90C64BDwCYhFHUaPJhc4tGBEU0
	iuarLxcCTNbXzsrT76QNcne7qV3dEquVmSvCT+Dhth/141WLhMXmzEFJ7YTI008HNqxxM5Y61mNxM
	cjFYMezQ8RceGR6QOFgko5QqwfwQc28OJ20/sfFl7WCMOO/ktLh4gUmYvSnyWQW25lhCvSBdTxeTk
	dZYaTm3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwqps-0070HA-27;
	Wed, 10 May 2023 20:54:56 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwqpp-0070G9-2U
	for linux-amlogic@lists.infradead.org;
	Wed, 10 May 2023 20:54:55 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so72745826a12.1
        for <linux-amlogic@lists.infradead.org>; Wed, 10 May 2023 13:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1683752089; x=1686344089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2A1mAdk2jOSOv/+D4yJ/kc5JQaEL+k6dZ6J6cz5nkBA=;
        b=h5Am1CZODLAoNZOHBxyY7P9MAPAef9ZK1WJCCAFWIAGakQWUCqhV5QXFL0rPqkVWqs
         hhVDIGlEqbDcp7z430xNX9T37ynoYTc/83BAlC0hWpEIMFNxyb8rGSW5Fb7/UGeh6BOs
         +2vOVzOewq85No5g+uFRoSYpuc45qDCdDABOfJN16QP+XZzu9eVxIpakGWSqF4Ls7rNK
         XeBXYuo/JI8bCC8H2B4+XGV9DTP8daoGnlPQ1dbq3F0dgynvh/EU/jzlffUQ3rwo5yLj
         1Mdq/HfJavzA8/bmYI7b+BODMdrEPa+T3GYrfruyfUrTIc4J43dED1yojmmKNKyEA5dC
         FfAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683752089; x=1686344089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2A1mAdk2jOSOv/+D4yJ/kc5JQaEL+k6dZ6J6cz5nkBA=;
        b=kl3aqEk5xBmQr4temGoiUOt9bh8Ud1uYP3PhIOSU+sZwUGL3xmEysYUy+7P3E281eC
         h8Y2iav5hAgEKWd+1WF6EvxB88fMC9+9HCA1iRJT2pgBshM4v5A+cT/rZdUknjjOPU6J
         vMWaIGtTUWyA1vizcQj7FN3M8sfWD8yOGBQYqm18FwHEQd3ODJb6Pv6HUn/SELWcrRFe
         wGGUszItuA1eub4ZN7JlzYa4Nsx3EDxYGT4adwt22s9ld6eTDi5FFjWzfsv1mSx4jHHX
         SHMczYmqor39N/uEqsq0ChapbUGIRBDjQbgqApV6L3JUGZPcmLNZnr+ZP5cQAzaewt8s
         O+CA==
X-Gm-Message-State: AC+VfDyt0QPdBjeHtZxMOVrQsn8ZPZR1TY1RA1WJIKXAB2HliHKNAdPl
	jEqTQDKXptHLuMKyTXSAqlV66l3eOook38/JAoLhW4AS4Vo=
X-Google-Smtp-Source: ACHHUZ70YYiCCbxqfkUQeSmtWGEtbxx2oMxAiVRlYho8p+Rd6ym4ITJ1Y8RJO5yhsVJZPd7PCEvU1NzNTaZdQjilp58=
X-Received: by 2002:a17:907:26c6:b0:94a:4739:bed9 with SMTP id
 bp6-20020a17090726c600b0094a4739bed9mr16472312ejc.13.1683752088968; Wed, 10
 May 2023 13:54:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAFBinCD0RT0p-jk86W0JuMT3ufohRh1RqWCcM35DKZJpuc10HQ@mail.gmail.com>
 <CAPDyKFqgYnBfm-NespEZF8AJ5Ou4Bya8jLfVEnfyZvfAZ05Q7Q@mail.gmail.com>
In-Reply-To: <CAPDyKFqgYnBfm-NespEZF8AJ5Ou4Bya8jLfVEnfyZvfAZ05Q7Q@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 10 May 2023 22:54:38 +0200
Message-ID: <CAFBinCDjPJHEhN-Jx3DhhhHJ3yi8oEoW7u4-Ld6Rd1+W826ttA@mail.gmail.com>
Subject: Re: Odroid-C1 regression with commit 4bc31edebde5 ("mmc: core: Set HS
 clock speed before sending HS CMD13")
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Luca Weiss <luca@z3ntu.xyz>
Content-Type: multipart/mixed; boundary="000000000000273e3505fb5d151f"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_135453_812269_7F631F64 
X-CRM114-Status: GOOD (  15.24  )
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
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

--000000000000273e3505fb5d151f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ulf,

On Wed, May 10, 2023 at 4:21=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
[...]
> Thanks for reporting - and my apologies for the long delay! It's been
> a busy period with lots of travelling for me.
Thank you for taking the time to look into this now - no need to apologize!

[...]
> > In this state I get:
> > # cat /sys/kernel/debug/mmc1/ios
> > clock:          52000000 Hz
> > actual clock:   51000000 Hz
> > vdd:            21 (3.3 ~ 3.4 V)
> > bus mode:       2 (push-pull)
> > chip select:    0 (don't care)
> > power mode:     2 (on)
> > bus width:      3 (8 bits)
> > timing spec:    9 (mmc HS200)
> > signal voltage: 1 (1.80 V)
> > driver type:    0 (driver type B)
>
> It looks to me that we are in the process of enabling the HS200 mode,
> but hangs at some point. Unless I am mistaken.
>
> More precisely, I suspect it's either the call to mmc_set_clock() or
> the call to mmc_switch_status(), in mmc_select_hs200(). Can you have a
> closer look to confirm this?
Indeed, removing mmc_set_clock() from mmc_select_hs200() also makes my
eMMC appear again on top of Linux 6.4-rc1.
See the attached diff in case it's not fully clear which
mmc_set_clock() call I removed.


Best regards,
Martin

--000000000000273e3505fb5d151f
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="drop-mmc_set_clock-from-mmc_select_hs200.diff"
Content-Disposition: attachment; 
	filename="drop-mmc_set_clock-from-mmc_select_hs200.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_lhi6fva30>
X-Attachment-Id: f_lhi6fva30

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2NvcmUvbW1jLmMgYi9kcml2ZXJzL21tYy9jb3JlL21t
Yy5jCmluZGV4IDg5Y2Q0OGZjZWM3OS4uMzFkN2ZmZjVhMWExIDEwMDY0NAotLS0gYS9kcml2ZXJz
L21tYy9jb3JlL21tYy5jCisrKyBiL2RyaXZlcnMvbW1jL2NvcmUvbW1jLmMKQEAgLTE1MDAsNyAr
MTUwMCw2IEBAIHN0YXRpYyBpbnQgbW1jX3NlbGVjdF9oczIwMChzdHJ1Y3QgbW1jX2NhcmQgKmNh
cmQpCiAJCW9sZF90aW1pbmcgPSBob3N0LT5pb3MudGltaW5nOwogCQlvbGRfY2xvY2sgPSBob3N0
LT5pb3MuY2xvY2s7CiAJCW1tY19zZXRfdGltaW5nKGhvc3QsIE1NQ19USU1JTkdfTU1DX0hTMjAw
KTsKLQkJbW1jX3NldF9jbG9jayhjYXJkLT5ob3N0LCBjYXJkLT5leHRfY3NkLmhzX21heF9kdHIp
OwogCiAJCS8qCiAJCSAqIEZvciBIUzIwMCwgQ1JDIGVycm9ycyBhcmUgbm90IGEgcmVsaWFibGUg
d2F5IHRvIGtub3cgdGhlCg==
--000000000000273e3505fb5d151f
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--000000000000273e3505fb5d151f--

