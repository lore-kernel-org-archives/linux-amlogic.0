Return-Path: <SRS0=UcGz=2G=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD334C43603
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Dec 2019 02:51:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1DEB24676
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Dec 2019 02:51:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ucxSDix0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eN3zEZj0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1DEB24676
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NG0VOKvLSkkFNDfdz6fsNP/lLBOSxNBi5HztXRnzIVk=; b=ucxSDix0loStxm
	Kx1fIHlgN2eFvh4/2PC2BjTam6uWhx7WertBVdG6Ghc9LdmqGxy32e8+rMckL7FqdHOoTuaoGBnPv
	rRPg7K33O7tFEMrMfKfY48Fkzw/aPvA3/baihw34ZkiF71qGhshH5RKzgMiymEkUorzd4zXrdpJXQ
	ve1mEAIQJ1+IPSebYJo/zLIcKAafXL/20StF1StQ+zh9CE3sxQG1xemHUnHzSg1axBpn2dhNoY26p
	zFRWIWJCl5qFlMpquJhQrvDvQOf6/EUzixO/bgzp8npHCIUWHd0dtnFS2szYjznwwHMKmd7BHtaCj
	PbCIsiEY8fZZcFhAHdaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iggU8-0005PW-Hl; Mon, 16 Dec 2019 02:51:48 +0000
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iggU5-0005Od-TM; Mon, 16 Dec 2019 02:51:47 +0000
Received: by mail-ua1-x944.google.com with SMTP id w20so1570955uap.1;
 Sun, 15 Dec 2019 18:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dt2N4SwdmDzKos7KOOuigco4w8TfoOXTqKozyp0A0x4=;
 b=eN3zEZj0WJFI6jBrvhlDydESyJ54sA6i7pO0dzNumgwquUT3cBMjt1kPXWPgLW3+KC
 O/9cPuh7+SCcZCEVWKiGl4Zs9dGE8yqQ02w1E4WnmdJIooJX5r/HWWSIZx+LYM5Gx8sh
 xZDmQj8fadMEQ0zsMW/4hfBKtzJZPbpfh2uo7OJsFUVjE2IYzjqoSxRffWaas85lHWYs
 FEeNRuQmA3WgSTH4Z+N/uv1NtKIesr1j4ANKbjbW9iGkgLYKCOrL1DwbXDVVlVbLyvEn
 pfLgUfG/9SZl0ixCu+Dk5YzqDa1nfiw3FzWVGQzdDb33P+zB6JVF4Vc2J9YNJw5Xj6yO
 8v/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dt2N4SwdmDzKos7KOOuigco4w8TfoOXTqKozyp0A0x4=;
 b=YtgyExk92kfnt+nASKfkeGGzBd5NgFbKX8ojcDkd40Bhd09VD6oALGK+3H0cyS44Rf
 jbuEsldWCvKLxc4qMYst3wYP+NLnkcSd84l6C7dMeF7zkmT6cjf5opMrG7hT14mMZzDT
 GcIudJdRWW22ptQA1ly6n3UF0/5zEYs+z/uAOEr5ZTIg8wYbzfjfdiTgImqCQ3UIxGye
 yASNmC62USC06hNTuXzHHWCDWx5k0xHV0cqs8BN5vnmZNQiZvj62bPLIi5UeaV2tiPp5
 D3xDvRUpCEmFjvFkTFfuAWsetbfg9+HuGg/ukiOYELAPtp/C2C9g6Fy6QZQdKI0rWCkF
 01mA==
X-Gm-Message-State: APjAAAXEy57v9nPOAghAf+6HrnkCqZDX3nmUnp1BF2grw6FBeigjcbtQ
 bsOKmGF6yAuouUED4Wv0GL+/7sM4/1e1PH1Ujyw=
X-Google-Smtp-Source: APXvYqw3MpWIVLjyYNcUhZRmQiQ0xpTyg++SgIZJzbsAahqWonhwopXbf6c/t0aPRJJxhF5A45bTkX9URI3HMonCQGo=
X-Received: by 2002:ab0:7027:: with SMTP id u7mr21346813ual.94.1576464703537; 
 Sun, 15 Dec 2019 18:51:43 -0800 (PST)
MIME-Version: 1.0
References: <20191215211223.1451499-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20191215211223.1451499-1-martin.blumenstingl@googlemail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Mon, 16 Dec 2019 10:51:32 +0800
Message-ID: <CAKGbVbvj5zK9gVDQ3+0=xmF5pOUOSJzZ6jaGKHoCqwjYz+UiEQ@mail.gmail.com>
Subject: Re: [RFC v1 0/1] drm: lima: devfreq and cooling device support
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_185145_948542_E715E8F2 
X-CRM114-Status: GOOD (  18.72  )
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
Cc: Rob Herring <robh@kernel.org>, lima@lists.freedesktop.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Thanks for adding this.

As the license, it's up to you, I think it's OK for now.

For the code, I think you may need some lock to protect the time records as
there are two kernel threads gp/pp will try to mark GPU busy and several
interrupts try to mark GPU idle.

Regards,
Qiang


On Mon, Dec 16, 2019 at 5:12 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> This is my attempt at adding devfreq (and cooling device) support to
> the lima driver.
> I didn't have much time to do in-depth testing. However, I'm sending
> this out early because there are many SoCs with Mali-400/450 GPU so
> I want to avoid duplicating the work with somebody else.
>
> The code is derived from panfrost_devfreq.c which is why I kept the
> Collabora copyright in lima_devfreq.c. Please let me know if I should
> drop this or how I can make it more clear that I "borrowed" the code
> from panfrost.
>
> I am seeking comments in two general areas:
> - regarding the integration into the existing lima code
> - for the actual devfreq code (I had to adapt the panfrost code
>   slightly, because lima uses a bus and a GPU/core clock)
>
> My own TODO list includes "more" testing on various Amlogic SoCs.
> So far I have tested this on Meson8b and Meson8m2 (which both have a
> GPU OPP table defined). However, I still need to test this on a GXL
> board (which is currently missing the GPU OPP table).
>
>
> Martin Blumenstingl (1):
>   drm/lima: Add optional devfreq support
>
>  drivers/gpu/drm/lima/Kconfig        |   1 +
>  drivers/gpu/drm/lima/Makefile       |   3 +-
>  drivers/gpu/drm/lima/lima_devfreq.c | 162 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/lima/lima_devfreq.h |  15 +++
>  drivers/gpu/drm/lima/lima_device.c  |   4 +
>  drivers/gpu/drm/lima/lima_device.h  |  11 ++
>  drivers/gpu/drm/lima/lima_drv.c     |  14 ++-
>  drivers/gpu/drm/lima/lima_sched.c   |   7 ++
>  drivers/gpu/drm/lima/lima_sched.h   |   3 +
>  9 files changed, 217 insertions(+), 3 deletions(-)
>  create mode 100644 drivers/gpu/drm/lima/lima_devfreq.c
>  create mode 100644 drivers/gpu/drm/lima/lima_devfreq.h
>
> --
> 2.24.1
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
