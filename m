Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3505C7EE23
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 May 2023 20:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gyjmWg/ljlomo08qXkCa2TN8/EY6dXkR9hbjQGAE/UM=; b=JJzpcP/v+IIpIQ
	duPmxrBLSr/nQDe+2tiDQpnLIZPAQH1zEX0oZs6gjPsbEXVDCgY3lhlwqZOxZ+Zg1Bv5vfxZoCzbq
	ELJJfe2Z2O5nAENqNb8bdMtrxqbGmJJjyLAxJsYriYXtJSIMstdigpYN56VXYpcJ9LoqXCpk+YA2F
	TuVfddP3JvFwth3Sx25Cj0gpdef2T/L160nXqKEDRucqT6jk8/BH1v+u8qdZKJVP80YnnfPcuds4S
	CvV8W5Jtu2JM2Et12Hj0dfUIYk8Whkz5H85QRRzmSAHJqbWPdPk97/gLqOYm8tyO33rVGVQ+N/d6S
	/dyHy1HrQsskxNOK8e/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwTeJ-004Ak5-16;
	Tue, 09 May 2023 20:09:27 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwTeE-004Ai9-15
	for linux-amlogic@lists.infradead.org;
	Tue, 09 May 2023 20:09:25 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-643aad3bc41so5237721b3a.0
        for <linux-amlogic@lists.infradead.org>; Tue, 09 May 2023 13:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683662961; x=1686254961;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k+FKrsLIVkKYcsIeLT6acEHQnxxZ6Q1AY/ul3RhcaDc=;
        b=t7HcuJJ8yNGZSd5jU/xlsEmIR0LbZB3y+UKrWSXF1bjCnP1H/mulK2qxWbB9om6c5e
         EPoNhS+2F2SY6TDpNh93OfYIaBuWtDyA0WUhhijzdrOdZ209vJFBMBDEstCsarasou+9
         +aaguV9fWmvqneuHb9CoJTE/qx66MsyzXT+Vxlf3Z99RhkANcfNe43TH2ZxXjLdx2+BS
         HuT1Mt+LUKLIi9eC3VKE3enmhVi2+4/fEeTRQlISUfpnrQX7AiRV2EtLIcQYI0O8DYbA
         SgRhafl44CnHhh1/jjt5W5eRfmOo6Y3wvHoZfrVQ9hLa4M2QjasbOPOES3SF4ouZL3OB
         lEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683662961; x=1686254961;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k+FKrsLIVkKYcsIeLT6acEHQnxxZ6Q1AY/ul3RhcaDc=;
        b=fQ7ZT8TmQL8/ZT4uC6WPSXjRZwf/DLjCVySbA6EauL6WRVcSj5rbqv1kZcSKnFe+/w
         d3Rd/ME+F9crCWBRJeBIdFlEdsKpnHmP/tBXVY8j+7vofn/QnBGXA0kzfEz5jAXoLCF0
         bd9CpTF2VdsxEJ2CEgPBqtgs5i6TL39WnUKMuwZ+I9JBJw2XPgoiaCoXnGkOU6c8KGyl
         Rkb4CqW0f3lMfuqTKrNyCoY5CIJ27mg4m/DR/VbahWwMGZP5z2u9Ty2PT5xXtfVMnC9a
         zmYELLOC4NEz5mrWwNxqUaYoMLUHmLch/kIEUZ2+3INBAk+bhPHATleRHBBok0Aw1U9T
         OvLw==
X-Gm-Message-State: AC+VfDwRo1VpNh0Hn6FVMXdopFFBQ7EBFRjSyPfQG/ZsJBfO0I/YIHcL
	itZJ8ZnPb/twGN1VIoTvA2/wug==
X-Google-Smtp-Source: ACHHUZ7DY1IJhZ58XkyYQJW/n6N11Hq8FL8JnuzhTJRQRu0mHe/ZFZZkYof5BJbwpbwYX39JmI5wDQ==
X-Received: by 2002:a05:6a21:6317:b0:f3:3810:8a89 with SMTP id wu23-20020a056a21631700b000f338108a89mr16127445pzb.51.1683662960788;
        Tue, 09 May 2023 13:09:20 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:5e48:ff40:3eaf:3f9e])
        by smtp.gmail.com with ESMTPSA id a9-20020a63e409000000b0050376cedb3asm1756976pgi.24.2023.05.09.13.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 13:09:20 -0700 (PDT)
Date: Tue, 9 May 2023 14:09:17 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-remoteproc@vger.kernel.org, kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 00/18] remoteproc: Convert to platform remove callback
 returning void
Message-ID: <ZFqobZAfdlu+Rdtt@p14s>
References: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504194453.1150368-1-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_130922_374447_9BB9858A 
X-CRM114-Status: GOOD (  18.86  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, May 04, 2023 at 09:44:35PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
> =

> this patch series adapts most platform drivers below drivers/remoteproc
> to use the .remove_new() callback. Compared to the traditional .remove()
> callback .remove_new() returns no value. This is a good thing because
> the driver core doesn't (and cannot) cope for errors during remove. The
> only effect of a non-zero return value in .remove() is that the driver
> core emits a warning. The device is removed anyhow and an early return
> from .remove() usually yields a resource leak. One driver suffering from
> this problem (s3c2410) is fixed by the first patch.
> =

> By changing the remove callback to return void driver authors cannot
> reasonably (but wrongly) assume any more that there happens some kind of
> cleanup later.
> =

> There is one driver (i.e. ti_k3_dsp_remoteproc.c) that might return an
> error code in .remove(). I didn't look in detail into this driver, but
> if that error happens, we have exactly the bad situation described
> above. (Note that kproc->mem and the register mapping goes away.)
> =

> Best regards
> Uwe
> =

> Uwe Kleine-K=F6nig (18):
>   remoteproc: da8xx: Convert to platform remove callback returning void
>   remoteproc: imx_dsp: Convert to platform remove callback returning
>     void
>   remoteproc: imx: Convert to platform remove callback returning void
>   remoteproc: keystone: Convert to platform remove callback returning
>     void
>   remoteproc: meson_mx_ao_arc: Convert to platform remove callback
>     returning void
>   remoteproc: mtk_scp: Convert to platform remove callback returning
>     void
>   remoteproc: omap: Convert to platform remove callback returning void
>   remoteproc: pru: Convert to platform remove callback returning void
>   remoteproc: qcom_q6v5_adsp: Convert to platform remove callback
>     returning void
>   remoteproc: qcom_q6v5_mss: Convert to platform remove callback
>     returning void
>   remoteproc: qcom_q6v5_pas: Convert to platform remove callback
>     returning void
>   remoteproc: qcom_q6v5_wcss: Convert to platform remove callback
>     returning void
>   remoteproc: qcom_wcnss: Convert to platform remove callback returning
>     void
>   remoteproc: rcar: Convert to platform remove callback returning void
>   remoteproc: virtio: Convert to platform remove callback returning void
>   remoteproc: st: Convert to platform remove callback returning void
>   remoteproc: stm32: Convert to platform remove callback returning void
>   remoteproc: wkup_m3: Convert to platform remove callback returning
>     void
> =

>  drivers/remoteproc/da8xx_remoteproc.c    | 6 ++----
>  drivers/remoteproc/imx_dsp_rproc.c       | 6 ++----
>  drivers/remoteproc/imx_rproc.c           | 6 ++----
>  drivers/remoteproc/keystone_remoteproc.c | 6 ++----
>  drivers/remoteproc/meson_mx_ao_arc.c     | 6 ++----
>  drivers/remoteproc/mtk_scp.c             | 6 ++----
>  drivers/remoteproc/omap_remoteproc.c     | 6 ++----
>  drivers/remoteproc/pru_rproc.c           | 6 ++----
>  drivers/remoteproc/qcom_q6v5_adsp.c      | 6 ++----
>  drivers/remoteproc/qcom_q6v5_mss.c       | 6 ++----
>  drivers/remoteproc/qcom_q6v5_pas.c       | 6 ++----
>  drivers/remoteproc/qcom_q6v5_wcss.c      | 6 ++----
>  drivers/remoteproc/qcom_wcnss.c          | 6 ++----
>  drivers/remoteproc/rcar_rproc.c          | 6 ++----
>  drivers/remoteproc/remoteproc_virtio.c   | 6 ++----
>  drivers/remoteproc/st_remoteproc.c       | 6 ++----
>  drivers/remoteproc/stm32_rproc.c         | 6 ++----
>  drivers/remoteproc/wkup_m3_rproc.c       | 6 ++----
>  18 files changed, 36 insertions(+), 72 deletions(-)
>

I have applied this set.

Thanks,
Mathieu

> =

> base-commit: 1a5304fecee523060f26e2778d9d8e33c0562df3
> -- =

> 2.39.2
> =


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
