Return-Path: <SRS0=PL4p=JK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 784A3C433B4
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Apr 2021 11:32:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0326E6101B
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Apr 2021 11:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0326E6101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GXcyWP1vzh4v4qt+Ektc5hxlM0XoO1zhuZ+zPiZtECs=; b=Q3zgKUJaCXofx/VrM64ZwNkyh
	zBu6LzF9IcofNAk5JnnF3wj04aQhZeGoNmMNh0KMHiYU44kV6qNgMKTj8xRztree0WMJcQy1bttNI
	WGqpE/Nzf8BX1bBwAethX/ocTcJrByVwP2OEkPoakP0NqIrXGdyEb3KxY7ykZvM6s5mPCIPidz+Tc
	XTyD1UjbQDDD6ErfXP2gWPlicDAqAQn5mnPgqvlV8ChWn8rQMSTEkCaIllhLSGrjDTRIXdNfVIpZz
	pTaGHV5BwmvXLEau2fTxWUqGG9Vvy9StAs7Z8v6UeXLJEaXfaJBOd9SHBVpGygKJ1HjHnqiadpdJb
	yyK9CDwfQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWHHk-00948v-F0; Tue, 13 Apr 2021 11:32:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWGvG-008xw9-R0
 for linux-amlogic@desiato.infradead.org; Tue, 13 Apr 2021 11:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=wkMmVdaqiVi3xtXd845LmjsnmFo5YjLpPek7JkQnFh0=; b=nORr8hNovZlq9e72RVLcFttT2m
 gH2LLksDse8i4pSN1ZqgugWeEZed6impMqLlMePLZzhMsP/qIjYdjaJPl2ov5Ul0ffjhOGhWuiFwI
 4G/9TIB+4w/Z+44TX5OAdbdeTFkVNdWebmF5vv7q3N9bAQwW9fQjY/ADTDW2/vKzpMsuSmxc1MO3A
 awUFt9rBV/SGDciRtp1Pv4e5FH0pBY/CbNidnbKYieT+aXQcnJNw6rpqqd2Qknyndr3LJfVK+9ks6
 Gjv/+1Q4g6LMW21xkozhcjqvmKEonqA/TPsLypgJGue/+LgN6I0Gx5OL9kDgrbXtsgGS1VuC0bnCm
 7xsAWHQg==;
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWGvE-006xHb-1w
 for linux-amlogic@lists.infradead.org; Tue, 13 Apr 2021 11:09:33 +0000
Received: by mail-pg1-x531.google.com with SMTP id b17so11665597pgh.7
 for <linux-amlogic@lists.infradead.org>; Tue, 13 Apr 2021 04:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wkMmVdaqiVi3xtXd845LmjsnmFo5YjLpPek7JkQnFh0=;
 b=Sq/7PrdMcKFFjvPyCPXpPvIwEqJsyzG21kJVszuBec1vwYduaw3CTQDQNFW2dn/von
 hXiaXtbOcrfryJR5KRclOSaBkpmesm+siY/qMKbndGvQiOiez5w+x0iLl+MPZRJqIo5m
 Wg+7BaycfkT2sywTDkrN3KLNj3ZsHxGQB0PomK76DahTDiiUF/C7FATDLlE5mz+qL4lm
 WytzfJXmLD8yPDOjW7giSiYGkF3r31/Yd93ztWMNbAHlRqzaE6y9uS+vo1Ng9Etri3qH
 rUKEWqPzoKTRX+8q3R7cmQF0vIkZabRLM2NsF3/jqbgujRod278rEfz8IbApupVk9U2X
 K2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wkMmVdaqiVi3xtXd845LmjsnmFo5YjLpPek7JkQnFh0=;
 b=MGy5nJUZ+joviBvLHsX3yMLPyKfXhA5JUTRI9cmMgwWREXYt/ijbmQNwYlaIWgOOeb
 2DFB383T7CLyE6wjd8raOqdn+fLrnuTm9UaYOCZjC2JhKBu2znGxdRHUOOMGK7nywoeU
 MBqXD+MC5hfDT3fiR6cOZ7+HIqhK5bP/1Zi5mVZewcAuzjmmq2jy6lTjd9YzKHHopj6I
 AH3wmGGEk0NRuSWCz8f5OHhLx087ONBMIfsxTM7Q6AheNXqtc2fRn55GQ2EhAxYcEvgF
 u+Auxjy9zM1/ScXHiwI3yN0eVxuoFbAVWPLKqQDCZhl3m9kK2fm1ruC7YjVh3N8QHhCa
 CzBQ==
X-Gm-Message-State: AOAM531fXKFTFjN6xt3Askf8ISS7lppvqaQuATk2kzvNcq/1Rq4aPLkv
 VWe6CDQ0Tz5wX9U6Y5MdRlg=
X-Google-Smtp-Source: ABdhPJwqAi/RC3MV9+EDD8mzB8jn12KdybM+is+fifKL0Y/Q22IUaJL6Y2nDOKb9zpuqzyfM+FAKKw==
X-Received: by 2002:a65:5c88:: with SMTP id a8mr30376055pgt.130.1618312170656; 
 Tue, 13 Apr 2021 04:09:30 -0700 (PDT)
Received: from kali ([103.141.87.254])
 by smtp.gmail.com with ESMTPSA id s20sm10295296pfh.144.2021.04.13.04.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 04:09:30 -0700 (PDT)
Date: Tue, 13 Apr 2021 16:39:19 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, martin.blumenstingl@googlemail.com,
 narmstrong@baylibre.com, mchehab@kernel.org,
 gregkh@linuxfoundation.org, khilman@baylibre.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
 linux-amlogic@lists.infradead.org, mitali_s@me.iitr.ac.in
Subject: Re: Subject: [PATCH v2] staging: media: meson: vdec: declare u32 as
 static const appropriately
Message-ID: <YHV734NB4flpFjbF@kali>
References: <YHU56OM+C2zY34VP@kali>
 <00c8a239-49d3-fedb-ec67-076e8b823efa@xs4all.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00c8a239-49d3-fedb-ec67-076e8b823efa@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_040932_118156_49A0FD02 
X-CRM114-Status: GOOD (  18.97  )
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

On Tue, Apr 13, 2021 at 09:26:01AM +0200, Hans Verkuil wrote:
> On 13/04/2021 08:27, Mitali Borkar wrote:
> > Declared 32 bit unsigned int as static constant inside a function
> > appropriately.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > ---
> > 
> > Changes from v1:- Rectified the mistake by declaring u32 as static const
> > properly.
> > 
> >  drivers/staging/media/meson/vdec/codec_h264.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/media/meson/vdec/codec_h264.c b/drivers/staging/media/meson/vdec/codec_h264.c
> > index ea86e9e1c447..80141b89a9f6 100644
> > --- a/drivers/staging/media/meson/vdec/codec_h264.c
> > +++ b/drivers/staging/media/meson/vdec/codec_h264.c
> > @@ -287,8 +287,8 @@ static void codec_h264_resume(struct amvdec_session *sess)
> >  	struct amvdec_core *core = sess->core;
> >  	struct codec_h264 *h264 = sess->priv;
> >  	u32 mb_width, mb_height, mb_total;
> > -	static const u32[] canvas3 = { ANCO_CANVAS_ADDR, 0 };
> > -	static const u32[] canvas4 = { 24, 0 };
> > +	static const u32 canvas3[] = { ANCO_CANVAS_ADDR, 0 };
> > +	static const u32 canvas4[] = { 24, 0 };
> 
> This is a patch on top of your previous (v1) patch. That won't work
> since the v1 is not merged, you need to make a patch against the current
> mainline code.
>
But Sir, since I have made changes in the code, and committed them, now,
if I open that file, it will contain those changes. Then should I
rewrite the patch body more accurately? 

> Regards,
> 
> 	Hans
> 
> >  
> >  	amvdec_set_canvases(sess, canvas3, canvas4);
> >  
> > 
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
