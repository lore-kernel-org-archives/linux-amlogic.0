Return-Path: <SRS0=YxYw=JJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D5A4C433B4
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Apr 2021 12:46:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4488F61246
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Apr 2021 12:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4488F61246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9TL7AB5BN5mJ8pkW4EGsA5FwIzY8H6bFlV9iYNbYP+c=; b=CqaFtiz4J46U/amv/U1y0XDmm
	BbeVTkzmGQo8FUzeS/4yCaTLE4Z04fVaqofJmbULLYQtUdvDKlUnFdoQ2KHHiNpFzWgNcneXv6bYk
	+bCpy7TPmLaM4hKpK+FQh2nSYIJh0oK7Yppwuw4/xu8zEJ7Q2J+vPiUWaEJH7QVaiyIvcA4pbiksu
	F/oRvi5cMetCzJEg5f8OBxu9y59+YfhYZQ0qU/Hqi7qKJ7KHxuCGJwtnlTpFFZ43Y+BGQJbGlLQ5a
	RlEUeSVbGtCW7qISVTBbYp5hrMd3xFo7PDF1ILyksply+9XAY18pK+mmCGiyoI3xt7mL38nS+Cj6B
	fNMLy0BaA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVvx4-006jTZ-Pk; Mon, 12 Apr 2021 12:46:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVvwy-006jSo-R9
 for linux-amlogic@desiato.infradead.org; Mon, 12 Apr 2021 12:45:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3NkHK9dlRLO9E11vKDI3by0BzQKmIoCdtqsiovYik5Y=; b=kknNGEOU9+aQ/W0cIzCpDW6y8F
 dQn1XMJukv/W646RCIgSu/LEJKNDpIR0CxNJnL4SpWo7HfjEWfWUwNKIJsOOh6ov3MyHi2XX9KECM
 8UU8GcH5DCfFXxBus04AEhz/seo3qSxNLoMiHAxctVSmwxhghbWD8M21qc58RD7MgC+WX4ErpcuH9
 DVm2Ao6Ql/a60CTj8JCksfAS0AtoNvhiM+fC8+T1dvvpnEsVT0bUTsDhHed9HAmIwXbYTc6io1zgy
 FZIl+rxCGXrsrV116J9OjtRay56vXxjWZdMFlM68DqYpBMn8twwzPWgfGpF1naPjGw9atJr4TpMaY
 BzP8z8Pg==;
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVvww-006EM8-25
 for linux-amlogic@lists.infradead.org; Mon, 12 Apr 2021 12:45:55 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 b8-20020a17090a5508b029014d0fbe9b64so8748339pji.5
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Apr 2021 05:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3NkHK9dlRLO9E11vKDI3by0BzQKmIoCdtqsiovYik5Y=;
 b=ipk8DwdYIM+Lp82DorQ0slg4Pzo/r2oPaPaTi5pIFNe1/ELqHN5WVqqpvKrp5agVi7
 Gx1ksSa8tqNrGMYoNsPhPZhSaOD31ER84MBkAiY/652qpkOz8FUKaRflCcPolsuJqaQ6
 rpOqq2YPaucNEYx0RI65wb2mHKvNL3vYqF3r+qsPlOeAkAyS0RI4sC5PlltLhW5BvjV5
 2YyEfVsbdSgTiO+zWf6Uqxse1uXsX26RbE/T3jMRoRW5y5Qecg7fKOkxb3dgCm5JrQay
 DJlJtoybuhS1gJpZIz/YYAwCbb9okPIrZzrTJMpW3c2pTAjLeSgZ9UizoxTHQ57bJlxT
 inrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3NkHK9dlRLO9E11vKDI3by0BzQKmIoCdtqsiovYik5Y=;
 b=hCAyZ3zm3M5YJB9lX57QnAqyB0/uKTQM2dSIiCQw8sVswqOTJK/if8T6CWgsM/Pf/7
 wfC8lfycNZ+oCcB1TC6q2FYydygySm0wPw6N5SPlKxFERc0WjQlqQ7rs5IYG/EmGNxqm
 OMph4KIbKx8F+7Pr/Gxvu2oZ3LJFxQJiLSgA4ZipP4A26R1sa70MRD1zawd87UAx9WiY
 KDE457pZTSHMkTDbEaCpkmZjfTLtFQiawwpgJ9rmRp/oDrdufWixbRueQIf1r7WMACa2
 AwtSlPp00mp3GVuwg7kuzSIMH0sjXnOOhI7kG5rfaZqQp1I4y6icpCCsvJKrRwu9oZe9
 K2BQ==
X-Gm-Message-State: AOAM532k8X/wl1Nc1t0OOXFfzCpExCC1S3YJ8Xxn9KIZHGmA12MRAMze
 WWp3YWdfiD8QeXdLzXcKrTo=
X-Google-Smtp-Source: ABdhPJxM44dz/V1i30xDBVDqbT6VanKYzhUL0fhLrUPPDqvvU5QpP5gH3Y+gZ2QcPWSxTrR/n+W9AA==
X-Received: by 2002:a17:902:8344:b029:ea:fc89:fa72 with SMTP id
 z4-20020a1709028344b02900eafc89fa72mr4649548pln.45.1618231552084; 
 Mon, 12 Apr 2021 05:45:52 -0700 (PDT)
Received: from kali ([103.141.87.253])
 by smtp.gmail.com with ESMTPSA id i22sm11367148pgj.90.2021.04.12.05.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 05:45:51 -0700 (PDT)
Date: Mon, 12 Apr 2021 18:15:42 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, narmstrong@baylibre.com,
 mchehab@kernel.org, gregkh@linuxfoundation.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
 mitali_s@me.iitr.ac.in, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2] staging: media: meson: vdec: declare u32 as const and
 static const
Message-ID: <YHRA9i+BjveJOUvn@kali>
References: <YHIDufKhTEeuxyl5@kali>
 <88d04746-717d-5a7a-7ea7-67cf6c95aba9@xs4all.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <88d04746-717d-5a7a-7ea7-67cf6c95aba9@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_054554_112229_C9AAC360 
X-CRM114-Status: GOOD (  21.56  )
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

On Mon, Apr 12, 2021 at 11:17:22AM +0200, Hans Verkuil wrote:
> On 10/04/2021 21:59, Mitali Borkar wrote:
> > Declared 32 bit unsigned int as static constant inside a function and
> > replaced u32[] {x,y} as canvas1, canvas2 in codec_mpeg12.c
> > This indicates the value of canvas indexes will remain constant throughout execution.
> > Replaced u32 reg_base and u32 reg_name with const u32 reg_base and const
> > u32 reg_name as it will contain data/registry bases to write static
> > const indexes declared above and will keep track of of contiguos
> > registers after each reg_base.
> > This makes code look better, neater. It improves readability.
> > 
> > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > ---
> >  drivers/staging/media/meson/vdec/codec_mpeg12.c | 5 +++--
> 
> Also change drivers/staging/media/meson/vdec/codec_h264.c.
> 
> It's a nice improvement, so let's do this for both callers of amvdec_set_canvases().
>
I have done chnages in codec_h264.c Now, should I send that as new
patch?

> Regards,
> 
> 	Hans
> 
> >  drivers/staging/media/meson/vdec/vdec_helpers.c | 2 +-
> >  drivers/staging/media/meson/vdec/vdec_helpers.h | 2 +-
> >  3 files changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/media/meson/vdec/codec_mpeg12.c b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> > index 21e93a13356c..861d8584f22f 100644
> > --- a/drivers/staging/media/meson/vdec/codec_mpeg12.c
> > +++ b/drivers/staging/media/meson/vdec/codec_mpeg12.c
> > @@ -65,6 +65,8 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
> >  	struct amvdec_core *core = sess->core;
> >  	struct codec_mpeg12 *mpeg12;
> >  	int ret;
> > +	static const u32 canvas1[] = { AV_SCRATCH_0, 0 };
> > +	static const u32 canvas2[] = { 8, 0 }
> >  
> >  	mpeg12 = kzalloc(sizeof(*mpeg12), GFP_KERNEL);
> >  	if (!mpeg12)
> > @@ -80,8 +82,7 @@ static int codec_mpeg12_start(struct amvdec_session *sess)
> >  		goto free_mpeg12;
> >  	}
> >  
> > -	ret = amvdec_set_canvases(sess, (u32[]){ AV_SCRATCH_0, 0 },
> > -				  (u32[]){ 8, 0 });
> > +	ret = amvdec_set_canvases(sess, canvas1, canvas2);
> >  	if (ret)
> >  		goto free_workspace;
> >  
> > diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
> > index 7f07a9175815..df5c27266c44 100644
> > --- a/drivers/staging/media/meson/vdec/vdec_helpers.c
> > +++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
> > @@ -177,7 +177,7 @@ static int set_canvas_nv12m(struct amvdec_session *sess,
> >  }
> >  
> >  int amvdec_set_canvases(struct amvdec_session *sess,
> > -			u32 reg_base[], u32 reg_num[])
> > +			const u32 reg_base[], const u32 reg_num[])
> >  {
> >  	struct v4l2_m2m_buffer *buf;
> >  	u32 pixfmt = sess->pixfmt_cap;
> > diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.h b/drivers/staging/media/meson/vdec/vdec_helpers.h
> > index cfaed52ab526..ace8897c34fe 100644
> > --- a/drivers/staging/media/meson/vdec/vdec_helpers.h
> > +++ b/drivers/staging/media/meson/vdec/vdec_helpers.h
> > @@ -17,7 +17,7 @@
> >   * @reg_num: number of contiguous registers after each reg_base (including it)
> >   */
> >  int amvdec_set_canvases(struct amvdec_session *sess,
> > -			u32 reg_base[], u32 reg_num[]);
> > +			const u32 reg_base[], const u32 reg_num[]);
> >  
> >  /* Helpers to read/write to the various IPs (DOS, PARSER) */
> >  u32 amvdec_read_dos(struct amvdec_core *core, u32 reg);
> > 
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
