Return-Path: <SRS0=GyIY=MA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C987C07E96
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Jul 2021 12:59:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BE9861481
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Jul 2021 12:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BE9861481
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7v3/Gn3OdmJ7dY1WZkEiBug0Qy+3Ksk8m6DGsIdgEvw=; b=LsjQIgldODQ9Lb
	sBiJJLhpj6Zj5GNdZEKx8z7uuTz+2kktn+NVG85X/wF+PR5GZMiI4ojDgiSjO3lUWQR2c98unxlBM
	qmjYCSzhrC5gAFPp3leQqlHHrCprWAsIU3b4PUp8esItiS3egWsoddRYMNN/kM43lXtEveRO0IdRt
	aZORO4FIbpv4lkCtaWY2fDN0SJw9t7iTwfTNm0E17lD26wwmfLXgZTpOcSRZVbF9Fxb2XoSWXYLv7
	RvivBYA7wp+F8Q/fkhPX0+u7y+fxdLASfdz2JgcbOiPw+e0BfbhQxX+TU+68bmbgQZ2hJZguK3iHN
	9IBhjcGeLSpgNzO+5uFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1Tcs-00Gzrd-Em; Thu, 08 Jul 2021 12:59:34 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1TcB-00GzVX-Uq; Thu, 08 Jul 2021 12:58:53 +0000
Received: by mail-ed1-x529.google.com with SMTP id l24so8356354edr.11;
 Thu, 08 Jul 2021 05:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F7/IfADTgL9yOioxWQhJ9S28lRDKiNWk3KD0yBlKwCc=;
 b=TVDT44os/tMgjVjvo9RbDXQC2OG0po0QN8RuKbGmR6lSsyGZkhfPmFFFQWJ1J6Cv6a
 qwcBn4C2BtVAAJehF1M8KyljHri4p1r0L9nL544ITb5DxJILtZ9lHI2qa35IdkMss6Ge
 2JH/NzBbB2Oc47ZRRkKablIVKytugjXCHUCr7nSLKnCuOY97+FDO52+cNq386reO76oR
 /vA12fxSIgzNpLeXKPXSw9tuNt3CBAXZEhMGKttBDUtHs/WTpCAhxNXJNOofJjlPr1m2
 NEyo4iyZILSsFEWir1mNxStXvNFbd1MxgGkUURjdWPMRw/Y4G85baBw5h6PvKLBXqxIo
 vymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F7/IfADTgL9yOioxWQhJ9S28lRDKiNWk3KD0yBlKwCc=;
 b=CqjKoGbv4ARQB/5koKlawrNBkO1LmnN6yswIAf2cV9zPi+1DN9RPB22knPY89jwMxU
 ZWLdpVCjfCjV8V4b1wsFjlS6LX5EaP1uCZaHOzIdChYiS6HsQf4QWhd4J1AgqL+a+9sG
 G6A4VqOpR0/NPfFl7DVyMSsP6YpxcyS1fOKwR/JDdLrV/jGOTFdYx1cEMVNjLRaRKYBg
 rsiyFXrmWW31furpsYhSS07TOyC83U+I3VG4QHiMG3zuThUlwNyD3H7IxzInzJgbFk6c
 DsNsdKDtYsYJIPFMF72RJe2DTWuo4ZIFfN03dQ+Y2+RIFb1IXk6nrWPFS0gtK3072SRV
 Q2/w==
X-Gm-Message-State: AOAM533tPZ4nBbUPtygzu7qZm6911gHWL6p9vTJ2b4WX5zGrpaojcMll
 7rSCD62Bt+tN6E+5uIQ1UJ8Iik0hGMazORjzdcU=
X-Google-Smtp-Source: ABdhPJxh5e6Dih0tKgLooQiJgxsMnUHsrh4ajZkKoXviZRRgTEijVM+wNachv7JUoRtRkhpprj5tihI+WBFAnmw3tyA=
X-Received: by 2002:a05:6402:190c:: with SMTP id
 e12mr4828457edz.176.1625749130631; 
 Thu, 08 Jul 2021 05:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210705112358.3554-1-linux.amoon@gmail.com>
 <20210705112358.3554-4-linux.amoon@gmail.com>
In-Reply-To: <20210705112358.3554-4-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 8 Jul 2021 14:58:39 +0200
Message-ID: <CAFBinCAkAz7Vhd6Rkk3RYC7x7i-yZiNykObTxv-R2wYCTxHSRQ@mail.gmail.com>
Subject: Re: [PATCHv2 3/3] ARM: dts: meson8b: ec100: Fix the pwm regulator
 supply properties
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_055852_090116_AE4EEAAB 
X-CRM114-Status: UNSURE (   9.04  )
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

On Mon, Jul 5, 2021 at 1:25 PM Anand Moon <linux.amoon@gmail.com> wrote:
>
> After enabling CONFIG_REGULATOR_DEBUG=y we observer below debug logs.
> Changes help link VCCK and VDDEE pwm regulator to 5V regulator supply
> instead of dummy regulator.
>
> [    7.117140] pwm-regulator regulator-vcck: Looking up pwm-supply from device tree
> [    7.117153] pwm-regulator regulator-vcck: Looking up pwm-supply property in node /regulator-vcck failed
> [    7.117184] VCCK: supplied by regulator-dummy
> [    7.117194] regulator-dummy: could not add device link regulator.8: -ENOENT
> [    7.117266] VCCK: 860 <--> 1140 mV at 986 mV, enabled
> [    7.118498] VDDEE: will resolve supply early: pwm
> [    7.118515] pwm-regulator regulator-vddee: Looking up pwm-supply from device tree
> [    7.118526] pwm-regulator regulator-vddee: Looking up pwm-supply property in node /regulator-vddee failed
> [    7.118553] VDDEE: supplied by regulator-dummy
> [    7.118563] regulator-dummy: could not add device link regulator.9: -ENOENT
>
> Fixes: 087a1d8b4e4c ("ARM: dts: meson8b: ec100: add the VDDEE regulator")
> Fixes: 3e7db1c1b7a3 ("ARM: dts: meson8b: ec100: improve the description of the regulators")
>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
