Return-Path: <SRS0=45KS=NO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B24C4338F
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Aug 2021 20:49:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77FB4613A6
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Aug 2021 20:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77FB4613A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HO9WT9ReCRtE5Hgub1uhOgRSRf9OICfKEArRT1aJn+8=; b=0//9X2pw1NRWfw
	WGY4JevnbnX8KKqVIvTWNR4+wH9xYp2xY0/OqmqXHrDW22cD4m/Ww5vXmapqJO4bUx2cWx5uio7cz
	p/fDCtnFwdDWT+fD3IWk1ugKSMbq/hbC09EtiV4hMgc5yH1uZcowjw1Tws1pczeBjw/AlRclXC9WQ
	cfa6qQP74bPuh8rtwFs/uV9769rcbo8BPlp6fLSpmfuI696lXuGDJgDGzftSwIb/ORpAz3RO0FM0L
	z/0fmNC7ASNklTvJJbU/REGmt+hx9nHN2cNGpdL7pMtcnP9aZnM6eJ0myq0neTRnZJk/2+I0ag+fL
	itu/7bQ/B5QR3qk4MyYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIGsS-000enU-1E; Mon, 23 Aug 2021 20:49:04 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIGsO-000emU-UA
 for linux-amlogic@lists.infradead.org; Mon, 23 Aug 2021 20:49:02 +0000
Received: by mail-yb1-xb33.google.com with SMTP id e129so12658725yba.5
 for <linux-amlogic@lists.infradead.org>; Mon, 23 Aug 2021 13:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c4QWnKvyWpOH8RqtwiwvK1dM7ed/hnT2KBqNw0j6U7A=;
 b=WbLChwgFihPdWlSC5y/qfShp0sIMtUsZdd/qhdA8yq+uKZnAylNBckILex07AGi/wm
 rgZ5uYq0OPLEDOjJjQNpJ+Ju8diDdxaDfCQwrnIx6lNmgzG/K2/mjgJLi6O9hgP9CCSf
 dAr8SWboRRD53wvgWYtAkjNiKwtx3QVlmKpOmrZzZczCSdPUvwPvbZTPXzhzLvAdAErk
 L9Q1MmJtxS/hNGKqRBqgzPLO1pCbAe5NUB7lFPq7KGs+5AAx41fIbogLHTls71Tlvoad
 RCv0gxozyF+yls+T9/8vUIxB2JtDhqhZt2c8n/mXIiynaLbj1SkY6RzF6Plg37vpje3f
 AtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c4QWnKvyWpOH8RqtwiwvK1dM7ed/hnT2KBqNw0j6U7A=;
 b=JbIhss+Zlc5ia84p5D4bZi9555jkxrjFB/kGg5UD+Fz4bIyxTaETg+N5Pdy+XmC9Ce
 H5nMT5TsvWVzssGE+BMnQbz8Y01JtImUq6LclzqHZOtJ8w4qGPu5VdDbDrXC29lze2El
 eEMYq6SjeNQltMCSoz3tJ8Um49djlXwKqfSsdvRkKokBfIkJKgrjtPCxtrLuRFgHEN7a
 YTXgDFsey3W/kw0CHWUs++RFeDNORC/U5fUWmd9d88tHD5y/KAoo4GJyxSZrXdyUJsSt
 ocoGqtoJQAkCEK4xXJsC3Fl32/yIDxmoSQ+wr2QXXq2LnObkOSJv7u1bvji4ReMP0ipg
 aTbg==
X-Gm-Message-State: AOAM5309MVPVWAt5soIkunVi6m/w0hqWq/0TP+qLxGDJl3niiCZmDtM9
 PCpL9TaB5oacsbg9mKE92P2NCX/Ri0IVkP0HVTuBaA==
X-Google-Smtp-Source: ABdhPJwU4w+ipd7j7HdZ0lrNLOvWfCuRfa/YomiIcCCPAc8CHcQ0D0Ea8O7+8nRuOQnuqDlL/BU0zgvC8Y9HniorxT0=
X-Received: by 2002:a25:8445:: with SMTP id r5mr47936513ybm.20.1629751738986; 
 Mon, 23 Aug 2021 13:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20210823120849eucas1p11d3919886444358472be3edd1c662755@eucas1p1.samsung.com>
 <20210818021717.3268255-1-saravanak@google.com>
 <0a2c4106-7f48-2bb5-048e-8c001a7c3fda@samsung.com>
 <CAGETcx_xJCqOWtwZ9Ee2+0sPGNLM5=F=djtbdYENkAYZa0ynqQ@mail.gmail.com>
 <YSP91FfbzUHKiv+L@lunn.ch>
In-Reply-To: <YSP91FfbzUHKiv+L@lunn.ch>
From: Saravana Kannan <saravanak@google.com>
Date: Mon, 23 Aug 2021 13:48:23 -0700
Message-ID: <CAGETcx8j+bOPL_-qFzHHJkX41Ljzq8HBkbBqtd4E0-2u6a3_Hg@mail.gmail.com>
Subject: Re: [PATCH v2] of: property: fw_devlink: Add support for "phy-handle"
 property
To: Andrew Lunn <andrew@lunn.ch>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>, netdev@vger.kernel.org,
 kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_134901_020979_A5204DFF 
X-CRM114-Status: GOOD (  20.64  )
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

On Mon, Aug 23, 2021 at 12:58 PM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > PHY seems to be one of those cases where it's okay to have the
> > compatible property but also okay to not have it.
>
> Correct. They are like PCI or USB devices. You can ask it, what are
> you? There are two registers in standard locations which give you a
> vendor and product ID. We use that to find the correct driver.

For all the cases of PHYs that currently don't need any compatible
string, requiring a compatible string of type "ethernet-phy-standard"
would have been nice. That would have made PHYs consistent with the
general DT norm of "you need a compatible string to be matched with
the device". Anyway, it's too late to do that now. So I'll have to
deal with this some other way (I have a bunch of ideas, so it's not
the end of the world).

> You only need a compatible when things are not so simple.
>
> 1) The IDs are wrong. Some silicon vendors do stupid things
>
> 2) Chicken/egg problems, you cannot read the ID registers until you
>    load the driver and some resource is enabled.
>
> 3) It is a C45 devices, e.g. part of clause 45 of 802.3, which
>    requires a different protocol to be talked over the bus. So the
>    compatible string tells you to talk C45 to get the IDs.
>
> 4) It is not a PHY, but some sort of other MDIO device, and hence
>    there are no ID registers.

Yeah, I was digging through of_mdiobus_child_is_phy() when I was doing
the mdio-mux fixes and noticed this. But I missed/forgot the mdiobus
doesn't probe part when I sent out the phy-handle patch.

-Saravana

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
