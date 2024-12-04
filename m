Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEAFE77171
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Dec 2024 18:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6eMrzC1jkELwJ+jyx5fl6pL0Zu6vwdzuOglEI77+ZBg=; b=PENR86x9zpaNhS
	KPQlVJ0QckPTVzc0jkcqd9gUUCKCinEh67IwiPd68k6aO6/6YgZhE0XXrznTBmYHmfShTpnUcF9As
	G8EXi311fO2YXFatd0R0RconOPrbb2G14l1FLG+QE+9pcIPLhTIYHdcHXOgjjkBqo1Xw8MinvTgAx
	TnAaWB8qbHGZa+vq0boBwATBwCsyHp2jA0TdkzteP0wOT3xXGS8tNQHaCB4hNopqam3NmF7S5I9vO
	ZC9WAeJMG6Lrf7Ovg6Gf6oKn3XFUny25YK4shqlFn/nXXFQokXOPYnPJbSV3GfasJAkz04iM83BQ6
	d7kw+Wz5DcK0UWSqM6AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tItj1-0000000DToX-2yNP;
	Wed, 04 Dec 2024 18:03:47 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIti0-0000000DTa4-0DEU
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Dec 2024 18:02:46 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7256a7a3d98so87390b3a.3
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Dec 2024 10:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733335362; x=1733940162; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PeBuKTAzT5t/xg0HOfB6aMdefP/YbNUMgGL/5kx9O2s=;
        b=yfDUG7en9yhdgmuGiayQkruUJxgX77V9PI9ZLx+kr4Y8+/o0szDtxjxKS++pIcBIdX
         l3kVpof4Lf5ugfUCQ9tTgu9/HNV94xSBtb2PiPfLQSjruwlOBgQAiRjQfLQeesMO7ZCk
         bG9DiK/sCZ9RCYtVDlYkKlJjzaAlCQArdp+l3TPnG2u38yOo4JfIw2XKH+gcov2P5cDq
         Bb7tIwSRSTs3Ii068LQX17HH4LQfC3sjBifZfa1Sspp6xFz9ZSBrZVjzNtk+dtzPhRwf
         77f22raRN7/NjXqHwIrtaN/O4c0XIvtjW2FjVntCzk6lTv8FRAh9UWpJsljk2PVLnsFA
         Wgfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733335362; x=1733940162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PeBuKTAzT5t/xg0HOfB6aMdefP/YbNUMgGL/5kx9O2s=;
        b=PW4z8i0reAq7oRARqhD2NUOBof8jQaQLPcL+e5qoVL9I4dufTeZvK743NXMndTq8HY
         aL96jxoO98V+6MkCcD012ez/fUqmC3b/C21RoNwNaarGVb87t7au8gc0soYQ7829MQUq
         iKX2NVOK9OMplcE1oOCXF4ArmV44Oi5dYu2l5a5ApHyqtsjHHiUG9RvZVmkTGaL6qawC
         yu5qQmzqcG06C1WpVJizgx/i/dwTaz5zsFjdjY3QLiQapP70jLQyCYES0tFVHOSOaRUD
         t+plT1U1piiBdhXQXjZB1rj3eXnVT1AAukAqx6wzPLRVz+bJ6pKl0BdyoZHywcBtFZ5Y
         9RlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxHtlce8SM7Zb321U330PK+htMjqdz3nogPLfgirh0PpimSn8IEMmfnDCDkWB1f3GMqiQVE+QPDvClmIEE@lists.infradead.org
X-Gm-Message-State: AOJu0Yw99X0O1hTOqHjXiMxZJa7jcjH5lpCx5at3H/tOXYa2pSdhPnlh
	MTXFYo+C11z78XTYhQY7EAhf3ONhipGYedWpSU+CEnWnKq6sUuiatsUHxn2a0v4=
X-Gm-Gg: ASbGncuSJY5mDHn/HyRkktZGIXHK4Riq1Atv1Y7qGBRqd0gj98nw1QI07J+rXv2ZQRa
	0XhfZ+MGeWmk5ze+gpx4vHNViWnUoE5xFX+69pz/mHp6RbPOUKrqTUZ9yU2/eKXcVTPt3U4PK50
	xqoTCDSjuF5VOQknvgSU6heAAyqX8+8oqM803auRNCcgEc53hzD4ZvReoqrxXIltU8qj9fsoOOE
	kObkNaek13RDvF+XobPTQgJp75bVZilUOj7w9+oXgb65QfGP9FEsw==
X-Google-Smtp-Source: AGHT+IGz/ZtmC4PnERHkalD6CvmzPb7Tp2woBDFzd1PcOy0yfXwbSkND0GchAL+Kghl7UNvinfrk8Q==
X-Received: by 2002:a05:6a00:180a:b0:725:1d37:ebff with SMTP id d2e1a72fcca58-7257fcd968dmr10230325b3a.22.1733335361978;
        Wed, 04 Dec 2024 10:02:41 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:cb58:bf7f:6102:4f57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7259470e2c9sm1282202b3a.190.2024.12.04.10.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 10:02:41 -0800 (PST)
Date: Wed, 4 Dec 2024 11:02:38 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	kernel test robot <lkp@intel.com>, linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v15 4/8] remoteproc: Rename load() operation to
 load_segments() in rproc_ops struct
Message-ID: <Z1CZPhu1T2opd906@p14s>
References: <20241128084219.2159197-1-arnaud.pouliquen@foss.st.com>
 <20241128084219.2159197-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241128084219.2159197-5-arnaud.pouliquen@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_100244_083050_31214DA4 
X-CRM114-Status: GOOD (  23.27  )
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

On Thu, Nov 28, 2024 at 09:42:11AM +0100, Arnaud Pouliquen wrote:
> With the introduction of the load_fw() operation in the rproc_ops
> structure, we need to clarify the difference in the use of the load()
> and load_fw() ops.
> 
> The legacy load() is dedicated to loading the ELF segments into memory.
> Rename this to a more explicit name: load_segments().

This is introducing more code churn than is worth it.  Please enhance the usage
comment for ->load() as part of the previous patch and drop this one.

I am done reviewing this set.

Thanks,
Mathieu

> 
> Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
> Update vs version V14:
> Fix: Rename missing load() to load_segments() in drivers/remoteproc/pru_rproc.c.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202411281332.Ra70nJAW-lkp@intel.com/
> 
> ---
>  drivers/remoteproc/imx_dsp_rproc.c       | 2 +-
>  drivers/remoteproc/imx_rproc.c           | 2 +-
>  drivers/remoteproc/meson_mx_ao_arc.c     | 2 +-
>  drivers/remoteproc/mtk_scp.c             | 2 +-
>  drivers/remoteproc/pru_rproc.c           | 2 +-
>  drivers/remoteproc/qcom_q6v5_adsp.c      | 2 +-
>  drivers/remoteproc/qcom_q6v5_mss.c       | 2 +-
>  drivers/remoteproc/qcom_q6v5_pas.c       | 4 ++--
>  drivers/remoteproc/qcom_q6v5_wcss.c      | 4 ++--
>  drivers/remoteproc/qcom_wcnss.c          | 2 +-
>  drivers/remoteproc/rcar_rproc.c          | 2 +-
>  drivers/remoteproc/remoteproc_core.c     | 4 ++--
>  drivers/remoteproc/remoteproc_internal.h | 4 ++--
>  drivers/remoteproc/st_remoteproc.c       | 2 +-
>  drivers/remoteproc/st_slim_rproc.c       | 2 +-
>  drivers/remoteproc/stm32_rproc.c         | 2 +-
>  drivers/remoteproc/xlnx_r5_remoteproc.c  | 2 +-
>  include/linux/remoteproc.h               | 4 ++--
>  18 files changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> index 376187ad5754..a4a85fbce907 100644
> --- a/drivers/remoteproc/imx_dsp_rproc.c
> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> @@ -934,7 +934,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
>  	.start		= imx_dsp_rproc_start,
>  	.stop		= imx_dsp_rproc_stop,
>  	.kick		= imx_dsp_rproc_kick,
> -	.load		= imx_dsp_rproc_elf_load_segments,
> +	.load_segments	= imx_dsp_rproc_elf_load_segments,
>  	.parse_fw	= imx_dsp_rproc_parse_fw,
>  	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
>  	.sanity_check	= rproc_elf_sanity_check,
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 800015ff7ff9..f45b3207f7e9 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -681,7 +681,7 @@ static const struct rproc_ops imx_rproc_ops = {
>  	.stop		= imx_rproc_stop,
>  	.kick		= imx_rproc_kick,
>  	.da_to_va       = imx_rproc_da_to_va,
> -	.load		= rproc_elf_load_segments,
> +	.load_segments	= rproc_elf_load_segments,
>  	.parse_fw	= imx_rproc_parse_fw,
>  	.find_loaded_rsc_table = imx_rproc_elf_find_loaded_rsc_table,
>  	.get_loaded_rsc_table = imx_rproc_get_loaded_rsc_table,
> diff --git a/drivers/remoteproc/meson_mx_ao_arc.c b/drivers/remoteproc/meson_mx_ao_arc.c
> index f6744b538323..a1c8c0929ce3 100644
> --- a/drivers/remoteproc/meson_mx_ao_arc.c
> +++ b/drivers/remoteproc/meson_mx_ao_arc.c
> @@ -137,7 +137,7 @@ static struct rproc_ops meson_mx_ao_arc_rproc_ops = {
>  	.stop		= meson_mx_ao_arc_rproc_stop,
>  	.da_to_va	= meson_mx_ao_arc_rproc_da_to_va,
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
> -	.load		= rproc_elf_load_segments,
> +	.load_segments	= rproc_elf_load_segments,
>  	.sanity_check	= rproc_elf_sanity_check,
>  };
>  
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index e744c07507ee..4e9a8bf3bc6e 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -924,7 +924,7 @@ static int scp_stop(struct rproc *rproc)
>  static const struct rproc_ops scp_ops = {
>  	.start		= scp_start,
>  	.stop		= scp_stop,
> -	.load		= scp_load,
> +	.load_segments	= scp_load,
>  	.da_to_va	= scp_da_to_va,
>  	.parse_fw	= scp_parse_fw,
>  	.sanity_check	= rproc_elf_sanity_check,
> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> index 327f0c7ee3d6..0b2bf2574f74 100644
> --- a/drivers/remoteproc/pru_rproc.c
> +++ b/drivers/remoteproc/pru_rproc.c
> @@ -1015,7 +1015,7 @@ static int pru_rproc_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	}
>  	/* use a custom load function to deal with PRU-specific quirks */
> -	rproc->ops->load = pru_rproc_load_elf_segments;
> +	rproc->ops->load_segments = pru_rproc_load_elf_segments;
>  
>  	/* use a custom parse function to deal with PRU-specific resources */
>  	rproc->ops->parse_fw = pru_rproc_parse_fw;
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index 572dcb0f055b..aa9896930bcf 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -527,7 +527,7 @@ static const struct rproc_ops adsp_ops = {
>  	.stop = adsp_stop,
>  	.da_to_va = adsp_da_to_va,
>  	.parse_fw = adsp_parse_firmware,
> -	.load = adsp_load,
> +	.load_segments = adsp_load,
>  	.panic = adsp_panic,
>  };
>  
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 2a42215ce8e0..a8beac1deabe 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -1687,7 +1687,7 @@ static const struct rproc_ops q6v5_ops = {
>  	.start = q6v5_start,
>  	.stop = q6v5_stop,
>  	.parse_fw = qcom_q6v5_register_dump_segments,
> -	.load = q6v5_load,
> +	.load_segments = q6v5_load,
>  	.panic = q6v5_panic,
>  };
>  
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index ef82835e98a4..9b269ce390c1 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -436,7 +436,7 @@ static const struct rproc_ops adsp_ops = {
>  	.stop = adsp_stop,
>  	.da_to_va = adsp_da_to_va,
>  	.parse_fw = qcom_register_dump_segments,
> -	.load = adsp_load,
> +	.load_segments = adsp_load,
>  	.panic = adsp_panic,
>  };
>  
> @@ -446,7 +446,7 @@ static const struct rproc_ops adsp_minidump_ops = {
>  	.stop = adsp_stop,
>  	.da_to_va = adsp_da_to_va,
>  	.parse_fw = qcom_register_dump_segments,
> -	.load = adsp_load,
> +	.load_segments = adsp_load,
>  	.panic = adsp_panic,
>  	.coredump = adsp_minidump,
>  };
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
> index e913dabae992..44b5736dc8b9 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -771,7 +771,7 @@ static const struct rproc_ops q6v5_wcss_ipq8074_ops = {
>  	.start = q6v5_wcss_start,
>  	.stop = q6v5_wcss_stop,
>  	.da_to_va = q6v5_wcss_da_to_va,
> -	.load = q6v5_wcss_load,
> +	.load_segments = q6v5_wcss_load,
>  	.get_boot_addr = rproc_elf_get_boot_addr,
>  };
>  
> @@ -779,7 +779,7 @@ static const struct rproc_ops q6v5_wcss_qcs404_ops = {
>  	.start = q6v5_qcs404_wcss_start,
>  	.stop = q6v5_wcss_stop,
>  	.da_to_va = q6v5_wcss_da_to_va,
> -	.load = q6v5_wcss_load,
> +	.load_segments = q6v5_wcss_load,
>  	.get_boot_addr = rproc_elf_get_boot_addr,
>  	.parse_fw = qcom_register_dump_segments,
>  };
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index a7bb9da27029..42102bc4c458 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -335,7 +335,7 @@ static const struct rproc_ops wcnss_ops = {
>  	.stop = wcnss_stop,
>  	.da_to_va = wcnss_da_to_va,
>  	.parse_fw = qcom_register_dump_segments,
> -	.load = wcnss_load,
> +	.load_segments = wcnss_load,
>  };
>  
>  static irqreturn_t wcnss_wdog_interrupt(int irq, void *dev)
> diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
> index cc17e8421f65..e36778fec072 100644
> --- a/drivers/remoteproc/rcar_rproc.c
> +++ b/drivers/remoteproc/rcar_rproc.c
> @@ -142,7 +142,7 @@ static struct rproc_ops rcar_rproc_ops = {
>  	.prepare	= rcar_rproc_prepare,
>  	.start		= rcar_rproc_start,
>  	.stop		= rcar_rproc_stop,
> -	.load		= rproc_elf_load_segments,
> +	.load_segments	= rproc_elf_load_segments,
>  	.parse_fw	= rcar_rproc_parse_fw,
>  	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
>  	.sanity_check	= rproc_elf_sanity_check,
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 8df4b2c59bb6..e4ad024efcda 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2485,11 +2485,11 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
>  	if (!rproc->ops->coredump)
>  		rproc->ops->coredump = rproc_coredump;
>  
> -	if (rproc->ops->load || rproc->ops->load_fw)
> +	if (rproc->ops->load_segments || rproc->ops->load_fw)
>  		return 0;
>  
>  	/* Default to ELF loader if no load function is specified */
> -	rproc->ops->load = rproc_elf_load_segments;
> +	rproc->ops->load_segments = rproc_elf_load_segments;
>  	rproc->ops->parse_fw = rproc_elf_load_rsc_table;
>  	rproc->ops->find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table;
>  	rproc->ops->sanity_check = rproc_elf_sanity_check;
> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> index 2104ca449178..b898494600cf 100644
> --- a/drivers/remoteproc/remoteproc_internal.h
> +++ b/drivers/remoteproc/remoteproc_internal.h
> @@ -167,8 +167,8 @@ u64 rproc_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
>  static inline
>  int rproc_load_segments(struct rproc *rproc, const struct firmware *fw)
>  {
> -	if (rproc->ops->load)
> -		return rproc->ops->load(rproc, fw);
> +	if (rproc->ops->load_segments)
> +		return rproc->ops->load_segments(rproc, fw);
>  
>  	return -EINVAL;
>  }
> diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
> index 1340be9d0110..8d6b75e91531 100644
> --- a/drivers/remoteproc/st_remoteproc.c
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -233,7 +233,7 @@ static const struct rproc_ops st_rproc_ops = {
>  	.start			= st_rproc_start,
>  	.stop			= st_rproc_stop,
>  	.parse_fw		= st_rproc_parse_fw,
> -	.load			= rproc_elf_load_segments,
> +	.load_segments		= rproc_elf_load_segments,
>  	.find_loaded_rsc_table	= rproc_elf_find_loaded_rsc_table,
>  	.sanity_check		= rproc_elf_sanity_check,
>  	.get_boot_addr		= rproc_elf_get_boot_addr,
> diff --git a/drivers/remoteproc/st_slim_rproc.c b/drivers/remoteproc/st_slim_rproc.c
> index 5412beb0a692..0f91d8f1e7c7 100644
> --- a/drivers/remoteproc/st_slim_rproc.c
> +++ b/drivers/remoteproc/st_slim_rproc.c
> @@ -201,7 +201,7 @@ static const struct rproc_ops slim_rproc_ops = {
>  	.stop		= slim_rproc_stop,
>  	.da_to_va       = slim_rproc_da_to_va,
>  	.get_boot_addr	= rproc_elf_get_boot_addr,
> -	.load		= rproc_elf_load_segments,
> +	.load_segments	= rproc_elf_load_segments,
>  	.sanity_check	= rproc_elf_sanity_check,
>  };
>  
> diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
> index 8c7f7950b80e..7e8ffd9fcc57 100644
> --- a/drivers/remoteproc/stm32_rproc.c
> +++ b/drivers/remoteproc/stm32_rproc.c
> @@ -667,7 +667,7 @@ static const struct rproc_ops st_rproc_ops = {
>  	.attach		= stm32_rproc_attach,
>  	.detach		= stm32_rproc_detach,
>  	.kick		= stm32_rproc_kick,
> -	.load		= rproc_elf_load_segments,
> +	.load_segments	= rproc_elf_load_segments,
>  	.parse_fw	= stm32_rproc_parse_fw,
>  	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
>  	.get_loaded_rsc_table = stm32_rproc_get_loaded_rsc_table,
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 5aeedeaf3c41..59cfba0a02e7 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -864,7 +864,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
>  	.unprepare	= zynqmp_r5_rproc_unprepare,
>  	.start		= zynqmp_r5_rproc_start,
>  	.stop		= zynqmp_r5_rproc_stop,
> -	.load		= rproc_elf_load_segments,
> +	.load_segments	= rproc_elf_load_segments,
>  	.parse_fw	= zynqmp_r5_parse_fw,
>  	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
>  	.sanity_check	= rproc_elf_sanity_check,
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index ba6fd560f7ba..55c20424a99f 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -374,7 +374,7 @@ enum rsc_handling_status {
>   * @find_loaded_rsc_table: find the loaded resource table from firmware image
>   * @get_loaded_rsc_table: get resource table installed in memory
>   *			  by external entity
> - * @load:		load firmware to memory, where the remote processor
> + * @load_segments:	load firmware ELF segment to memory, where the remote processor
>   *			expects to find it
>   * @sanity_check:	sanity check the fw image
>   * @get_boot_addr:	get boot address to entry point specified in firmware
> @@ -402,7 +402,7 @@ struct rproc_ops {
>  				struct rproc *rproc, const struct firmware *fw);
>  	struct resource_table *(*get_loaded_rsc_table)(
>  				struct rproc *rproc, size_t *size);
> -	int (*load)(struct rproc *rproc, const struct firmware *fw);
> +	int (*load_segments)(struct rproc *rproc, const struct firmware *fw);
>  	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
>  	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
>  	unsigned long (*panic)(struct rproc *rproc);
> -- 
> 2.25.1
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
