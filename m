Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCA3C43458
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Jul 2026 07:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hhxkm5sJ5Q+KXgKSScB165+VZNkygUzNdd1e2/mMmEQ=; b=DxnN0dSCCg7Sk2
	dI7vP8245idBhjFDze1UH87vLo0Gn5o9UbGtkmN5ZX5H+h95hHtLdYmG9eAZLeWPF+ciE3ohxIm0I
	CSB49SJ9nevYK8c8CjIWPQe5WfvS33S+Jj/kcK2G34GYt77ghYNuOYGXBi3uEtYj4cfA6/AK7Gr0c
	IBqFAVKmWOrRkXhasj17yM02gwyRqiIfpwjcPQ6OfbfSVCJs3IND0IPAZOt/FPIHdxTCE6cQoAYVn
	mz5k86Rh4fiRphSlzijn/BxuKJWUywJ0+6Aozx6f0WV+MnPIyrAmJ6hLlZaJpckuVHp3QPzXzG0XM
	U56A2/GB0lV4m7LTulDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXUn-0000000B9S2-3xOQ;
	Tue, 14 Jul 2026 07:24:01 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXUk-0000000B9Pw-3A3P
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Jul 2026 07:24:00 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-698acd36d67so7180851a12.0
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Jul 2026 00:23:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784013837; cv=none;
        d=google.com; s=arc-20260327;
        b=B23mvsVo52x5KV0kipcIg7vr3tKpre/DQeZ2ZKiB+0JzasdvGAQYiMvlIgmHs0PIyv
         zC3VE0zcJ4azq9+8H7xNmdqH5VMJPfPiLPqC1lN7rbi5IhyCVBiE6jVhJi0SHwAs0aTd
         EcecJk4NxnLw3xLLplOmLzgZjekdz/nX3uSRI76MaM4EQmxAvAdirBouy6kD0z4WXAuD
         kFaFZrRNvRZw0GHX4N9QdSRPQ+NMWG9PXWv8pG8seLgNW9YPkgOPKOjkynJZm7i8Nktz
         tyl1afqj+MuSGsMkWwB6gvlHWxMO9xc+Y18aimpmYO0C7uQhaHV9DMsEsu87Yc8xcdy/
         XPCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4otLa0osIIgCWg6PJhWGRKAbFh1CF4DbrLX8uzqDyWU=;
        fh=qAcZRzJ1gq0iuIzw/iU4Hd5Ac+D15Wo6Q43Qf4QmGOU=;
        b=Y/HeVpMViXWeJpkcc8NWHZRoupb59ZvPSnsVR4005bf+cNSJyf50nNU5t7m8Vejvxx
         tc2JFeqy4VHOVmi9lPpa/djYmMlvo7o76GRzRe9kIWSgKZ4TFF0cYB8CyF/KckwjPgcj
         dKHK1RT/Grelfa4l97hlxw+rJblz4xxRJ59G4Oyq+UfDnhK7HKmsnhGA1FNZPnZJmdN4
         RVJYRpLCcPjQ4nzS7KsV+fWpf36uXrpvimskPEyVh9BmIKbajSn4LJ/YAtJY898o0YrX
         ry9HMqAFY0dwnQ6BBVvA6V6/kEztZ9rpTO6Un5Ca+R6zwPnJZ30qIe7Z0QkU9T6WVaze
         yeAg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784013837; x=1784618637; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4otLa0osIIgCWg6PJhWGRKAbFh1CF4DbrLX8uzqDyWU=;
        b=P7TDkKVKWO7naUhb1jUIT3Yk+zG9DYkWxZoIa7L2OodtilS6SWK+qC6dXQnamGPFl5
         XbjiVexydPASQtytHW4zHwSEHuNlaGqgks/qmv15DrCGXL121bwvooY0kEhA5HX2B8Kx
         G4zw7KTv/FMnqWO56qAXdpstU/PRl3RfZm0XZPJvQkzASsJL5avnJdFGPLB8zziDSJ7B
         tvDKCC81l9xS/0lwj4LBqQLUj8jFdyUQDrSHztCwjYGc/yJLxN22DPqHjHF47Qujp0iF
         JPJQFL4MeEsH1JAqJYrLQt/6TkcxlgZvVYtx/H7vD6FfER6vGgiBUHlXvQSaVgG8zgso
         OuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013837; x=1784618637;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4otLa0osIIgCWg6PJhWGRKAbFh1CF4DbrLX8uzqDyWU=;
        b=BeWP/S/V9PVzIstxat082kUz998tISwlCcapORGKHDvxxCfOTvfCJC3W2Hac2gsQVV
         dN3vsARbU0q5IKo29pTgKzoos9Jbt/ZwGYFZw8XxJxZi1ljF15Pb0f5lwnaNpydAPWwy
         M1/anjT/LYouKsGu5s1KVWUMYIVKirReY8k9256GwsIZig6mG2Gxg4Y6Iu364fvJSGAb
         IKsnM9pK9StlPOoNSGlRnsG9yqQ6W4xAOFACxkJ2xTbm2lLODnI71f0UepDvJLB5a6S/
         g6oiuKvyCQQ5JM8turBr1/z5A5N/8Fh8rSJhElcpDR7l1I/fXnUYOcN4PH6WXyaD1cQu
         Yjtw==
X-Forwarded-Encrypted: i=1; AHgh+RpIb6VptDVY72bxCulqPEpRrBtclBGche8nAbgXfD3s6yb7RxgGx8ADRA+v9JyyVEhga1R92E3RjNEMr8SJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxGmLTroPTxE7eJG1RZ8L9wJmxEZ/Y+eOrz61yzNtPhOjxndcdw
	Bgz5W0jEQYq8HyshcIEdonM7gCxD+o6QfWk/zW/IKEtO02opJJ0Q6O/gNAe8GqnMRmLkNELGEk3
	D8uXwrUiPUm8eS2Zkz0bqsfbNGS6bur4=
X-Gm-Gg: AfdE7cmPZ/JrSHWELxa7r+az/4oTxLEHEOK7kIouNYqFfFY19vVf6fzdRQ16L2C3/k9
	nHT2RBmpX6gYqSPJxP5uyjxHL9Un312KImuBGMQtepMX2QNhHc/0tPPZp1T5rFjXcQfdaj9XZRU
	WTEZAJtTUUqLf34CtpJaP+YUAZ4BWWbmhxuySRAV1+BqSBHX2kCCecINUOXLfuwPwwESsalXfW/
	pBIjYtOnYhzQsOvV4qeKyYSss5GZ0YzIWsvi1tPFd/koEiuCSFfy+tZWni8zTjE65yWYLFrPpV5
	KQ+whg==
X-Received: by 2002:a05:6402:e94:b0:698:c13e:179a with SMTP id
 4fb4d7f45d1cf-69cd2a001acmr1004913a12.10.1784013836409; Tue, 14 Jul 2026
 00:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260713120840.17427-1-linux.amoon@gmail.com>
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 14 Jul 2026 12:53:43 +0530
X-Gm-Features: AUfX_mzvXnkQt9N3uwj4z53r62LfKGSebrr5Wzfs3imVuOH5yaZKNS9xAf_UWqU
Message-ID: <CANAwSgSz+e483m9VKkFZzSKzB1Tsd8kS20UcB3ON-cZ=J8gX+w@mail.gmail.com>
Subject: Re: [PATCH v7 00/19] media: meson: vdec: Fix lifecycles, race
 conditions, and stability bugs
To: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"open list:DRM DRIVERS FOR AMLOGIC SOCS" <dri-devel@lists.freedesktop.org>, 
	"open list:DRM DRIVERS FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>, 
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" <linux-media@vger.kernel.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>
Cc: Doruk Tan Ozturk <doruk@0sec.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_002358_814738_261878BD 
X-CRM114-Status: GOOD (  21.00  )
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

Hi All,

On Mon, 13 Jul 2026 at 17:38, Anand Moon <linux.amoon@gmail.com> wrote:
>
> This patch series addresses a collection of critical race conditions,
> memory leaks, use-after-free bugs, and resource management issues
> within the Amlogic Meson video decoder (meson-vdec) driver and
> associated components.
>
> The primary focus is tightening session lifecycles, safely synchronising
> the V4L2 m2m framework callbacks, hardening work queue operations
> (esparser_queue_work), and correcting buffer validations to prevent
> stability issues like KASAN out-of-bounds errors or stream-on timeouts.
>
> Summary of Changes:
> * Race Conditions & Synchronisation: Fixes multi-threading and
>   execution races across stream-on, stream-off, job abort, and
>   teardown pathways.
> * Memory Lifecycle: Eliminates memory leaks and use-after-free
>   vulnerabilities by safely pinning, canceling, and sequencing
>   device removals.
> * VP9 & Buffer Hardening: Addresses payload handling bugs in the ES
>   parser, properly tracks ongoing buffers via atomic counters, and
>   prevents invalid memory writes.
> * Platform/DMA Adjustments: Adjusts DMA segment configurations,
>   canvas handling, and buffer sizes to match modern hardware demands.
>
> Note on an outstanding issue:
> An execution deadlock occurs in the driver workqueue path during high
> stress or long playback sessions. This stall is triggered when the
> Amlogic hardware internal video FIFO buffer becomes completely full.
> When esparser_queue_all_src runs, the capacity validation check is
> tripped due to a design limitation in how buffer exhaustion is handled.
> This blocks progress and leaves the workqueue worker waiting indefinitely
> on a core mutex lock.
>
> The resulting hung task call trace shows the worker thread blocking
> on the internal lock:
>
> Workqueue: events esparser_queue_all_src [meson_vdec]
> ...
> __mutex_lock
> mutex_lock_nested
> esparser_queue_all_src
>
> I have tried to address this issue, but the underlying deadlock persists
> under extreme conditions.
>
> Any feedback on this new appock is welcome.
>
> Testing was done using v4l2-compliance and active decoding pipelines
> on Meson platforms (like Hardkernel ODROID-N2+ and ODROID-C4) SBCs.
>
> The v4l2-compliance tests passed successfully via:
> $ v4l2-compliance -s -v -d /dev/video0
>
> Pipelines were validated using the following GStreamer script.
>
> [1] https://gist.github.com/moonlinux/08295ba1f17ce7155550773f2d2cb6e5
>
> Previous changes:
> v6: https://lore.kernel.org/all/20260530094326.11892-2-linux.amoon@gmail.com/
>

I will review Sashiko's feedback. I will look into these suggestions and
work on incorporating them to improve the code quality

> Thanks
> -Annad
>
Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
