Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE0BC5B572
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Aug 2026 03:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qiiwcno9wKM++4sccZUCoUEs+glwQpDlSjGuv1Ql1v8=; b=HermBzrLb1zfTi
	dXR0Kk3AozSfe+vI9TzfPwSu6+y0islV3aW38xGsNnucyPuDtFfPkId7vTntTSReCSVST2GuuR8sI
	geh/R6MJW+riO6zRiPCjLukjvHauuG4z0SN9DMVzNffm0ppGjQtObhwl9VUFIvVR4/cvOrQH4NW4o
	HnrisYAxC/6G57zZtZAX8iFr6Ko5Fy4r172dUx4EqkJgGkASXe1FCv9JZH6lXhLrJP4e8WirKgi4o
	WkjWZmwEegiQ6HlrUYQ36URl7viwle2ag+4WlvXtUW0AC4vuXCo2uPPwux9PG+TjG6qkw2Fhh21HX
	5is0yXc/ykh/pDiKi8Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwA5O-000000077qS-38LN;
	Tue, 18 Aug 2026 03:01:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwA5L-000000077pa-3s3x
	for linux-amlogic@lists.infradead.org;
	Tue, 18 Aug 2026 03:01:57 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLklti3370366
	for <linux-amlogic@lists.infradead.org>; Tue, 18 Aug 2026 03:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZBz2J/YR064wcCDlSxnx2LWj
	NaH5A+0wFaq4Q0GwWVY=; b=CCt8SSDxuZAlXZCuVF7FdA4BBarebF0vi6DR6AUJ
	RohD5U3q065fxZ/SPY/Rj9yA0N/spjaxzfI6evKJnGwG9NZwKtYfIZlE+CAZ+VJm
	+jDyQlAqD6yFHtqJ7Y/wBOCet2HFnWUm/P6QKmnOVY0B5rQvXm5xag7Z1AEDvHLy
	0FTqbuMBdjcecjzVJ2w4QjuEt7kFy75e57f3gZXsF5/YLP4xJ8LViC0as/IfBbAB
	EKf/ZpbDUvXuMWFlBjjtUHGs+pPDy9yb2Eh+SYO7vc0nOv8KoOtrO9XMAmdGGJdx
	srrZQGKI+SrtZoXjSwkJsdqp0jzPrqsap/sri0fjwskkAg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xykc6bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 18 Aug 2026 03:01:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ef13b61bcso587929785a.1
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Aug 2026 20:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787022114; x=1787626914; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZBz2J/YR064wcCDlSxnx2LWjNaH5A+0wFaq4Q0GwWVY=;
        b=eNF4/Rl7NFRjWKxFZfYRkoDrPd4AI+wuwaeazRTo4iThPO4zzOc/9fME1iRxxuqVPG
         W1RXLkUIshjYlVvW7yIGvzUX43H/5DJFhCF+/CN3vEWRwLrXAiMTNT1DVSXG0hevylTi
         VjeLvDwGA+qt89PwwGv4Fsm4Vtav2qV23rGLMAED0UMRZyybp1p6Yu+jmKvww/2uazOz
         vn/8blfuXCPI3i6Cj+MWsgFPw6GKWKi1R0jqLeaOM310SNQH1TWUgHb3rZd5MIaxNh34
         c1iWJChLPuWRT19C//9P1u7mF/wu6GiDNXdyTgk5xIf6w5PKwrrbaKkZNSTRtvcGaJ28
         B+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787022114; x=1787626914;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZBz2J/YR064wcCDlSxnx2LWjNaH5A+0wFaq4Q0GwWVY=;
        b=AFdqzVLGngjv/k2aJIvQEWz4vqqDMlhU7j9xaEQOAU2s4uhGzsgPiCriPpzK91e4o1
         swbeKgh74zTQiX8RL8d/71kaaD622pPynfTaaFV1fjC9r35QyKVY2RDxgtbUTIfTcPrq
         4WIyP8ZFxt/L9hdxZAloI2iUTZpNvS3vZx4ZhHO2qgXwycM+Nn6rpH965+pHNYhNf9rh
         dyyGdw8kf1gDTMu3mfid0hxbnMSRLw6xxE4fviAykF73JQefhHj8GBoaVb0GB+isI1VR
         /Hn9yR4+zfJ8BPav1du0R0oVeiaTfXYLjBaPTvuLYLbEtTUOBWsIUOBqafRbuvGQgUz6
         oPCQ==
X-Forwarded-Encrypted: i=1; AHgh+RqWpnf6XifqSPs8L8ObVxG9z+juhfZOP4cZh1VmWWS7FMbM2DweAPNkvb5A+cYB4Q+wI4I7pAUka+GOubO7@lists.infradead.org
X-Gm-Message-State: AOJu0YyWuyENsF85LI9pL6V10ABSvuQX6Wib6FRJaywHN80T8ugKSGAc
	e7BxnAhNllhAcXCmtlmi6dGHLLiZkoJBl9ZzSxd2XoujcZFsFfHT6VPsd5qlQ0OGKrDvSisrPl/
	HJegMhZHD/xPB/KckjzumnSDdIAhmXswEazFxZUDhBdf4735M/l7Uf39sAQ08etLXT7ZmXJyrVg
	==
X-Gm-Gg: AR+sD10lsLh3G48tF/WKEAvetd/KdA4MLoFRCOe4MFlCsWiG0hsL1En9fkISlBsSQqm
	KKJO1lcHXUACYdL+dB+9D1C3a2UjqShGfFOpvbkmCFdrO5pRlHOGR0qYYBPifDCbF5s3LjDiAgx
	6sxfq+yg2b3jWnvunc+ZFzavWozBPI+NdrFNZVLtzGH2bM91ewfvyF0nVwSa9lM9nuzSuUbMMt2
	d4/sK1su7d5pUFF74ZMsipovkwUnP/6BnD/uZIgpGI5AQ7Jue5po1sfh571+k32wXUkc/ioe14E
	m+FdTwyXDYnDmjdVmZA0gYBDoi/wnHeVZ0uwuYQH/z4m33G58JuW3OHc0EZV4obBcUWGXsX3pq9
	eEn6QpITL77ha/jGihXawG/LyhV3teDdONoZZH0Qx+6Cyya2yG6FmrAWVBIx4HBHXyWmb2HWrTC
	yWkzGin0OOpcFl
X-Received: by 2002:a05:620a:28d1:b0:932:df7e:b31d with SMTP id af79cd13be357-936d227ee03mr2727444685a.12.1787022113820;
        Mon, 17 Aug 2026 20:01:53 -0700 (PDT)
X-Received: by 2002:a05:620a:28d1:b0:932:df7e:b31d with SMTP id af79cd13be357-936d227ee03mr2727440185a.12.1787022113404;
        Mon, 17 Aug 2026 20:01:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b1bcc39sm8342611fa.29.2026.08.17.20.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:01:51 -0700 (PDT)
Date: Tue, 18 Aug 2026 06:01:47 +0300
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
Subject: Re: [PATCH 1/5] drm/bridge: allow hpd_notify() to suppress connector
 hotplug events
Message-ID: <pyqpajtjcnslk6g5ysn3ce2csrb76fhd5bif4vdb6wezomlmsg@fsl55exyufx2>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-1-646a10256233@oss.qualcomm.com>
 <cgk2httvebzm2jnjnb437mutez66tfozzdk77mjwukfzngdioh@mu46u3pwlf2u>
 <af5f2e4f-42a2-49f3-9c6c-0f910c5f9208@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af5f2e4f-42a2-49f3-9c6c-0f910c5f9208@oss.qualcomm.com>
X-Proofpoint-GUID: f_KPwakJzqBGgvZzZ5LlXo_g9VfHQa4M
X-Proofpoint-ORIG-GUID: f_KPwakJzqBGgvZzZ5LlXo_g9VfHQa4M
X-Authority-Analysis: v=2.4 cv=dLaWXuZb c=1 sm=1 tr=0 ts=6a83cb22 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=WMPlNdQLU-vNwlj8jccA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAyMSBTYWx0ZWRfX8ZNQczrco49R
 rrUaq5A+UT8GtWnHaUECDfc5m34TKsK/U4A3Uh9jFRGAtzQS8O7TFsGNM4uXVO1trPo0vT6UoC9
 veisqV247pLrf7g8Ld+U+iiq9a2wVXpsSsCXzI/ChM8MgpFlrGQhl3KdJRpitLAAIkSxTOYmmqb
 AB86bwiDLj/Et6cSGzx6j5DzIFpNXx8ckQMe6pOctHBoEIONm1wP1gt2LwhRcCtrCLGsnyTxced
 tPiqgWziPQDUlwi05Q1k0FVQ3+/C6qOCAZsuWJiRfOMahSABZef63DvT5hifueJRld9vtaJFOVd
 QLOz9H+/ZMGp/x8EljhbdL00Gb2Q8bi3OPeas3bi1avpgiLrxKUxCQbWyATZiWGQFaIOlvS1F6y
 oYMn6pOh72Cf0eyDQEDmQ+bxAjFUuhslwkvvD8JW6SP4Ypv7HsgkRdtOgzrxe+jzVf48plhACOs
 3FqVH26SrTEmRphgD4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAyMSBTYWx0ZWRfX8OFNe0J1b1Xj
 hswjsXbRL8KtbcigIxmjRBy2kPWyckpjGsZasCQHeljPtp8QWAwqbYSaqGr/+OIjoxAPX72cDhh
 Z0Rxxy5aVKO4BoesTpdOYrcJCrmpZhw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_200156_081018_BC4327B5 
X-CRM114-Status: GOOD (  35.12  )
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

On Mon, Aug 17, 2026 at 04:01:41PM +0800, Yongxing Mou wrote:
> 
> 
> On 7/12/2026 6:21 PM, Dmitry Baryshkov wrote:
> > On Mon, Jun 29, 2026 at 10:48:03PM +0800, Yongxing Mou wrote:
> > > The bridge connector framework currently invokes all bridge
> > > hpd_notify() callbacks and unconditionally emits a connector hotplug
> > > event afterwards.
> > > 
> > > However, not every HPD notification requires a userspace hotplug event.
> > > 
> > > In particular, DP MST bridges may use hpd_notify() to propagate HPD and
> > > IRQ notifications through the bridge chain while the actual hotplug
> > > handling is performed by the DRM DP MST core. Connector creation,
> > > removal and userspace hotplug events are already managed by the MST
> > > topology framework.
> > > 
> > > Allow hpd_notify() implementations to suppress the bridge connector
> > > hotplug event by introducing a bool *send_hotplug parameter. Drivers
> > > can clear this flag when HPD processing should not result in a
> > > connector hotplug notification.
> > 
> > Why? Worst case the kernel receives another hotplug notification which
> > gets ignored by the driver.
> > 
> Hi, thanks for reviwing those patches.
> Let me try to explain the motivation.
> 
> Semantically, IRQ_HPD is just an IRQ notification, not a connection state
> transition, and shouldn't be turned into a userspace hotplug in the first
> place. However, drm_bridge_connector_handle_hpd() currently calls
> drm_kms_helper_connector_hotplug_event() unconditionally after processing
> the event, so every IRQ_HPD ends up reported as a hotplug.

What if the IRQ_HPD is delivered together with the first HPD event (for
example because of the TCPM processing those events)? See the mechanism
in the displayport.c AltMode driver.

> Second, MST IRQ_HPD is level-sticky -- as long as the ACK has not been
> cleared, the IRQ keeps firing repeatedly, and MST bring-up (link training
> / MST enable handshake) itself generates a burst of IRQ_HPDs. So this is
> not about "one extra hotplug", but about a burst of them within a short
> window.

Ok, if it is level-sticky, it should be handled as such.

> 
> Every one of those hotplugs is delivered to userspace via udev and
> prompts the compositor to re-probe the connector. In the window before
> mst_active is set, that re-probe walks back into msm_dp_bridge_detect()
> and performs aux/DPCD accesses, racing with the MST enable flow.

If there is a race, the path needs to have a lock, preventing concurrent
access. Otherwise, you are just shortening the window instead of solving
the problem.

> 
> The amplification also isn't limited to a single connector: on Hamoa
> there are 4 connectors (3x DP + eDP), and we observe that a hotplug on
> any one connector causes the compositor to re-query all 4. So this burst

Please fix the compositor, it should not need to query all 4 connectors
if the HPD event came from the single one.

> of spurious IRQ_HPDs during MST enable ends up amplified across the
> whole card.

How do i915, amdgpu and nouveau respond to IRQ_HPD? When do they send
the HPD event to the userspace?

> > > A NULL pointer indicates that hotplug suppression is not supported by
> > > the caller, such as the connector detect polling path.
> > 
> > And nothing in this patch makes any use of it. I'd say, it's
> > questionable addition. Let me check other patches...
> > 
> You are right, I will reorganize the patches in next patchset.
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
> > >   drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++------
> > >   drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
> > >   drivers/gpu/drm/msm/dp/dp_display.c            |  3 ++-
> > >   drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
> > >   drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
> > >   include/drm/drm_bridge.h                       |  3 ++-
> > >   7 files changed, 21 insertions(+), 12 deletions(-)
> > 
> 

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
