Return-Path: <SRS0=6jDt=EX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83FFDC5519F
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 08:52:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E623A24671
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Nov 2020 08:52:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VEg3F4Bw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FfxQHpua"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E623A24671
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GmB8vq3zKUvDplj6qGU6RwCZdRZ4pvft+Z+JCNpr8rs=; b=VEg3F4Bw4OYn+gvwKIGdD0h0f
	/DEkHoy10/GAm/Jhaf0oFPxId/CFEhGHEKY2XmyPsBeeG+r2I7b3nxVMooZFJ91Z2a10dafcLpcd7
	1E77/3krJZ/S8+pXxc9RCMWezPomM17Mvq0aAKtlNIoWOqHejyUpKjtlAcfVDVbxRalXi62o6AqrZ
	NX+oOVp8d7y4Dpfq5puhzc9M4QGh1+to17biglR618RiNwuvSanfwXc6RCpSkYG8IO1D/FyAyVwf5
	C4nD8/93/GHb9RZkB2xpTRyfklzEXh8QeEqcqLKicaqiHcMhb1wgmJdWZoUNZDk/hMc12ZJuWMf9w
	XVbfZj+lw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kewic-0004Bt-1i; Tue, 17 Nov 2020 08:52:06 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kewiZ-0004B2-MG
 for linux-amlogic@lists.infradead.org; Tue, 17 Nov 2020 08:52:04 +0000
Received: by mail-wr1-x444.google.com with SMTP id l1so22307206wrb.9
 for <linux-amlogic@lists.infradead.org>; Tue, 17 Nov 2020 00:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pGfq+HTj2b7jAvETFhtsrMFBaNIHXs1Y5DjrMJw6Tkg=;
 b=FfxQHpuaM5aAo6KrBFWUZi2mQNH+pfyZFss9j0JeOveWZ7+OG8cUJDwzfownPeiIAq
 IKvd+nEpR8IdMMknY5ldAYDDbNGW1CMggnf4t2QGpZ6Wzp94TDmRD1I9Dx+mG0n1hPv8
 ZG1tQm3LE6Dm3OuZZe7hGA/TulPS4AiHa93+0zmxZ6ceEV7zjU/wRuKavOKc0x5EzoSg
 lhQWT7nv0GnO+B2omlr88qeoK1wAXCx9oKYLTEAweakdhbojbG3KWc8O0QKTBEySN2Z0
 5LYxYlc02IjM8DsEfN3Gog95Uf4hiN3jLFQmVfeAN0b3feOqPPtlK2/llQVvIu62ZwHm
 ne7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=pGfq+HTj2b7jAvETFhtsrMFBaNIHXs1Y5DjrMJw6Tkg=;
 b=tCtijB2thjxVEpgT+V2FW25yUz6zkCXkuij091SORM7r5PLMims4ri6mGLnnWyXOf2
 rA9R4/o3XHugyNX3yEFFWaNmq7wrVXiQgZXjeJvVpDph/l9Y3UBvc0Anfn80+ZcPQpgy
 +SO72PiiUWMFfSiMNWP1b1jeW3xT37U0Fl9dEgeptkyAYk/VRjXJMX31C4z2Kz4AgXaX
 5VPwF82YGgfC7qDbrYYl/dTTqXF+DHSsovhUchQVqCKD/hH5ReE2bNMH0jwP6PXr8EK8
 4q//vzHq5c2QRzBndy5lgs28AD/1gHpLWOJOPq/LyjH1tGneMDxfXLNAMc+Y1Sk8Yngo
 94gQ==
X-Gm-Message-State: AOAM531r55z0rzXDQoTcz9wsraHD/N8Td3QttuqqAVHDqcSMsUMkR4ez
 aCKOzqC9amVwbmPbT9TvTqSh1g==
X-Google-Smtp-Source: ABdhPJxCaSHbBBy3cZ1v4p2s2l1c5tPox6rdISBkCO7PmsVyZvmBo5G1y6F3FEIqeqeR1yrGUpDHqQ==
X-Received: by 2002:a5d:4703:: with SMTP id y3mr24342048wrq.416.1605603122631; 
 Tue, 17 Nov 2020 00:52:02 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:1561:9f4b:5829:8e26?
 ([2a01:e35:2ec0:82b0:1561:9f4b:5829:8e26])
 by smtp.gmail.com with ESMTPSA id 18sm2458646wmo.3.2020.11.17.00.51.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 00:52:01 -0800 (PST)
Subject: Re: [PATCH 1/4] drm/meson: Free RDMA resources after tearing down DRM
To: Marc Zyngier <maz@kernel.org>, Kevin Hilman <khilman@baylibre.com>
References: <20201116200744.495826-1-maz@kernel.org>
 <20201116200744.495826-2-maz@kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <1cdb7832-f400-8a11-210a-0cf33be76039@baylibre.com>
Date: Tue, 17 Nov 2020 09:51:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116200744.495826-2-maz@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_035203_787318_D8CB9430 
X-CRM114-Status: GOOD (  20.48  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 16/11/2020 21:07, Marc Zyngier wrote:
> Removing the meson DRM module results in the following splat:
> 
> [ 2179.451346] Hardware name:  , BIOS 2021.01-rc2-00012-gde865f7ee1 11/16/2020
> [ 2179.458316] Workqueue: events drm_mode_rmfb_work_fn [drm]
> [ 2179.463597] pstate: 80c00009 (Nzcv daif +PAN +UAO -TCO BTYPE=--)
> [ 2179.469558] pc : meson_rdma_writel_sync+0x44/0xb0 [meson_drm]
> [ 2179.475243] lr : meson_g12a_afbcd_reset+0x34/0x60 [meson_drm]
> [ 2179.480930] sp : ffffffc01212bb70
> [ 2179.484207] x29: ffffffc01212bb70 x28: ffffff8044f66f00
> [ 2179.489469] x27: ffffff8045b13800 x26: 0000000000000001
> [ 2179.494730] x25: 0000000000000000 x24: 0000000000000001
> [ 2179.499991] x23: 0000000000000000 x22: 0000000000000000
> [ 2179.505252] x21: 0000000000280000 x20: 0000000000001a01
> [ 2179.510513] x19: ffffff8046029480 x18: 0000000000000000
> [ 2179.515775] x17: 0000000000000000 x16: 0000000000000000
> [ 2179.521036] x15: 0000000000000000 x14: 0000000000000000
> [ 2179.526297] x13: 0040000000000326 x12: 0309030303260300
> [ 2179.531558] x11: 03000000054004a0 x10: 0418054004000400
> [ 2179.536820] x9 : ffffffc008fe4914 x8 : ffffff8040a1adc0
> [ 2179.542081] x7 : 0000000000000000 x6 : ffffff8042aa0080
> [ 2179.547342] x5 : ffffff8044f66f00 x4 : ffffffc008fe5bc8
> [ 2179.552603] x3 : 0000000000010101 x2 : 0000000000000001
> [ 2179.557865] x1 : 0000000000000000 x0 : 0000000000000000
> [ 2179.563127] Call trace:
> [ 2179.565548]  meson_rdma_writel_sync+0x44/0xb0 [meson_drm]
> [ 2179.570894]  meson_g12a_afbcd_reset+0x34/0x60 [meson_drm]
> [ 2179.576241]  meson_plane_atomic_disable+0x38/0xb0 [meson_drm]
> [ 2179.581966]  drm_atomic_helper_commit_planes+0x1e0/0x21c [drm_kms_helper]
> [ 2179.588684]  drm_atomic_helper_commit_tail_rpm+0x68/0xb0 [drm_kms_helper]
> [ 2179.595410]  commit_tail+0xac/0x190 [drm_kms_helper]
> [ 2179.600326]  drm_atomic_helper_commit+0x16c/0x390 [drm_kms_helper]
> [ 2179.606484]  drm_atomic_commit+0x58/0x70 [drm]
> [ 2179.610880]  drm_framebuffer_remove+0x398/0x434 [drm]
> [ 2179.615881]  drm_mode_rmfb_work_fn+0x68/0x8c [drm]
> [ 2179.620575]  process_one_work+0x1cc/0x49c
> [ 2179.624538]  worker_thread+0x200/0x444
> [ 2179.628246]  kthread+0x14c/0x160
> [ 2179.631439]  ret_from_fork+0x10/0x38
> 
> caused by the fact that the RDMA buffer has already been freed,
> resulting in meson_rdma_writel_sync() getting a NULL pointer.
> 
> Move the afbcd reset and meson_rdma_free calls after the DRM
> unregistration is complete so that the teardown can safely complete.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Fixes: d1b5e41e13a7 ("drm/meson: Add AFBCD module driver")

> ---
>  drivers/gpu/drm/meson/meson_drv.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 8b9c8dd788c4..324fa489f1c4 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -389,15 +389,15 @@ static void meson_drv_unbind(struct device *dev)
>  		meson_canvas_free(priv->canvas, priv->canvas_id_vd1_2);
>  	}
>  
> -	if (priv->afbcd.ops) {
> -		priv->afbcd.ops->reset(priv);
> -		meson_rdma_free(priv);
> -	}
> -
>  	drm_dev_unregister(drm);
>  	drm_irq_uninstall(drm);
>  	drm_kms_helper_poll_fini(drm);
>  	drm_dev_put(drm);
> +
> +	if (priv->afbcd.ops) {
> +		priv->afbcd.ops->reset(priv);
> +		meson_rdma_free(priv);
> +	}
>  }
>  
>  static const struct component_master_ops meson_drv_master_ops = {
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
