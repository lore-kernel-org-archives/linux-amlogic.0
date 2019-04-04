Return-Path: <SRS0=arCo=SG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1539EC4360F
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 03:42:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D325C20855
	for <linux-amlogic@archiver.kernel.org>; Thu,  4 Apr 2019 03:42:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SHWqJ+7d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aBwGgNMM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D325C20855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E8fli3MHJLtlxTY/iohmnmAXngD8lP/6zaP2qz0vqm8=; b=SHWqJ+7dJtMcVj
	pt6obkafZ3BbTmZFaFxELJpittMXFTPKpHBjmsleTRXXnSMGxTK0ejgMyAl45gaKgRdaNHQx58WLL
	Dxu9pH8iq4JIFkYhX6UK32kT1IfjVocIQvcPIp1u/vkaHyHOiumpmZqS5z550xQiS7xCcRP8Y0tuG
	N+uiFjiO5fmIFPaw+S0aEvwmn7miv6soKipalTuWxvGfpTKe8/gbK0TGc979/0xamRv3nDx4lWbqY
	GKARDwLUq8/Dp3szea1RXYKClcc6goNQJgm9srMzxH3b6tBuVGJIVE/PqkoLP1Gi096qjR7vtUhEX
	Exn2AENN+UR5AyLmW+FA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBtGe-0007fk-H5; Thu, 04 Apr 2019 03:42:20 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBtGb-0007fQ-HE
 for linux-amlogic@lists.infradead.org; Thu, 04 Apr 2019 03:42:18 +0000
Received: by mail-lj1-x242.google.com with SMTP id h16so711370ljg.11
 for <linux-amlogic@lists.infradead.org>; Wed, 03 Apr 2019 20:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=29X/AC/PrHlHS0OMXZfselge/eOaCEenzhRC+wnkd8o=;
 b=aBwGgNMMbdYvO1VZSa7VNW2WMYZ2q9ZgnPP6BH+SBoSLH3Wae0qqRxXpHvKHKUw/+y
 GCCBp6QpqX2s7b23Y/Ixr4Ich3cE+Y12kxZf8/QsU6Mvz7h8AU1O+TpCTXAKZP7B1X5l
 pYmFTRwFlMjswkBWX+jC9vR1d+Z2GvXU5lYK/phCDbqQyeKx2eqSO8FeMSPc2E+zgxwB
 Pfe3a5ehl+668ClY9GmEuk7+S0sdPwgAKfjBq0IgyVx9ojRsqi8AvDk/xcrtfjsPkE5t
 MQlRxuyTLvnNBm1EPl2a37XYrxv0g5rdxbfsfNQ821R7qaBTd5tumFrjFjLuIgjOydkU
 hHNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=29X/AC/PrHlHS0OMXZfselge/eOaCEenzhRC+wnkd8o=;
 b=nsxDEJa2EteDcyYfZZt8KtV8GrLLKKMhju+otW0xDXaCSetjDsX1vFFwm75JzPLnRa
 U7WtOmx02dtR9AmfdEM1+jSsPrFTIEDkQu7SrVoSEEd94PdXTKj9lYb6LBsqC/CWTTVS
 yFKrq+5MmT6uamoy16X6cPq5kVqZmfvO0yP5qcXCKp8RO2cvL+sUPA/kRrMI9QnpQDtT
 EQWidn6Wgkih9K7jFrIXdlJA5aTXoSMSdgtq0NrO9GgxXkfHvxUELEKhTCGR0dxGCbWN
 r3t0IeYmqLv3WMLAMgAZZMFIbRI+LR3g+F4nhelv+jsO0oBaEvkcB6BLXm6BHVdulyRd
 m+4Q==
X-Gm-Message-State: APjAAAWPb4Afprsvb0hL4kqiRIOyX1mo0Q6EAKODpphjW/7eqAZPG2zm
 BW4HrrLEUiEgKOKPRN+cCQ5wlTJkm30SJOSnhukVzA==
X-Google-Smtp-Source: APXvYqw4e+JidrHrHBXzWRWVeG/v6WdG5mRe2YaSaMe+B1YnJVi9rHe+KmuK4u+5iR2Qx3Wd4MV1Fl7Kq8Ic6KVi0P4=
X-Received: by 2002:a2e:5d94:: with SMTP id v20mr1823342lje.138.1554349335486; 
 Wed, 03 Apr 2019 20:42:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190314163725.7918-1-jbrunet@baylibre.com>
 <20190314163725.7918-2-jbrunet@baylibre.com>
 <20190330212830.GA28281@bogus>
 <722ef39685fb3b519d09c00a3444708abd685f9d.camel@baylibre.com>
In-Reply-To: <722ef39685fb3b519d09c00a3444708abd685f9d.camel@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Apr 2019 10:42:03 +0700
Message-ID: <CACRpkdahO0rQ+qLuWOqeMTECsH6JwRL7Eh+hb2iNH4JwgzJkOQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: meson: Add drive-strength
 property
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190403_204217_575697_96B8CF61 
X-CRM114-Status: GOOD (  11.33  )
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
Cc: Rob Herring <robh@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Guillaume La Roque <glaroque@baylibre.com>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Mar 31, 2019 at 2:04 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> On Sun, 2019-03-31 at 01:40 -0500, Rob Herring wrote:
> > On Thu, Mar 14, 2019 at 05:37:24PM +0100, Jerome Brunet wrote:
> > > From: Guillaume La Roque <glaroque@baylibre.com>

> > > +Optional properties :
> > > + - drive-strength: Drive strength for the specified pins in uA.
> >
> > The standard definition says this is in mA.
>
> Yes, the problem we have and the solutions we are thinking about are explained
> in detail in the cover letter of this patchset. Could you share your opinion
> on it ?

I like your idea with drive-strength-uA but I need the second opinion from the
device tree people.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
