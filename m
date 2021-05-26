Return-Path: <SRS0=o2l2=KV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEBEDC47082
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 May 2021 20:34:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E858613BF
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 May 2021 20:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E858613BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZRi5ELR18YxPj89LV53LXe3FcE7g77Omu3f5uRQbI0U=; b=3FZi1XfiB+Npdw
	ZasQZoLfW5N2N4NJlfpkIkHND3dPfOzYTgsrDv6GnDgaQ32L5MGWUvXszgS2Nta2ecKF3aNDRtiax
	/LT/nbomfRqVd9aJ/pGX169+oWU1SLe9ZUjMeCNl9pvRB8zpd9lqjEicBJSL2YD8mHT1geIYRGp6F
	0PEqIlyM1IRfoTGrXBKi1NbJPfOTCvgWc529aMFYeF/dSCE+mPbHiEBOB+HcOw7HusdaSR1p1pOri
	WOAOWTP6DmnRZr0heH+rJ+8PSrnKWTHRElWesnwDLpey2qfQMgbuLFY3/sD15PyXWKClLiCQc+j57
	zPZjE8ytnBwC+SuXFSmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lm0Eh-00HRej-Pe; Wed, 26 May 2021 20:34:39 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lm0Ed-00HRcH-Oo
 for linux-amlogic@lists.infradead.org; Wed, 26 May 2021 20:34:37 +0000
Received: by mail-ej1-x62b.google.com with SMTP id k14so4546757eji.2
 for <linux-amlogic@lists.infradead.org>; Wed, 26 May 2021 13:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T+H5imxboEvEWcQL8bX7Z9RtUIPqocaQ+NYdLS1t4Ck=;
 b=HSmKXi2TWc7xf7qjsKK8NxcAYATC8XtTuu/2y4yEqr56ILpp+zQprYIJb2vjKTkNCC
 MFg9PKb7cS4sf21kjaflycsFcMFT9uB9lbKeEJoH2eOXNvYy1LeQ3OKP25VpzqGUVKE9
 VV4AI2JQfdMy/hJXRAMtYJ3sE9ICldVDFVzWpbRk12GGBcLcG9rhnTwaghtrRyq3nab4
 astqgBbbnWcBHCcB2kCF2O3SWI2psjKLfVgwpPPgqKdV2Sd3G3T0UukulRNofXCs2IgT
 2APBEhkIHAvuQUHkI3FmF1uIUSAZd34l/rrsszlBohY/nxB5VV+EdjGFbhcQTnO4nJV3
 /5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T+H5imxboEvEWcQL8bX7Z9RtUIPqocaQ+NYdLS1t4Ck=;
 b=P6VSZa40X8qn5ZndtwYBhV8CxoDpWwI48c5dAQ6mOvroYK7FzWkVkNAvmiU05/gigx
 c50NkL4aSori9yG7GO/DtxAFA1g67/FenB3yxCHHsxIWGJtbu1u9GSQ8baXVJ+FLPEQR
 s7jxQ9yWvO9Ya78gYrrz8wz5VNM4kUNssoQkyNDEWQwOus/cY3PnyaOwHMk5gcF0E7jw
 Amnrfgt/frYLHuBjgq/Wx/LOaSsw5vzXnaqhh0wfBkQDq8pLLfN0sVH3CqNLaxdp7FXD
 YxVHtYYzKIo446f9IpoS0H4E0dspYFdxTYOKzw3n0mnB3ftR6BFcFvhotwxE/vdidAKN
 iqzA==
X-Gm-Message-State: AOAM531dNyFA4GkA2FlRrenzu3ZAy+l8wHDMtNuzNE2Qg88mq7moJPbl
 vx6Bmv8mlhH/985WfTudrHaeUnnZHtIUu1liAL0=
X-Google-Smtp-Source: ABdhPJxyBEVgA7PdW9NE11ABNjc9PaMIG2UijMlomerRQR8EIhbXqq2qeABzfmsKFl9q9zhCeYfYXL6Lb16BHy7dlmE=
X-Received: by 2002:a17:906:6941:: with SMTP id
 c1mr153377ejs.172.1622061273827; 
 Wed, 26 May 2021 13:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAFBinCBuFzJVXFdDqpy9HgWt4AMMk_jeOWvQ-mYke2z274FXPQ@mail.gmail.com>
 <1jeedtb8o0.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jeedtb8o0.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 26 May 2021 22:34:23 +0200
Message-ID: <CAFBinCBJA03r5VdqkszsYWjZYZLsZEbrsmtrpLVyMV3-i=26wg@mail.gmail.com>
Subject: Re: #linux-amlogic IRC channel: move to Libera.Chat or OFTC?
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, 
 Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 carlo@caione.org, Beniamino Galvani <b.galvani@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_133435_859516_088C01B5 
X-CRM114-Status: GOOD (  10.33  )
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

Hi Jerome

On Wed, May 26, 2021 at 9:24 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
[...]
> > I have no strong preference on which network to choose.
> >
>
> Is there any difference between the two networks ?
OFTC was founded back in 2001
Libera.Chat is run by former freenode staff members and was only
founded this month (May 2021)

I picked a few channels I know about as examples
lima and panfrost (our GPU drivers) have moved their channels to OFTC.
LibreELEC, armbian and #armlinux have moved their channels to Libera.Chat.
I have no doubt that there are more channels out there which are
"related" to #linux-amlogic.

Neil just wrote: "Half of my channels went to oftc and the rest to
libera, so the choice is not easy"
It's pretty much the same situation for me.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
