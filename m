Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6BCC4332F
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Nov 2022 19:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yXam2m6tMgSXShSS+PRjrMON/hQVcbAjwJyvVreQm5g=; b=RSPOgr1IInuaG9
	5CcduyID3GL4FS9u/ltCtcyY2XQ1dQg8X1iPOxKk41nnjXtXPFtQopQcfPRXwxseGQbll2HfSo38K
	7E0Iya7TC2sSOFFiSmN31QdzE5lFW1GOTYQcQ0IbvTmNYs7xPJ/lsXlDwBFtqSSPm03Kc53wpRraw
	rVW69hnmR0TnIiOmEfN5esoXPkEY/8v1XgO1c+BM99+oNntjs23neVc6JJ30k3yczCQEpegRxp2g5
	Z9DmDGxi+g4lWk6iIZ3Vl0Di1l/A+Y9gFp/bp+yYn4r06e7J6fJZjPRka/fUAen5xsUknFSW6GpZE
	vfqPWtFnIZ3Y9bWh7Q9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqJ63-00DUia-A5; Wed, 02 Nov 2022 19:08:19 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqJ4R-00DSiL-3y
	for linux-amlogic@lists.infradead.org; Wed, 02 Nov 2022 19:06:40 +0000
Received: by mail-pf1-x42c.google.com with SMTP id y203so3110714pfb.4
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Nov 2022 12:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YLJw50A1K+KhusFBEa675+xxaU3caL5GDgA+x/6AGwQ=;
        b=eanRVW/LBbSyQtTn8NWCZTTDAawhljklM58TSIe0LHlwW/gHbMD11JP3ckeaEe/msg
         vmppBy0RmvOGmkJW6vTqFKB6oG4y+0rkYyOuCChrP4Sy/x03U/caHHgMIFnNNWlXRSYQ
         MKBSw57TYyF6OcudfzZhtv+PDEccU/3X7mxRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLJw50A1K+KhusFBEa675+xxaU3caL5GDgA+x/6AGwQ=;
        b=xb7XDsPvUvbh8S9/oynK9ZMJJOpV5FIGOGxkLplVyLO8LJh32dUeX7lvMXFmUIrkJ7
         yaq50fKSP0oEJF/RcCOcZAIwROFHZfDdPMebrTEjhimoz8s/yF0BVuPxhJthubEAl5Mn
         8kbqhw02BgGTxLyBta+rYf6TvjZk8ERrIMk5CKWR0Cfe0outV9h8qOUj62PDP/x/X8Of
         WfDM07f8WJ3QYNPBN68Ga6keNN1ARZKtjcCJ/vBLgEbp7NdYG+8lAH917lhYX7T3IbqH
         N29zUKhJNqGDbKwHmRY2U4kmIVWeXgXvlixMPATDkj3YaLpRKagPi/5LSpE1pLqyRsjK
         fsVA==
X-Gm-Message-State: ACrzQf0pbLi4agWTWquMFj7iQVA7inzXDUYzHzXYLHse2JF7SOh+oiQa
	yKc31BoyUeaFJwMiGrWBPY0mvw==
X-Google-Smtp-Source: AMsMyM5nOP7TB+tQ3IHpynS+a4tGqv36tuqeuJEkR1BO6kWK8sdX+uSJsUdso0ZtKCVhfl6YA8bm0g==
X-Received: by 2002:a05:6a00:1688:b0:53b:4239:7c5c with SMTP id k8-20020a056a00168800b0053b42397c5cmr27219671pfc.81.1667415995509;
        Wed, 02 Nov 2022 12:06:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s17-20020a170902ea1100b00186727e5f5csm8710774plg.248.2022.11.02.12.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 12:06:35 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:06:34 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Sami Tolvanen <samitolvanen@google.com>,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: Re: [PATCH] drm/meson: Fix return type of
 meson_encoder_cvbs_mode_valid()
Message-ID: <202211021206.F5C5954F66@keescook>
References: <20221102155242.1927166-1-nathan@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221102155242.1927166-1-nathan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_120639_206228_401FDBE8 
X-CRM114-Status: GOOD (  13.93  )
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

On Wed, Nov 02, 2022 at 08:52:42AM -0700, Nathan Chancellor wrote:
> With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
> indirect call targets are validated against the expected function
> pointer prototype to make sure the call target is valid to help mitigate
> ROP attacks. If they are not identical, there is a failure at run time,
> which manifests as either a kernel panic or thread getting killed. A
> proposed warning in clang aims to catch these at compile time, which
> reveals:
> 
>   drivers/gpu/drm/meson/meson_encoder_cvbs.c:211:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_bridge *, const struct drm_display_info *, const struct drm_display_mode *)' with an expression of type 'int (struct drm_bridge *, const struct drm_display_info *, const struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
>           .mode_valid = meson_encoder_cvbs_mode_valid,
>                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   1 error generated.
> 
> ->mode_valid() in 'struct drm_bridge_funcs' expects a return type of
> 'enum drm_mode_status', not 'int'. Adjust the return type of
> meson_encoder_cvbs_mode_valid() to match the prototype's to resolve the
> warning and CFI failure.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/1750
> Reported-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
