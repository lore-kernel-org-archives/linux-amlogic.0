Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F556F557FC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2026 09:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t1W3TrVPDytyWNQ8qEf81KlkWm3UmH7kEfHvagrxhnE=; b=PQNqk2Ycd2YmQX
	ET/NFpSLR/eS0v0tlcenjcK7xAPPWFuulJAWXtwGPTyFUkrXnrzDcv4lK1AHwaadGg77hqkcJv8n0
	d0y4LPJOwCky/+3F6VkeAShpSod8mthJMfjud4O4PlpacB1O6NKm5a5l/pP9LU6ncCEKeuF4xU2u6
	KULEOhjCYs9545WSCbrSeokMD8SS2IJZEnjn3VvrblCsgkVmMgVGpFjvucvVUJqRtGzy01rN7KLg9
	uXY8GCuzI1J+k/SWq81eZ4ev/1H/CRf24wLrkU68uQP/4VDz6xmzBByN4ngfp5JB2nPaCE0kq+id8
	g6pkBGODdab6DIHQISgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wElGg-00000006hDf-0qR6;
	Mon, 20 Apr 2026 09:50:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wElGd-00000006hD0-2mNU
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Apr 2026 09:50:12 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K97Wfp084674
	for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 09:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kWuPigQBRvg2mmG1YEkZ2x38
	8ocHV9caZV1E1+5l688=; b=W57WOtCeOcicX3eqOdiyb3EDavkLG5irwHoXW55M
	wmRlpJepFltE0GBwDB/eEZBvMRLgtu+23T/xt1DZn4WHzXcrKRfoVPgQut1CClJX
	VOYHOXibM3WI5SZiwdhnS4DizoNnKO4tGaZ4JSDZcp8Th2Dask97hw6Z7ZhAr1cP
	aMwPD+EXq8OVfnwV4UiLLWKNWccIeCI0Dub5H2t9t3AcazG6saJukNtykdqRYJkj
	D4s0lFeY98n8l5NcyXmUp7ALuyhcmg4wVEJt2Z//32LLZZj1qsrLH43JCZX/QjPe
	A2yRQiUlXqP2y/JQ0XNndxovMBtB55L3BZJYG3/1Jqd95A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh81g5pw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 09:50:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4076dc16so38092241cf.2
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 02:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776678609; x=1777283409; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kWuPigQBRvg2mmG1YEkZ2x388ocHV9caZV1E1+5l688=;
        b=PntSz8CnXBVXMbMyq9jRC6XWXR2bLx/kbNA365gkdwr2cIc8XOprNn/WsM1J56qWC3
         +hxi4EKxQ1MyUDtTW/naqKYUcdaZonwasc3F7SH/hMS/PkNqUMHdBN7GOdldaafsWoyl
         n4RIfq35SfqcY6lPBz1TtDbjC70fu12DkHIz7VR71hXGu8aqtjD1zV5LMMw2nm/bG73N
         4JbeYIoBwAUUO3jT6+UTMO2s+7o2UwN6lLgvPK7XuJ9raKku+E8AQyzcgs5bQ5fQ3wBp
         IOL8rTF/FLRl1hzUVwHgVtn+GpXXgEKTgZ/MYIwTpAcF1WOBMnc9GzgM7LvdSl0HJHjR
         jwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776678609; x=1777283409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWuPigQBRvg2mmG1YEkZ2x388ocHV9caZV1E1+5l688=;
        b=oalKeW+smPdWFda+r92Bv4KyAc95gGh7aZ206KsgGLqN+QM8VE6zsZ+4bPggXnKJ4v
         94puR0WyTQuHgpi+18ybSUxmT7NjQejTVOa48nT1lDbuOPcDwqlpYKnwRf33rMXB2HR5
         dnMhshw0/FOiAFYk6qTK34/QSHbKtSR3ZNctYQ42cPcwaIw0VPdG0P/+G6DoEES9U7Xi
         BCAwHPdwnavD3cQpBHM02XxaSYbjWJ1e0aZ18JB9IIT/3jcjdjaMLS19xlU18BI8jOdu
         BNODiKDqt37xTlrhEMJag2OiGmr/SA3OWFguaRS3D7enJ09WldvgQM0T+dw1g6PkjxXw
         dR6A==
X-Forwarded-Encrypted: i=1; AFNElJ9IbRhl3IjwHzlfu8M/0X5x53luPNC3O+rwwfitoCxHVDLDaSOp3z8ayw2k7g8503rr+RhvhOn4z60nDx+Z@lists.infradead.org
X-Gm-Message-State: AOJu0YwC+qjtLMTjtTNF8hc6gLiwhlGlFg3cSaunlmi6FbdzZvwtdaCX
	WgHw/yKcnDscNbWxwNmc5W18EeZcVC+O3INL/8Q8Mp9RLg7E/5o+h6w8vqjaxSYq8fpfl/7g9B/
	6jLROOew0mC0W0mFjr5bRXm9Ae3ILHqf4bmEQBQj6oUNrjxfENWjMG7S+r7UEg1kkikBVMwAZaM
	fdnW2NVg==
X-Gm-Gg: AeBDiev+tgh44g0sYfQ202klVtDDqw7c0yMQllabl5cfFByo58VOB0SniDBpM99/eip
	mawba5neHUGL2wTJwRKP6Vmgpaq+3URPeUpymqNNtwUyy5dIP1IcA2QLWYLHdrQ2A6l5IniZvUJ
	MKyB+ZqpyriY2PHIwQKzidomHlQbpT6SONeQ38zy5fk8AfAafSFQmLTXyusgYquqPngzI4US5Tr
	IAsyqscdBctJOrYAP4LpmjFxILJdb+AUNRLlD98yti9z5pahjO44ELur6tsl7/bxYmznN4MsvJr
	BzUs+X5AnWGKKbz8M0HX9muOcYBy/3KjIm4B5zm8RXPdmf8VWg6kh7/BvHYpAd/bsC1AFZl3RiQ
	qeGbVBiAYLVVhCb2EOCTQdv1568ynPiqRG5j3iDg6NBItNYw7WVXz8XrcGc59nJbdYjzsaeN9ie
	P8wxLVSbK+qgIfeaoruA/vxmsvO8zJx85zpNUUpqhm8keoFw==
X-Received: by 2002:ac8:7f15:0:b0:50e:5f37:a821 with SMTP id d75a77b69052e-50e5f37af22mr37013231cf.36.1776678608872;
        Mon, 20 Apr 2026 02:50:08 -0700 (PDT)
X-Received: by 2002:ac8:7f15:0:b0:50e:5f37:a821 with SMTP id d75a77b69052e-50e5f37af22mr37012641cf.36.1776678608356;
        Mon, 20 Apr 2026 02:50:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad138sm2859553e87.9.2026.04.20.02.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 02:50:07 -0700 (PDT)
Date: Mon, 20 Apr 2026 12:50:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
Message-ID: <3vrqk67oivkgo26xdc3r774rvj3jn3t6sfydhlytyrfiftubhg@cipain7xxcjz>
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
 <20260416-hpd-irq-events-v1-1-1ab1f1cfb2b2@oss.qualcomm.com>
 <51b7c44e-36c9-461f-983a-eaa86eeb8cfd@ideasonboard.com>
 <6z572fdjkvjqvedifwvotgdy4lcrifiqvkjpnutousjqc6764r@zepfzkqy2kbu>
 <a2e60e74-a1be-469d-8f4d-ecce1f30b517@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a2e60e74-a1be-469d-8f4d-ecce1f30b517@ideasonboard.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA5NCBTYWx0ZWRfXzkYD2K3kID5c
 A05p3WykE34fScxh2AZBDXPARd7fuDEwR6BKi8O82LiBW3mShPJ8MCzqtfGNIT+adaKNt/T6gb8
 HhGXq87rm1luqhhnZJZkj7vE59XzKQYhe7ImreJeH4ZC+K39UyJC7h83tjXBzj3QP9TlStJcidH
 ZoEb1z+xVKnFkzuWMOHGW5rafzvDiZs/KzdG9z4siYIvgTeklfhSb5scsnSvOHMosCh2/DCmd1y
 Qthq3Djyi7dtHnpED31E8QMzH9wgDlJYk0sA6qt1W/LUeau5OKqIgscmNBJ1uj3Ql5rPfbFsMxf
 qcUJGMj6Nbn2nsM2MbFxb9PPv1J/ur0n2uiavuPuzgXnjJj4e88ZQBcX2aI8vQhaHUuwBiZOKcj
 rBq0xeczhsnqjOhhAS3YPWe0LiXMCmOAzzzKSzz3vjdmaJIdGx7dFSfUEMGrF2zJikwno5CV3LW
 av4UcIzHoVyJHjcQDNQ==
X-Proofpoint-GUID: eaAp_P9BHDsjfsAL_u08yFvtdH1mUpSg
X-Proofpoint-ORIG-GUID: eaAp_P9BHDsjfsAL_u08yFvtdH1mUpSg
X-Authority-Analysis: v=2.4 cv=PsKjqQM3 c=1 sm=1 tr=0 ts=69e5f6d2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=VVbN_I7Xu8gywQYyaxkA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_025011_821869_FA0C78A9 
X-CRM114-Status: GOOD (  45.94  )
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

On Mon, Apr 20, 2026 at 07:50:46AM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 18/04/2026 01:32, Dmitry Baryshkov wrote:
> > On Thu, Apr 16, 2026 at 11:10:03AM +0300, Tomi Valkeinen wrote:
> > > Hi,
> > > 
> > > On 16/04/2026 02:22, Dmitry Baryshkov wrote:
> > > > The DisplayPort standard defines a special kind of events called IRQ.
> > > > These events are used to notify DP Source about the events on the Sink
> > > > side. It is extremely important for DP MST handling, where the MST
> > > > events are reported through this IRQ.
> > > > 
> > > > In case of the USB-C DP AltMode there is no actual HPD pulse, but the
> > > > events are ported through the bits in the AltMode VDOs.
> > > > 
> > > > Extend the drm_connector_oob_hotplug_event() interface and report IRQ
> > > > events to the DisplayPort Sink drivers.
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > ---
> > > >    drivers/gpu/drm/drm_connector.c          |  4 +++-
> > > >    drivers/usb/typec/altmodes/displayport.c | 12 ++++++++----
> > > >    include/drm/drm_connector.h              |  3 ++-
> > > >    3 files changed, 13 insertions(+), 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > > > index 47dc53c4a738..5fdacbd84bd7 100644
> > > > --- a/drivers/gpu/drm/drm_connector.c
> > > > +++ b/drivers/gpu/drm/drm_connector.c
> > > > @@ -3510,6 +3510,7 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> > > >     * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
> > > >     * @connector_fwnode: fwnode_handle to report the event on
> > > >     * @status: hot plug detect logical state
> > > > + * @irq_hpd: HPD pulse detected
> > > >     *
> > > >     * On some hardware a hotplug event notification may come from outside the display
> > > >     * driver / device. An example of this is some USB Type-C setups where the hardware
> > > > @@ -3520,7 +3521,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> > > >     * a drm_connector reference through calling drm_connector_find_by_fwnode().
> > > >     */
> > > >    void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> > > > -				     enum drm_connector_status status)
> > > > +				     enum drm_connector_status status,
> > > > +				     bool irq_hpd)
> > > I find the "IRQ HPD" naming always confusing, even if I'm somewhat familiar
> > > with DP, but if someone has mainly worked on HDMI, I'm sure it's even worse.
> > > 
> > > Can we define this a bit more precisely? Is 'irq_hpd' only for displayport?
> > > If so, perhaps 'dp_irq_hpd' or 'displayport_irq_hpd'. I might even call it
> > > 'dp_hpd_pulse', but maybe that's not good as the spec talks about HPD pulse
> > > for both short and long ones (although in the kernel doc you just write "HPD
> > > pulse")... The kernel doc could be expanded a bit to make it clear what this
> > > flag indicates.
> > 
> > I attempted to stay away from defining a DP-specific flag, keeping it
> > generic enough. HDMI is pretty close (IMO) to requiring separate flag in
> 
> If it's not specifically the DP IRQ HPD, then we need to define what it
> means. I tried to think what it would mean with HDMI, but I didn't come up
> with anything.

I might be mistaken, but I had someting like HEAC HPD / EDID status
changes in mind (or HDCP-triggered HPD status changes). But here I
admit, I hadn't checked if it is actually applicable or not.

Anyway, for e.g. DVI or VGA that means nothing. But, my point really is
to abstain from defining someting as DP-only in the top-level API.

> 
> > Linux. Likewise I'd rather not use "pulse". The DP AltMode defines a bit
> > in the VDO rather than a pulse.
> > 
> > Anyway, if irq_hpd doesn't sound precise enough, what about "bool
> > extra_irq"? This would convey that this is the extra hpd-related IRQ,
> > but it would also be obvious that it's not related to the HPD pin
> > itself.
> We'd still need to define what exactly it means. I think it might be better
> to just define it as the DP IRQ HPD, as then the meaning is clear.
> 
> Also, would an enum flags parameter be better than a bool parameter?

Maybe not enum, but u32 param. Then it can become:

@extra_status: additional type-specific information provided by the sink
without changing the HPD state

void drm_connector_oob_hotplug_event(..., u32 extra_status);

/* DP short HPD pulse or corresponding AltMode flag */
#define DRM_CONNECTOR_OOB_DP_IRQ_HPD BIT(0)
/* DP long HPD pulse, debounced XXX: do we need this? */
#define DRM_CONNECTOR_OOB_DP_REPLUG BIT(1)

For HDMI we might want to define:

/* HDMI 1.4b 8.5, HPD pulse */
#define DRM_CONNECTOR_OOB_HDMI_REPLUG BIT(0)

Or might not, 100ms is long enough for all debouncers.

For HDMI we potentially have another source of OOB events, CDC-messages
from CEC controller. I have not looked in the details of the HEAC 3.

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
