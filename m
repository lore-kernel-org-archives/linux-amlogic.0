Return-Path: <SRS0=yQOf=LQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED5FC2B9F4
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 20:01:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54D87610C7
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 20:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54D87610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKnEVt6axWKfjOExjKzn2MUHmmK5UI9Tv7nrrrdAMR8=; b=0K6emu/5ONBMZR
	9FfDbBjeRNjqoDOpVOyX4uUNAattD/avriwMu7HzyM2FIAQEXs1Y0nOsAPk3E7hoMYTA63yK0+uz1
	yESGeGS/BMIktL8484HzXGLKQ8y6fJcBx7kb5sjUMLcbDVyG+Ydo+P2TLyvGpK2KOqhddzolDMYnP
	IAcUyNWU5m0rguKPeHRZXok2pLZaSr5kJm+8aXIfWD8Ei/BnTC++93/ywzbJxsFmOpyjKdFRSurKy
	smP9NtdsR7vsvxDR5i+6AFXn9RsMvUopSllvfPo7yp5WjW3TD19EG7WtJ+MoG6+H9nHN0uoSyNAvR
	Q+uUR8pPzNJ/2tRehqbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvmaD-008HOi-5K; Tue, 22 Jun 2021 20:01:17 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvma0-008HN2-HQ; Tue, 22 Jun 2021 20:01:05 +0000
Received: by mail-ej1-x635.google.com with SMTP id ji1so273524ejc.4;
 Tue, 22 Jun 2021 13:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zf4vdgRI2eIvOyP4BfdsN5wqUDVZRwFofOZUaIYATtY=;
 b=Xg5E90d+x7IHvd/rCJj3o+qjOEM4/AqGVdQHwicqleR2GFmKMJHRY9cvZgzHw86/if
 tznrosDerhJy+e7zX7Mx5kJmlnmmU5NF7vNhlzJ5dymzT2wGhQiVyDdlXdDYPL58wpTa
 BSNCwXlew5vXQ3W3lXJn5DO+f3JucPqUu1BYh3aEezggPgSfaEiiXXbWr0YlcBVsu5go
 6nxrn5NW+fUFsh8NFcnVEh0+8mBDjxibwRtGGDaZjQNLCYK1yTTJ8DjYbw2HA6o4LIQu
 ho0jE/spAvLFFsIAk3PUZwld3AuKaV58T5AydE6JNGqqRXq42T+FKerU/2wRvAF9G7rX
 Qtog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zf4vdgRI2eIvOyP4BfdsN5wqUDVZRwFofOZUaIYATtY=;
 b=jJ1r8LWjcDDZW1Tbr9UKqzsLIvjDcNQCXoeOTTvKk35/3sKKqIhoDEEmgb34aK0hIX
 O+e5YF3c8UzRyYh5zCzzoxopI7v83lwVZHjUkl1+gns46GnkyBr8Qw27OyFSRsdNIzty
 ySHIhGBeP0EVBq0mMFv5yv4p3Hb2uFHdAKNbLinvor/VNuqP/7Q0wn0DZsfa2bTx9yNf
 NxhNwKPpm/iRvOOAY1S+0e0kG5BSKW2XXlMEDjZsmKUr3MDX4QuHL5S3ihtqNmdi5bJr
 92zWEmH9Sw+zuMgbSJlXYlTu8QfE+9I+89a6WcStnvIF06KiGXw6qXgdEN7gCUof2tqU
 P3zQ==
X-Gm-Message-State: AOAM533JJVsifi2ZqGiPUSJynN7AfL4HCqHqY1D3Rx0eDDjZ+/15lX4N
 nlwy1Pl1Ne9je5uQ5+DF9/YQjBVnDwD3gazi2LQ=
X-Google-Smtp-Source: ABdhPJzvh7nsvk4PVuaKFHZXXafU6Hb6v8/HVjM/U5isfltZa2k5+fZ9AxpjVdjuvx1dttC8PnkMnC39zlrovwF3pH8=
X-Received: by 2002:a17:906:64c8:: with SMTP id
 p8mr5646217ejn.428.1624392060989; 
 Tue, 22 Jun 2021 13:01:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210617194154.2397-1-linux.amoon@gmail.com>
 <20210617194154.2397-8-linux.amoon@gmail.com>
 <CAFBinCC0KScn6cJ36ZB_=TRncOOCXJHWwR3s=o3TobH=yOrGJA@mail.gmail.com>
 <CANAwSgRi7UcS22QKZRRhwYvB3Dyk0ChowX+KByEsxP35ezjtKw@mail.gmail.com>
In-Reply-To: <CANAwSgRi7UcS22QKZRRhwYvB3Dyk0ChowX+KByEsxP35ezjtKw@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 22 Jun 2021 22:00:50 +0200
Message-ID: <CAFBinCD1+FTx59kVn7w=RurZVK48S3+pdXYjjW_LEQtTEr87mg@mail.gmail.com>
Subject: Re: [RFCv1 7/8] phy: amlogic: meson8b-usb2: Power off the PHY by
 putting it into reset mode.
To: Anand Moon <linux.amoon@gmail.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-phy@lists.infradead.org, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_130104_622807_4B1F3D55 
X-CRM114-Status: GOOD (  20.98  )
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

Hi Anand,

On Mon, Jun 21, 2021 at 9:15 AM Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Martin,
>
> On Fri, 18 Jun 2021 at 04:07, Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > Hi Anand,
> >
> > On Thu, Jun 17, 2021 at 9:44 PM Anand Moon <linux.amoon@gmail.com> wrote:
> > [...]
> > > @@ -245,8 +250,6 @@ static int phy_meson8b_usb2_power_on(struct phy *phy)
> > >         regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_FSEL_MASK,
> > >                            0x5 << REG_CTRL_FSEL_SHIFT);
> > >         /* reset the PHY */
> > > -       regmap_update_bits(priv->regmap, REG_CTRL, REG_CTRL_POWER_ON_RESET,
> > > -                          REG_CTRL_POWER_ON_RESET);
> > The vendor driver uses the following sequence for the power on reset:
> > - set the power on reset bit
> > - wait 500us
> > - clear the power on reset bit
> > - wait 500us
> >
> > With your change we now:
> > - wait 500us
> > - clear the power on reset bit
> > - wait 500us
> >
> > I don't know if this is sufficient to bring the PHY into a well-defined state.
> > Maybe it works, maybe it doesn't reset at all in this case - I don't
> > know how to verify this though.
> >
> Initially, I tried to some bit mask code to resolve this but it failed,
> So no harm in keeping the original changes.
yes, I feel more comfortable with that

> There is another parameter REG_CTRL_PORT_RESET to be considered.
none of the vendor kernels that I have sets or clears this bit explicitly
I agree that the name seems related, but due to lack of an example or
documentation how/when to use this bit I suggest we don't touch it for
now


Best rergards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
