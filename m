Return-Path: <SRS0=E298=QA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED6A5C282C3
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Jan 2019 09:47:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC21F218A4
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Jan 2019 09:47:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E/9+otHK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="KyqlCxnm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC21F218A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i7hw+OxSnKoziQQTdedhy73+mUmis0h3QvCIoSMN+Mc=; b=E/9+otHKxL4Q/V
	5w4y3bgwSU8apv9O/7UOPjxcrrXT1Fk84ubatq4R591kx7k8Afimde2kDETj3wPZyMGtJhBOb4UDW
	RLsr0w9VoZ+DO5E7oG3DLTMFXfvZv4RitGoPI5b+14jOMy9U8C42atIuY3gzOQ8tGEK8YxL4J13DM
	36h3KRAnWyZysTUibOoTE5nEi/NM9Q51fT1p1kjAL03as2yuIhyHchV5nR2FnJQLwBd3Y+EGznqHo
	2G0/3GSwThbOakI0hpXP1bq0rXsSZgev42aXp6I0Wqm/8hhuidEKXftFnCNsQz+kJhNZnWn3p9beq
	SeyuH7okveK74tVPjoWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmbb8-0006eD-75; Thu, 24 Jan 2019 09:46:58 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmbb2-0006bj-Pk
 for linux-amlogic@lists.infradead.org; Thu, 24 Jan 2019 09:46:56 +0000
Received: by mail-ed1-x542.google.com with SMTP id b3so4070915ede.1
 for <linux-amlogic@lists.infradead.org>; Thu, 24 Jan 2019 01:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ME0rz5SsonrtYN9ChIhZ9ZFSOi0ay5CtbTSVpion9Q0=;
 b=KyqlCxnmv4L3viaQMANDb+fINanAb67JVx/6zt4Qktv1H4g76xD1wDkDcIofW5RdY0
 Ba5YfSlchLicDP/y6WJgm5QJjDLH9kY0+gN9dMqetri15M5Mz6nXvlg7dn8+Z4rAeMEE
 UDULxpA0wkJF0ucou5+UfEGWwXX8ogKEnlO6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=ME0rz5SsonrtYN9ChIhZ9ZFSOi0ay5CtbTSVpion9Q0=;
 b=d82WVoN8RaDLVb7sJ7rSHtDQ+e5uNLGGD/OXBmA+E+fG4kqqnl63UU/BAA1zf6gWdZ
 KchBl+LPhbiS3ya5IegNg6Fqbz9e3eb57qeVJTSv/4dF0QeClfacXo1EJnLCoLDn5vM3
 y/BzqSAW8aPLUGyWODssNtlKi4ViE1TzMzI3hMNeLYl3Z3wg2HQ8NhTBJ2Xcy6di+0E0
 Nm6NYCTGgt65OqX3MfTl59mJ2mQ/fc4dgdGt/4Sn3wl9SNF7hiX95G5rt5jn56GXuK1A
 J+XZd/22RhKUEIH4ZrUFMrwg7rbn2Tz70XNdnsJkH/MWpJdQznOaTtN7P1IWcTz5iYgo
 uFRg==
X-Gm-Message-State: AJcUukfmfx3SIDiJ3kNk1ZOdtV8ayVO6kg3y79sLGnXG/mL/5prdrKfl
 pyVe2LTRiYJbJvx3GQyVGaDHsQ==
X-Google-Smtp-Source: ALg8bN4/Jzo5nGSIJv/qkSUJLMIMSvfioivlnWljZGhkvdTBvNWgQmgFPEUTnTWmjk//fiRqWCbmJA==
X-Received: by 2002:aa7:d88c:: with SMTP id u12mr5735270edq.237.1548323210614; 
 Thu, 24 Jan 2019 01:46:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id b46sm11288858edc.57.2019.01.24.01.46.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 24 Jan 2019 01:46:49 -0800 (PST)
Date: Thu, 24 Jan 2019 10:46:47 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm: Split out drm_probe_helper.h
Message-ID: <20190124094646.GR3271@phenom.ffwll.local>
References: <20190116181018.GA27364@ravnborg.org>
 <20190117210334.13234-1-daniel.vetter@ffwll.ch>
 <20190123170015.GA23138@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190123170015.GA23138@ravnborg.org>
X-Operating-System: Linux phenom 4.19.0-1-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_014652_919530_877A33C6 
X-CRM114-Status: GOOD (  13.26  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 amd-gfx@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 nouveau@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>,
 spice-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 linux-mediatek@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, xen-devel@lists.xen.org,
 linux-renesas-soc@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Jan 23, 2019 at 06:00:15PM +0100, Sam Ravnborg wrote:
> Hi Daniel.
> 
> On Thu, Jan 17, 2019 at 10:03:34PM +0100, Daniel Vetter wrote:
> > Having the probe helper stuff (which pretty much everyone needs) in
> > the drm_crtc_helper.h file (which atomic drivers should never need) is
> > confusing. Split them out.
> > 
> > To make sure I actually achieved the goal here I went through all
> > drivers. And indeed, all atomic drivers are now free of
> > drm_crtc_helper.h includes.
> 
> How are the plans to get this patchset merged?
> There were dependencies on onging drmP.h removal in i915 IIRC?
> I guess my "Minimize drmP.h dependencies" patch-set also have a role in this.

Working on it, a pull request got lost. I originally wanted to get this
all resolved this week, probably going to be next week now :-(
-Daniel


> This does not hold up any work of mine, mainly wanted to make
> sure this was not lost between all the other patches.
> 
> 	Sam

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
