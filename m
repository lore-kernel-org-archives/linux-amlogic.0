Return-Path: <SRS0=wsHT=B4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E997C433DF
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Aug 2020 08:16:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 280E1206B5
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Aug 2020 08:16:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kc6kUQUb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qBojPTd7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 280E1206B5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jtYTIkraMOStaTIatPDvQTStCXMzi/Sd4fVwGwVs8yc=; b=kc6kUQUb0/xr9S6E3wQBfkRti
	JlvBxK5fsyuLARqFaSN3YDeH1QfaZ4XYSufKSCcNfOp2WNWJ/z8DR4DGIoCV8h7GDnj5QI9EyV/1t
	Jh2mw7SLnlW6ScafDBs7TaajQ92vcJYtCUmwusDee2b5fgGBX5CHYnvO63CEaah/MjJmXvVk1aUJt
	SNylW+6hegBHN2aTPvnoDI36NTrNV4KS5HyQG3iLUU+noXc2VV+zemVSOS/Vhadk9Oi9hPzi1ad59
	g2BtB1ghfScxhv2OlNfijNkTtShi53uM0VT8Q8jfGJhMZsqts8gjafhsdrXE2gw6n26hvM2ajM875
	O7+H93hOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7wmr-0003sO-Nr; Tue, 18 Aug 2020 08:16:05 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7wmm-0003rT-Tp; Tue, 18 Aug 2020 08:16:01 +0000
Received: by mail-io1-xd42.google.com with SMTP id t15so20402243iob.3;
 Tue, 18 Aug 2020 01:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mVTJ27D4R3H6C6f0jdBIw50yJtblFxQuDJ6LjKOMP5s=;
 b=qBojPTd7Q+0e6B8OJziPOJ9nn7uED4XQgwDpQNf996Pu0sWnuI7BWPbmuzmjvketsq
 Nz46NgmdJ9KoR00KJGuDfmAfZGZtXB76eV1PVh1pVjJwFz09zLl4ZLiOxv5hK2d384du
 1B3BD/3QQo24iogPuiSkD5HKTNsfefDaY+WlOZ34sSGaRkQh5lkE5QGzBdqSdhfTOqkF
 6p1AUoRhtjl5E6apEJXb7AVYrnf3G7101Myby6rfj/hsYitV3mRo68qGXC5/HBEJO/Ry
 /O4QVYQ2E9GaPz1po2qEkOkLnmncFpR7A0zxLVmj5Ic5SEUGnAYynHN7b0cB2UAsgjqB
 BV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mVTJ27D4R3H6C6f0jdBIw50yJtblFxQuDJ6LjKOMP5s=;
 b=g1WEjrdza9g1J0o+kC1qrFUCG4Ng1aUAq+rqcMOr5GgtAvCX/G9UDAsWeavn6WcaAb
 FnmmD2tV5GfW8fK4+jIyf2btQ0/rHq4NU23t7qjZPBok0WWfEyRrugExcklW7EZDKY+1
 Gm0ejtCaNHSAfUuLMMAAnsKF5tbeOFbh0OIbHDq0mmSeciSWSyMJjL/1xbLfTcCrAgWD
 kWddw2qTwwXRAZ5ZNM8GXkM5nGx4n+8z9/YVrBXjk6fJYZbj6Av9PmoGGJPbLgyoszif
 apK+dY+wNkHFNfDTOktuUzRii8gLN2LbV2EEQHkweaPGE8WyKRCfVit83zkKn48XLtDo
 ZfPw==
X-Gm-Message-State: AOAM530quGHcSM+Xn2LkZAHRiLy8aRAEaEtfLOMdqomrdQRCmZKlP2C/
 cCRkopD3yKtjhHbbjQO2mbFhcdXJR4emxqwjkZ3Mvb3Q
X-Google-Smtp-Source: ABdhPJwoaSxUUmkYr7BSfO/yhNs7u20OUnmAeKOoAXMZAbbSOtGvZT9QCMhCfI4jY1MhXOJVcmRHUZ20H+AirlWZWg4=
X-Received: by 2002:a6b:f801:: with SMTP id o1mr15423627ioh.43.1597738558213; 
 Tue, 18 Aug 2020 01:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200817102122.434-1-linux.amoon@gmail.com>
 <20200817102122.434-3-linux.amoon@gmail.com>
 <1jzh6se6te.fsf@starbuckisacylon.baylibre.com>
 <6B583170-3479-4DFB-B81A-431B5982C8D6@gmail.com>
In-Reply-To: <6B583170-3479-4DFB-B81A-431B5982C8D6@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 18 Aug 2020 13:45:48 +0530
Message-ID: <CANAwSgS+MwbQHT=o3Bs7h_D7Gn3F2j4zDeT7dCnMwA2_YD4eDQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: meson-g12b-odroid-n2: Disable virtual
 RTC driver
To: Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_041601_042477_4BC696CE 
X-CRM114-Status: GOOD (  14.06  )
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
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Christian and Jerome,

Thanks for the review comments..

On Tue, 18 Aug 2020 at 13:21, Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
>
>
> > On 18 Aug 2020, at 11:45 am, Jerome Brunet <jbrunet@baylibre.com> wrote:
> >
> >
> > On Mon 17 Aug 2020 at 12:21, Anand Moon <linux.amoon@gmail.com> wrote:
> >
> >> Disable virtual RTC node on Odroid N2,
> >> since RTC PCF8563 support rtc wakeup.
> >>
> >> [    7.171149] meson-vrtc ff8000a8.rtc: registered as rtc0
> >> [    7.182875] meson-vrtc ff8000a8.rtc: setting system clock to 1970-01-01T00:00:07 UTC (7)
> >>
> >
> > Maybe I'm missing something but why should disable this ?
> > Can't the 2 RTCs co-exist ?
>
> aliases {
>         serial0 = &uart_AO;
>         ethernet0 = &ethmac;
>         rtc1 = &vrtc;
> };
>
> ^ adding this alias moves vrtc to /dev/rtc1 allowing the on-board rtc to
> assume /dev/rtc0 which scripts/users and HOWTO guides assume to be a
> real clock device. Tested and working fine with my own experiments with
> enabling rtc on a bunch of G12B/SM1 boards.
>
> Christian

I will drop this patch and add the alias in the next version.

-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
