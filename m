Return-Path: <SRS0=ULSD=UF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C35EC28EB3
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 13:24:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3648F20866
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2019 13:24:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AgwnJlTC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="khY7Hzsl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3648F20866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AhkDFPH/5QDK4fRy/WA9wHjtGN/KxoYJG2s8IbJXx1k=; b=AgwnJlTCUnjCJR
	ezZJuTVoj4ybBgHAR6n6hwjV5ML2fT77n/HCR5cO5bqiZeWuHh1DC/jphLVhHwHaYovnZ6ny4/g+n
	CaRnTuBaOv5yYlrWdA7IrjX8CpIZUvsVi+UM4NjZgGX4qeBtB8J8QdfN8VtYqsKc3buGk0sIMTClK
	Q66VScrTo6HDprKglfVFyjOG7XI+hqV6oz4y7eu8Rk/nsG+W+jrUkV+bZjOsyh0bdiNpJgNxAODK4
	0r7QnJIJ8Z6GIvk/bab4cEEnpjycUKP4t+t9uF901gnA9GsKXTnZuyxSdsKaI1J3ogg2QoS7qNqGT
	dN4OzbZqZmNXroO9pGpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYsNV-0005Ri-Ud; Thu, 06 Jun 2019 13:24:25 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYsNS-0005Qs-Jo
 for linux-amlogic@lists.infradead.org; Thu, 06 Jun 2019 13:24:24 +0000
Received: by mail-wm1-x342.google.com with SMTP id a15so2131736wmj.5
 for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2019 06:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QoGog8a3Wrsj5HuFdAVlHcSa7d9sUGcrDi4SC/3qBKY=;
 b=khY7Hzsl2mrL6XdXHgajw/IBA9cQipqEFv5h6jaAjYz/mPADIrsyBZAwk9MD2Zn0vB
 A6Tj3bVkdGPNk12lhKNwEYMDYFBUgDkNMOEqgnXpubbQg5OHgFE8Zvq8vkdKU/e/3az4
 0M3o5ceFu7NZxuZAGuO65bv1Q/XaxqZNsN4WwlCclCVWWCIzvZmFf3MJcLBW/vzlxEoU
 8tRlUsRzCu9eIj5PEBcIaDt9NEIXyHGJRjDdMhwl0T7ydGec7lnUQwmBJUf4EXCx6ujj
 X4lWk+dBys6IcpmxdtXXx3eO9h+S75BsDnZWgeZvYyPRF6CvL5RlvZpInusxsfYIkV27
 J+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QoGog8a3Wrsj5HuFdAVlHcSa7d9sUGcrDi4SC/3qBKY=;
 b=aQD8mh6eSHeHRWlhT4b7DAhrRBDLiz8WGihds6An/bqDTznNOOQLcw4tKyKkEw88aS
 TDDYotL1tbBt3fG47Nnxr4DIRqyMfuK9CiHZqQ6kTlIba9YWPobWihRb6s+85f1AaJGC
 6+XM1k5iw8AmN/6JOIziaVLkKCPHxRJyx12QW3ZmKGBe3M9ukIL/Yq0KteQ2EzZyxya8
 RhGGNwOP4ZgowHGwQnSQYDVy4L/6nP9ymjrPvaJDNIZGsh5x7MeIKEXm7J0TXFhOmfWm
 ru71rV6lVYudHryk7K2DPDFRHbRLxwWoBm9uNrpi9qSD02kU7L8NYDyKiuArgnHrZi8s
 4c7g==
X-Gm-Message-State: APjAAAUp5Rb2IoRxOEf+lSL7TZrC3DVm4hPoHUMfZ4q5JC6yAEDGO2Tj
 F97od+0GPEW62pzdK8w7x8hHRZy/3Aheuk9ZBsSYVA==
X-Google-Smtp-Source: APXvYqx8KrJ+cP3MBQAozA03nDeKj75Rodf/KMjmNziao/G2SxLWllc4LLaFap1HssB7UjMSiD61t4uXPaACXGxsSWw=
X-Received: by 2002:a1c:c706:: with SMTP id x6mr24472351wmf.162.1559827460800; 
 Thu, 06 Jun 2019 06:24:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190605161858.29372-1-mjourdan@baylibre.com>
 <20190605161858.29372-3-mjourdan@baylibre.com>
 <a5676c4e-9c79-5ee4-fb3d-924602ef912e@xs4all.nl>
In-Reply-To: <a5676c4e-9c79-5ee4-fb3d-924602ef912e@xs4all.nl>
From: Maxime Jourdan <mjourdan@baylibre.com>
Date: Thu, 6 Jun 2019 15:24:09 +0200
Message-ID: <CAMO6naxtUA82inWZKhJ99zmcDiBZZXeDpgMYeOaqLH_cqso40Q@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] media: meson: add v4l2 m2m video decoder driver
To: Hans Verkuil <hverkuil@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_062422_695511_F8E0DD82 
X-CRM114-Status: GOOD (  10.78  )
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
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
 linux-amlogic@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Hans,
On Thu, Jun 6, 2019 at 2:32 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> While preparing this series for merging I came across the following checkpatch
> and sparse warnings:
>
> checkpatch:
>
> CHECK: Alignment should match open parenthesis
> #159: FILE: drivers/staging/media/meson/vdec/codec_mpeg12.c:83:
> +       ret = amvdec_set_canvases(sess, (u32[]){ AV_SCRATCH_0, 0 },
> +                                       (u32[]){ 8, 0 });
>
> HV: I think this doesn't need changing, this is easier to read.
>
> CHECK: Alignment should match open parenthesis
> #968: FILE: drivers/staging/media/meson/vdec/vdec.c:185:
> +static int vdec_queue_setup(struct vb2_queue *q,
> +               unsigned int *num_buffers, unsigned int *num_planes,
>
> CHECK: Alignment should match open parenthesis
> #1755: FILE: drivers/staging/media/meson/vdec/vdec.c:972:
> +       core->regmap_ao = syscon_regmap_lookup_by_phandle(dev->of_node,
> +                                                        "amlogic,ao-sysctrl");
>
> CHECK: struct mutex definition without comment
> #1949: FILE: drivers/staging/media/meson/vdec/vdec.h:85:
> +       struct mutex lock;
>
> CHECK: struct mutex definition without comment
> #2085: FILE: drivers/staging/media/meson/vdec/vdec.h:221:
> +       struct mutex lock;
>
> CHECK: struct mutex definition without comment
> #2116: FILE: drivers/staging/media/meson/vdec/vdec.h:252:
> +       struct mutex bufs_recycle_lock;
>
> CHECK: spinlock_t definition without comment
> #2120: FILE: drivers/staging/media/meson/vdec/vdec.h:256:
> +       spinlock_t ts_spinlock;
>
> CHECK: Alignment should match open parenthesis
> #2247: FILE: drivers/staging/media/meson/vdec/vdec_1.c:108:
> +       amvdec_write_dos_bits(core, VLD_MEM_VIFIFO_CONTROL,
> +               (0x11 << MEM_FIFO_CNT_BIT) | MEM_FILL_ON_LEVEL |
>
> CHECK: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.txt
> #2313: FILE: drivers/staging/media/meson/vdec/vdec_1.c:174:
> +       udelay(10);
>
> CHECK: usleep_range is preferred over udelay; see Documentation/timers/timers-howto.txt
> #2354: FILE: drivers/staging/media/meson/vdec/vdec_1.c:215:
> +       udelay(10);
>
> CHECK: Alignment should match open parenthesis
> #2413: FILE: drivers/staging/media/meson/vdec/vdec_ctrls.c:19:
> +       sess->ctrl_min_buf_capture = v4l2_ctrl_new_std(ctrl_handler, NULL,
> +                               V4L2_CID_MIN_BUFFERS_FOR_CAPTURE, 1, 32, 1, 1);
>
>
> sparse:
>
> SPARSE:/home/hans/work/build/media-git/drivers/staging/media/meson/vdec/codec_mpeg12.c
> /home/hans/work/build/media-git/drivers/staging/media/meson/vdec/codec_mpeg12.c:201:25:  warning: symbol 'codec_mpeg12_ops' was not
> declared. Should it be static?
> SPARSE:/home/hans/work/build/media-git/drivers/staging/media/meson/vdec/vdec.c
> /home/hans/work/build/media-git/drivers/staging/media/meson/vdec/vdec.c:417:5:  warning: symbol 'vdec_vb2_buf_prepare' was not declared.
> Should it be static?
> SPARSE:/home/hans/work/build/media-git/drivers/staging/media/meson/vdec/vdec_1.c
> /home/hans/work/build/media-git/drivers/staging/media/meson/vdec/vdec_1.c:85:5:  warning: symbol 'vdec_1_stbuf_power_up' was not declared.
> Should it be static?
> /home/hans/work/build/media-git/drivers/staging/media/meson/vdec/vdec_1.c:85:5: warning: no previous prototype for 'vdec_1_stbuf_power_up'
> [-Wmissing-prototypes]
> /home/hans/work/build/media-git/drivers/staging/media/meson/vdec/vdec.c:417:5: warning: no previous prototype for 'vdec_vb2_buf_prepare'
> [-Wmissing-prototypes]
>
> Can you fix these issues?
>

Sure, preparing a V9. I'll add sparse to my list of tools to use
before sending a patch.

Maxime

>
> Regards,
>
>         Hans

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
