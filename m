Return-Path: <SRS0=Y1av=2V=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1F6C2D0C2
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Dec 2019 14:20:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD5822064B
	for <linux-amlogic@archiver.kernel.org>; Tue, 31 Dec 2019 14:20:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SOB/9LAG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="XznbIAtg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD5822064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SPq1xYMO2KwYf5pEVkc2c6+xZgS5QYXYmJgvO9ctMMk=; b=SOB/9LAGwgCUVw
	avTIDj+NC1X7WW+3Rg66wAxDoraYwc0GpJAHOSVF5BYSll2E5P2IaysH/vk2G4Ew8QPJ6Jzb7/Q0d
	3pN8rmshV5aDhqRqUPGWuiLuRoImeNIXTcT0tpprFNZVefRhoQOyurNRUN4bQrMBHKgMxtLXx3tmY
	g39K3GViiGMv4LNuiUJRurr83e4hve5iPnsvDgpkoDoASyWVMqOc1T5Cn0w8batSwQ5lrMsgBGxvX
	YnUhEcrwA950+qCOei2JfromfAjLp2HcsuhRvl1jeXWLsddeSV9tAn9wPrLCO4THVHYYTfw0S8z85
	BVZNRXh9J+Kbp7/++Owg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imINL-0006mI-W8; Tue, 31 Dec 2019 14:20:00 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imINI-0006lp-UY; Tue, 31 Dec 2019 14:19:58 +0000
Received: by mail-ed1-x543.google.com with SMTP id f8so35390770edv.2;
 Tue, 31 Dec 2019 06:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9y1tmY4RwLs4Y1ujy/qNU7zmo877ZYf9RQx8Ho+O9iY=;
 b=XznbIAtguo9Bm13nZNKcGfWNbF9HeJqRmin10NcTYgr1Vw046xRj9+rzrUJU4NHprt
 Tkc0HmqBKaz7bpKSK9WQmS5/yJeSasVdRatCqWVYWuS5RL6y4ugWYo5qEWfMc2iAZ1CB
 pJ85G4GnkNzDYQmXK8F8MVqL2js7V2uXdLzFhvlZBVg2/RA7nzliUNg1iMDN5ogPCpwZ
 Ng2sw6pCeLjKh4JoSXyR4Nf3BnV9ap6rVwvJqnX33r1QmXkwcpjux8OejB9tvc+i4Psy
 y8fDgkJZ8Nhcp6JAAMUcJbepMq52Lu2nqTIeJ1FUuMqo2CfwLbrAooynJ/rUT5SJ+pX9
 Ar0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9y1tmY4RwLs4Y1ujy/qNU7zmo877ZYf9RQx8Ho+O9iY=;
 b=i0JcgKs3oK/ajdi5PmGVCPizNJwu4mlro76cSR7HR3WgXF46ZYnElvrMei82gWzvgy
 J7moiqF78CVKL1h8zzTGliFWcQjTG8RnWGEWqeyMGppkDeST0chrFfLJcFEUwhk8rvmR
 9c/eHCnzHD+ee4iNCZ9q+0xM1M5BBtv5OFomJzDGYA5u4pyPVhWxPSKdCrvubzpiCED0
 WOGQ4PpRF38rYtDtgag84o+ZBlJWW4CmoQMcCGEa155e9LrzzjAsLTFUTWG8eo0zfWgq
 TkD93X9RGghbyDTEOFNyua7jIKoobUuExqGtmvrheEqs1+zh5Q5eaGqMSGu9uLNtRg9k
 0uLQ==
X-Gm-Message-State: APjAAAXLubWice2ClGwkDxkZWLGdKePXkJqeK59KKx3KfNGgehqh7QfP
 wEMz/raU89t40wKnWUdz/9RtQuSqLD3WigZ8vS8=
X-Google-Smtp-Source: APXvYqzEOkZZG/2vGecnH7059nruHo6x8SX+ETSVkcqY8CFP1LYgZ/RDi4F7iof47RA91e8QSwcGekMXLc/GWHZYaCE=
X-Received: by 2002:a17:906:339a:: with SMTP id
 v26mr77221660eja.2.1577801995388; 
 Tue, 31 Dec 2019 06:19:55 -0800 (PST)
MIME-Version: 1.0
References: <20191227173707.20413-1-martin.blumenstingl@googlemail.com>
 <20191227173707.20413-2-martin.blumenstingl@googlemail.com>
 <CAKGbVbs365C_44p9VyW33n5r2s7VKgOzpZWCZ2rAHZ+f2sic1A@mail.gmail.com>
In-Reply-To: <CAKGbVbs365C_44p9VyW33n5r2s7VKgOzpZWCZ2rAHZ+f2sic1A@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 31 Dec 2019 15:19:44 +0100
Message-ID: <CAFBinCBMKBry+ynmk1byC+UweMPbQcpHnGE2CxKJVJBcrY5+QQ@mail.gmail.com>
Subject: Re: [RFC v2 1/1] drm/lima: Add optional devfreq support
To: Qiang Yu <yuq825@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191231_061956_987516_2DDEA21B 
X-CRM114-Status: GOOD (  15.66  )
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
 David Airlie <airlied@linux.ie>,
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

Hi Qiang,

On Tue, Dec 31, 2019 at 3:54 AM Qiang Yu <yuq825@gmail.com> wrote:
[...]
> > diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
> > index f522c5f99729..851c496a168b 100644
> > --- a/drivers/gpu/drm/lima/lima_sched.c
> > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > @@ -5,6 +5,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/xarray.h>
> >
> > +#include "lima_devfreq.h"
> >  #include "lima_drv.h"
> >  #include "lima_sched.h"
> >  #include "lima_vm.h"
> > @@ -213,6 +214,8 @@ static struct dma_fence *lima_sched_run_job(struct drm_sched_job *job)
> >          */
> >         ret = dma_fence_get(task->fence);
> >
> > +       lima_devfreq_record_busy(pipe->ldev);
> > +
> >         pipe->current_task = task;
> >
> >         /* this is needed for MMU to work correctly, otherwise GP/PP
> > @@ -280,6 +283,8 @@ static void lima_sched_handle_error_task(struct lima_sched_pipe *pipe,
> >         pipe->current_vm = NULL;
> >         pipe->current_task = NULL;
> >
> > +       lima_devfreq_record_idle(pipe->ldev);
> > +
> >         drm_sched_resubmit_jobs(&pipe->base);
> >         drm_sched_start(&pipe->base, true);
> >  }
> > @@ -348,6 +353,8 @@ void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
> >
> >  void lima_sched_pipe_task_done(struct lima_sched_pipe *pipe)
> >  {
> > +       lima_devfreq_record_idle(pipe->ldev);
>
> This should be moved to the else {} part of the following code. As you
> have added the save
> idle record to the lima_sched_handle_error_task which is just the if
> {} part of the following
> code, so no need to call it twice for error tasks. BTW.
> lima_sched_handle_error_task is also
> used for timeout tasks, so add idle record in it is fine.
oh, that is a good catch - thank you!
I will fix that in the next version


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
