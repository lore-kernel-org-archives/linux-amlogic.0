Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05AD5C6FA82
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Sep 2022 07:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YZ0mOGqpDqmJwDmTSfNlx5xdJWEk9Fv48j9pp2d0eBc=; b=nNgxLOyrJbHDIN
	kFv86UUKpx4PWMffsM4YwxlxGyVYmObehNgzQas9CauRVPj5ATEH0bOaeb+PLHV0FxrH+PV/hVZpl
	KN8G5AJWG50GjTmaWRM0B+q+irr4Z3NWIEYJDzWLXvHPjPHrAYwkOIbIqLQ843mCAzbgtX7mpkazr
	ZgGxLxTv5zsFYp1H74ckGz8p5cnR3BVIbw0zZ3rofYG15T+JkTvVNpziRqeL30/vXRmHPYrMufBBv
	kWqHLZhN53WvNJXmW/BEP5GnOEYyarycQoeMoW++eNJsW4RcSmxuzcvV4dN5shFWpII9ks3WHEHzG
	9kFgPCD84/SDXpjs3kXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY0mB-003r7z-2O; Tue, 13 Sep 2022 07:56:11 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY0m6-003r3C-A2
	for linux-amlogic@lists.infradead.org; Tue, 13 Sep 2022 07:56:08 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 202so16403715ybe.13
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Sep 2022 00:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=cLpbb86UrbdT6Fmy4lqyat3r0rgj69ADWnh5PWd/WeA=;
        b=Nj+/nuQcfIknUGti4zXJEeziglp1/iJvtBvdYNeyVqEsJ5By9njKtfGlJBOOR8IQLV
         q4K/oFuMhiGTt11Egdf6HPMlS/lMqPRvJj4Ks+BpEKzDFwuADOKLXOxtdMMOGigRxlQR
         eXHrTwffRbxNKjrbpVCZtcx5ATMEwhNSP4a6pjOMMTR/ISP+8epFBSv+M2AdrAOx64XK
         9ZnW/UQb6VO8R+6Qlwv/P0GeOTu0x9qhZicfiMqTcT+iXVH7JJveB3p3xnQcpAVRiDV9
         SmjFX7g7ZhkLJKqKlwO7JqENZut5DQFC4/7YBzzrpHYWq+Nom+xIKfe8HhelApkgmcvI
         fxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=cLpbb86UrbdT6Fmy4lqyat3r0rgj69ADWnh5PWd/WeA=;
        b=sX2WeV8RxdWe/jhRxOes08Knxdr3rce6Mh0vKaX+r5UIngKxSKL6E41EFigeUvxCGi
         kVIZkCIolW9Q6lyplkAMU7brsNDdiivs3K8jlZFJEJIr141sEA2IAnmFzyAnC+gzs9Pu
         mC44iQW69Hc+07Y6cpSEj3yUPk78qVVqx26hjAZUQfJJVm+Fv/WtjEOXQ7qXiXxivkTE
         0AuEQdOzafhWOWiwVAPttOjg/6kVGyaXbZqaVnUPiHnJ588/G+V76V4RneaEdudbuwRI
         kCaUhC45tJtH8NK0fCtYsMe1a9apVo+FUQdzRqUrK2UkHfFUaBGN2HrFWw+kqVoraJ3k
         F9dw==
X-Gm-Message-State: ACgBeo1guVeUbPvjxe9IrnFRzgeHo88Wom2cE91ekJR1dQnMmDVIdCz9
	czzwNSLbbVYNn4NndIJICKbZ/Skl9puM4QXqDvY=
X-Google-Smtp-Source: AA6agR5tCkIemEq9F7BHd5gX7YHzj9YA4lfp0b/xqFnQt49xmGWGBv0Ee4/8dIvOwqxu4/ETWiTPNEnStCbHr2aXrT4=
X-Received: by 2002:a25:8242:0:b0:6a9:1089:e68 with SMTP id
 d2-20020a258242000000b006a910890e68mr26634924ybn.452.1663055762369; Tue, 13
 Sep 2022 00:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220707101423.90106-1-jbrunet@baylibre.com> <00f1e968-c140-29b9-dc82-a6f831171d6f@gmail.com>
 <CACdvmAiyFQTUgEzkva9j8xYJYYBRXg_sfB562f3F515AHmkUoA@mail.gmail.com>
 <5c8f4cc4-9807-cfe5-7e0a-7961aef5057f@gmail.com> <1jfshftliz.fsf@starbuckisacylon.baylibre.com>
 <CAK4VdL0pWFga4V1jR8B4oHjXmbBm7dU6BB8pdh0Hymd2sAiqiw@mail.gmail.com> <99839201-6c30-b455-2f32-ea0f992427fc@gmail.com>
In-Reply-To: <99839201-6c30-b455-2f32-ea0f992427fc@gmail.com>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Tue, 13 Sep 2022 09:55:50 +0200
Message-ID: <CAK4VdL2b+LjEsXtkDi=judJXj2gEjHL=6QxNFeiPjmdQq8NceQ@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH] net: stmmac: do not poke MAC_CTRL_REG twice on
 link up
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Da Xue <da@lessconfused.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, Vyacheslav <adeep@lexina.in>, Qi Duan <qi.duan@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_005606_368933_A2F94866 
X-CRM114-Status: GOOD (  20.25  )
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

On Mon, Aug 29, 2022 at 8:25 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> On 29.08.2022 12:29, Erico Nunes wrote:
> > On Mon, Aug 29, 2022 at 12:02 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> >>>>> Jerome, can you confirm that after this commit the following is no longer needed?
> >>>>> 2c87c6f9fbdd ("net: phy: meson-gxl: improve link-up behavior")
> >>
> >> This never had any meaningful impact for me. I have already reverted it
> >> for testing.
> >>
> >> I'm all for reverting it
> >>
> >>>>>
> >>>>> Then I'd revert it, referencing the successor workaround / fix in stmmac.
> > If we are considering to revert that, I would like to trigger some
> > tests on my S805X CI board farm as well, to ensure it won't regress
> > later. That was one of the original reasons for that patch.
> >
> > Since there are some more changes referenced in this thread, can
> > someone clarify what is the desired state to test? Just revert
> > 2c87c6f9fbdd on top of linux-next, or also apply some other patch?
>
> Yes, just revert 2c87c6f9fbdd on top of linux-next.

I see that the revert is already applied.
For what it's worth I ran have been running some test jobs on my CI
farm with linux-next and the patch reverted and haven't reproduced the
bug that originally prompted 2c87c6f9fbdd so far. So it seems to me
that that patch is indeed no longer needed.

Thanks

Erico

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
