Return-Path: <SRS0=GB2T=5Q=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A529C43331
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Mar 2020 16:27:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E3A320784
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Mar 2020 16:27:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i3MXAlwc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ceJi3zIy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E3A320784
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mMo+IIuMKXfsuK9eMuRIyF9HDifzVO0D9p5nFBM3QKo=; b=i3MXAlwcT4i3n0
	RXdjkrnTlMQiwbX4IlKh27aOhwMAqXZtET6Ppt+IZ/SgDBkEw28JoRDFTHcaHrlvWahuia05LKhsM
	tJg2vILwqM7Y/w+cKrqYO+ZM/eLY6OrloqVs5XvyZSkTm8kbPn6kWhYSUnX3M5u05pDP43/IM4XUA
	bmJ/6eKd5fMOGX4BkOya+H8z4/djp0509aWLqPi3HM/kTnFoBbhRWMb9sAQdcIU1+SM3FO097wqew
	t/szFQEUL1MGV25gn0IgbBJZEMkXs4g1pEEQXCpSjJXxh+gA40XtAJcxpfl2KTvJ08CEkI7jyy/QU
	aRcWwYDmedtY73KCx/Iw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJJjL-0007B9-B4; Tue, 31 Mar 2020 16:27:11 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJJin-0006fo-A0; Tue, 31 Mar 2020 16:26:39 +0000
Received: by mail-ed1-x542.google.com with SMTP id a20so25911716edj.2;
 Tue, 31 Mar 2020 09:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nwQ6p0kjxHWUaH6A6bVvx98gfYpYtkPqYfqeOSPqSBo=;
 b=ceJi3zIySsmcUUoMmbHyJIINyLKe1RaNcCjos5UDdJyQw4zHK+W9pBsv/ATDJMWnx7
 gqi08d8eB+GQcLMotvF2luheKYoJ+pMkCW6SOAlIrXTHusdPn+5UcgJ2yr5Hnr8L+CUc
 6vglca50z1wEpzPK3t4w2fQi9Uu2s55eRg03uSO+wUkvcUKQPFYMES3TXyAL5Gom6JmO
 5w0XUDYTiTG1UahLy/9VNjHRy5Nx5EeNDy8tZHKcQVCqfAKM0i8XsoCZRYNk6o+5w89A
 UyaN1vXpkdI0wsq0CcavJkv01KK86hVYk93wPvOpT1/+G1kaS/L//0UtSjqePGqLt399
 sOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nwQ6p0kjxHWUaH6A6bVvx98gfYpYtkPqYfqeOSPqSBo=;
 b=Cpv//9NI6zJmD4lW5iB4nZozqVMEbEFBd6k90/Vfckw73vHZpQb6egU3QATEI6epCt
 LT6lbiJk9vuGSB1NZ4132lRNkjlbSMIQ/qpI99jHgYEweiALYc/QQEc8WjpyFL8oOhvi
 HRDL3j/9k+SCXphLyCFgzYhP8E4nzihA/pEE+Pv4m3YSwesB8Fu/0AGHW6QXNCnsMtNG
 vLpKZJAHL1YgGr8TYfEi7oP7roMuZUEQBqhBkKzz3/vBmeX07HTU+kxrRgLAJS7RnnqN
 UKhSB9luz/oVsf+mKNdqexTTfWtX1+VXQFx9jUcJ5p3Azi7DzdQtquV+mDXnlmIaz7mg
 Tq1g==
X-Gm-Message-State: ANhLgQ21bOqC/5imtsHKupReKINEa8+0jUnCidmWDUbE5x/SSKjDcuo2
 wLuiR8jZDC9r7BOmbkvT7VpA/+8MF0CoU+8qUCZwVqUf
X-Google-Smtp-Source: ADFU+vsUMbwWMvrTmly08wlYEdvS8JaGTqzQfOyIFOyynV49KSGBzq6rwLnsJZGo0uibBQM6JWfp7zNbBSCAn7fUy5I=
X-Received: by 2002:a05:6402:b14:: with SMTP id
 bm20mr15236694edb.365.1585661493777; 
 Tue, 31 Mar 2020 06:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200330221104.3163788-1-martin.blumenstingl@googlemail.com>
 <20200330221104.3163788-4-martin.blumenstingl@googlemail.com>
 <05c15e30-3e20-6fce-d2ca-87b8762d0fef@baylibre.com>
In-Reply-To: <05c15e30-3e20-6fce-d2ca-87b8762d0fef@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 31 Mar 2020 15:31:22 +0200
Message-ID: <CAFBinCDdjz8FqwAvPOKRYF-KMm6bMMa9D1j7x1=Pkvsx-zRrUg@mail.gmail.com>
Subject: Re: [RFC v1 3/5] arm64: dts: amlogic: meson-gx: add the Mali-450 OPP
 table and use DVFS
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200331_092637_555263_B3E02CE5 
X-CRM114-Status: GOOD (  10.90  )
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
Cc: devicetree@vger.kernel.org, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Tue, Mar 31, 2020 at 9:44 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Hi,
>
> On 31/03/2020 00:11, Martin Blumenstingl wrote:
> > Add the OPP table for the Mali-450 GPU and drop the hardcoded initial
> > clock configuration. This enables GPU DVFS and thus saves power when the
> > GPU is not in use while still being able switch to a higher clock on
> > demand.
> >
> > While here, make most of meson-gxl-mali re-usable to reduce the amount
> > of duplicate code between GXBB and GXL. This is more important now as we
> > don't want to duplicate the GPU OPP table.
>
> Looks good, but please add comment about the CLKID_GP0_PLL assigned clock rate.
I can do that - do you want that comment to be part of the patch
description or in the .dtsi?

> I'll ask LibreELEC people to have a run on these patches (including the clk changes) with Kodi.
real-world testing would be amazing!


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
