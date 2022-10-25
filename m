Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B75C38A2D
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Oct 2022 07:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ps4wQqDyiSN5KqZ5h0vF6/NVFxll2QCAdOORIERvHhA=; b=pOskSOjVIW+Ny1
	gBbfnwlsgSdIcTfQ+nBiA07bPOwgCOXLNm2iC0tZpbOiqbKTE294YdZ96CbOwOEtB9Jk09e3weshw
	tqOM98HrmmHdNw763Zwy2KEjwZVf+RsMPt63bsW2lCBRAKoTXs8GpnRFDGUrzB1MaGB/yi/ZmxOBW
	G0Z62fy29AalXQRs9kJb45DLn9o4jJbrc3IA/vG+ayThZhFn+MO0hgXQvNv5K/ivqHL+ZqL7h3ils
	miM7xHTXR32us6yDGpuVPti0x/GijL9oQzCB6DIQpCC9gmVQ35dSR2wHgykju/IKTc/vSFe8aqhOh
	NJQ7ZkqFxhVujFcAm5Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onEQU-004AZa-K8; Tue, 25 Oct 2022 07:32:42 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onEQR-004AWj-Ew
	for linux-amlogic@lists.infradead.org; Tue, 25 Oct 2022 07:32:41 +0000
Received: by mail-lj1-x235.google.com with SMTP id bs14so15694637ljb.9
        for <linux-amlogic@lists.infradead.org>; Tue, 25 Oct 2022 00:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+r3Ej5MJ+sN5EgIN4UbB8uiEPUjhfnn1clmg3no9TJA=;
        b=dHEXI2+TslzzCiyCa1KMcE47r1HtIoMwtoBUvkYBvqpP87fm4EUvpXQfRQ6MXO6AuC
         9xeO4KO3F0T+tFK/WMcBGLd+yq4Fw4c2AXe1ISkqTIDMK654s+kSbgEVGoLARnx3uoJW
         aD0U5w1Q9U2FxNEaud2UGBpkhZQnjHh9Yln5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+r3Ej5MJ+sN5EgIN4UbB8uiEPUjhfnn1clmg3no9TJA=;
        b=T1dDVywcqMB37jkFifwdX3qcOYmA/T5LCmj6i0cQB/vuPDYe7QnPfG69DeFXLvdpmX
         W7idayt9cIM7R9CpG4z61UlOUmanUUIe9NZVmb1N0ej0MGdI+0V+eVM1lil6FhxisYmu
         5jzp8F1uWVw6UQ4GdNWji5/jxQcYZdSzHkHNQ+QzbEmbV6LO3xuyxNc6161AfsaC+w7V
         fxHBBNkaXqCJ2EKF2+z8tsQ1WLbWB9myDJ+uHdavqzVsT33+jzvfPyzk9xD84pXUmsc3
         ENIxTm5bDVLz+2YCjUTPUYwmrwK2BNAp8Ji6JB6n2iZsXOp/XyaIEFNJDNUiBRzj1u6U
         A0zw==
X-Gm-Message-State: ACrzQf0TMGHqysHNz3dz0F5dsAhPBKoA3qafz2vF2vB6X52Can258wzW
	ByJ4vVe19uM/fmMbKykUofXvwq8ywaK4q9Wfjyvz7w==
X-Google-Smtp-Source: AMsMyM7I2ND3r5rWOu78x2UxeUO/s4RiLWEaBOmN4MFRAA0t4abyOutiAaFD3Hl5qHMnJY+WWxw8umC0FhsMF7F5Qq0=
X-Received: by 2002:a2e:b055:0:b0:277:a98:aac0 with SMTP id
 d21-20020a2eb055000000b002770a98aac0mr3617068ljl.480.1666683155618; Tue, 25
 Oct 2022 00:32:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220829093141.45583-1-tomeu.vizoso@collabora.com>
 <20220909141528.5090-1-tomeu.vizoso@collabora.com> <CAPj87rMYW1xZdacZ1Y0qk+D9xpqsqE+cwbQ1j1nZ7S+RKpzOoQ@mail.gmail.com>
In-Reply-To: <CAPj87rMYW1xZdacZ1Y0qk+D9xpqsqE+cwbQ1j1nZ7S+RKpzOoQ@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 25 Oct 2022 09:32:24 +0200
Message-ID: <CAKMK7uGkFP1jSNQzv37PvSqvOtt1FnbfbNyYEf99WM=_2AszSw@mail.gmail.com>
Subject: Re: [PATCH v8] drm: Add initial ci/ subdirectory
To: Daniel Stone <daniel@fooishbar.org>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>, 
	Jonathan Corbet <corbet@lwn.net>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, 
	Heiko Stuebner <heiko@sntech.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Rob Clark <robdclark@chromium.org>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com, Neil Armstrong <narmstrong@baylibre.com>, 
	Rob Clark <robdclark@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_003239_530547_2594FD79 
X-CRM114-Status: GOOD (  28.38  )
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

On Fri, 9 Sept 2022 at 19:18, Daniel Stone <daniel@fooishbar.org> wrote:
>
> Hi,
>
> On Fri, 9 Sept 2022 at 15:15, Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
>>
>> Also include a configuration file that points to the out-of-tree CI
>> scripts.
>
>
>  I think this para is outdated given ...
>
>> v8:
>>   - Move all files specific to testing the kernel into the kernel tree
>>     (thus I have dropped the r-bs I had collected so far)
>>   - Uprev Gitlab CI infrastructure scripts to the latest from Mesa
>
>
> But equally - and sorry for not jumping on the IRC (?) discussion as I was in the middle of other stuff when it came up - I'm don't think this is the right plan.
>
> Mesa having all its CI in-tree makes sense, because merges happen rapidly to a single canonical tree. If the scripts need to be changed for whatever reason, we can merge something in under an hour and everyone immediately gets it. DRM is quite different though, given the forest of trees we have and the long merge paths between them. I worry that merging the CI scripts in-tree - especially for our initial attempt at it, when we're likely to need to make quite a lot of changes before it settles down to become a stable system that works for everyone - is shooting ourselves in the foot by limiting our flexibility.

So the entire "we have multiple trees" is why I want at least the
gitlab-ci.yaml in tree, to force people to collaborate more on one
thing instead of everyone rolling their own fun and hacking stuff up.
And there's still tons of stuff outside in the separate repo, like the
lab status so Linus doesn't get a silly history of lab flapping.

Also wrt "developers don't get the update right away due to
backmerge/pull delays", that's why integration trees like drm-tip or
linux-next exist. So maybe initially we should make sure the ci
patches go in through drm-misc, to maximize how many people see it.
And even for mesa it's not fully automatic, you still have the rebase
your branch if you picked a bad one for development (but yeah marge
does that if the MR is ready). If you're doing kernel development on a
linear tree instead of an integration tree, you're doing it very
wrong.

What I think everyone agrees on is that we probably get the split
wrong and need to shuffle some files back&forth, and that's something
we need to warn Linus about I guess. But somewhere we do need a split
between internal and external stuff, and personally I'd like if at
least the pure sw testing (build and virtual stuff) could be all in
upstream.

> Given that it's currently very dependent on fd.o infrastructure (published ci-templates, the registry, the specific-tag runners for Collabora/CrOS DUTs, etc), there isn't much of a portability gain in bringing the scripts into the tree either. It's a good goal, but not where we are today.

I don't think there's huge chances for any non-fdo gitlab anytime
soon. Once we get there we might need to figure out how to standardize
the hw lab interfacing, and if we have all the sw targets in upstream
that should help with shuffling stuff around for a hypothetical LF
gitlab CI (or whatever it is).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
