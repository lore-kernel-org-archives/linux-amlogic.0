Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82E1CD5BA4
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 May 2026 12:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ylWamqZEKJT5bTbiLqQ0XxgQ3WucXvkzc6xVT2JzPbc=; b=SyHayEQ7LJ+v33
	XQL6fvs2BdVKaPdxq/rUCCvKoeYUKiNmuvUitjjvSnGzt7Kur6ON+HETBAyNeZHQ+V+8++UT0bKgK
	HqKCDyce8YrcIDrDwdMl89y+q7LfP8KpiRV/PoIp74/8mUPhHhPmn6g+i2AqXaPkAXR197z2SKPwL
	cq7zFcRxZODDCOx7dpM6Mybdc0AyLAoLkALCarpjmHmVVLYEQzsVZKr9Xu62jW3koMIKuSCJ/WQap
	BfwbiDVkjSfHVB3ycy3ZDfgDPqSrhPtBHq3tIgb31qIxZh6cdCDKAIffIqbufYtAf9QIG7hXiKkbT
	x8tFUzqUOOE2XvA8akJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ29Q-00000007gHC-0KYp;
	Thu, 21 May 2026 12:05:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ29N-00000007gGW-406y
	for linux-amlogic@lists.infradead.org;
	Thu, 21 May 2026 12:05:19 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LAY2Gv818987
	for <linux-amlogic@lists.infradead.org>; Thu, 21 May 2026 12:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pGY+j87eohBlWubIX+vUu3zL
	xCM+uB8O9JAB1ecXkdM=; b=ESUcJTqfqAtQySEKLKp7KIRCaL9t+erTOvTDfYVG
	fOBbLyDU9ErXoWLj4r4aG9s0cSsb8zoRyM1JEXHKMO58+5AlNlIqYhVm4fJDnyg1
	cl2sJsIct0JQnB6xtZiA/nkLgshpE2ZJ2d8TMb2iE+jiPVc88/YLy+/uMALyWJcO
	EFiCMzn/yB2f4Oj7+vhyZdRM7OScqDwli9yLV5lCf6V/2L0HFXQP/129g+4Vwob2
	zmgClDrJK6DrYqqGGbrsnUTeIGoXHc4aGqrFVjT2e248jtLQepcXVGsiUmf9Vdb9
	yl1pamahY+nuPtJOIFtAZJqeEnapAvzxGfzSceLlDVUI8g==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea0dkga9g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Thu, 21 May 2026 12:05:17 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-43a181bcc39so6833652fac.0
        for <linux-amlogic@lists.infradead.org>; Thu, 21 May 2026 05:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779365116; x=1779969916; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pGY+j87eohBlWubIX+vUu3zLxCM+uB8O9JAB1ecXkdM=;
        b=jJm+G+TtAr5609AWpiUfxF03XrDjj+HCuadDaY2GflNhgW7BrWCoI5CDAG6XC7I7np
         w13+aiYSf3sqEZZ0Hh2itK5GjGkOKSLjPm9+ft6qz9kHIOiJlm4YyUrYDzKkXNZlmUmX
         A0dK6eaTj4Puf27VLzRIYLso+W0KEAvTq92hLaOF76rx7qWdZg1C/SV1CE3caEiEmLBj
         iILd8j8aPUL+abkhtOg9NMbEvuY2j4NIxd9z/8PA5dEVHnEAUhiYoUJRWv6FJSlziGnD
         Mp0c8Ea4Dpon2cPJbLH7mGREb9Id05lUDzg/GRGIxMoGMTTXGtbYj7Cv6kOEL+hGzLSM
         YChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779365116; x=1779969916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGY+j87eohBlWubIX+vUu3zLxCM+uB8O9JAB1ecXkdM=;
        b=foDup8kkx7JHG0vMQ7XKKFQ2hxzIqVkt9OGIKrk4Se5+90wZGeusQiHThkLD5Wk2hY
         vHeYK94bDQGl6jhCFaxYP8/5KaesteRkCFZfTzGgnTpm4S+c/eOadZgJMwj++t0fbSUP
         s9fD59xXUAs5wFbvTBh9cuOTHjdAmtK0EHOJ30E6rFcpV3jZzXcIqqfCfEWKb3N33o1m
         dgisa8GZozAWzn8ZQyygYDHuUey/jipgPMchD9LrYjXgm45ziSuk0xJOwiYP9rtgBFjq
         tkMh6a7+HOv51e1qNIGgjWJXzqPez/42N6ty+yE+Ts5S/ILtJCzzqcef3DaXrqB94L/k
         5RSg==
X-Forwarded-Encrypted: i=1; AFNElJ9CaMP06Ro26nIDGifqYe6Uw1/Tkq+LVXgfJtigqcGvnv50cN5Q7NkearlDbxl+jXLZOwyov0GRmxauiGmY@lists.infradead.org
X-Gm-Message-State: AOJu0Yzzs/BT4a6/kBlhWWvCBqtcSXroj+/IAfjRNbyvhGjoXCaEpDMl
	DxdwLmPCBE9zwzivucIhAypiP8JvHh0rr82AZ8OBQlnYZHZvvVEAgU3b0uT58e8l99a3Zfterc2
	x92TkTkuMXUEgV5ZT4PjMAz9W2NA3L1UByBztKoRQT0kNLwYtWBW7x4GdobAmhvpXoL+mK1taOQ
	==
X-Gm-Gg: Acq92OHbVwMgNKdJ+z5HmTTIzQd8+d2bMp4FChaC7LHxZ0B/GOQZPv+tdBlWiCjFlvx
	ATnqZ9uwpfa1LO12sjlIJ0gv4Qye14RhKyjwaBbo/QO0Vyt33k4+Hlm/Nc8r2o6dPPlMqMpWxyC
	ZJqVdvqMsXcalGx+uEq81OwIY6nU+CM7LTAYpWcT2S5YrH1sehcwbkNrf6PAQEa3QXrDwKqnl3P
	FZkYMzxGPojpd4bUCMYepPr2kYRzOXv2tAHnh5jpZwBQJtho7taPFrQUETmdxQk4YyXH5wpUFHR
	pqMYhhJzEPbbIT6LvRA4JZwHE9oDcEtj5TAI5CKBM+JT5koR2bRM1+QCP+61VZPHHp/BEeXbA4n
	OahHFXhrz+R3ejKQnxji8bzBncNtArTVeP5MFAZU4/Xfgt4D3Gig8x+USeNnd7wcV7tOgadBveT
	lrUa/2Vt7m5sAftODgSZ6uDpRL/77/rgTUAMU=
X-Received: by 2002:a05:6820:1348:b0:69b:bf80:2db5 with SMTP id 006d021491bc7-69d6ef409f7mr999613eaf.52.1779365116356;
        Thu, 21 May 2026 05:05:16 -0700 (PDT)
X-Received: by 2002:a05:6820:1348:b0:69b:bf80:2db5 with SMTP id 006d021491bc7-69d6ef409f7mr999560eaf.52.1779365115873;
        Thu, 21 May 2026 05:05:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395d0a107afsm2201901fa.16.2026.05.21.05.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:05:14 -0700 (PDT)
Date: Thu, 21 May 2026 15:05:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH RESEND v3 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
Message-ID: <vpd5hyote5wspmlpad64kf5peoy5g7wv6c7xjn6ammcmjtai7r@q2tarmr5aoqn>
References: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
 <20260513-hpd-irq-events-v3-1-086857017f16@oss.qualcomm.com>
 <20260521-funny-astonishing-mackerel-cc5a01@penduick>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260521-funny-astonishing-mackerel-cc5a01@penduick>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyMCBTYWx0ZWRfX5UVr5I6cYPse
 Ed1AWqq+XUbzTLn72R0zDiZ0PbzGdOO4P3ZGFq2Y6+9xygu+seZeK1IStSKFujDprd1w7KjZ1mP
 B3fXOpym+2QbBdXuSugnvx/UW/on6Chz82DH7QNmLK27UP8m/c2MLsQ0AhMy2ZcV43M13fB73aV
 NCnXBY0v9M0YTwVynMQZDlStjRw0lBUxyAY4WSxad00zVBMOB1neKHZsI15XmRe523Aa76RbsRs
 FVev7Dp5KwBJAdHR9UtJuIrtGoIRD/ypwzbZaqIvNIF2wHQULh68/4zYBSIPLm5uw2NAVr4IPHh
 p7SFQqpcjYl+C3bXIPFvf/L2uiwSBQWDjy65zNYxiPotKXoirIy40dQy9VV7EouG1w+KEF+tkq6
 Dos14Hj30d61wzFelLw/+CYCTFsW8gJo9VdJWeXe5dq13O9kwDOtS39dir2bQTJpjcjnArCL5Ke
 83+S0EWjYMH8c6jrd0w==
X-Authority-Analysis: v=2.4 cv=aueCzyZV c=1 sm=1 tr=0 ts=6a0ef4fd cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=mRF-X4ptvIx_UuOgb7IA:9 a=CjuIK1q_8ugA:10 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-GUID: 42BoLEcauUpoEFHZfuy_epGJQmIdTMuG
X-Proofpoint-ORIG-GUID: 42BoLEcauUpoEFHZfuy_epGJQmIdTMuG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_050518_304576_052ACC69 
X-CRM114-Status: GOOD (  32.01  )
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

On Thu, May 21, 2026 at 09:47:29AM +0200, Maxime Ripard wrote:
> On Wed, May 13, 2026 at 09:23:21PM +0300, Dmitry Baryshkov wrote:
> > The DisplayPort standard defines a special kind of events called IRQ.
> > These events are used to notify DP Source about the events on the Sink
> > side. It is extremely important for DP MST handling, where the MST
> > events are reported through this IRQ.
> > 
> > In case of the USB-C DP AltMode there is no actual HPD pulse, but the
> > events are ported through the bits in the AltMode VDOs.
> > 
> > Extend the drm_connector_oob_hotplug_event() interface and report IRQ
> > events to the DisplayPort Sink drivers.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/drm_connector.c          |  5 ++++-
> >  drivers/usb/typec/altmodes/displayport.c | 15 +++++++++++----
> >  include/drm/drm_connector.h              | 19 ++++++++++++++++++-
> >  3 files changed, 33 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index 47dc53c4a738..edee9daccd51 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -3510,6 +3510,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> >   * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
> >   * @connector_fwnode: fwnode_handle to report the event on
> >   * @status: hot plug detect logical state
> > + * @extra_status: additional information provided by the sink without changing
> > + * the HPD state (or in addition to such a change).
> >   *
> >   * On some hardware a hotplug event notification may come from outside the display
> >   * driver / device. An example of this is some USB Type-C setups where the hardware
> > @@ -3520,7 +3522,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> >   * a drm_connector reference through calling drm_connector_find_by_fwnode().
> >   */
> >  void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> > -				     enum drm_connector_status status)
> > +				     enum drm_connector_status status,
> > +				     enum drm_connector_status_extra extra_status)
> >  {
> >  	struct drm_connector *connector;
> >  
> > diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> > index 35d9c3086990..7182a8e2e710 100644
> > --- a/drivers/usb/typec/altmodes/displayport.c
> > +++ b/drivers/usb/typec/altmodes/displayport.c
> > @@ -189,7 +189,9 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
> >  	} else {
> >  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
> >  						hpd ? connector_status_connected :
> > -						      connector_status_disconnected);
> > +						      connector_status_disconnected,
> > +						(hpd && irq_hpd) ? DRM_CONNECTOR_DP_IRQ_HPD :
> > +								   DRM_CONNECTOR_NO_EXTRA_STATUS);
> 
> Since the extra status itself, and what the options mean, are DP specific, do we really want to
> extend drm_connector_oob_hotplug_event()? I think I'd prefer to have a DP specific variant, with its
> own set of parameters.

I can try arguing that drm_connector_oob_hotplug_event() is DP-specific,
there are no other users for it, only the DP AltMode driver.

Anyway, do you just mean new API here or new API and a new connector
callback?

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
