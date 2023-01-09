Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031A6C5479D
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Jan 2023 14:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8lJfAZj17+eOQXFsXrwqz5B9wfJeYYJ/SEZIfgbiAs=; b=pxfjZ5qJWwPQRH
	uxoNFqoTXPZz2y206vn6UH03uzXXa+qrMXU+hSlhtpmi3mVRO+AORdQSlDsR50Gisd3qfmlXpP1UX
	ikahUZuLL5bYr3WHdJkpRX/V9YoTX4Zq4bGYp3AjGQxT/bHuVCUblbofGGlvbSvhan/wEvu9V6+nG
	YeAC6964mVeeCSNYh9febZSF5eqPAyW1Uu2VqI/Wv8fS45LF61L4QRCmB1Pnc4B6IlhIfK3mN1/Vk
	a4B2KEV0fMsoiVOitIRg+/S6p37k4LTktunX51PpSlAq/ZS0pLdkMZRpCyihZswjUUh1H27lyHy6h
	whXXm3rn+B+lU9pRR4nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEsiP-001mxk-8U; Mon, 09 Jan 2023 14:01:29 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEsUG-001hk6-4w
	for linux-amlogic@lists.infradead.org; Mon, 09 Jan 2023 13:46:56 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20230109134647euoutp0143f90339da1b738d28c65401c312c922~4qAZxPJ501653416534euoutp01X
	for <linux-amlogic@lists.infradead.org>; Mon,  9 Jan 2023 13:46:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20230109134647euoutp0143f90339da1b738d28c65401c312c922~4qAZxPJ501653416534euoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1673272007;
	bh=0nwkwv/Rw0/gOSHiBDWJzOYYgdsO4mbdAhH0BIWIEsM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=ZpMQdlE+rZ4RiykOwHOQIZ28A/ktqDt5NlA3gEw7w/syJcgl8HL9tSOxWYJe4bH+C
	 wqm28M4hJWvTh4ECenuav1VCxkdmD4I+TGmYIQOPTzpryGvB88Ayk+JHwIYB25Onf+
	 40p8V0IdYvM2gf4428Zcu+0bxUVKKD5YFvqUeG3E=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20230109134646eucas1p1e9146c0edaa99ab48cf13e1e27e712c7~4qAZjFLms0769807698eucas1p1g;
	Mon,  9 Jan 2023 13:46:46 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id CB.1F.43884.6CA1CB36; Mon,  9
	Jan 2023 13:46:46 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20230109134646eucas1p17c7fbd379b0301b8429278ff289f2e83~4qAZANu6f2042520425eucas1p1p;
	Mon,  9 Jan 2023 13:46:46 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20230109134646eusmtrp260122d9ff5535c5e6238658f3e998993~4qAY-ej8R0582105821eusmtrp2j;
	Mon,  9 Jan 2023 13:46:46 +0000 (GMT)
X-AuditID: cbfec7f5-25bff7000000ab6c-7d-63bc1ac6d7ee
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id A0.10.23420.6CA1CB36; Mon,  9
	Jan 2023 13:46:46 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20230109134645eusmtip20ab292f975ca377bab1cc28ed2389967~4qAYSybTE0962109621eusmtip2P;
	Mon,  9 Jan 2023 13:46:45 +0000 (GMT)
Message-ID: <6c865dd8-b6c3-4491-48ca-df3e3fa45a2d@samsung.com>
Date: Mon, 9 Jan 2023 14:46:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
	Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RESEND2,v4,2/2] drm/meson: dw-hdmi: Use
 devm_regulator_*get_enable*()
Content-Language: en-US
To: Matti Vaittinen <mazziesaccount@gmail.com>, Matti Vaittinen
	<matti.vaittinen@fi.rohmeurope.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	Jerome Brunet <jbrunet@baylibre.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <df0096b5aea2a18d1540cde379c5abf589ccd7c4.1669799805.git.mazziesaccount@gmail.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGKsWRmVeSWpSXmKPExsWy7djPc7rHpPYkG8w/bmQx9eETNosrX9+z
	Wbx5dITZ4mf7FiaLb1c6mCwWzOa22PT4GqvF5V1z2CyOLTrJYrH92yM2izlLT7BYvN95i9GB
	x+P9jVZ2j99HH7N77Jx1l93j6YTJ7B6bVnWyedy5tofN4373cSaPzUvqPT5vkgvgjOKySUnN
	ySxLLdK3S+DKuL7AuWC6WMXWyfvZGhj/CHYxcnJICJhIvJ2xl7mLkYtDSGAFo8SHdddYIZwv
	jBI3GnezQzifGSWaJh9jgWmZsec2I0RiOaPE5RetUP0fGSXOrnoAVsUrYCfx9P8RNhCbRUBF
	4vfJxewQcUGJkzOfANVwcIgKpEhs+lMGEhYWCJXY9vAdWDmzgLjErSfzmUBsEYFUibuzz0LF
	u5kl7l2QArHZBAwlut52sYGM4RSIl7jywwiiRF5i+9s5YOdICMzmlHh5/iMTxNEuElc/PICy
	hSVeHd/CDmHLSPzfCbILpKGdUWLB7/tQzgRGiYbntxghqqwl7pz7BbaNWUBTYv0ufRBTQsBR
	4sNifgiTT+LGW0GIG/gkJm2bzgwR5pXoaBOCmKEmMev4OritBy9cYp7AqDQLKUxmIXl+FpJv
	ZiGsXcDIsopRPLW0ODc9tdg4L7Vcrzgxt7g0L10vOT93EyMwqZ3+d/zrDsYVrz7qHWJk4mA8
	xCjBwawkwruSc0+yEG9KYmVValF+fFFpTmrxIUZpDhYlcd4ZW+cnCwmkJ5akZqemFqQWwWSZ
	ODilGpj838Y/nfzb/93VLuUTfp71i99P9y7+H1aZKim35FCCyWWZBXzM+lLFvFWZDF9/8HsY
	BktcV5dfcntXzOKpRzxEuv+/T9vFsSvp2PYQ45eT5/N/rjw/mX/7sUeTN09tvrPbkDmDyXyJ
	gL78/Tu/Shed37XnXWK3ROyWZTmaR/7fXFLhpf7ReIPyYf7lRwp9a9Ly57NszpnOeeY1i3fm
	rtZq1tjNWkaP3r3bIfdowv4Hcu84Ja9zNpT0/3qsUL277lHP3jkquvN8N3gtC28RPx2+cWeq
	gJ/o5ep3N/eJrLnqxW2c/t1kq52qK+OmmeZXb3yc51TI8/6VrtF9z9uOP173a6/7FnuBzaWx
	Vm3nR8FOJZbijERDLeai4kQAW8SEvNkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJIsWRmVeSWpSXmKPExsVy+t/xe7rHpPYkG9xcwGsx9eETNosrX9+z
	Wbx5dITZ4mf7FiaLb1c6mCwWzOa22PT4GqvF5V1z2CyOLTrJYrH92yM2izlLT7BYvN95i9GB
	x+P9jVZ2j99HH7N77Jx1l93j6YTJ7B6bVnWyedy5tofN4373cSaPzUvqPT5vkgvgjNKzKcov
	LUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DLuL7AuWC6WMXW
	yfvZGhj/CHYxcnJICJhIzNhzm7GLkYtDSGApo8SbZy/ZIRIyEienNbBC2MISf651sUEUvWeU
	+DZ9BViCV8BO4un/I2wgNouAisTvk4vZIeKCEidnPmEBsUUFUiSan58EqxcWCJXY9vAdWD2z
	gLjErSfzmUBsEYFUiY8L9zBDxLuZJa68yQWxhQTiJBZ3nAabwyZgKNH1FuQIDg5OgXiJKz+M
	IMrNJLq2djFC2PIS29/OYZ7AKDQLyRWzkGybhaRlFpKWBYwsqxhFUkuLc9Nziw31ihNzi0vz
	0vWS83M3MQLjeNuxn5t3MM579VHvECMTB+MhRgkOZiUR3pWce5KFeFMSK6tSi/Lji0pzUosP
	MZoCg2Iis5Rocj4wkeSVxBuaGZgamphZGphamhkrifN6FnQkCgmkJ5akZqemFqQWwfQxcXBK
	NTCxWMxkXZnRFaw2z2YL538jtcIfTRsOSnAu3+RrbJrxyrfwROt3o9w1O9OTX/FtbNNZmCiz
	/OOPWZ0LUuLWZ9UvZl2jl1ySPrOlkv9Lz68MkVCeY39zbLxU2RlPp3n52Pv4d/c53plxdqb3
	uX+XzdoNF66MY7DU7vh+bo6OtWl9NQv/SZZiQ42u1DPyatYnHn5YO2l9+i2PAy435jbczLzh
	Nymj4WTiC4dZ88+vuz/3/PJi25OqpycE/9vEULnyearL8RMmS3dsVDY68ePR7BcTkzj+ib7h
	strRKfhk960DFx3eCTu4GgekXTuSrGTwsGL5L7mVnk9SPjmdTV6R+HL606jUWs87D816Du+e
	dGyCEktxRqKhFnNRcSIApjGZ0mwDAAA=
X-CMS-MailID: 20230109134646eucas1p17c7fbd379b0301b8429278ff289f2e83
X-Msg-Generator: CA
X-RootMTR: 20230109134646eucas1p17c7fbd379b0301b8429278ff289f2e83
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230109134646eucas1p17c7fbd379b0301b8429278ff289f2e83
References: <df0096b5aea2a18d1540cde379c5abf589ccd7c4.1669799805.git.mazziesaccount@gmail.com>
	<CGME20230109134646eucas1p17c7fbd379b0301b8429278ff289f2e83@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_054652_615155_CF757582 
X-CRM114-Status: GOOD (  21.73  )
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

Hi Matti,

On 30.11.2022 10:23, Matti Vaittinen wrote:
> Simplify using the devm_regulator_get_enable_optional(). Also drop the
> now unused struct member 'hdmi_supply'.
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> v4 resend 2:
> Respinning unchanged code with the commit title changed as wa suggested
> by Robert Foss and commit message changed as was suggested by Martin.
>
> I am doing a clean-up for my local git and encountered this one.
> Respinning as it seems this one fell through the cracks.
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 23 +++--------------------
>   1 file changed, 3 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 5cd2b2ebbbd3..7642f740272b 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -140,7 +140,6 @@ struct meson_dw_hdmi {
>   	struct reset_control *hdmitx_apb;
>   	struct reset_control *hdmitx_ctrl;
>   	struct reset_control *hdmitx_phy;
> -	struct regulator *hdmi_supply;
>   	u32 irq_stat;
>   	struct dw_hdmi *hdmi;
>   	struct drm_bridge *bridge;
> @@ -665,11 +664,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>   
>   }
>   
> -static void meson_disable_regulator(void *data)
> -{
> -	regulator_disable(data);
> -}
> -
>   static void meson_disable_clk(void *data)
>   {
>   	clk_disable_unprepare(data);
> @@ -723,20 +717,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   	meson_dw_hdmi->data = match;
>   	dw_plat_data = &meson_dw_hdmi->dw_plat_data;
>   
> -	meson_dw_hdmi->hdmi_supply = devm_regulator_get_optional(dev, "hdmi");
> -	if (IS_ERR(meson_dw_hdmi->hdmi_supply)) {
> -		if (PTR_ERR(meson_dw_hdmi->hdmi_supply) == -EPROBE_DEFER)
> -			return -EPROBE_DEFER;
> -		meson_dw_hdmi->hdmi_supply = NULL;
> -	} else {
> -		ret = regulator_enable(meson_dw_hdmi->hdmi_supply);
> -		if (ret)
> -			return ret;
> -		ret = devm_add_action_or_reset(dev, meson_disable_regulator,
> -					       meson_dw_hdmi->hdmi_supply);
> -		if (ret)
> -			return ret;
> -	}
> +	ret = devm_regulator_get_enable_optional(dev, "hdmi");
> +	if (ret != -ENODEV)

The above line should be "if (ret < 0)", otherwise it breaks hdmi support.

I've noticed this once this change has been merged to linux-next and all 
my Amlogic Meson based boards failed to initialize HDMI. Is it possible 
to fix this in drm tree or do I need to send the incremental fixup?

> +		return ret;
>   
>   	meson_dw_hdmi->hdmitx_apb = devm_reset_control_get_exclusive(dev,
>   						"hdmitx_apb");

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
