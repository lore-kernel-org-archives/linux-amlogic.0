Return-Path: <SRS0=0Q1W=UM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75ADC31E45
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 08:20:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87F9A20866
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2019 08:20:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sQLOJCEy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Ii3ivdWm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87F9A20866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xyhHb0KgmqL8w808IUJ7I9YYNgu1B4yc9il6w3qOuWk=; b=sQLOJCEyXtp5pd
	IHr1eeFf7TvuYwYaGez6pax1AXhZL+dHS4XqdROYVBesgzcBbh8ylEpteFKTDQliTkxvMb+CrYD3+
	uqOWzPT1GoT2V+uPxv7+Ouhv+Xpz3JwJA82utraELf+e9+9Enxr0k4zmadb4nqB4VbxVl2QIzSYxB
	UnhYs9G+R+58t/VgeQfcdh4PHjBxlUCsUCuxbGv4orwzB+1XT9BbCI0VybO6rjUpsQxFNpxrGzMyw
	oYp5FajyblkVqWfUP6efhekSCETafqUZEnuwGCvpaaMkkMA0CO+4eUVYd948oK4XUsMVdb5q9+Vz2
	Ivji9NzWKSqYi7vimB8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbKxm-0007NE-K7; Thu, 13 Jun 2019 08:20:02 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbKxj-0007JE-66
 for linux-amlogic@lists.infradead.org; Thu, 13 Jun 2019 08:20:00 +0000
Received: by mail-wm1-x32a.google.com with SMTP id c6so9127013wml.0
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Jun 2019 01:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=lMgrbgr5m4Rq383287CDalQy+dWiEqm9D3wZKZJwVy0=;
 b=Ii3ivdWmrHA0L8XZV2P3l5I1A/5IfUpok0nrJ9pPWLa2IWymXolnQquEyavScsIeLh
 Vrl3jl3bKOERQkvJVrPpUPYaMyNg+HdYxS2uMhD+LiemEdRHGl+/Q4hEsbYTrSq8noXg
 iviXzrJYDonmf93KMDsRLuaRX/CVlBZSOFwiGG69Awm0Mq3yUNOAbJ2YO4mAEqoPzl90
 bW7EOuY/IkpRaCSTYd2jCr3s26DtImg58AY53+ELiluZSIBwKujI8SBqnOlYQAisNsCb
 aL8KZ1677LH065FzPs9kvDQmVfr3MLyeluZtqf2RGt5X46B8QKsz5lN5LXoAiEY2bRCA
 CGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=lMgrbgr5m4Rq383287CDalQy+dWiEqm9D3wZKZJwVy0=;
 b=PsiSt2kzPmWmiAfz7toQaGentCEfVrYVCImReTUwf5iaagAP+eQS+oU9ukLNFQf9Py
 goA461z/P7oFwLYnOEV++1ReNvaN5IkCNEW5sCG3k/i92+XAt12AQrVDRzr/tnHRl2mR
 th64Q52F5SU2wlV5WzoaR8VAo6pBpmPrC6ZGlzQrEFA/0ufDWMQ6wrFHolOzcwXfjBDz
 U92wfYDgwA6IEp1EoX5h6QGHD93so+wcYOwDeg6oMG3dts4htpnNiWCUSe2EKdOtny2R
 vQ3WL3PtiLEzi2XR3qsgSvyBcIFO+2xXvefNaVU0ovu4UNoc1J4XmjT2J/cBOrbLKJ/Z
 DQ/g==
X-Gm-Message-State: APjAAAVYaMkbM4rPXtvv3DcyokY7fItimFwrtKjoepOmkUdSYJfQDGyu
 8em2XlBOL2r3bB2mSdcYNShEaQ==
X-Google-Smtp-Source: APXvYqwAhEgTqcc4HsUpnrH3aYRdCJ35vX3Cult1dw2Ys29bWPKwU+d0WEqChPnt/nYzuchsbvx4cA==
X-Received: by 2002:a7b:c0d0:: with SMTP id s16mr2627651wmh.141.1560413995247; 
 Thu, 13 Jun 2019 01:19:55 -0700 (PDT)
Received: from boomer.baylibre.com
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id l9sm2382040wrt.13.2019.06.13.01.19.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 13 Jun 2019 01:19:54 -0700 (PDT)
Message-ID: <df0dad551db9f344e53db134a3c5a25d5d51ae63.camel@baylibre.com>
Subject: Re: [GIT PULL] clk: meson: fixes for v5.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>
Date: Thu, 13 Jun 2019 10:19:53 +0200
In-Reply-To: <20190612230201.3692F20896@mail.kernel.org>
References: <a834836da8de689ec541093f3226a853af001fe4.camel@baylibre.com>
 <20190612230201.3692F20896@mail.kernel.org>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190613_011959_290615_23280BC9 
X-CRM114-Status: GOOD (  13.10  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, 2019-06-12 at 16:02 -0700, Stephen Boyd wrote:
> Quoting Jerome Brunet (2019-06-11 05:23:33)
> > Dear clock maintainers,
> > 
> > Below is a request to pull a couple of fixes on Amlogic clocks for v5.2
> > These are typos in recently added clocks, the most annoying one being in
> > the DT binding identifier on the MPLL50M which is used by the network PLL.
> > 
> > Regards
> > 
> > The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> > 
> >   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   git://github.com/BayLibre/clk-meson.git tags/clk-meson-5.2-1-fixes
> > 
> > for you to fetch changes up to 3ff46efbcd90d3d469de8eddaf03d12293aaa50c:
> > 
> >   clk: meson: meson8b: fix a typo in the VPU parent names array variable (2019-05-20 12:11:08 +0200)
> > 
> > ----------------------------------------------------------------
> 
> Thanks. Pulled into clk-next.
> 

Hi Stephen,

This was actually meant for clk-fixes
We could probably cope with next, but it would be preferable if the typo in the
bindings was fixed by the 5.2 release.

Thx
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
