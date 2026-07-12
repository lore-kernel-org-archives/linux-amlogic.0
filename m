Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E5AC43458
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Jul 2026 10:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vRzK4zN88thBOeqp/eeTP5UY6ZYAHjXFkSbMrT/n4a4=; b=ePd5mx5Kwcohe1
	JRct2n+RpvtZ/6McNb2BZcOY70sEVIr3iItPlak3fmo2kQm1U7i2tFGwYJlNpNCOdVkE9zdFZBCcQ
	lQTObSN1beClBIlDjtXGT3S0c70MS68WLQEwFhOt7SfpecEYrIv9iLDLjt2Y7V257zlZi0zefkF0G
	odlCVpRW6fMP+xCCLpNtOXLab4duxRcMoK+JkhjGmvckhJnb0oI0WgXs96Kx8Fuuo7njSmtXkWC7L
	+rZ1NzmizMO1oIV8QohbpoKltga6AN9UN2MBwdMgpq25WjeE6KstjFojMYounQWcOzERcF3LNdecQ
	ULbNjRJkN4a44rrLAo8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirqZ-00000007O28-3MRu;
	Sun, 12 Jul 2026 10:55:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirqX-00000007O1R-0XUg
	for linux-amlogic@lists.infradead.org;
	Sun, 12 Jul 2026 10:55:42 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CAcwfO2244706
	for <linux-amlogic@lists.infradead.org>; Sun, 12 Jul 2026 10:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=auFn13uC31yp9UcYtu9hmPfT
	LxwSp7w1fsylGewneOo=; b=O9m1b+1k6ty2rzLZmRjvVmojaRI22qGhHfUpbc0O
	4/CORof1ep0kJAlM0oxexNVXCrV4g9EPMHBwF3RfExvQIYpMNXjYPuQwzKuuHLZj
	HAyJ5D7ococJhk+O2LuP+kN7WB25xnNcO9TIDj0o1GNhN+pKzg87Ohkc7usdihTs
	usG1sd8uLn5HYRI+CoEV2XQPoyh9ulsphj9wfKeZPznBFJyeWoi3uV/kZWij0anA
	wGH05YGQHYRqjetok6c388B/iuMePlNlFeAojN0i0MzuwNWD9ZT325QLc4QeqohT
	/BDg32An9aMvdcVcNkwyR7VmPViPyLMBrPEd/uQA02pXAA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbekcjk29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sun, 12 Jul 2026 10:55:39 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bbecd250b7so406512e0c.3
        for <linux-amlogic@lists.infradead.org>; Sun, 12 Jul 2026 03:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783853738; x=1784458538; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=auFn13uC31yp9UcYtu9hmPfTLxwSp7w1fsylGewneOo=;
        b=cG2duUwc6iQkkWvkwu/rJh7DaYq7Jut41aKkqhKaTh63nw0lgJ8MsI0X9QS+inaCP9
         seT0xThau/DZZSW5b03zeQxXV7mPdl1xqJvx0Budzx3nhcsTwKgAJkJL3RyS0pFsSF/x
         BVzk1ULoPRcZCvi3ScqBNCQbyZAwu1eHU8I3ztNlQed2lVRLZ+aAwCQYgju1ocQmTAEJ
         RxnhEDxMStTc/bvFYarQ60COfTE0I/spZgpDjPY4vFnmUGp+Fc/C5WzJTNRUVqOUgY2w
         r4MbQQkqwk0gP7IK/ISVKeaI7SI4kpp31AFz+ifp8SaxnzzeYXNnZhg1VO+RmKULOj4T
         TG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783853738; x=1784458538;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auFn13uC31yp9UcYtu9hmPfTLxwSp7w1fsylGewneOo=;
        b=Vf2DGUwT0thF4j0dj5XlU51PRiSat6JGKKO9rEnwMrTgM8aVgeCmZMhqRH/QY6iyns
         AFjbgomsBas7gJs+IGKW6sO7QfQwFveHbR8ShP4NjLP/OLq4FF9WRfSyxJ69YhJtuyPT
         QoBw3xkFkr3xzb3K3fpiRt2phvV0Zuq/wwr1zsG9fq/qa1khrLNQi766ppA+KZVGc/lS
         HKZXspso2xJsaN7af6KmZwRkL0nfhCs7LL/lN+fMwezHhQ0FeCNBMgAbQF4DLbWQifmc
         sSUN/AbWBe2X2j2Zp4mxODHFVOLhU6Pjt7WqrJw2t9r0XaAqc1e2urD8DJpomUWZhJmK
         e4sg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+q6AKmKWSFMWk/3jQatfHUY9tJlfGuM9wwnKEypaYgEQ/5TATl96IPOenceTMLoN22nO4netbi4MaVU4b@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/LbKa7F9VUgSpXHT3fzB73rcK/hLBdpM8YuwNK52zlTlkC2Xa
	/fqZTsjPPfuXnDhzEjLpvzgIFVb1lYOeBu+IolTyh9fa8IENLbEHMzXbDcKNd59xlN6sGgdzQBo
	+GdWu/KOy0b/M1Szu7rAmuhbPsdl1evQ02zY8fuBpZY9kO+/Jvz3PV1MZiqCgSrnMA4X40cMh5g
	==
X-Gm-Gg: AfdE7ckT47+DuxaMwbd5Ta8/VzMIrljXovINmhn+iWrtDmBgOOMtoPEvWVGHSqb/qoL
	AOMRJ5aOgtEQz/zQT/EIAgAahcdmFTpkbEn+tt/vfv/3Xe/aQn0Kk+GlfkWYaQPh0gW64L86YTc
	fuLhFtcPjZed4L0/o9u7NTDHzXoNVrcsJO1UONX1W7Ihcxu2VHND96GecnRXfTAMUvQ/l0JPcPU
	o3IA3ltZhuu00Fh5URhWLbG2Lhw9VYba44gbxXDA4gN9FZzEMv3uk/AAxxBZWkvJfosbnFbhrpv
	X/S7ST5t/krbyldRhOGYEMwNxZj6w6bgzTcl3/+oylPR5wxrrmnVs/TvHJFVbtneF+WowdnjNtK
	qiPVDFjKF8SALN9UDhwThPchoWgpJ5xEpSJPf768WiDv7h96p6VM7e2yZRS+MKSiuRp8V/FunZU
	Rabt6FI3usNyHloX9BQ40VJfjO
X-Received: by 2002:a05:6122:65a4:b0:5bf:a181:d46d with SMTP id 71dfb90a1353d-5bfbf09b771mr2585521e0c.3.1783853738078;
        Sun, 12 Jul 2026 03:55:38 -0700 (PDT)
X-Received: by 2002:a05:6122:65a4:b0:5bf:a181:d46d with SMTP id 71dfb90a1353d-5bfbf09b771mr2585485e0c.3.1783853737547;
        Sun, 12 Jul 2026 03:55:37 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849180ddsm20446691fa.3.2026.07.12.03.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:55:34 -0700 (PDT)
Date: Sun, 12 Jul 2026 13:55:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 4/5] drm/msm/dp: report IRQ_HPD as an IRQ-only
 notification
Message-ID: <zmnftag6s6mxvnoqdzouhpdcbwscm6sfzrqkzgwrcptgbr53cx@jetw2gtov7qp>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-4-646a10256233@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-msttypec-v1-4-646a10256233@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDExNCBTYWx0ZWRfX2RRRV2eIIN0N
 j/e8hCyYi40/wP08d87iMijnZE71UKfyslXFcX3dopnq+LSYozLBBHMHvvGxU7h1+iyiI3s5Vci
 qOMhEL/pT+VCDHwG3IKNu8VMX3vU8M/VX+QaQM8yxaldIgmT/00/Jb5mxEt9v7Q4ER3+Ao19Ict
 s1RLowCP2q0w/yVJpptsMQShdrBvP3hEtQiE73pfXziQahKxrUvJrgtAFrgBmHkQINpsneoXNz4
 jWBH9XYy3qXijtDET+6krnnKxJZJ3B2UnMcZGLZnA6CAxqF51cNFkoCf8LYMSEI/ojK+7FCBCwi
 QMRaewI4tiqA65JLyYGBFUmQvC+i4iCeSN4+f+5mFQq3KxBGI+PgMKBkvc8JyNzL45o6PwdQVW6
 6a0f1pu6grvxwrjzpcUXJ+PBg3tnDJ7wQLOObVBQs/lxSCe1sUZzpL1GLZzYNr5J5yxs6Wt7BF8
 uOx+3bqJq6suMUfa4ng==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDExNCBTYWx0ZWRfXwmqubGtrSwNq
 WOUeeZy/CZg/rIZ2OmHhOLvoLZOEt0XFtX6petfKGi4X0KZBEkT4r4sVfDCQAyeJTPTvjTr6J50
 PVQ7OrbMn2Zt1I8zERF/yQvhajpJTzs=
X-Proofpoint-GUID: hJZK0uvw__gY-NY1Biz2sTmcVoT460VA
X-Authority-Analysis: v=2.4 cv=XNsAjwhE c=1 sm=1 tr=0 ts=6a5372ac cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=byx_Kl4d9wP9hOeXrbAA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: hJZK0uvw__gY-NY1Biz2sTmcVoT460VA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_035541_167932_AF8D73A1 
X-CRM114-Status: GOOD (  26.78  )
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

On Mon, Jun 29, 2026 at 10:48:06PM +0800, Yongxing Mou wrote:
> MST reuses the SST connector bridge to propagate HPD IRQ events through
> the bridge chain.
> 
> For IRQ_HPD notifications there is no connector state transition to
> report. Use connector_status_unknown together with
> DRM_CONNECTOR_DP_IRQ_HPD so that the bridge connector framework treats
> them as IRQ-only notifications and forwards them without modifying
> connector state.
> 
> The DP driver handles IRQ_HPD events based on
> DRM_CONNECTOR_DP_IRQ_HPD rather than connector status transitions.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c   | 22 +++++++++-------------
>  drivers/soc/qcom/pmic_glink_altmode.c | 14 +++++++++-----

And which tree (and why) would be able to merge this patch?

>  2 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index bc93b566fbca..4ee391cc7165 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1119,14 +1119,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
>  		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
>  				      connector_status_connected);
>  
> -	/* Send HPD as connected and distinguish it in the notifier */
> -	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
> -		if (dp->msm_dp_display.mst_active)
> -			msm_dp_irq_hpd_handle(dp);
> -		else
> -			drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
> -					      connector_status_connected);
> -	}
> +	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
> +		drm_bridge_hpd_notify_extra(dp->msm_dp_display.bridge,
> +					    connector_status_unknown,

It's _not_ unknown.

> +					    DRM_CONNECTOR_DP_IRQ_HPD);

This should be fixed in the MST patchset. You should not be doing any
actual handling in the ISR routing.

>  
>  	ret = IRQ_HANDLED;
>  
> @@ -1781,11 +1777,11 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>  	drm_dbg_dp(dp->drm_dev, "type=%d link hpd_link_status=0x%x, status=%d\n",
>  		   msm_dp_display->connector_type, hpd_link_status, status);
>  
> -	if (status == connector_status_connected) {
> -		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
> -		    extra_status == DRM_CONNECTOR_DP_IRQ_HPD) {
> -			msm_dp_irq_hpd_handle(dp);
> -		} else if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
> +	if (extra_status == DRM_CONNECTOR_DP_IRQ_HPD ||
> +	    hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
> +		msm_dp_irq_hpd_handle(dp);

ANd here you missed the case when IRQ_HPD is being reported together
with the first HPD event.

> +	} else if (status == connector_status_connected) {
> +		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
>  			msm_dp_hpd_unplug_handle(dp);
>  			msm_dp_hpd_plug_handle(dp);
>  		} else {
> diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
> index 946eb20b8f83..28ab8cbb5ef9 100644
> --- a/drivers/soc/qcom/pmic_glink_altmode.c
> +++ b/drivers/soc/qcom/pmic_glink_altmode.c
> @@ -373,11 +373,15 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
>  		else
>  			conn_status = connector_status_disconnected;
>  
> -		drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
> -						conn_status,
> -						alt_port->hpd_irq ?
> -						DRM_CONNECTOR_DP_IRQ_HPD :
> -						DRM_CONNECTOR_NO_EXTRA_STATUS);
> +		if (alt_port->hpd_irq) {
> +			drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
> +							connector_status_unknown,

And this is completely wrong. The AltMode driver (btw, you also missed
the normal altmode driver for DP) doesn't know if it should handle the
events in some way. It should report the HPD and IRQ_HPD as is.

> +							DRM_CONNECTOR_DP_IRQ_HPD);
> +		} else {
> +			drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
> +							conn_status,
> +							DRM_CONNECTOR_NO_EXTRA_STATUS);
> +		}
>  	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
>  		if (alt_port->svid == USB_TYPEC_TBT_SID)
>  			pmic_glink_altmode_enable_tbt(altmode, alt_port);
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
