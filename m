Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BB7CD98CF
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Jun 2026 18:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dvB3GLU3a9tHna+oIHK9Ld9jiq9DhtAPW3YxtJq9xpw=; b=kunvAHfu0vBwUd
	tjo7eQy/cGs732g8BaXgR18ZSo6bG+wFpWb2l0Z5RTlcpBYm/nBKQN847SOzfQ9sSS6KY1F72Aeoa
	v/WLJKHlcT2FREecHMwVMSUgmDHORoTGRldk9c0u6ByfbRwVkkzD3r+7To0ojn7pGqXKtpB/LmOrf
	ZXzH3IPi9I1S4Zpo0b1NUSUAY1MHuzyx8QH91Kd/6Zv5Zsq3oMSOxvTbzviIxtwnk7tXwWo+kZDtm
	MD98PnA/iw/yscT2Rzioh1HB14CWvfINNYC9SQspz71HavGQIB0w51aoWCrMZ4ZgZJgbkVYC+BJwH
	y9FjTwHhNNONzJ8LwaZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY70f-0000000BQKD-2Vfr;
	Fri, 12 Jun 2026 18:53:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY70d-0000000BQJ8-1wMA
	for linux-amlogic@lists.infradead.org;
	Fri, 12 Jun 2026 18:53:40 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65CGUg144152996
	for <linux-amlogic@lists.infradead.org>; Fri, 12 Jun 2026 18:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v3/Hm6Xq7WCrgTyuR+mYm99o
	byQyGcdOpmpb0F6ke1c=; b=QyzaGnikY7lvP+gYNtF5B5gsq2WmUJGU6b/iEyc8
	SM60hoYQ877RExS0N7DGLbXtTL5/6KRJJw7ZeGH5x87tjPexRkoTotluUY0BnFoF
	HkMji3P7vnUoJFsacAa7h3IxAfTGy3w+v0t6lhiq0m2CPW7jNKXBP9dy8oZQAYes
	/x7yvsuAm61BlmQgJFdUBuRG9rWEKgjMq6Ve3gPdCoUfGxiYeVrB/2byyKH95qPH
	2lgtErJZxVrg9WL1eI0Tx9nasXDLeiH+aWXhjUscB+gmB6mXz9YnPbeuLzbPtaHi
	OJTYOJiWMIh/LNLvFxLza8JV0OnU+OYW/dSj20tJKJptdQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er1xcmcjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 12 Jun 2026 18:53:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9157f1be083so220243485a.3
        for <linux-amlogic@lists.infradead.org>; Fri, 12 Jun 2026 11:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781290417; x=1781895217; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v3/Hm6Xq7WCrgTyuR+mYm99obyQyGcdOpmpb0F6ke1c=;
        b=WcP1YbVNP8fINlmseY1haHM8iHrDQFn9wenTh2eU6/2kRii3WB75yWtXX5BnmzzrXz
         3iLbPxFJXb3/x50b0yUODVwibhrghjNXa7Kx6drPvBjsjKkTsvZUFpR1FGd0R3zobg1q
         Z2INiWPQIEBvPcXI9zg9YYFZGKLjpzHIaVdL6EyujBpdlox8p0/OSvuvrmNFdyPwS+Yf
         EtmFzSF2xwBR9tTSbkVwjBqURnY21jrzJ+DBbvX9mTYzV+Ua/h8rUnVyylnz3uw9vtOo
         r7EkaDUCemueTuSwcXrF4ePaaO56wePi12Q3bheymwPnbKUWzNQOktuon1gv+MX995QB
         G9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781290417; x=1781895217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v3/Hm6Xq7WCrgTyuR+mYm99obyQyGcdOpmpb0F6ke1c=;
        b=VJzn2n2Zt+EWhg5i0YoihsqL7/RMLitkIm0rKIBe0Pg/gHkaYaYgu37XlXRUnWsSuZ
         czsX8jlnz9G/xrUI5Oe8y4LrQMEs17DP9rWtZQ/ZHCV6CKZ6saFf/gRgqW7dqxsNSgQv
         g5CA3NEjoTOVgkrEuc8QlaWQxK48EYUGT3W5wsLZQQ1Ivuu27fyjPliA6CEyfCZLFFrQ
         XzR6aMJE8lmIm6WQ1qWqNA++P7XRSFfwL6AdCssLhkYgDS2PHVsCxIj7QykprYrnrIGW
         /iczF/E9Dy+1856eHYRVRFkcxX3lOeRd4ICsD+FAg2fhkYXoynlOyR+TVXcqjAn7QSsa
         bRWg==
X-Forwarded-Encrypted: i=1; AFNElJ+rXKAHUtZUAdGguDOKzytiszQuHcstZ0AV+LKvu3tEaBGvwZVikb0ty5qEtBLLpiry1Emn/Uin/nphnr4m@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe2BntNqghHsd21wQ4rF6uf7xMkXDn4T0vtlD1hyT8N0A1eudk
	EoPfWCqR6lzwwU1AtcIm8Ujz7QYX8ruVZpEivPHwsCn4HlOGbjCBPoUigcX++JmkEficRi4N9QN
	Aozu5fvi6mtH55E9b9frGKbpJ1/2EKmHiw47f0Vpcu47fSyE5WKSleh36QS7oKvppB7rUZ4ozpw
	==
X-Gm-Gg: Acq92OHtfIR5pDnABximza3Uw2ixY5WY+lyPvDkkBxSmOt8G+xieMxsGEhNEoXBoq3L
	rfbX0jPf1g75abNy4ZgdYlNyOLAFsI03xRepqhRoGcjqQVVSPoLj1rQpYT4qtq1tVM3djt4zJ6F
	dAXGopcNeExLPnva9Rat/LEE4mRNm4Dx3ifPXjq3d207bxAT1yEp62XL03UBzVRc0zFu+tnbOQ1
	Tx52ltOpy8OSVo/EbOZII2aY5TbO4RysATdHQpZQvBl2g072SQlTl9PdyeJT9BOLwLYTzDUmYaS
	8yAbDVZg9P1/+2HO+E/enUc9A1mIVHlZv/n6M60wjUrKlDlRjWE2D502PO7t5XU437i+6BAlAMg
	hvqY/+5IFBNyr7Ojaaz/T6lQpW8FhWAs5t04ONMEjZ7QZ8sTpq15qjq5uXAJ55DYEo/7Og6q6z9
	dodLa0YqPcinW26kllOOUSLAOWiVi367vU4OE=
X-Received: by 2002:a05:620a:17a8:b0:910:db3a:7bdb with SMTP id af79cd13be357-9161bc8d778mr559909385a.32.1781290417465;
        Fri, 12 Jun 2026 11:53:37 -0700 (PDT)
X-Received: by 2002:a05:620a:17a8:b0:910:db3a:7bdb with SMTP id af79cd13be357-9161bc8d778mr559899485a.32.1781290416844;
        Fri, 12 Jun 2026 11:53:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1ae1absm726479e87.59.2026.06.12.11.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:53:34 -0700 (PDT)
Date: Fri, 12 Jun 2026 21:53:32 +0300
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
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Francesco Dolcini <francesco@dolcini.it>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v4 1/8] drm/connector: report out-of-band IRQ_HPD events
Message-ID: <hxto2g32oyfy2tlihdgpjy7bwkhxp2cdw7qnf2rvpl7g7jczen@5js56gor3z6t>
References: <20260608-hpd-irq-events-v4-0-30b62b335487@oss.qualcomm.com>
 <20260608-hpd-irq-events-v4-1-30b62b335487@oss.qualcomm.com>
 <20260609-bouncy-tomato-dalmatian-70ccee@houat>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260609-bouncy-tomato-dalmatian-70ccee@houat>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDE3NiBTYWx0ZWRfX+wOGhtoM0uOi
 NugZqumkKtmo4kDQly/gLj58XqWRwQbh3ymoxDTZzkvaOxhxW7XyrPjSn/lSELSgIsvQaniwLGg
 Px2W7KDx0+JCpHmlxXmVKRWg73xmg4nAWjl/k15h47qykQi6zg4xeeS+Ms/W9dYfb5tZO0M5P9j
 9vhLF791oVrBhMsqtEZ4Eyu7sbo1Rn5aMS0XzJvDpuEjDZCtWx/qFJ5HioNDEnDcryJm8znH4gt
 6Wa0oCVqNyCUFb5aEk0zZofwjiyqKNRNxWA1aWSS+zeZ4UL/vuuEl1rza3zc/Z32UUEEjmqKGDr
 QQg4G6OeVQrJD5dIqZ/qRWU0DNKC0asa0gtxtW0tr5IbokgAGyIzymHlVvm3kLxQ5O/5Tq5ChAq
 iX227HEnt5+0sAjKX/xDY/7qko4pDENyOA9n4cuoKHnCQ5Wl9I+qzZv0C+GqRA6GVkCPjoKazG5
 rX8zNx1nzkNFMMmhuzQ==
X-Proofpoint-GUID: WwcNDqFMxhHgF8DwSDh6Tt3V_BMl3iVf
X-Proofpoint-ORIG-GUID: WwcNDqFMxhHgF8DwSDh6Tt3V_BMl3iVf
X-Authority-Analysis: v=2.4 cv=NZPWEWD4 c=1 sm=1 tr=0 ts=6a2c55b2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=Qs5g3gW-Ea0FhcstOt0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDE3NiBTYWx0ZWRfX2zTMIP4WCDl9
 glVxectvBs5n6lxQV5xAON/0R3fQ3Cm10uEohbfsO22bWNBJJANW0Y2w+Hqd1+Fo1EpzsAJWoO0
 INRP/koKKdqm84YEYngMhY4Era3mH4Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_115339_627437_D27B66D0 
X-CRM114-Status: GOOD (  32.96  )
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

On Tue, Jun 09, 2026 at 03:20:01PM +0200, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Jun 08, 2026 at 12:33:02AM +0300, Dmitry Baryshkov wrote:
> > The DisplayPort standard defines a special kind of events called IRQ.
> > These events are used to notify DP Source about the events on the Sink
> > side. It is extremely important for DP MST handling, where the MST
> > events are reported through this IRQ.
> > 
> > In case of the USB-C DP AltMode there is no actual HPD pulse, but the
> > events are reported through the bits in the AltMode VDOs.
> > 
> > Rename drm_connector_oob_hotplug_event() to drm_connector_dp_oob_status()
> > and extend its interface to report IRQ events to the DisplayPort Sink
> > drivers.
> > 
> > Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/drm_connector.c          | 20 ++++++++++++--------
> >  drivers/usb/typec/altmodes/displayport.c | 23 +++++++++++++++--------
> >  include/drm/drm_connector.h              | 21 +++++++++++++++++++--
> >  3 files changed, 46 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index 3fa4d2082cd7..bb128dd0263a 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -3502,20 +3502,24 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> >  }
> >  
> >  /**
> > - * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
> > + * drm_connector_dp_oob_status - Report out-of-band hotplug event to DisplayPort connector
> >   * @connector_fwnode: fwnode_handle to report the event on
> >   * @status: hot plug detect logical state
> > + * @extra_status: additional information provided by the sink without changing
> > + * the HPD state (or in addition to such a change).
> >   *
> > - * On some hardware a hotplug event notification may come from outside the display
> > - * driver / device. An example of this is some USB Type-C setups where the hardware
> > - * muxes the DisplayPort data and aux-lines but does not pass the altmode HPD
> > - * status bit to the GPU's DP HPD pin.
> > + * In some cases when DisplayPort signals are being routed through the USB
> > + * Type-C port the hotplug event notifications come from outside of the display
> > + * driver / device. In this case hardware muxes the DisplayPort data and
> > + * AUX-lines but does not pass the altmode HPD status bit to the GPU's DP HPD
> > + * pin.
> >   *
> >   * This function can be used to report these out-of-band events after obtaining
> >   * a drm_connector reference through calling drm_connector_find_by_fwnode().
> >   */
> > -void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> > -				     enum drm_connector_status status)
> > +void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
> > +				 enum drm_connector_status status,
> > +				 enum drm_connector_status_extra extra_status)
> 
> Thanks for the renaming, but I think we can also rename
> drm_connector_status_extra to something a bit more descriptive now?
> drm_connector_dp_oob_event? status?

I did not want to introduce a DP-specific interface, keeping the HDMI
eARC HPD in mind. But... Let's get it nice for DP first and handle eARC
if the need arives.

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
