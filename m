Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423FEC5DF67
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Aug 2026 03:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uy0mD7y39nVbV2AHtxJx1umK5m+G/bdGj6fsjaoF2w4=; b=qckV2kjnDoNlrW
	eH9gld/GuRLBRGvQyrT3YEiMzEHL3biW6TvlRwwjZp+P4w+sNuZvXyX+loo5rSPcSV1exZexUSCKx
	mZHqjFUYsnv7n4SpOLlGkAsHUlzVvPD2DaEWprr0SpSAK7/tW3SNSyOm4s537ZoYikx9Ta47H/APR
	eaPzAEKkQbCNgWOopaayZkNJjhyYnvTRyLPeJvFN9g3LHmCfVLnnYfyuS3nUHFH9YlAle8Zlxbf5H
	eZeQ+cJ24Y8MtdrtECeRrPl3CjjL/zZ0uJp9g06SCSVoX0U2IoAOTRDbvuo0+jeCHGGV2XpRYioMN
	bO5ue5pEWQMgdmut3neg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwAP3-00000007AwN-0cXa;
	Tue, 18 Aug 2026 03:22:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwAP0-00000007Aug-1lhN
	for linux-amlogic@lists.infradead.org;
	Tue, 18 Aug 2026 03:22:16 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLkVhk3464524
	for <linux-amlogic@lists.infradead.org>; Tue, 18 Aug 2026 03:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j73bG+tmYVwAb5KvFoWsfW2d
	3OEy+/PhR/daxy+LBa0=; b=gEIfS9N+MIBWmQuKtz1VxzQ2+YyWmcmHg3HmqF41
	bQj6qxawqRFoTLNd9Pd9yeyek2qdJZyW0QKTsk8CD8jS3Bi1EUqAXB5OP5yYPdyl
	OsowqZlj1kWOPVi26fWMmLqTDUUUu7FWu/ZziKXReKe1LmOlmKUMBNWGTbUwxCEl
	WDtYDlvvUlRnmLvH29k6UVnN0sdSo6p3LHQQFY3RIzjeBncjsfzbroXqP0nSQ8dg
	L7bBnA5upxEuD5z0l6zXP61s+OHc98FNNC2BM2NbRFi9aHPnC/k2hd0wdGACnpPl
	Wk+EAN/mdc5M1jsjZzgLhFMSpKafUYOaOlwUakC/8SBIWg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4611actv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 18 Aug 2026 03:22:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e5fc4c7e9so542714885a.3
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Aug 2026 20:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787023333; x=1787628133; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j73bG+tmYVwAb5KvFoWsfW2d3OEy+/PhR/daxy+LBa0=;
        b=dMr6CngtxsrLuPtwe3/wRDSDMwVv0jC77vKWiMeYOF7uJHHFdY2Hfg1WNHhdaOgwu6
         GckQj1TJdR/IppAXCKv3Dxqfab4ZnpsQY86bqsACJPzZNlVxUUQ7sMQrPToaC1OKtmsU
         4qI+lHeFidGkHjioRonxXeZiq8pbrSnlvz0DPahhEcSoLnUkOkyhvf5RnXeZq4CJnnek
         ud9ZFWheePNdqAvHtgYynBZYZnXMBz19uYa5TpwWQhYU39BihTAP3fLLQZTGx3jP2sjh
         /K61K1CQX3t4e+uRZfGsxYT9vHCnZOXzTn6I0ldXBA0TRab92mQdSrxQF6/9FQEjUtWG
         2ouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787023333; x=1787628133;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j73bG+tmYVwAb5KvFoWsfW2d3OEy+/PhR/daxy+LBa0=;
        b=FDDCyOnHLTd0CjsMLKYIHdWFQcmqwFPVe2AkvgTwXw8qwY00jdj0Ab+2b0GbvX/0Vc
         2Z1wPiTxl4IUgN3avn1Q4ZzcYH8evvwNtDzy64EsfQnF1JsBiW6RsgtkTPW8f4rURe/Y
         dkhXXBTdzm637eQxE7eDT9r1i1UxcJpahcd7zVZOprWG2NcOWcPurPVLCthh/Hv4EmOz
         xhExZsJ77FL/8aIqE1gqfuMklUiqKwT23bM/Fn+aiqZCdJkV21kQrkr53hR7SRbnk4ef
         8yx6wJvfpIfMOF3pc65ETOaT2mXiIXbbLR8fSqG+zTGzxiMRRnkh4quIz21BKBHe0TvV
         mmVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr32Z8K5nNbjDnCGltzY0o9b9x4w7ScWmA51SNLdaEROiMV4m4uel1mADID+khsDWXWve67wco0rR33wAfO@lists.infradead.org
X-Gm-Message-State: AOJu0YwovLS3F6aH2UpJu+E4FXLsQaOC+e2aZXqOyJunjTaiaX8rem4C
	2xO+KW5Rj8zDP5wA0/5CZvfRuoflmzyZP7NXGpwCMjHIUG584qTuo1OQ0ryCtGTnNOJ5sE69iVA
	6G5mOcDoAbHKo2PfdzSNLcl2jz67lQHpM+lf2JDcIzvluMYUw9xYbjJq4FjyxbLWHArtr9Px8wA
	==
X-Gm-Gg: AR+sD12ou+yGI5PXkREw3O88UFxpnOvPiip53V91lpsh7sexL617fOdjRfxung4Z4MQ
	MqfDXkWsnmdrPQ3xF6W/YgjNxGCWKPaWAuU25ulieaeT46M5UK5eLg8krDPfRO5QSI9yGS93xAA
	7ISN+KP5o5Cl6LtbASXtsZ4GvGWDJzw+l4IyCrV7eao5qko5y70V5CfgknsTCUmQqy097c7Nlpl
	o5L7/t6kyK9WSnNYZ53nLEmb+WnTmAuTYDbcAd7dXr8Fx2S2xBNX5bDsaC/fIIkIteQPbLEIvjk
	dr+ha5DsOzi+KF0zU6HJkUegX8ubtD3rIXVZ95Ybyyu7JvG8SWNXc+3kmk34p+2sNRuy0UHBXhF
	T23Zw0G6T82+n9tZWeL9BXmN+CbZEOgnm5P/Jy++xLozHsorpv4vgX8L6rtvqPvdjmszFjCUyFu
	52/rHIEpMJ7eom
X-Received: by 2002:a05:620a:e1d:b0:936:bcf9:8539 with SMTP id af79cd13be357-936d232dab7mr1974697785a.35.1787023332578;
        Mon, 17 Aug 2026 20:22:12 -0700 (PDT)
X-Received: by 2002:a05:620a:e1d:b0:936:bcf9:8539 with SMTP id af79cd13be357-936d232dab7mr1974694985a.35.1787023332068;
        Mon, 17 Aug 2026 20:22:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cf95803sm836861e87.1.2026.08.17.20.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:22:10 -0700 (PDT)
Date: Tue, 18 Aug 2026 06:22:07 +0300
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
Subject: Re: [PATCH 3/5] drm/msm/dp: suppress bridge hotplug events during
 MST operation
Message-ID: <r2xv3lsvku2wlccf44dlesqgrjqbvjrvike3jfx7casembecrd@3mw3olil5toz>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-3-646a10256233@oss.qualcomm.com>
 <fozk5fz6bgat55vmlgyvovnmfzabjprna46cmcaoh4jyrwmbtu@k2qtjgip5vg3>
 <d4e96255-814e-4fb5-8d97-50126a61c20b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d4e96255-814e-4fb5-8d97-50126a61c20b@oss.qualcomm.com>
X-Proofpoint-GUID: YzzgAe2dtU9pqz2vAnKleV2GZcT6AGj5
X-Proofpoint-ORIG-GUID: YzzgAe2dtU9pqz2vAnKleV2GZcT6AGj5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAyMyBTYWx0ZWRfX244WllxvW8pt
 8G5X4OjnCMmHnHYTlEQ74AlZe1GeITVkAi/bFfp0pvwtWEq1Yfn3TT0PdSXH99v/bEunyac59Y9
 L1UBwZYwYhtsv/W+EajfTMd/00wT+VE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAyMyBTYWx0ZWRfX53fx7wiSXzbI
 mMtpzWAKeDedsxBWCDxW6LKUA2CnfcHR2Wm/X8FoBuBNdP/V7DsH6+J/Uqi97/tB0DMIWkdXiwB
 XfFN/P5X+1XVRd6nDaPoz5Z5jNyY91elApmNuAPF26vMGzmJyb15XOgmTzZ7G5dp2cabnNRngaO
 gH/gFKV8SoYWzuCSVF1qREjh96kkIyaVruxiNwfMiRRotftTCcvyUniNFanVdv9EuoM5MnFQ35o
 I2qb5RcyRk+QRog8cg1OhyK3voILCJifAOUEbQprbeMfRvFWdblw52PsyyKp157ckhlPMG092vo
 LFk3bgEpyUCjK8zbZ2hrePLUtGAKBufIkMGeq2FZTWrWkJvWbFbbTCB+pujjARkmMkvllD9Toqp
 JMdKx5ZvpvrC02iYR3dCraScxXN967SDFkE4pVGIyBHKwwO+xGo4B5rG1coXEMXwuj89SXFsWbw
 a6f6Gzs1323WIasW/sA==
X-Authority-Analysis: v=2.4 cv=UslT8ewB c=1 sm=1 tr=0 ts=6a83cfe5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=pvfFc-ymSHibiSm0GcIA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_202214_581504_8915115C 
X-CRM114-Status: GOOD (  34.91  )
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

On Mon, Aug 17, 2026 at 04:01:36PM +0800, Yongxing Mou wrote:
> 
> 
> On 7/12/2026 6:44 PM, Dmitry Baryshkov wrote:
> > On Mon, Jun 29, 2026 at 10:48:05PM +0800, Yongxing Mou wrote:
> > > The DP MST framework already generates the required hotplug events for
> > > MST topology changes.
> > > 
> > > Suppress connector hotplug event generation from the bridge connector
> > > path while MST is active, and continue propagating HPD notifications to
> > > the DP driver.
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/display/drm_bridge_connector.c | 6 ++++--
> > >   drivers/gpu/drm/msm/dp/dp_display.c            | 9 ++++++++-
> > 
> > No, it can't go as this. The drm_bridge_connector part should have been
> > a part of the first patch.
> > 
> Got it.
> > >   2 files changed, 12 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> > > index 7334d6677604..82ed0dc450ab 100644
> > > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > > @@ -162,6 +162,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
> > >   {
> > >   	struct drm_connector *connector = &drm_bridge_connector->base;
> > >   	struct drm_device *dev = connector->dev;
> > > +	bool send_hotplug = true;
> > >   	/*
> > >   	 * IRQ-only notification: extra_status carries the event but
> > > @@ -179,9 +180,10 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
> > >   	connector->status = status;
> > >   	mutex_unlock(&dev->mode_config.mutex);
> > > -	drm_bridge_connector_hpd_notify(connector, status, extra_status, NULL);
> > > +	drm_bridge_connector_hpd_notify(connector, status, extra_status, &send_hotplug);
> > > -	drm_kms_helper_connector_hotplug_event(connector);
> > > +	if (send_hotplug)
> > > +		drm_kms_helper_connector_hotplug_event(connector);
> > 
> > But now I can also see that the idea seems to be incorrect. You are
> > preventing the kernel from sending the events, but it doesn't really
> > matter. If connection status oscillates, then other components might
> > notice it even without the event being sent.
> > 
> Here our original intent behind suppressing the hotplug was
> that, under MST, hotplugs should be sent independently by the MST
> framework, rather than being emitted along the IRQ handling path.
> 
> Following the extra_status approach you introduced, would it make sense
> to let the bridge_connector layer distinguish between long pulses (HPD)
> and short pulses (IRQ_HPD) -- a short pulse would not update
> connector->status and would not emit a hotplug, only forwarding the
> event to the bridge driver. Does this direction sound reasonable to
> you?

IRQ_HPD is not limited to the MST usecase.

> > 
> > >   }
> > >   static void drm_bridge_connector_hpd_cb(void *cb_data,
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 6835c68fe510..bc93b566fbca 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -1790,10 +1790,17 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
> > >   			msm_dp_hpd_plug_handle(dp);
> > >   		} else {
> > >   			msm_dp_hpd_plug_handle(dp);
> > > +			/* mst_active is set in plug_handle; suppress SST hotplug */
> > > +			if (send_hotplug && msm_dp_display->mst_active)
> > > +				*send_hotplug = false;
> > >   		}
> > >   	} else {
> > > -		if (hpd_link_status == ISR_DISCONNECTED)
> > > +		if (!msm_dp_display->mst_active) {
> > >   			msm_dp_hpd_unplug_handle(dp);
> > > +		} else if (send_hotplug) {
> > > +			msm_dp_hpd_unplug_handle(dp);
> > > +			*send_hotplug = false;
> > 
> > Why? Disconnected events definitely should be reported further.
> > 
> In MST case, MST DRM framework will send the discconnected hotplug by
> msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, false);.

msm_dp_mst_display_set_mgr_state() is not a part of MST DRM framework.
But, while we are at it. The MST framwork needs to be updated to send
connector-specific HPD events.

> > > +		}
> > >   	}
> > >   	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
> > > 
> > > -- 
> > > 2.43.0
> > > 
> > 
> 

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
