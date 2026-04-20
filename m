Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585E8F5581D
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Apr 2026 11:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1t21bgZf2veaY6ZXPt6keWTwxfjhWVkKDmENTsDbdM=; b=noRtmtKsm65VbZ
	+qPodvc5So9i7NZJFC5DCObIqQ4IZI58kRS0n8fL6xP00O44oxp8zabFUwXpzNVhg682fH4kKLrCf
	mhh9D84sEj+1IBuuXO/JTCrCRg+eBGaDEuREBXhsXWUIq9H0vC7i+Du9w71VeuNM7cL5OMi7rh5tQ
	oRP9m/U5hdR/gVrG6X0teMgIGS4angrjFUCfuXr4Iwxja8yN+FD6LwVwToranhLFjiUv/u/ablTYg
	Hic8wHPJIjOcicOs1NCb7XBSjRTOEWmfwtzhGPPSJrgLVhHOEbdrp2BMe4xvwl+muYUHZSQazT+sP
	IYMUhGhju+zCZlR7t4Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEn4f-00000006oRL-0Y5R;
	Mon, 20 Apr 2026 11:45:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEn4b-00000006oQg-47dP
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Apr 2026 11:45:55 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K91RHk2281666
	for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 11:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OSEOlty1w4G0PIvTT1dv0PCa
	ahtC4/jkfebraYruQdc=; b=f+Ng/SPgYV0/VApKl6YYyO9YGSHsU3z0Q2RBtC+P
	UiZtdEPyRFWDNAsoNaf2b8tsnDdpDuSWf3WCsSVIn+MgaHepaX4JPbXmDJXw1XSz
	XS3us1ReB/tHS0hAgv4Dffl3nCK954nXS81UtTBk+UpJ0TZq3OI/49HhGKfXUd2x
	f6t3ON+5D3vaxgEbTe1TpLcelu442HeuCsaiiBQsK0Nrz77SMXUzP4Lo5ptaIXhM
	ODldoxylvSvlTVmas16TrTI/rmmaR6nHaUXWDznUbPhs3W3vjWXl18Tm2YBALshy
	VumfoIKgMCrWt14FCsvZ0pHI0Zzf2Jgwbm4mCsVZCaPXSQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh598j95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 11:45:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d9d52ad9aso54545421cf.0
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Apr 2026 04:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776685552; x=1777290352; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OSEOlty1w4G0PIvTT1dv0PCaahtC4/jkfebraYruQdc=;
        b=eJbbBrzB5AAY3Wu7sg/Hj+OH1TeHxejyEt+oFOURi0XDy406STZ3BWcBFQGE7jMCNR
         QjU52Gb3o1/fALNkCEqTztdZmrwaAWA4JDrX0fssS8wE5+LtT8kkYgXbg70xhBjADlxw
         8YX1giZL4EVR2pG6WDXz9f0UnA+rbydYb2sEIkZ4KI3+6Jpoy7Kg8L12jP4viWhbeY8D
         sxkFm8Bg47JPPYp7eHKH1Mta2offNFtE9zvZE4MaS0EG1Re+JwiIh2BdvujJnaUhj3qN
         wbKXIysO4MofhFeOrDHqTyrIyNHL7F7sDFuc90S8+pkNm4o+sXlvBAJwDPFDCUNT/zn8
         FtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776685552; x=1777290352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OSEOlty1w4G0PIvTT1dv0PCaahtC4/jkfebraYruQdc=;
        b=GXi6U2eK5bMeOUsAYAl0L01oeqZc49Mq2Dr0+XdFfkwQQE6zxr0e4Xjwsyu61CKoCn
         x1xXdSXu5LAyAJ+5om9l1XAIT5Vp8wo9xwVhSifgDzx0+VE23Cu4zJ5A/Cnros5hRogx
         /L+3HbpcCuDgaTvhAgZNqobyMJSzx5Hkxfs43y6PNZ0TsROulhWKby/jCJxYOFezy340
         amp7lyddBLsTSTA8sc59sYMPS9hk6wP0FWOMvw8o1zOzhw8E7YSgYIu502xSqTa5V0FF
         DPLPDPnLiTQlALbQOsM9XVhI5osBD8tKGjViwruZb7NCBp1plsKusG5LxAsIZEAZrImQ
         bRwA==
X-Forwarded-Encrypted: i=1; AFNElJ9fxvUSfU/VIieFE3EV1s2mLom7yomamI7yXNECrrqf4dBgvkpSeC7KmxVqWpwyUXVW8Q8iJYmNrh+mbvAy@lists.infradead.org
X-Gm-Message-State: AOJu0YwaYrjExz73EneyKnKBaF5DXn0Kg5XcWpEJI5WzXDZZyCiV7BjI
	02v5/yz9RTUnXxhXg4fnvnQRLwd6d2CQFb4t4ECdFxgzJ1l2bT/btBXQiCjcOvA1gr+nYwPBltT
	5WxZ/BSBPffp/gw5/xJhEQ7cvVzuhIrewOYIctB2ZzMTtQInYl5ToSSVN2FjEmE0vQ2E/SbNOQg
	==
X-Gm-Gg: AeBDietY8bausjzwil8MCupoo2NEtgtTb5ZHUvKlNkP5BDZTfh02fo58Zs1k2AA4I7/
	7LzXm+jNzMgnGj67EQgD7xfSpcKrzP8tjDsuBVuEG+tJAfAxsdXnf3o6sWYM6stEAYe8wj7f9DB
	yy9bjzSBegubGUrukL6xb3yo9caLXnb99iahGU0M/oAGx86YujIQ7rRTDPrOv75+6CtpsruHuz4
	dVRmp92ZWeLunvOxGo+9TRs+/bUJv8rtSe3ROC0yVr5H81rGZ2eSz26bp0NpymxqXsEo6CNQvvS
	yoseJpCDfN91BkTGyMUpmxvQRwsYoNtSpMEBhSZcqF1F9dV3uOohfBDJ2W4bR1P8XbaMMB2c7BS
	BdnzY0mvG1+7UI8+pArpVqDTJ75iCnMsm/1TGBgJxJVeMeyvmWZDcOFvIi80jAawudyIX1Tmcrh
	kXCB5rMQxG2uRlcl0tAjlczoLxOoKGPc5rPyPW2e9S2LmQjg==
X-Received: by 2002:a05:622a:ce:b0:50b:3895:c22f with SMTP id d75a77b69052e-50e36b4ec02mr195510791cf.26.1776685551890;
        Mon, 20 Apr 2026 04:45:51 -0700 (PDT)
X-Received: by 2002:a05:622a:ce:b0:50b:3895:c22f with SMTP id d75a77b69052e-50e36b4ec02mr195510191cf.26.1776685551248;
        Mon, 20 Apr 2026 04:45:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7b22sm2874049e87.62.2026.04.20.04.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 04:45:50 -0700 (PDT)
Date: Mon, 20 Apr 2026 14:45:48 +0300
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
Message-ID: <v7h3a5pwx32dfcumc3diysylja6lhkhobyzemfthb6dsadcxnp@2kkidnsgov4e>
References: <20260416-hpd-irq-events-v1-0-1ab1f1cfb2b2@oss.qualcomm.com>
 <20260416-hpd-irq-events-v1-1-1ab1f1cfb2b2@oss.qualcomm.com>
 <51b7c44e-36c9-461f-983a-eaa86eeb8cfd@ideasonboard.com>
 <6z572fdjkvjqvedifwvotgdy4lcrifiqvkjpnutousjqc6764r@zepfzkqy2kbu>
 <a2e60e74-a1be-469d-8f4d-ecce1f30b517@ideasonboard.com>
 <3vrqk67oivkgo26xdc3r774rvj3jn3t6sfydhlytyrfiftubhg@cipain7xxcjz>
 <f74ecd0a-3ff3-45b4-935e-44b89cd0c92d@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f74ecd0a-3ff3-45b4-935e-44b89cd0c92d@ideasonboard.com>
X-Proofpoint-ORIG-GUID: _3g_TXy3rLLB8bKnpfDWasI_gGAEgz3l
X-Proofpoint-GUID: _3g_TXy3rLLB8bKnpfDWasI_gGAEgz3l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDExNSBTYWx0ZWRfX3fLfuMbkxGYH
 vU5YeJHDqbRbWrSh4kBoucMQI3X5reKBRgXJCbyV69KrIbxs7tZQ52jx79KoLh/mVZb4QtbvjqU
 Q49I4Pl6FQeE/SV0uRKIHQzowDrXb7vM17iN5V24IxV3vrMHMYJVF/UWBmBygifzwSqKlfZz5/Y
 SZ+7YsQpytv7h8CcpS59TnW0RGORQ8y6ZmNdcsJh4W6T3SZOPQfosOUtGZ749N8CCTkj+D4NuiD
 WzDoBwijoo+xaz9xjjBc7t3qs8dwKZbrO5wBbGHqPbQqAkhLA948KlQ1eqbO0DcLDOnea4fBC0C
 Hm50iLrsrn5wkaWTXybtZPldGdxXqq6H7pNqd4UwS8XA1/FsxX9QFF/+GAYcUOg1pQrYb0uewZz
 DmcXkzHiNNkY7qzS2iLP0FQQVBP4/zBVIE4U5yaNPTWantby+5GQa17Y+9G3cl5yNxNFQ3J7Kb1
 neItpZFJKISgkjxWzAw==
X-Authority-Analysis: v=2.4 cv=HNrz0Itv c=1 sm=1 tr=0 ts=69e611f0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=hvn8mZBs_W1j6JFEFtEA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_044554_200619_3BA5847B 
X-CRM114-Status: GOOD (  59.21  )
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

On Mon, Apr 20, 2026 at 02:01:57PM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 20/04/2026 12:50, Dmitry Baryshkov wrote:
> > On Mon, Apr 20, 2026 at 07:50:46AM +0300, Tomi Valkeinen wrote:
> > > Hi,
> > > 
> > > On 18/04/2026 01:32, Dmitry Baryshkov wrote:
> > > > On Thu, Apr 16, 2026 at 11:10:03AM +0300, Tomi Valkeinen wrote:
> > > > > Hi,
> > > > > 
> > > > > On 16/04/2026 02:22, Dmitry Baryshkov wrote:
> > > > > > The DisplayPort standard defines a special kind of events called IRQ.
> > > > > > These events are used to notify DP Source about the events on the Sink
> > > > > > side. It is extremely important for DP MST handling, where the MST
> > > > > > events are reported through this IRQ.
> > > > > > 
> > > > > > In case of the USB-C DP AltMode there is no actual HPD pulse, but the
> > > > > > events are ported through the bits in the AltMode VDOs.
> > > > > > 
> > > > > > Extend the drm_connector_oob_hotplug_event() interface and report IRQ
> > > > > > events to the DisplayPort Sink drivers.
> > > > > > 
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > > > ---
> > > > > >     drivers/gpu/drm/drm_connector.c          |  4 +++-
> > > > > >     drivers/usb/typec/altmodes/displayport.c | 12 ++++++++----
> > > > > >     include/drm/drm_connector.h              |  3 ++-
> > > > > >     3 files changed, 13 insertions(+), 6 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > > > > > index 47dc53c4a738..5fdacbd84bd7 100644
> > > > > > --- a/drivers/gpu/drm/drm_connector.c
> > > > > > +++ b/drivers/gpu/drm/drm_connector.c
> > > > > > @@ -3510,6 +3510,7 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> > > > > >      * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
> > > > > >      * @connector_fwnode: fwnode_handle to report the event on
> > > > > >      * @status: hot plug detect logical state
> > > > > > + * @irq_hpd: HPD pulse detected
> > > > > >      *
> > > > > >      * On some hardware a hotplug event notification may come from outside the display
> > > > > >      * driver / device. An example of this is some USB Type-C setups where the hardware
> > > > > > @@ -3520,7 +3521,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> > > > > >      * a drm_connector reference through calling drm_connector_find_by_fwnode().
> > > > > >      */
> > > > > >     void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> > > > > > -				     enum drm_connector_status status)
> > > > > > +				     enum drm_connector_status status,
> > > > > > +				     bool irq_hpd)
> > > > > I find the "IRQ HPD" naming always confusing, even if I'm somewhat familiar
> > > > > with DP, but if someone has mainly worked on HDMI, I'm sure it's even worse.
> > > > > 
> > > > > Can we define this a bit more precisely? Is 'irq_hpd' only for displayport?
> > > > > If so, perhaps 'dp_irq_hpd' or 'displayport_irq_hpd'. I might even call it
> > > > > 'dp_hpd_pulse', but maybe that's not good as the spec talks about HPD pulse
> > > > > for both short and long ones (although in the kernel doc you just write "HPD
> > > > > pulse")... The kernel doc could be expanded a bit to make it clear what this
> > > > > flag indicates.
> > > > 
> > > > I attempted to stay away from defining a DP-specific flag, keeping it
> > > > generic enough. HDMI is pretty close (IMO) to requiring separate flag in
> > > 
> > > If it's not specifically the DP IRQ HPD, then we need to define what it
> > > means. I tried to think what it would mean with HDMI, but I didn't come up
> > > with anything.
> > 
> > I might be mistaken, but I had someting like HEAC HPD / EDID status
> > changes in mind (or HDCP-triggered HPD status changes). But here I
> > admit, I hadn't checked if it is actually applicable or not.
> 
> Possibly, I'm not familiar with those.
> 
> > Anyway, for e.g. DVI or VGA that means nothing. But, my point really is
> > to abstain from defining someting as DP-only in the top-level API.
> 
> I'm fine with that, but then it really has to be defined =).
> 
> > > > Linux. Likewise I'd rather not use "pulse". The DP AltMode defines a bit
> > > > in the VDO rather than a pulse.
> > > > 
> > > > Anyway, if irq_hpd doesn't sound precise enough, what about "bool
> > > > extra_irq"? This would convey that this is the extra hpd-related IRQ,
> > > > but it would also be obvious that it's not related to the HPD pin
> > > > itself.
> > > We'd still need to define what exactly it means. I think it might be better
> > > to just define it as the DP IRQ HPD, as then the meaning is clear.
> > > 
> > > Also, would an enum flags parameter be better than a bool parameter?
> > 
> > Maybe not enum, but u32 param. Then it can become:
> > 
> > @extra_status: additional type-specific information provided by the sink
> > without changing the HPD state
> > 
> > void drm_connector_oob_hotplug_event(..., u32 extra_status);
> > 
> > /* DP short HPD pulse or corresponding AltMode flag */
> > #define DRM_CONNECTOR_OOB_DP_IRQ_HPD BIT(0)
> > /* DP long HPD pulse, debounced XXX: do we need this? */
> > #define DRM_CONNECTOR_OOB_DP_REPLUG BIT(1)
> 
> Why is u32 better than enum? So that we could e.g. pass short values inside
> the extra_status?

No, my thought was to be able to define values specific to the
particular connector types and to be able to combine those values.

After sending the email I started thinking about the bridged and
corresponding notifications. There having overlapping values will not
work becasue bridges in the chanin don't easily know the final connector
type.

I think you are correct here, it should be the enum. With the first
iteration defined as:

/**
 * enum drm_connector_status_extra - additional events sent by the sink
 * together or in replacement of the HPD status changes
 /
enum drm_connector_status_extra {
  /**
   * @DRM_CONNECTOR_DP_IRQ_HPD: DisplayPort Sink has sent the
   * IRQ_HPD (either by the HPD short pulse or via the AltMode event).
   */
  DRM_CONNECTOR_DP_IRQ_HPD = BIT(0),
};

/**
  * @extra_status: additional information provided by the sink without
  * changing the HPD state (or in addition to such a change). It is an
  * OR of the values defined in the drm_connector_status_extra enum.
  */
void drm_connector_oob_hotplug_event(..., u32 extra_status);

> 
> > For HDMI we might want to define:
> > 
> > /* HDMI 1.4b 8.5, HPD pulse */
> > #define DRM_CONNECTOR_OOB_HDMI_REPLUG BIT(0)
> > 
> > Or might not, 100ms is long enough for all debouncers.
> 
> As I read the spec, there's no usable HPD pulse in HDMI as such. It just
> means that if HPD is low less than 100ms, it should be ignored, and if it's
> low more than 100ms, it should be handled. In other words, from spec
> perspective there's no difference between HPD being low 105ms or five days,
> there's no upper limit for the "pulse".

Yes... Let's see. I don't think we should define any extra API or values
for HDMI until the need arises.

> 
> Still, we probably want to handle the case where the HPD is low only for a
> short period, so that we don't do a full disable/enable-cycle. We can
> interpret it as the same monitor still being connected, we just need to
> check the EDID again.
> 
> But isn't that just a drm_connector_hotplug_event with drm_connector_status
> staying connected? The callee can see that the connector was connected
> before, it's connected now, but we got an event, so let's read the EDID
> again.

As I wrote, I'd be more concerned with the CDC / HEAC / eARC. For the
normal EDID changes I think we are doing a good enough job.

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
