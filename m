Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86018CCF9E9
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Sep 2024 07:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=feP299CKpL2DPlNk8CkelLBAKfz2tvKeXhee6quEG1g=; b=DtUqsovcMWpjJL
	qtDnZFKBhhiM2mZuEj/npurrW3QjI0y/72g+nmC8zPY6ZRXM+qyYeS/FEK8Eo7qfRKkxu3LMN00dy
	+EDvYjnbHbSKgujYUT3+d1beR3NJfV7h6KIWonC1UzVtykDYs2ucgNf6hMpncX3hO7Do+KsPfKMCw
	HXopc0HkzuGMbjue4zNF+CzK4BtKZEYxfZFloFsX/FtZbUKCwr344mF1RJpZVR9chtLUhLwlFwRUT
	wsp6kSm9wOWac325JTtF6kMpx3rcAsevTa5JVeQXaY2RDLq7HB7/Xt5aLr9ORdyJnWq0u5ixYBqaq
	dEDK8zdRN8wJOZ+Xr+Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stj9J-00000007Y4g-1oXf;
	Thu, 26 Sep 2024 07:42:53 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stiwM-00000007WAP-2cm0
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Sep 2024 07:29:33 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-53654e2ed93so845668e87.0
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Sep 2024 00:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727335768; x=1727940568; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qDfxbQPwiokVDYdYi9MFG3A73Xy2Dn6HJeQAftMAmZo=;
        b=T8HF8ggPSXV9DSN835RE58/ZcWfLgkQS94aFq5bmXIl5HkavtIc4FBUw3Znht/DnpN
         g/AH/3F1zRxReWVIWr9OcHs9eyE4GvYEoXpoc+Q8DZaLXqXuSpaF1vWLOJDork3qtN6e
         6e68ki2W1S+VZ++rD6hbpuY7SJFKCJTnMbMSfP9c+IXvLzVaiFaY9zAaTaRnYzPAbgHt
         j2XN6r9rxaLVdfmKJ1CbsgVKH8L1xcl5N3L8r4q7Rmx+4A/1cNpJ8I/gp+Esn8CUPCEE
         Zv2wWVfxv+tAxh9fHNOOjnL6t+ataHr0pe0cd14iToDbru2SCG0A6HM2M/iZUrzCuUHj
         zynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727335768; x=1727940568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDfxbQPwiokVDYdYi9MFG3A73Xy2Dn6HJeQAftMAmZo=;
        b=bdH7YxQtACBn/QYvB5URnpHhh2HkVy/S8AWEI91GbKiW7ggjCk7p2Rcut4MQzvzj9j
         jJbEa4zPlSfXRlxG6sQPmAn+fF2X5wEeEYZjXzF7Q19uHGqaxRUsgdYJaOloe/vvvGWw
         thHnF5VMiMO2u9Wl67lt+9uqDvsoKE7WBd/YEuHYlTgq1lcr5wsfU4PTz3kNuOm1hIw2
         J0Uo2XHzwiPC8GRt/izhesFHn2EEtP9j/HaWuUOJ/LnNkC8TFLgdPLWeb5jcXg6IHD3m
         K+Ws2oz6yuybxYDNETI5FOZHjcbPiSj83cYvJ7OOJ7z+L21klrP3b8TP6ZODNMMKOi1S
         tDyg==
X-Forwarded-Encrypted: i=1; AJvYcCXzAncbt2kIOpJlmAuucqJbEMIfq8O70qkqgwOccCh383RwKsNORw0VKUhkffb1NS87yv/wrFBvKMClQsNx@lists.infradead.org
X-Gm-Message-State: AOJu0YzDhxie5R+u3y/o6CmsPx23yszJaGayrIgfwReLBoem9oL0y2Jo
	VgZFG8MUlrMF/NQFwzhgF+RMNU0eBxmWSoIiM2VCjcT0UfTz4tvmOotIIDK2w2s=
X-Google-Smtp-Source: AGHT+IE8t/WEuR6wLLC+FMdDPRvo5sy/HJiTMb2ns4dr6CTbA9nkOna0DOKv3ZWAngvCWp8t9wgrZg==
X-Received: by 2002:a05:6512:2243:b0:52c:8c4d:f8d6 with SMTP id 2adb3069b0e04-5387755ba36mr3075446e87.45.1727335768286;
        Thu, 26 Sep 2024 00:29:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a85e061dsm737595e87.44.2024.09.26.00.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 00:29:27 -0700 (PDT)
Date: Thu, 26 Sep 2024 10:29:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, deborah.brouwer@collabora.com, 
	mripard@kernel.org, rodrigo.vivi@intel.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs/gpu: ci: update flake tests requirements
Message-ID: <llzzzcfbb5gpdcldobqsl5yqgac6cpgcs4r5jh7sbbsuwhchua@avub3pj2by4z>
References: <20240926070653.1773597-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240926070653.1773597-1-vignesh.raman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_002931_291831_97152C8B 
X-CRM114-Status: GOOD (  22.04  )
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

On Thu, Sep 26, 2024 at 12:36:49PM GMT, Vignesh Raman wrote:
> Update the documentation to require linking to a relevant GitLab
> issue for each new flake entry instead of an email report. Added
> specific GitLab issue URLs for i915, xe and other drivers.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
> - Add gitlab issue link for msm driver.
> 
> ---
>  Documentation/gpu/automated_testing.rst | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gpu/automated_testing.rst
> index 2d5a28866afe..f918fe56f2b0 100644
> --- a/Documentation/gpu/automated_testing.rst
> +++ b/Documentation/gpu/automated_testing.rst
> @@ -67,20 +67,26 @@ Lists the tests that for a given driver on a specific hardware revision are
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
> +https://gitlab.freedesktop.org/drm/i915/kernel/-/issues for i915 driver
> +https://gitlab.freedesktop.org/drm/xe/kernel/-/issues for xe driver
> +https://gitlab.freedesktop.org/drm/msm/-/issues for msm driver

Ack for the MSM part.

> +https://gitlab.freedesktop.org/drm/misc/kernel/-/issues for other drivers

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
