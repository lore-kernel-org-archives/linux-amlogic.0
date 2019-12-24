Return-Path: <SRS0=kiAd=2O=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D4E1C2D0CF
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Dec 2019 11:23:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43CB8206B7
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Dec 2019 11:23:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XXXiCt87";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="hV6Sv9HY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43CB8206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qwUQgPUPUR02IJLMkmdgBirmB9UoSJwZsJmUmMAgLzE=; b=XXXiCt8760K/wy
	RTvOPn8fpCrvKf4soFEQsZtWGS/Pp8rynIANOjcoCt24F9BXe3iwLcEOWbFC0OMkDwKg4u4s5f9Gf
	5d/x0pEGAKXB/9VflwCrccfMkLegU/tNu7JrQXroCGeiZe4AbT6TioEWaMAUExwAPMM7us6zJPqs9
	sQPVtR8+zzKqYVHl4H3CsYctJfefX941uOKfXf0okFocjruPDVbvyUkbWMRWTQ9cIKjRe6fhqUsKt
	rS/QKk8NvhDPcO54Emu8711xEU8MZkecvamoen54PYi8r9FFO7txeIrlvcZ+mkpiGQSg/KbNiwBdN
	xNR8pMc0vJwQb6HK69BA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijiHO-0000E4-Su; Tue, 24 Dec 2019 11:23:10 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijiHL-0000DX-Jz; Tue, 24 Dec 2019 11:23:08 +0000
Received: by mail-ed1-x541.google.com with SMTP id c26so17691589eds.8;
 Tue, 24 Dec 2019 03:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c47JlWEDIhN2S2u1wxTqqESFzvVYGhPlp0cUwZlGkVY=;
 b=hV6Sv9HYva9wtb8hp6tNO6tvePcODpHmJZu/VUzADMIq7e1lydd4AIQm5QcNgB8QLH
 1h+gGHLMQV+DC93LLBNgu5GAcaNfeOYim8qnsSVtJUOBuN5Hcmf3dlduNlw31nhQTYxs
 osdHml8BruM08yn80dRcRPGWfGicWKVsHl0QUj5Iq7BUC/0x0x5AZg+Xs5N3AaEG5l0e
 1hgTzroXNUUC/XTQAcz+7jatKQAUGqM5BqvFRiXGZPRKK0M2gIvP27m5xjBtoCJLxJFT
 S0aFgzHrxoKwh8kAkkC1Q8gr7awSD4Q8qA2B0IdA43b9YkQFPkFIvnRPc7PXIo7w9TXJ
 bfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c47JlWEDIhN2S2u1wxTqqESFzvVYGhPlp0cUwZlGkVY=;
 b=Y3sikXFWNgck44l94vK6/xVrh7HelJ+9xhXK7SHTtDGRrwP2hrhHFgi4cO3HSIxp9c
 R/oZ/94EnQCDhYikoCJwZlTzj3CTnM6HMBN4KFYUgDt+9UW9DEJigzscmeGucIXkrmqA
 j6HvmWw5boggI4V/9FuB36LCuHQy9CcUpPEd4siMTP2vweyrU6fl/Vay02num2K56pny
 p1dpxdhmXZG+/DKXrC+4oYsmJuZqnxWk3iRTiK0eOWlMQkM04AYml3uur+NbS5av6vFu
 VI/eFkAMHwGnRdr167Yz/ZPcrT4J8JJWMfi5RFUtdCjz0VPKuvESCNjI/N2RNnTE96VF
 qyTQ==
X-Gm-Message-State: APjAAAXSXKR4z+fzvNhWUC6+0d7VPK8iDVPgACXYMVUdPbiCHAk08xp8
 HeysCqNHtGrqZNQpRgDT9lrqcgh/OI0JdCeFI60=
X-Google-Smtp-Source: APXvYqwD+JCN10hMA2DFib/zOkIvt8olsyADG5yMRQAnRIpVdhoobkX+Lq9zRK7zOH1PNOCsg/qoxPJQkum6XaM3KOE=
X-Received: by 2002:a17:906:339a:: with SMTP id
 v26mr37490223eja.2.1577186586030; 
 Tue, 24 Dec 2019 03:23:06 -0800 (PST)
MIME-Version: 1.0
References: <20191215211223.1451499-1-martin.blumenstingl@googlemail.com>
 <CAGb2v6528SUOyefhsnjEwG7vfud3+Ce+_=CM3cM4vKiRcmNXAA@mail.gmail.com>
In-Reply-To: <CAGb2v6528SUOyefhsnjEwG7vfud3+Ce+_=CM3cM4vKiRcmNXAA@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Dec 2019 12:22:55 +0100
Message-ID: <CAFBinCBTL05FLiZfBGdGCdq2JZ-_W_zDYKP_nrrUs-YEwaHCfg@mail.gmail.com>
Subject: Re: [RFC v1 0/1] drm: lima: devfreq and cooling device support
To: Chen-Yu Tsai <wens@csie.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191224_032307_658201_B76BCB4A 
X-CRM114-Status: GOOD (  13.30  )
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
Cc: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, steven.price@arm.com,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 yuq825@gmail.com, Daniel Vetter <daniel@ffwll.ch>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 alyssa.rosenzweig@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Dec 16, 2019 at 4:03 AM Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Mon, Dec 16, 2019 at 5:12 AM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > This is my attempt at adding devfreq (and cooling device) support to
> > the lima driver.
> > I didn't have much time to do in-depth testing. However, I'm sending
> > this out early because there are many SoCs with Mali-400/450 GPU so
> > I want to avoid duplicating the work with somebody else.
> >
> > The code is derived from panfrost_devfreq.c which is why I kept the
> > Collabora copyright in lima_devfreq.c. Please let me know if I should
> > drop this or how I can make it more clear that I "borrowed" the code
> > from panfrost.
>
> I think it's more common to have separate copyright notices. First you
> have yours, then a second paragraph stating the code is derived from
> foo, and then attach the copyright statements for foo.
thank you for the hint!
I found other examples that do it like this, so I'll update it.


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
