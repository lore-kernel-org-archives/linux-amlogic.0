Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6665DE77198
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jan 2025 05:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jpTmxRmBBCX/jfSi/3uVt7+Jj+UkuwRoI8ioRtQY2NI=; b=NBL/u+ApgGOQBl
	tEK6dcn50IdS612R++s6xlOtwoqFbz35ycaAG/c4Alf7MufBtaFsDoIVqVzmaqA+wk1i0Fi0kKUpx
	f5m7fl3stYxlqYFoBzmqia2h/cD8TSILdiWOiPkHnVyaav0Mb/Lu8ZB7fKYTw5Pri7aNW2/yAWcSU
	+X2f/F4LdCLmEP/0Zs2Y11TwSICbeXdRg2ANRC6iUT6HgZGh0l5JPe8Skvv12Zhrh+DPn2AfvaeP3
	e+JNG+kkyevMBcOdZs4PJz3N5zXtZX3QGbxx7xJPXKKES9PPjRCMPeGXQjDKdAuEDFCMDexbTD8iI
	woYQT28CcK4kxiqNj8gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTai8-0000000C9nw-25gp;
	Fri, 03 Jan 2025 05:59:04 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTai4-0000000C9mO-2mL4
	for linux-amlogic@lists.infradead.org;
	Fri, 03 Jan 2025 05:59:03 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-3004028c714so133142281fa.2
        for <linux-amlogic@lists.infradead.org>; Thu, 02 Jan 2025 21:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735883938; x=1736488738; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sFlWSYAVuSson+OhthOc5MObp0JO2PaKlR/7cwxtKLk=;
        b=lJOCF4getyLfCTeb7T9gis1JfTlyqANzE85LuaJJDjqnhHKEfFUXaBl1pOx5+IbRaJ
         WSqfIche3gDO6hCmbpiqvFnUlNhDfvd0kGOThC5LwT6ny2gKBtAhE61MO+wF1+rtiUYI
         901Ozh5JDaLzwB8MmM0CsIOxsK+DOa+2qod6BTSBAORj0cuJuKMWQLuSQXe2wpeQB3Yg
         1o+hmCEU//PxONurY6juhbXJjqrZhCGKL5IJ55Pxz5mN+b3noKKCoqEZblL535LRj0LU
         Yn+9JuQsnp6K6WjQui2ZsyDshsjlwKKioUs1/xn0i9EdK/PMIEWWcniY8Rq8kcb5X2V1
         m88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735883938; x=1736488738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFlWSYAVuSson+OhthOc5MObp0JO2PaKlR/7cwxtKLk=;
        b=acZPdYZhmIYpctGLQOng6c0cekQ54fZ2cwV8xo9PvGwaG8DZxNdy0H78DkARwG5iOL
         s5bgr7ARQegjlwuWFzRjAwt8lvkNFV2WO58iMD8sq+pq1k/yY/0zoauCIb5mfaRZ86h+
         Ta22OQiUzv8hIF20WHiomW+DWfmfj5iiBTo7Vdsv/NWZyvPgTycz5205pEye1IvfFYjg
         8jQ91sHnrfzIR4sl6MT5i74pQ7uQThqTTmHUZarvKN6zy0IWEu6h16W+kFxNKx2vr8mm
         LaRgpfYmD0WXNWw2FTsNN9189ERx4Bu96SX9y4KMQpSkdZ9HZfQDHr3Cc6vwW7CACK2A
         nw3g==
X-Forwarded-Encrypted: i=1; AJvYcCV7rU2z796+2Mk2MfqeGkqFm6WSZoQ/NvLJ3g/BrYCH43JqJnqPortzbgk3FJbj+6NJufno2MF0E8BXAAiK@lists.infradead.org
X-Gm-Message-State: AOJu0YwJXzjIjDEkl0hNU5ZnqUFXpvxSqBOvOVJpls4Mq/1abU6mbTFJ
	FHdj4NGGtYJHq7km8F3inJtGRH9puLd2/LbbmMy4L1Ys3htGcRhEd6VfO949/7w=
X-Gm-Gg: ASbGncuQx3ace2i29+OrJpuhogO9Kee8znAe2ty6SZcGR8GU/2h+pojtM096gCDIw2f
	w9S9LzErBWw9fOhkN6BZ76lhHmNhDX9Ljus96jTz2Lw4+LZ6iPTJy68nxjQhipLVnICLNkbuc7+
	rDUVzkJl0E3usprwkjW/zeDXvcbMfyS/j/CXNxKEgz++7ftGtPUDzLIoYg9P/WwnoUorECuUfh6
	KMQt2wZJ4Xs7QxupHKLKbQg3Fn+9pm2MsBJ9/XMG6R4/PXnH6rIcvZaYtn2qMJ29VIhngMHkSB0
	QtySHXhL1tAwHStfXV4EGQECqMJWXR4T8PC/
X-Google-Smtp-Source: AGHT+IE6y4JdTtlzcbrnGGg7v7FjSgwU7e/vWxQ7TgNE5uhhWt7BpBzFop0XHrbVtbgwiv0CXbLJOQ==
X-Received: by 2002:a2e:bc1a:0:b0:302:3a46:10a7 with SMTP id 38308e7fff4ca-3046851f9cemr129431821fa.5.1735883938405;
        Thu, 02 Jan 2025 21:58:58 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3049ec4ca6bsm26165151fa.56.2025.01.02.21.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 21:58:57 -0800 (PST)
Date: Fri, 3 Jan 2025 07:58:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/ci: uprev IGT
Message-ID: <dj2r22upxnj2aicjnsvoqnhd4n73tyfgm36jtvixxp4vphocev@gggcjakm3xge>
References: <20241217160655.2371138-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241217160655.2371138-1-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_215900_709255_742BA96A 
X-CRM114-Status: GOOD (  10.29  )
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

On Tue, Dec 17, 2024 at 09:36:52PM +0530, Vignesh Raman wrote:
> Uprev IGT to the latest version and update expectation files.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v1:
>   - Pipeline link - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1327810
>     Will update the flake bug report link after v1 is reviewed.
> 
> v2:
>   - Pipeline link - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1331363
>     Updated flake test bug report links.
> 

What is the current state of this patch? It would have been really nice
to get it in, we have patches depending on updated IGT.

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
