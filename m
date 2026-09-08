Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49C43C79F99
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2026 13:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H/7q+5b5xpTygqf8PMO/P2Sc0SDLAKTxPmOc7gvkbyg=; b=vPB92BA7p2/K+U
	dtMi8OjtNZIfVBvEw9LJTRQ0+N5w1/J2Z48AhwhDlGG+KZ0+wOJRdJ7iQabOj8OB7Q8AuTrOaHCk4
	OCHcQmfEVAZ8vCrDB2f7iLKE2qel+CyLA5aACCTf49mo9kuVpljDAqzKnZVzfPt4cQBQ2V7Jv2MmZ
	Tw28xhabp4ed2kUvfFfTH9M0zv2a/hyD4Wi1kYM8OfgOnfQ8Q8URMByiHWcKlK3beRonyq+AUbZwY
	rUJAPrRS17lvDyHwZAwBw+4jf0yQOpoXd8Ib7imo89jgHn4uSpjz7+Lkr9Eu/1FNlwXBNl0DM9S3D
	f7eJbXPMt5aO+dDItKbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vaT-000000097EV-0lKQ;
	Tue, 08 Sep 2026 13:10:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3vaR-000000097Cw-0Xiv
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Sep 2026 13:10:08 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Ckhow4162850
	for <linux-amlogic@lists.infradead.org>; Tue, 8 Sep 2026 13:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XtibxPQVyAZfi7GIcCdlRshMUFB6kV6tOrHbxWFRoTM=; b=FYEEsmu9Bp4RxlKr
	bdlkDU7MM956qVwX0TH40aknbPt8f8sGAAXZ569953xVF3qWYKwmqH3MRoKTZFai
	Np5YiUDQlpNmS04fiP2jqJAFyhgQSTYFXOcYrMvKa2NyfvdZNaV1oab0T7ZKD9fH
	J35pDir6rCVbmXaohQRWqfEfnOvXhRtK2lq+3M+9oby/aZFToyIGfH8NLjPAnSUM
	IETCZxEIXjKh3J6fy+Wq2QK/v8PySRCtHvQIN5iS8OtaytEq7tdZczXAM2ZOBHk0
	lfM+L1SG8GTvnYPZP0EBQTaOp3hL4bFE+G4Rv8iax5C42AHCs2SksxywO9+dIeaY
	0JKEig==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjb0pa296-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 08 Sep 2026 13:10:06 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98066bba118so435611241.0
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Sep 2026 06:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788873005; x=1789477805; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XtibxPQVyAZfi7GIcCdlRshMUFB6kV6tOrHbxWFRoTM=;
        b=bEYb88gksFNuEYvCJ6N0OMx7bT+qQN8+oyr1ma9OEkDyci2dI8otr67FFo8LDRfQwh
         hnxVJ3Z3zw5yXQcJSNvE+NlcL9QsBTXA6ikGCLWcEuoBkbN/IPI3KUVsZD2qV1f5OwLy
         gXfyL0Gi8k0CF3lmadM2Nd+1LIPmZsX1OVc45uTF6jprkSUlCwoVuEZ9fI1R7bhXhVwr
         cVvwfD39xUbnH5rij/ddlD+nS7iME4DzTSurObDAqpsETPCERR4a/JdfJB/OhF9wH+Eq
         d/eFaOx066zHY60tDBkwFplTFi7lZDbMoy1p5vJ5T+wmbfdNovDjlXhIG2+/0ih+fRwa
         SOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873005; x=1789477805;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XtibxPQVyAZfi7GIcCdlRshMUFB6kV6tOrHbxWFRoTM=;
        b=Yz0oH/MSIiva/YR7vyA3QlcJOLgDTfEVi1uWv1WdXi5ToXrbNQICXKCvXXSwnoc8KU
         ohc/zLua2m1TNoJRbc2L8uW5xnsF7RvKHHN/nfel0MljBdjQtttptyP1JS4cBbBYWQ0U
         qaE9m2XIqOwQWttwSpNweyqh0Q9B4eYwL1xoEeqO8ufHsfQvCYQpbQUlM2YvJfW1EwFN
         YI6ey4AZ8FbsQzXxtuxF4eJSI6+1u2ecrotnQ7FJ/WAvMSgPwGSlnMxPUvGmxl86ZswI
         JX4NIuwnf46yZfzL7/LIvGXa2/fEClw0LfDAZYnnPeJsnqX7KgOvwPbTv04JBV8N4dxB
         WW6A==
X-Forwarded-Encrypted: i=1; AKwUvBzZkzapGONAhq3rmHq+6jd9MoE0ROCJ2NOR4ns6kCMDo0/TNHQeIYBUiBorE+WHHMwBNu4oevsDYMjxQN+i@lists.infradead.org
X-Gm-Message-State: AFuF++k97alsCFqoDcVP+1TXW5Zwc6nig/DEQNhsxYcM8eeMR6whiXaW
	eiC7C5fol+kORL0XQTXsCvLnTuwErUzhuL1zC7AHOHVmXUqWQIEQJDMy2P4zg8jOjkc0VXNllcI
	n3OIwiigTF6OnFJ1HfWPUNIgRHVOsjoG54WmJZsDr2WHN/CxW3tljMkkrlG7HDW2s40Xdrz7Q0w
	==
X-Gm-Gg: AYBFou1slDR4a49vM3JTH8C5b08fMpUoECYYDDDY3N/bjmpdQb6m2JyVoMFpAqBHukx
	y1S5i6dZXMZxCED1k3MdOx58QS76e+eUt5OPov1RLIDJQyClZ6cYmDf5yo2juvYyej5C8y0BvPe
	YFixV9PZsBS8/Z70WFh9b+HBsa65Xin8BwQowJ8UPoyYptbhKldukK99M7qEMl84FaJlwvhuNVi
	WSD92WaRBfxHU/tRYXtSHiDoBJoaiX5dHctBhrC8FQTaFZBLmWvWs6CLYDPttbiXs1dB2tKtD/z
	7P8QIPq6lfQh5V6sdL72BrRc9ze5wR8Hlp4y6bEaF83oowsMBCXAAAebYEiEIEhJaSi0aPB/PTw
	HEzOhB0dQMPtl1OxLvBGzVWttRPyBJ9E+QhCl4n+SfXDhkZLjc8NjhSLCLd0d6JgqOoEEJbV/8r
	TWHibxuMNoY3Dt
X-Received: by 2002:a05:6122:f18:b0:5bd:cb34:1b70 with SMTP id 71dfb90a1353d-5c7ed29d58bmr14694120e0c.1.1788873004873;
        Tue, 08 Sep 2026 06:10:04 -0700 (PDT)
X-Received: by 2002:a05:6122:f18:b0:5bd:cb34:1b70 with SMTP id 71dfb90a1353d-5c7ed29d58bmr14694023e0c.1.1788873004277;
        Tue, 08 Sep 2026 06:10:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a3705f37f0sm34623661fa.41.2026.09.08.06.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:10:03 -0700 (PDT)
Date: Tue, 8 Sep 2026 16:10:01 +0300
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
Message-ID: <z7a7c2pe7aqpqlh7z6ep4fhctujnwaxqxukqaywjwvt3w7ahnc@j5i5f53c4fqu>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-1-646a10256233@oss.qualcomm.com>
 <cgk2httvebzm2jnjnb437mutez66tfozzdk77mjwukfzngdioh@mu46u3pwlf2u>
 <af5f2e4f-42a2-49f3-9c6c-0f910c5f9208@oss.qualcomm.com>
 <pyqpajtjcnslk6g5ysn3ce2csrb76fhd5bif4vdb6wezomlmsg@fsl55exyufx2>
 <dd375289-0174-41ad-980f-f027fad976f6@oss.qualcomm.com>
 <fcc816d3-e3d4-4dbf-8ae5-bbbac6e2189a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fcc816d3-e3d4-4dbf-8ae5-bbbac6e2189a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: YE9WJMIOyqDhY2oM5tRri9_80w3KUK_e
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE0MCBTYWx0ZWRfX6ovBgKOkOvya
 C1IvBXLnGAkhNz19zTUFYMMtGDVA0Gi0N59mvOvTqK3VwcAbUl9MidzloRYSk0TrO+NS+WobUKR
 t0OrPZkDGCMdDjEAlM/Xl3A7obZGsjU=
X-Authority-Analysis: v=2.4 cv=HL3z0Itv c=1 sm=1 tr=0 ts=6aa0092e cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=5Eng7BWHuIvqA__06hIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: YE9WJMIOyqDhY2oM5tRri9_80w3KUK_e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE0MCBTYWx0ZWRfX1LzlFW9EnJf4
 Rd6WwiOLT6gUe0kxToRbfom8veOM8gGnq6nO7jt75OjABiO65GYsJTuxl80N9wiVBtwdGHCdFPf
 Ou9QEDEiNOnA2VjZ0WKDoM0+kFWj1q2/1yo5R6rAcFyATI0I5ee1Zl9yttpPXs8zWXTKCTjw/k8
 6ZpHMPcFJqt/7gK0o9a2lzwk7m3T20VnYr/nsVmtKmrZuAeb9L+alMfa8k2l33ZH101ObdFB8YD
 CVgM+a9zEXCKaqrHV1UublNO4wjjAY/3dkjAvh7s3R6EeAS0Sx+9JhKCbyMvzLvUZfigj7fijPo
 x3BxTErb1t203fAJbwrw6QDhcEUJJntIHjlGjsq6ZJ/hgNkAmQ8Q6qSlqJzjdkdrR4VX//cnVvZ
 JpOuCVIpn/qBeCUlTV12NHcVZEh35XbjG83jxIkuyJ9P+JW3zXrE17074NlaQNBrLM7BdeFNEe3
 G75tdrHpy0YaiimHYFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_061007_187007_F30C9D2E 
X-CRM114-Status: GOOD (  58.85  )
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

On Mon, Aug 24, 2026 at 11:15:44AM +0800, Yongxing Mou wrote:
> =

> =

> On 8/21/2026 3:20 PM, Yongxing Mou wrote:
> > =

> > =

> > On 8/18/2026 11:01 AM, Dmitry Baryshkov wrote:
> > > On Mon, Aug 17, 2026 at 04:01:41PM +0800, Yongxing Mou wrote:
> > > > =

> > > > =

> > > > On 7/12/2026 6:21 PM, Dmitry Baryshkov wrote:
> > > > > On Mon, Jun 29, 2026 at 10:48:03PM +0800, Yongxing Mou wrote:
> > > > > > The bridge connector framework currently invokes all bridge
> > > > > > hpd_notify() callbacks and unconditionally emits a connector ho=
tplug
> > > > > > event afterwards.
> > > > > > =

> > > > > > However, not every HPD notification requires a userspace
> > > > > > hotplug event.
> > > > > > =

> > > > > > In particular, DP MST bridges may use hpd_notify() to
> > > > > > propagate HPD and
> > > > > > IRQ notifications through the bridge chain while the actual hot=
plug
> > > > > > handling is performed by the DRM DP MST core. Connector creatio=
n,
> > > > > > removal and userspace hotplug events are already managed by the=
 MST
> > > > > > topology framework.
> > > > > > =

> > > > > > Allow hpd_notify() implementations to suppress the bridge conne=
ctor
> > > > > > hotplug event by introducing a bool *send_hotplug parameter. Dr=
ivers
> > > > > > can clear this flag when HPD processing should not result in a
> > > > > > connector hotplug notification.
> > > > > =

> > > > > Why? Worst case the kernel receives another hotplug notification =
which
> > > > > gets ignored by the driver.
> > > > > =

> > > > Hi, thanks for reviwing those patches.
> > > > Let me try to explain the motivation.
> > > > =

> > > > Semantically, IRQ_HPD is just an IRQ notification, not a
> > > > connection state
> > > > transition, and shouldn't be turned into a userspace hotplug in
> > > > the first
> > > > place. However, drm_bridge_connector_handle_hpd() currently calls
> > > > drm_kms_helper_connector_hotplug_event() unconditionally after
> > > > processing
> > > > the event, so every IRQ_HPD ends up reported as a hotplug.
> > > =

> > > What if the IRQ_HPD is delivered together with the first HPD event (f=
or
> > > example because of the TCPM processing those events)? See the mechani=
sm
> > > in the displayport.c AltMode driver.
> > > =

> > The DRM API should simply pass both long HPD IRQs and short HPD IRQs to
> > the driver as they are, and let the driver decide how to handle them.
> > Based on my review of the implementations from all three vendors, when
> > long and short HPD IRQs occur simultaneously, the long HPD IRQ is always
> > handled first, followed by the short HPD IRQ.
> > =

> > I have another thought regarding the current DRM API. Could we have the
> > DRM layer pass only the HPD event information (long IRQ and/or short
> > IRQ) instead of connector status, and leave all handling decisions to
> > the driver? The DRM core would simply report LONG_HPD | SHORT_HPD, and
> > each driver could decide how to process the event. This seems like a
> > pattern that could be shared across different drivers.
> > =

> > This is just my current understanding. Please let me know if I've missed
> > anything or got something wrong. Thanks.
> Sorry, after thinking about it again, this idea is not fundamentally
> different from your current approach. In the end, we still need to handle
> HPD state transitions in the driver. It seems my previous suggestion does
> not really simplify the problem, so I apologize if it has caused any
> confusion or misled the discussion.

No worries.

I'm currently stuck between two ideas: continue pursuing the current
"single API for both events" or implement new "two API for two events".
I think that the second might sound more plausible, but in the end it
would complicate drivers much more, because now they'd need to handle
synchronisation issues on their own.

If we start from the DP AltMode, we have a single state word which
specifies exactly, 'HPD pin status' and 'was the IRQ_HPD captured'. Our
DP controller also has about the same status word: the connected status
and the IRQ_HPD pulse. Which (for me) points out that the single API is
a correct way to handle the HPD/IRQ_HPD.

Now, coming to the drivers/userspace side. Let's leave the MST story
aside for a moment. For the DP branch devices connected to the USB-C the
AltMode will always report 'connected', but the DP's detect callback
would rightfully report 'disconnected' if there is no actual monitor.
The kernel should do it's best in this case and report that the
connector is disconnected without any interim states. I think we do it
already. The compositor should do it's job and skip full scene
evaluation of the disconnected connector gets disconnected again.

Event filtering. Historically, drm_bridge_connector was trying to filter
HPD event. We had to remove it because for the DP prefiltering doesn't
work. This might have left the gap, which now needs to be filled. The
bridge_connector uses drm_kms_helper_connector_hotplug_event() which
just reports the even to the userspace. Consider reworking
drm_bridge_connector_handle_hpd() to behave more like
drm_connector_helper_hpd_irq_event(). Execute hpd_notify under the same
mutex lock, capture if the status has actually changed afterwards and
report it to userspace only if there was a change.

> > > > Second, MST IRQ_HPD is level-sticky -- as long as the ACK has not b=
een
> > > > cleared, the IRQ keeps firing repeatedly, and MST bring-up (link
> > > > training
> > > > / MST enable handshake) itself generates a burst of IRQ_HPDs. So th=
is is
> > > > not about "one extra hotplug", but about a burst of them within a s=
hort
> > > > window.
> > > =

> > > Ok, if it is level-sticky, it should be handled as such.
> > > =

> > > > =

> > > > Every one of those hotplugs is delivered to userspace via udev and
> > > > prompts the compositor to re-probe the connector. In the window bef=
ore
> > > > mst_active is set, that re-probe walks back into msm_dp_bridge_dete=
ct()
> > > > and performs aux/DPCD accesses, racing with the MST enable flow.
> > > =

> > > If there is a race, the path needs to have a lock, preventing concurr=
ent
> > > access. Otherwise, you are just shortening the window instead of solv=
ing
> > > the problem.
> > > =

> > > > =

> > > > The amplification also isn't limited to a single connector: on Hamoa
> > > > there are 4 connectors (3x DP + eDP), and we observe that a hotplug=
 on
> > > > any one connector causes the compositor to re-query all 4. So this =
burst
> > > =

> > > Please fix the compositor, it should not need to query all 4 connecto=
rs
> > > if the HPD event came from the single one.
> > > =

> > > > of spurious IRQ_HPDs during MST enable ends up amplified across the
> > > > whole card.
> > > =

> > > How do i915, amdgpu and nouveau respond to IRQ_HPD? When do they send
> > > the HPD event to the userspace?
> > > =

> > The driver revalidates the actual connector state, and a hotplug event
> > is triggered only when an actual connector state change or a link status
> > change is detected.
> > > > > > A NULL pointer indicates that hotplug suppression is not suppor=
ted by
> > > > > > the caller, such as the connector detect polling path.
> > > > > =

> > > > > And nothing in this patch makes any use of it. I'd say, it's
> > > > > questionable addition. Let me check other patches...
> > > > > =

> > > > You are right, I will reorganize the patches in next patchset.
> > > > > > =

> > > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > > ---
> > > > > > =A0=A0 drivers/gpu/drm/bridge/lontium-lt9611uxc.c=A0=A0=A0=A0 |=
=A0 3 ++-
> > > > > > =A0=A0 drivers/gpu/drm/display/drm_bridge_connector.c | 15 ++++=
+++++------
> > > > > > =A0=A0 drivers/gpu/drm/meson/meson_encoder_hdmi.c=A0=A0=A0=A0 |=
=A0 3 ++-
> > > > > > =A0=A0 drivers/gpu/drm/msm/dp/dp_display.c=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0 3 ++-
> > > > > > =A0=A0 drivers/gpu/drm/msm/dp/dp_drm.h=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 |=A0 3 ++-
> > > > > > =A0=A0 drivers/gpu/drm/omapdrm/dss/hdmi4.c=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 |=A0 3 ++-
> > > > > > =A0=A0 include/drm/drm_bridge.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 3 ++-
> > > > > > =A0=A0 7 files changed, 21 insertions(+), 12 deletions(-)
> > > > > =

> > > > =

> > > =

> > =

> =


-- =

With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
