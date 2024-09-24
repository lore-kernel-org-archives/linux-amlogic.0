Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9420CCF9C6B
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2024 06:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wd+yvej6qhIyIH81416lUFfiruJoA6vPcmY85fkqX70=; b=tCLIl2i6p9rZLQ
	rM9PVRvwWhsqB1L/7mMjFigpVPr0eOiW1/nzq0qKDwU4PWuvwqifMgSDWF2Ac9E+LAvpqh0fDzrJS
	rhWDRm3HEunFUfIoXSqtxJtAAVHrTiFuGAo0J7p9tyqs2YQKdqvljfFlSbPI2YjkhivOu0537DMD0
	ZmRKKFxSg8/PFVL7iv3hHUv8R9h+9n7SBFnSldfPsF8rHsQJX0iLZabmwblVQ6osc87jhDlZK+W1x
	81LijuwQ15NLxD0z1M9meS8Ns939HUO2yNjrez9csFU8vFUfC/NBYnTXobLJ3o7rInUtitsddsXpX
	viCTTcezO4SzFivsxzZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssz3r-00000001FrJ-3BTl;
	Tue, 24 Sep 2024 06:30:11 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssyqO-00000001DTa-0cDK
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Sep 2024 06:16:19 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-6d6a3ab427aso38051967b3.2
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Sep 2024 23:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727158575; x=1727763375; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcweUFHFW/KJCW3gKD065UQS3lsmUsHAhy70Femt8O8=;
        b=OpylL/DTkYlkxlr/48/96CTuR36dN8qQCZK06gZqBXjY5u3kJa2ikc1zGqJ9nZr4Ie
         8Ot1766owysdMQ60V4diqE9n7HGCMFHMYIDFRgc9nxZj3yqbh36YfNSNj34+A355DKV7
         eWE4X5DkIXr6C5/IP/hgQXYBh7TGvKXfUmN3jY0i+lDKqNh87S9ul7GeQf+zgf8gb43k
         m8bEStarNtJ1avrEIW+/UWY7qD0+sbtZyQaFYVqtZnusjnFqngdDSQNJdIgZ4FJ2PHfp
         Q89M/9cEejyilQLgC6OFKn3mW1lRJUrmKxQdawNT3L8U63EbuoDRAAMNstHECHt3dOc8
         5Q6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727158575; x=1727763375;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZcweUFHFW/KJCW3gKD065UQS3lsmUsHAhy70Femt8O8=;
        b=SGJCv12z2gGTzJORV9ERhPIbA+EnYrnTLz5PTOE7QWT9GdzMxEzbvBgEUTrKtWLkgk
         Pnu+Tw9XY5fHteMqC61TCWl3BZCJtbcRR1QP2DCuZBhw6UYBEOXp+UqhlcVdSohFXaqL
         lv4dQ9ywAEBYUozyRMV7hCx3uOiyG48Oa8BTXSlG7U27I9WzJYvccyeT6DcMF4OizmbZ
         A3ttdbd4MBGSVGFNJ3Sr2p+/r+rt0nAYTXLB9dbRvxBmBcd9ElgBpovZ/jdaJn2jEn+O
         duWs6MmG7VU7e3eWmvw6On3L+IPsL4z5CbX1ayqrgzegGqYlMOFATtoWFdUUZuiQulPP
         U8Og==
X-Forwarded-Encrypted: i=1; AJvYcCX3MEQeK/T5V9a28VLZ0kJQDSnKwL1xNdFCI2kV4czv95Txa/SDUrVf5o5t1O5h+3ZPUj2oiRIxtw3HarYD@lists.infradead.org
X-Gm-Message-State: AOJu0YxiAMlZdEy2oEZmGVngkICrxYDBeWrMNmpCnQ8cVPmY/b0eGeXp
	SBCKj3SYqihAqtexm9Fog5kGikNpizEUUyhApx2neqJNZnxCH/N5U5Rm/8xNbZccF7og5Gr7KnU
	NvwZfzi95dyQveji/zqSsAIaerl+Q8iOQeLJGKA==
X-Google-Smtp-Source: AGHT+IEF5j0JkBVAgP1jTlkYufGIlKJxFTmmd49IaW+yK41rQF/NpMRTMvOPM1xHJnDTOa2dEHhH9wuEn2USXNPEeWM=
X-Received: by 2002:a05:690c:89:b0:6b1:4948:f689 with SMTP id
 00721157ae682-6dff290379dmr105980107b3.34.1727158574971; Mon, 23 Sep 2024
 23:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240924022600.1441969-1-vignesh.raman@collabora.com>
In-Reply-To: <20240924022600.1441969-1-vignesh.raman@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Sep 2024 08:16:04 +0200
Message-ID: <CAA8EJprUUUc0iDph-HPrW1anrdnzYju7+JERQdHbwxvznq=H4w@mail.gmail.com>
Subject: Re: [PATCH v1] docs/gpu: ci: update flake tests requirements
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, 
	robdclark@gmail.com, guilherme.gallo@collabora.com, 
	sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com, 
	mripard@kernel.org, rodrigo.vivi@intel.com, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_231616_220411_A3EBC76A 
X-CRM114-Status: GOOD (  21.70  )
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

On Tue, 24 Sept 2024 at 04:26, Vignesh Raman
<vignesh.raman@collabora.com> wrote:
>
> Update the documentation to require linking to a relevant GitLab
> issue for each new flake entry instead of an email report. Added
> specific GitLab issue URLs for i915, xe and other drivers.
>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  Documentation/gpu/automated_testing.rst | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
> index 2d5a28866afe..f73b8939dc3a 100644
> --- a/Documentation/gpu/automated_testing.rst
> +++ b/Documentation/gpu/automated_testing.rst
> @@ -67,20 +67,25 @@ Lists the tests that for a given driver on a specific hardware revision are
>  known to behave unreliably. These tests won't cause a job to fail regardless of
>  the result. They will still be run.
>
> -Each new flake entry must be associated with a link to the email reporting the
> -bug to the author of the affected driver, the board name or Device Tree name of
> -the board, the first kernel version affected, the IGT version used for tests,
> -and an approximation of the failure rate.
> +Each new flake entry must include a link to the relevant GitLab issue, the board
> +name or Device Tree name, the first kernel version affected, the IGT version used
> +for tests and an approximation of the failure rate.
>
>  They should be provided under the following format::
>
> -  # Bug Report: $LORE_OR_PATCHWORK_URL
> +  # Bug Report: $GITLAB_ISSUE
>    # Board Name: broken-board.dtb
>    # Linux Version: 6.6-rc1
>    # IGT Version: 1.28-gd2af13d9f
>    # Failure Rate: 100
>    flaky-test
>
> +The GitLab issue must include the logs and the pipeline link. Use the appropriate
> +link below to create an issue.
> +https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/ for i915 drivers
> +https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/ for xe drivers

drm/msm for msm driver, please. Otherwise we can easily miss such issues.

> +https://gitlab.freedesktop.org/drm/misc/kernel/-/issues for other drivers
> +
>  drivers/gpu/drm/ci/${DRIVER_NAME}-${HW_REVISION}-skips.txt
>  -----------------------------------------------------------
>
> --
> 2.43.0
>


-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
