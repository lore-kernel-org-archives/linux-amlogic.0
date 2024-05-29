Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2606C25B7C
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 May 2024 07:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EaDkX+Miqm/HAKZZNRMw9W4UI6FUxPDSjtl9vVlGhas=; b=Ib4be1rFevxvYY
	inRHGwyHEQUcfZlUa8FBO6g3g4phCeoVCznKtkGngKvo/oLlwB8Gw2iXjL1NEOxdjat7hIYdzrtC/
	W3+U7Erj3+PG9qGKuUa9BUDNjnlJiAA0qflfSKr49rr/Tzkq1A0OGGWQyOZlGdpQ+3UCt3aSGYJ0X
	BIPaaCXiij5X8CG/wgYSF4kihDSu5H4ZWqCybh5p8GT1ZISQkAcLUfbt3PYJYtqiYLT2p1/x1IgGo
	TEgbiUy4FhsJQ9noRE6IVQzMqV4mvFMULF6jE7z8KJJ05lJJ7UuRsluQwygPE6A6/+I+KRkMmeKH+
	IwVNF4Fb2869AuQdh8IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCDzO-00000003CBh-1MuS;
	Wed, 29 May 2024 07:44:50 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCDzK-00000003C8L-29Qu
	for linux-amlogic@lists.infradead.org;
	Wed, 29 May 2024 07:44:48 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2e716e3030aso15809991fa.2
        for <linux-amlogic@lists.infradead.org>; Wed, 29 May 2024 00:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716968685; x=1717573485; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S1XyMvug7w7dhtxZdl8ZlGvff2YgfxxUHgfNNPJEirc=;
        b=qeAuhxtLQf3IGRqUpRGdLEFUQn2lQ5R8F97dw+wddye71g7Rb91pzXX85eZ4iF6/nk
         ZgduyBXCfMpj8TLiYowjWFib39yv/v0FzfALw18NmgcuT5vm+Bx3t7Zjt8o84NM9QxrI
         WN/8x0FOfAUB/4uq4+h+1jXYFKCpyOk/V0Y4auBnvNsskm/VV8QA/+0KMLfZ/a8d3KKH
         c588euE6nf2qCHMj2VQ1Lwp8N0DkqIeH0KSF1bY5xO8jWURe/m3Y4sYZQbKJOEXUa4jB
         Yfq5GmSNR34Ckw3ClJFver6hyPKGD8+tUTuxp/AVCrtguGwrkgfo/4KwIgSP2JK8Lz6D
         yuYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716968685; x=1717573485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1XyMvug7w7dhtxZdl8ZlGvff2YgfxxUHgfNNPJEirc=;
        b=wfcGSOdLKtVaYVw9y6P+2XXnSJOF9wZ+LVUdePgpNTS31pSloLvgkqbYZpD1SO6wLW
         5/UNxe1cxpYY0F9VVSTK5pUftXV7hxjgM4jNYZUQ0bf68ZCs6Xrk6Bu+d5Rq/wXQVzK8
         qphNYEqItmEkoS6LXNumWMMgYP3EOdCpYtFjZ/L02ZqdoHMZCpJSLhAaKnix2Fq8+6dq
         2P0nDL7wiQ05yvLoaXAFrEWiiot2KZcBStv5gvAQZB6m23RwyAiyUQA/9imNOzQRZ0VZ
         fY25Kl3ob5cKY31yfnsjyjNJ6raxV20LzsPWFwe62tx9/tHg7o7Xq/AVRiuIP0to/pck
         ZZgw==
X-Forwarded-Encrypted: i=1; AJvYcCWF8VHuD/4P1FBsISiMEf6CPoUt0znP00zLlQF6WzADXD1dO3PSG/R2vsnjqLmh5bxRQoFADU6+2HmD9FKHftvTVL1ud+u4+sxD1V8c9CUocRo=
X-Gm-Message-State: AOJu0Yz2QJL/6ToPGsz3mBIRhi6eazJxYaM0OlQtonJQug1TZXrLxw3m
	GbINWrWYX5Jrp+J7F713xZMiYXqaFLjDeLyBE6KfxFL0kgy2OlWvilqUPqtfUnc=
X-Google-Smtp-Source: AGHT+IHWA2lvLG0B0kntbUD/V5owakoa3EW0tQI6tq3UwCSFqELYaCxoJok/0cawUBov1/1KRXreEw==
X-Received: by 2002:a2e:b05a:0:b0:2e7:c29:dadc with SMTP id 38308e7fff4ca-2e95b24e06amr72686241fa.34.1716968684582;
        Wed, 29 May 2024 00:44:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e9816943d2sm6297271fa.61.2024.05.29.00.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 00:44:44 -0700 (PDT)
Date: Wed, 29 May 2024 10:44:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	david.heidelberg@collabora.com, guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] drm/ci: generate testlist from build
Message-ID: <nsamdoevg6fhop3otikwsmu4ga6ysyrg2ogxbqhw3sqg2nbqq2@n5xbqid7ltiw>
References: <20240529024049.356327-1-vignesh.raman@collabora.com>
 <20240529024049.356327-4-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240529024049.356327-4-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_004446_958608_56E39543 
X-CRM114-Status: GOOD (  11.50  )
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

On Wed, May 29, 2024 at 08:10:46AM +0530, Vignesh Raman wrote:
> Stop vendoring the testlist into the kernel. Instead, use the
> testlist from the IGT build to ensure we do not miss renamed
> or newly added tests.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>   - Fix testlist generation for arm and arm64 builds.
> 
> v3:
>   - Rename generated testlist file to ci-testlist.
> 
> ---
>  drivers/gpu/drm/ci/build-igt.sh  |   35 +
>  drivers/gpu/drm/ci/igt_runner.sh |    9 +-
>  drivers/gpu/drm/ci/testlist.txt  | 2761 ------------------------------
>  3 files changed, 40 insertions(+), 2765 deletions(-)
>  delete mode 100644 drivers/gpu/drm/ci/testlist.txt
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
