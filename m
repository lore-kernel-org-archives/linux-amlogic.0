Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A420CA5FA1
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Sep 2026 05:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bG2mj07NKUOITrrLKT3ZatX0YJBQAwGNiCWCMN4y0ZY=; b=bCSUmG7OocbUnH
	LbGLAFLjMvABB1rgzJiREzToeE9YiAw+YZxX/ihfhHQgrLVw0IrkGPk9VAGcsFGWFwXDI5Y7034BF
	aMxh/KLVrBTtvoFdBKxy1oNB5NYFm1ugYq94tom0ojSIbmQgav5d535y2ooqg7Kjv10d4D1fIjpXy
	Y4OR6ZUOYPBxkJSuCqVaz5/2inoKl3ig4p4hhFSM2yLEZS4IIngp0PxLMNHJTU2f5zWfKa0/T17IJ
	wbh0qcnaBeibkx863lyklSod/XdXZAe27kgAWHw7YjArXGrJMq1E33nFCJmWdEQ/rClQf+/PMD1Rf
	XRoQTT4AUzJTz3YJ2bpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBQg3-00000002O2r-0bor;
	Tue, 29 Sep 2026 05:46:55 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBQg0-00000002O1n-3dPa
	for linux-amlogic@lists.infradead.org;
	Tue, 29 Sep 2026 05:46:54 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ffed768deso3873085e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 28 Sep 2026 22:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790660810; x=1791265610; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cHaIQHQAzypExf5bg6wFndJXSrqRhD8ZT8crEHQrTnE=;
        b=A96DTktHjXgoufi9b4GqaukPGOgQMNe5KjuaGpcFPypzIScIDbMHtU0cOwRU8x6OFK
         HYjVh9f/x2XW5d3hGFfTtF3DMDVRe8V+mQXXNRGlQkEdDbg5mUtYSJ614Cyv3qDfcy61
         y8oxustKhRH9BNj8yADec7U3/rzgGggKEcBNDEIkRBeRZa9RrSWJne91A/EgCpljtrFH
         6RmJrmr6LrPhvaU3yuShjbPEZF/BBNcMNJaxtvVnR7nNQJAl6V4IjmoU+Hhq92k9EPdV
         Rq1+du3p+KnY/cIr7yqF4LtLIzpIcUoFkqGXJIFyA9JRhZNlZx9L/z2ONk7eg7a933Xd
         bMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790660810; x=1791265610;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cHaIQHQAzypExf5bg6wFndJXSrqRhD8ZT8crEHQrTnE=;
        b=vM3VzAWYVCBJ4Cp3YmllyWYdLsKbs+N7LdzYDvaHJu92S4dr6ek9D3AYXLd3RmU3r0
         +XoyQ0O6fHljSqp3Gyb6CWUwerS+JMKsJ+le2HvsFID3DWO13aHzM9oiOVDiwsE5e6LT
         vjiE47vndwy8OfLMqFGAfnEvbo17bczyCO0w4dG+1r8zh3vQWotr27hh0l5yaNenMxWl
         udu4SL5RmpgPKFFIbX8eYb5/MdyYzFydRw+PoYwmNJnUo10QrCuooh7xeN4cvrJzY8/d
         o5MdSaajsEZoRwClVwEqtK5x9+0elZFTT7cFpiGFlETIDl0jR2BZ/REyruy5dEJKAanp
         WNwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzoCiLEjM53H2Tq2iTqO7/FYvjDX5CHD+2xJVA+S6Hvnlds9DTrABzbENSOfvd55TSbi6ydC6jk9zuaipxM@lists.infradead.org
X-Gm-Message-State: AFuF++lBoW6S9SQ13C202e9YgJ4t2vo2cpVO1Ta6F1I2tFPsw8uHiMQi
	a2pxEFY6SIBrI5P+7xZtb6l1k0TV+wzl6vhPDzlUuVonKKq38Xx79Tmk
X-Gm-Gg: AYBFou1DAlVHApQmI+QJZ4927Na87avpEWIU2JErUIup16aVg5v56J7mkColM3Q92mx
	yQRsn2p8DToZDYtkkfY8VRVBhKSbzDNK4htG8VNV3tVG73MvoUMWnsH7nmSx2m6nTPdAI32A1cr
	YRqAIzC3WCG4WhzvbWIMvjREf2GPMe8J3qdmVaNMrEsy+aE60PXyv1xjQF5N4yMyYZ5SYdoZ+xZ
	j6RTTAz1TJXz9pa1u9TsD1ubxVa7G6QAOFrRDaSVeVXwLk7xYT9Z9FdVmF4p5PWOpeQ9ilrMNiv
	bjlNhxa3cUgxwme4wB15f+6Ci90NEPnMepkAA1VI0+eahY6K01gIM+W2gFN37xYszluav6Z6OzT
	o4vjaLuD5IDdXHt09r5RpunuKNTs8pTRzk5tz2hbyZ+u4ArLSJ4l7LMWMtxf0hWZhCApLQHmKsP
	QeqI/ssAz2W4CZZB2t8vGLxtNwGC0fh63LiCYRLbI/SzvBiXH9P9eRijbOa8sA4abhfsg=
X-Received: by 2002:a05:600c:1550:b0:49f:fefc:7d01 with SMTP id 5b1f17b1804b1-4a00d778f09mr19426275e9.15.1790660810212;
        Mon, 28 Sep 2026 22:46:50 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d45ce1csm32021415e9.3.2026.09.28.22.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 22:46:49 -0700 (PDT)
Date: Tue, 29 Sep 2026 08:46:45 +0300
From: Dan Carpenter <error27@gmail.com>
To: Michael Freidkin <freidkin@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: meson: vdec: size capture planes from the aligned
 canvas
Message-ID: <artQxRR3kJUv-mBF@stanley.mountain>
References: <20260928165045.642354-1-freidkin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260928165045.642354-1-freidkin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_224652_915171_CBF80F13 
X-CRM114-Status: GOOD (  16.18  )
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

On Mon, Sep 28, 2026 at 07:50:45PM +0300, Michael Freidkin wrote:
> The decoder writes a whole canvas of ALIGN(width, 32) x ALIGN(height, 32)
> (amvdec_set_canvases()) and reports bytesperline = ALIGN(width, 32), but
> get_output_size() derives sizeimage from the raw width x height.
> 
> When the width is not a multiple of 32 the planes are too small for the
> advertised stride: for 720x360 NV12M the luma plane is 262144 bytes while
> 736 * 360 = 264960 are needed (282624 for the canvas the firmware fills).
> The decoder writes past the buffer, and importing the capture dma-buf
> into DRM fails: drmModeAddFB2() returns -EINVAL, so e.g. Kodi plays the
> sound over a black screen. 1280x720 and 1920x1080 are not affected.
> 
> Size the planes from the aligned canvas the hardware actually uses.
> 
> Tested on an S905X (GXL p212) board with LibreELEC 12 (6.16.0-rc3):
> 720x360 and 1920x1080 H.264 play through V4L2 m2m + DRM PRIME with no
> AddFB2 errors.
> 
> Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
> Signed-off-by: Michael Freidkin <freidkin@gmail.com>

Reviewed-by: Dan Carpenter <error27@gmail.com>

It would probably be more reliable to just ALIGN() the width and
height at the start so we don't have to do it over and over again.

regards,
dan carpenter


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
