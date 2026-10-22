Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C5C606A31A
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 13:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=krGLUaNh;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h4kWjHHp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EKOVtCEO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MUF2Noky7qwkg8xP+tfJJ3lzgb74cZuXV0gG2zqZjnw=; b=krGLUaNhtYH5R/lCi2Co5zSQYa
	6LKOO2n5eCGsMkrVxP0y7oSxsbVaL7ExcWF7/NygmjtXwTfzqKbKKLM/W0B+Hxw7+IjdmeUSDiuDa
	SJnmUgTwf/xtlz+7TxA6Lds2hkXZ9+A8ZiKg/1EKjchRn5OUbqnDZvVZ5zgZB6fYoSGe14L19gQoJ
	5byeQlXKuoC6+dUUEgOwBTqiegwUWZ3qfm8i1UUPCg2U93K9x5cFFaKgJyYQVg5ik5tRGgUGGDvCe
	q9wkis1GkC7606sMc35IxyQ897t1mlL2Qzg1/Zml4a5cVPr/n0BEh6XysFbcUSbfc32D2Adcvmm6I
	3Oyz80Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsYX-0000000E91e-1wvR;
	Thu, 22 Oct 2026 13:10:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJsYV-0000000E901-0PkW
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 13:10:04 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xp333478820
	for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 13:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X71VhERMLk9X4yX6oZKoIWZ1
	HUd6drCTkrXIPj5i+40=; b=h4kWjHHp2vQbs7FvHIG3d+zB/9hpThcUAdfi//Kx
	lHQMH9vEM6g/E9b9N2pDrJHNk9G6T90OAYdz8+F60MgY8MuMvPr8nDZhP5eTUl9i
	6oV5tW4+SUoYgUfJuoKQfOHAUv8avm3bVlcT8Z5vH54BGXzunjNOP7P7M9XndaJW
	4R0L6fjgA+khWUgH2DNpSbkAZ2TPpTjXJde1dzqTXIR+wowz5sSREPa7jtRjbkVr
	3wUhdECgFAlstvlduFnVdLXEILlECEh5HeObxXyF7MqoiGvDisCB4QTYknJ0I7l7
	nN9QjCi0F9HwgoaFPKjvmTcdjTU4Z5YuOEl8MS6yteLb1A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a3m00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 13:10:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934956beec8so400966185a.0
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 06:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792674600; x=1793279400; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X71VhERMLk9X4yX6oZKoIWZ1HUd6drCTkrXIPj5i+40=;
        b=EKOVtCEOcKYYeDsEHi/p6zluUw1YiNVvCwegXwxDP/1zm52bVFn2kQfrOhb6ifvDa3
         dTDvt87HytuXvhubJEacVvvlcQt5aS5t9Oh9kuBCa+8RD0qiHaFkSVMvCSeRCD5yc4Kk
         0m4j7YtDNpMw0mYxkPnOW+PN1A0FfC+GYeXxARMa9/3nH+odCBgIOxNsmPcNZCTtgIG7
         THmwDYvdvWHnqD9g9Ip4GkAvfG7Tk7GOlD/O/m//WWQkZY9tfxg9YMoKZfIvGiyFJNbW
         UVzjD5kj2BNp+M2mfkbtbwmcMW3D21xNLKpAWfyPhBswlHBl00uFBnBX3kHltKIFs0f7
         fnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792674600; x=1793279400;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X71VhERMLk9X4yX6oZKoIWZ1HUd6drCTkrXIPj5i+40=;
        b=P53UClnZKrITcxGZjsiUOwAemKZ0BMoNByc1lI3ZvnIRUdHzYzxdMeK37K897aNHd1
         y+xqPT3guKUk8Uh+jxqmmzP5dAAAGsXGrSQoO1LaehvE9to2at6SIboKD/ybPkt0lVL7
         95JIcYU039YmpWEyL694A7pfn/stHezn1QpXeMsU1dK/9cCTiMo1ZgWRkEQK6F7W3K2g
         IKIArxocYAZGRNXxmsAYlv9OdXiG8J8134GO8TeD+zfBugcWad3xEzmT1z8jMSB0hr6n
         dys1jx95SST/x+8YXnuQCriDtCGMJkP6lsib6VsDVQnQcUVmbLucZwpX+wYBY13kxknR
         jqng==
X-Forwarded-Encrypted: i=1; AKwUvBz8HOaf6acuTL7s9Xhypq4gJpF8ovEl77FG8h/YsMARMsPR5ZYpuPyPRj9/T8HnZsXYOBU+h9dFcGbu60Id@lists.infradead.org
X-Gm-Message-State: AFq9FYIKeIvLssuBv63iI8SNs9UocQWYDhuhkVIT5vDYaF1BAYihRvbj
	DqyWRMzlyePf+5BErg5Vyl45XVjKTFnfmesWOGczMM81V8YunNWz95KM9XdrlayddqHm4akjX8s
	IaWYQlXKT/xG5G1cW9EcSadyS8SJlw+Xfksj+AG4QWuAxgdfU+N0zpvY3x1J+hR64RlL5RDEIXA
	==
X-Gm-Gg: AYBFou3L7i2+OaMTvIHt+Nv7pesHBcjfMFnJVY12OqTGkB8B08Nufm4MV8cUP1LRVrv
	qsb+ePCgWEY/i+fR/1sk/XriUQCDqJUOCiWPuXNdUMJ2ULY5DpAI7H3OJvVHkb+fZrmI2qMHjk6
	O/8v2Xd7108rgQKZbzqtIdgsZfb73BSdWtW6UCovriAH9YjTxNU23r06x2QELS3NSvECgCY4mMN
	cimYhBtYRK6v0ngt0nEtfTXZPCY85KFkB67DPee4pmDb/3py4V3rT1d1zDPlGp0PqWWRJV10FbY
	2GUFijt8WE/Azgrx4yDkaR7ogq3XHE0pGpBMeSG8Rgp/FwLt9/zY1RaPw4uUaXILlM4hCX4gPHM
	FI8L73hY8q3nrQZkTk9sV9RA9ps9jGhcYK360LANKbiWngsGGl+Gn9YqY+8yiHbt9t/xNrPK3zP
	A/dkW3PZLdZRSe
X-Received: by 2002:a05:620a:2987:b0:93e:6068:7e8d with SMTP id af79cd13be357-93f57e5e1dfmr891279985a.10.1792674600139;
        Thu, 22 Oct 2026 06:10:00 -0700 (PDT)
X-Received: by 2002:a05:620a:2987:b0:93e:6068:7e8d with SMTP id af79cd13be357-93f57e5e1dfmr891275485a.10.1792674599660;
        Thu, 22 Oct 2026 06:09:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1b94eb2sm1024058e87.45.2026.10.22.06.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:09:58 -0700 (PDT)
Date: Thu, 22 Oct 2026 16:09:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Francesco Dolcini <francesco@dolcini.it>,
        Abel Vesa <abelvesa@kernel.org>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 2/8] drm/connector: pass down IRQ_HPD to the drivers
Message-ID: <mdmxy4u5vz7xt6e524l3ghcy7b7yx63lirrnk4s7qzs4pm3oti@wucyw3rgooyk>
References: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
 <20260920-hpd-irq-events-v5-2-ff1de0090c72@oss.qualcomm.com>
 <b6ccf98c-58f3-4fdc-bd7b-3eb1bc3b6e98@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b6ccf98c-58f3-4fdc-bd7b-3eb1bc3b6e98@rock-chips.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MiBTYWx0ZWRfX7d8mCJuvvCYG
 P9Eu5k4BjnZuxFzIX+i4jjsb5fqVnMmxFC4nRRsQCOxkMqOnVLheoe7zBie++CRbtF5/j1Ok6LK
 tsIiEFmU4CYt0bA+YVkcNclqNvKv0Z4lGcc91CtuwPlmMI9nSyzDFn1KIVVPpk49MPaR604lb78
 AF0rGwcbRhnAWOgB8PBbxJAUASwnhDfRQC01LaPwSKCqCfF2j4U6CF49x1oiT1440k3WXbxN37l
 /22FsMfbEee97l4X3DHDiWdW9wyoAAto7ubGQpfybrBNw0ifopw7PvQ4382Iv97So6C1EptL96H
 i4/FVTqyTkF8CSJYSylwyo5VpsDcZykbG9n9shTMTpPOhS7wSveGn6LAQba9GuFl5+SwJPgX2MM
 sBp71Wm+R8rZo/sV9RQUaMQ7Y7+oQP0Ai0ZVjrxyDmXLIoQuCtF+ihlUYDCy7KDkGABkIXhjaHG
 IwxWKoIR2WD0lvOSwaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MiBTYWx0ZWRfX7XC+gNP6LjAz
 s520Uq8lGckcVb3933sZmdIc9/7iQewmugZTyM21OYHtBioLz1LqsCzstkaMbGOE2wRwbziGZUM
 RswdojRfuuZhEOtY+rQl8xGSxt57RAI=
X-Proofpoint-GUID: duLIV_Ovi5uHFO-q7pa0UfAoRFoD1sKd
X-Authority-Analysis: v=2.4 cv=NaFzRGD4 c=1 sm=1 tr=0 ts=6ada0b29 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=qswy0Ei35aWKpRDCTP8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: duLIV_Ovi5uHFO-q7pa0UfAoRFoD1sKd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_061003_165906_7B091CF6 
X-CRM114-Status: GOOD (  27.30  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Sep 21, 2026 at 09:53:12AM +0800, Chaoyi Chen wrote:
> Hi Dmitry,
> 
> On 9/20/2026 11:01 PM, Dmitry Baryshkov wrote:
> > The DisplayPort standard defines a special kind of HPD events called
> > IRQ_HPD. These events are used to notify DP Source about the events on
> > the Sink side.
> > 
> > Extend drm_connector_funcs::oob_hotplug_event() to pass the
> > notifications about the IRQ_HPD events down to the individual drivers,
> > letting them handle those as required.
> > 
> > Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
> > Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/display/drm_bridge_connector.c | 17 ++++++++++-------
> >  drivers/gpu/drm/drm_connector.c                |  2 +-
> >  drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
> >  include/drm/drm_connector.h                    |  3 ++-
> >  4 files changed, 15 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> > index 00feb73e63d7..a51567d19550 100644
> > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > @@ -141,7 +141,8 @@ struct drm_bridge_connector {
> >   */
> >  
> >  static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
> > -					    enum drm_connector_status status)
> > +					    enum drm_connector_status status,
> > +					    enum drm_connector_dp_event event)
> >  {
> >  	struct drm_bridge_connector *bridge_connector =
> >  		to_drm_bridge_connector(connector);
> > @@ -154,7 +155,8 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
> >  }
> >  
> 
> It looks like you only changed the function signature. 
> Don't the "bridge->funcs->hpd_notify" inside this function need to pass the event?

This is being handled in one of the next patches. Indeed, maybe I should
squash the patch into this one.

> 
> 	drm_for_each_bridge_in_chain_scoped(bridge_connector->encoder, bridge) {
> 		if (bridge->funcs->hpd_notify)
> 			bridge->funcs->hpd_notify(bridge, connector, status);
> 	}
> 
> 

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
