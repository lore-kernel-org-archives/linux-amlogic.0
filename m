Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409F6C5DF87
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Aug 2026 07:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u75LkVVc9MczNCUyTbDbB9jS9bRHMy4Es6eTxEtCwE0=; b=UGrElPW9IEbsqf
	50NP4w26+ETVAmJSL4b810WG/PyntB1OKOE2m1lcpFqMGuHU+HPRH2A7lrmnffXpe46e6aQoUIJkt
	a65n1GRTz4abtW2KI98fr/5oqafaRTNuQ+1yeMyOW6zH05vEdDE/kl3knnbnFsqlwNv4+y64UV004
	kRZMHidf8G/JT4ZKNjPlPLBtSx+qXrd3kXP7Aofw+hYdLf5IOWxq6zuNkaqhgy9di4aWYQs3AEBJm
	O0JO/Nfzqs2fwm98OFv2WMaP8KzRcsENPNPWCs+goftcdisT9quZs7yNwGF0mcLPkleNr653eVrqh
	fDzyL7GSqkzlsnwx3MXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJYd-0000000Cgq8-2H7l;
	Fri, 21 Aug 2026 07:20:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJYa-0000000Cgp5-2HCZ
	for linux-amlogic@lists.infradead.org;
	Fri, 21 Aug 2026 07:20:54 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L5TiRv1366829
	for <linux-amlogic@lists.infradead.org>; Fri, 21 Aug 2026 07:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U4hIfsztrJ5/Bunzr0Zeq8RzRG+Rg+6qQ9vg35INQbw=; b=cVEICEyT5E6nAFNG
	2Se+uBa/wtqan+H2cfzDMIjfK/vHT20R4YCL7+6CmHUk/xTgmLdIEcbsWA+fZpvj
	H9hmGhLFwPdMSB6dwQIHtYbPn55bNV4pHFpMcQ79UuXwjor6DwP8UF6ojhZBXS6x
	nArFj66KhIREoTlJ8PYKiPJrUzRaM3GAHo3AJngR0U7G3unrKjiUaS4lS10BY/8j
	1Es2j3Zra1sskBdl5A5+C0Z7nRT+hrpygT29ulNtRlah95iKzEgLM0M3iW06WGlP
	IaIinyWQUjPApye+jlGeBb28spz6yqZrChTZZN8MsM4IM1lDG5Wj10OTYlVnzNSW
	r+Ef5w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gdn8cp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 21 Aug 2026 07:20:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso1179698a91.0
        for <linux-amlogic@lists.infradead.org>; Fri, 21 Aug 2026 00:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787296850; x=1787901650; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4hIfsztrJ5/Bunzr0Zeq8RzRG+Rg+6qQ9vg35INQbw=;
        b=dWI4BA3RsbzmiW4mzZajE/trqCr4NkbgMjg57+ycf2rscDhSajkD/W4cAxr2eOqjwJ
         B354VAJYpca+CDSn/C3w40kEj6AyGDFLroiMUc+FJJ1xjL0CC1R3LC5RtC0ANQm/GN1J
         nNhlS/uU7PeamBDPmn6mW0luByd/0SKucuGVIMcaXzDbYvtDtZ5MGvkt6rgAp87QY5+d
         dr4P9NJ7Ve+bOA1PGcqx/pe+NvWnPywhWt9GhBbINB+JHF2ItSexrPyNe0TuLLRDqiWG
         2VN7w7ru5EY5ZiJaF3llVAMV9YbsQExTPtfAcu2rM+ohVkwG6eJDbDwon7JBtIAa8ATY
         agkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787296850; x=1787901650;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4hIfsztrJ5/Bunzr0Zeq8RzRG+Rg+6qQ9vg35INQbw=;
        b=d87nKY5O+clqF7x9nfBrwqGLY9npVz1UiRPy2UXxQKS+cUOHVvM9c0bRjz0AFerqsw
         xPqlFOpW+ze7GtsOcdlY1VlXVa4pVRiKxAOfNzFqRsNXJwAfvxuAwf+ZWBHG2mgeyINb
         MIRjV1NAHfYncH6o2pohapRbhDERuD3T+e7ayDngxKGg5jqWDEcmKlDoDkgXG+j2anXU
         BkRGWBO555VVJcZpgsiY/7ZXswd4t8HG5MI6XVa8KSYdjv/mcu9RHWRqrOa8hvr6SWX8
         1swuqTczEH03BcydJ+MV8S6nDruVbbZde2zM9skf5CW/jV4aTmZuJy7N8/yjWt8rBMoj
         M5Hw==
X-Forwarded-Encrypted: i=1; AHgh+RoB0iVGIVyrovj4k0IQU9FfGHu31Uku6HHJOvpm0k1GX97EAdZRMJZOCnOYtRE8Q2mO0p3tD8r5MeeKz0HL@lists.infradead.org
X-Gm-Message-State: AFuF++kfUT8cNFYpJ7GOfdAv9j6y8wbbAneQPbvvFx9zisBjoLc/xRId
	eQR4kemwKCVn3fe4+tsFfm+wxMnTN68MFc8ZUjzcyVzQPE9rcAAr7pNc1J0m5HenvVN73Pj7FJL
	GTv7rNzLS/cBrclSI6unhO2zZoo0AJNbazprTsBDha7m4mky2/XCh0shq7+5rwtrlSizDehKenQ
	==
X-Gm-Gg: AR+sD12uXtCxRTHah3m+0678IRh3uDY/D31DzKZRfgZPtrqN6kgTCeMWbEwlobEa38O
	evejZkn61Wn0elGGR6Ka2XGKPDaAhhgdx/pPH7ZurxQDTl+NKBpzN0dIN+mxE1osH3ovGozUMWv
	1V2JD2zCtWR3j3PxJMN86GQd+kMz+i3pnPSQpdqxlZcz6SzO4rgfHU+TgeBW13Wzm3zgnSOJ/Tm
	UzhCoo1PZNA/e+2KJCDMN5glP8xv57yxAP1VX33s9RenOrLtb7I59gvlO+7D9upYhysUHMBiTtR
	aOqgPRWsaAARYACWqRe9X4RhcYeA1FjIP1GDi6K8ws69YBAym5rLCdgPa7JOkJf0M2WIoMJlBGp
	SFuPKwwYirX6WXFMa31qkKll3sYA1fNAYScx3Qwz/xoOcgd7/cn06BjAuT7tOPapY+dnpi3k=
X-Received: by 2002:a17:90b:2ccb:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-395c35ba5aemr8334026a91.10.1787296850327;
        Fri, 21 Aug 2026 00:20:50 -0700 (PDT)
X-Received: by 2002:a17:90b:2ccb:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-395c35ba5aemr8333915a91.10.1787296849773;
        Fri, 21 Aug 2026 00:20:49 -0700 (PDT)
Received: from [10.133.33.40] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c46b88e9sm1995751a91.7.2026.08.21.00.20.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 00:20:49 -0700 (PDT)
Message-ID: <dd375289-0174-41ad-980f-f027fad976f6@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 15:20:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/bridge: allow hpd_notify() to suppress connector
 hotplug events
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Dmitry Baryshkov
 <lumag@kernel.org>,
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
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-1-646a10256233@oss.qualcomm.com>
 <cgk2httvebzm2jnjnb437mutez66tfozzdk77mjwukfzngdioh@mu46u3pwlf2u>
 <af5f2e4f-42a2-49f3-9c6c-0f910c5f9208@oss.qualcomm.com>
 <pyqpajtjcnslk6g5ysn3ce2csrb76fhd5bif4vdb6wezomlmsg@fsl55exyufx2>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <pyqpajtjcnslk6g5ysn3ce2csrb76fhd5bif4vdb6wezomlmsg@fsl55exyufx2>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA1MSBTYWx0ZWRfX/Oky/MXZFuVK
 F5cltew0f/RnUp1Lv3PlZ3Nh2bD2GKoeZ7Ji9VyAWFFQilFAMbFLnt04KjUyLrk6wNGTGuujTAI
 4jSF/yolYoVIhyzBOO4mSZ5+r92UXVrLSZ0V18Nbq/+dwJ3mzBaRMWjI3z8WO8SH5Q7SJ0o6Uob
 nWATc4o1itWElyMexopAfOCqPpqkEutTLXBTe5ZGJ2DU7ROowMiVtW2NUT4xwGSIm7jLeTVE8wd
 Fp5YCufLNJegyAYTPLCeWSJ4MSSkO/fDMkdW5JeaNk2CJ3IK3LLSTdLeGcAGRMujapJGhBQmCUI
 1EwjfSR+RV94oErcUuH49f8N5il0j6WP+wHVVb3gR8wKK62797eqz31nOkYoogVVifMTLjimUNa
 I15yt64t0w5soIPQj3KdytOIJkimsrjUOJZI7e/tXQiv4KP5ckTxcw7vejBP3I9IGMfQpI9W3Si
 o3mog/v6hvIWCtFf7Uw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA1MSBTYWx0ZWRfX3eIGj8l4xjWM
 01v4JZZbZmIw/gVKtO5KbtQLO71uxzGfONn7y/JNEPT5GxTwH+ZwIavm0Hl263lyxfrVg/sb1WN
 goSqKEQeh43zI7/vXG8tV9lsHlmaR4w=
X-Proofpoint-ORIG-GUID: xZlTfrv9FO6Lo2P3kkffeDJYIPWeSYck
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=6a87fc53 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=h0lqEGe5wbmRA1m2260A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: xZlTfrv9FO6Lo2P3kkffeDJYIPWeSYck
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_002052_713364_46A2AFF6 
X-CRM114-Status: GOOD (  35.67  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 8/18/2026 11:01 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 17, 2026 at 04:01:41PM +0800, Yongxing Mou wrote:
>>
>>
>> On 7/12/2026 6:21 PM, Dmitry Baryshkov wrote:
>>> On Mon, Jun 29, 2026 at 10:48:03PM +0800, Yongxing Mou wrote:
>>>> The bridge connector framework currently invokes all bridge
>>>> hpd_notify() callbacks and unconditionally emits a connector hotplug
>>>> event afterwards.
>>>>
>>>> However, not every HPD notification requires a userspace hotplug event.
>>>>
>>>> In particular, DP MST bridges may use hpd_notify() to propagate HPD and
>>>> IRQ notifications through the bridge chain while the actual hotplug
>>>> handling is performed by the DRM DP MST core. Connector creation,
>>>> removal and userspace hotplug events are already managed by the MST
>>>> topology framework.
>>>>
>>>> Allow hpd_notify() implementations to suppress the bridge connector
>>>> hotplug event by introducing a bool *send_hotplug parameter. Drivers
>>>> can clear this flag when HPD processing should not result in a
>>>> connector hotplug notification.
>>>
>>> Why? Worst case the kernel receives another hotplug notification which
>>> gets ignored by the driver.
>>>
>> Hi, thanks for reviwing those patches.
>> Let me try to explain the motivation.
>>
>> Semantically, IRQ_HPD is just an IRQ notification, not a connection state
>> transition, and shouldn't be turned into a userspace hotplug in the first
>> place. However, drm_bridge_connector_handle_hpd() currently calls
>> drm_kms_helper_connector_hotplug_event() unconditionally after processing
>> the event, so every IRQ_HPD ends up reported as a hotplug.
> 
> What if the IRQ_HPD is delivered together with the first HPD event (for
> example because of the TCPM processing those events)? See the mechanism
> in the displayport.c AltMode driver.
> 
The DRM API should simply pass both long HPD IRQs and short HPD IRQs to 
the driver as they are, and let the driver decide how to handle them. 
Based on my review of the implementations from all three vendors, when 
long and short HPD IRQs occur simultaneously, the long HPD IRQ is always 
handled first, followed by the short HPD IRQ.

I have another thought regarding the current DRM API. Could we have the 
DRM layer pass only the HPD event information (long IRQ and/or short 
IRQ) instead of connector status, and leave all handling decisions to 
the driver? The DRM core would simply report LONG_HPD | SHORT_HPD, and 
each driver could decide how to process the event. This seems like a 
pattern that could be shared across different drivers.

This is just my current understanding. Please let me know if I've missed 
anything or got something wrong. Thanks.
>> Second, MST IRQ_HPD is level-sticky -- as long as the ACK has not been
>> cleared, the IRQ keeps firing repeatedly, and MST bring-up (link training
>> / MST enable handshake) itself generates a burst of IRQ_HPDs. So this is
>> not about "one extra hotplug", but about a burst of them within a short
>> window.
> 
> Ok, if it is level-sticky, it should be handled as such.
> 
>>
>> Every one of those hotplugs is delivered to userspace via udev and
>> prompts the compositor to re-probe the connector. In the window before
>> mst_active is set, that re-probe walks back into msm_dp_bridge_detect()
>> and performs aux/DPCD accesses, racing with the MST enable flow.
> 
> If there is a race, the path needs to have a lock, preventing concurrent
> access. Otherwise, you are just shortening the window instead of solving
> the problem.
> 
>>
>> The amplification also isn't limited to a single connector: on Hamoa
>> there are 4 connectors (3x DP + eDP), and we observe that a hotplug on
>> any one connector causes the compositor to re-query all 4. So this burst
> 
> Please fix the compositor, it should not need to query all 4 connectors
> if the HPD event came from the single one.
> 
>> of spurious IRQ_HPDs during MST enable ends up amplified across the
>> whole card.
> 
> How do i915, amdgpu and nouveau respond to IRQ_HPD? When do they send
> the HPD event to the userspace?
> 
The driver revalidates the actual connector state, and a hotplug event 
is triggered only when an actual connector state change or a link status 
change is detected.
>>>> A NULL pointer indicates that hotplug suppression is not supported by
>>>> the caller, such as the connector detect polling path.
>>>
>>> And nothing in this patch makes any use of it. I'd say, it's
>>> questionable addition. Let me check other patches...
>>>
>> You are right, I will reorganize the patches in next patchset.
>>>>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
>>>>    drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++------
>>>>    drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
>>>>    drivers/gpu/drm/msm/dp/dp_display.c            |  3 ++-
>>>>    drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
>>>>    drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
>>>>    include/drm/drm_bridge.h                       |  3 ++-
>>>>    7 files changed, 21 insertions(+), 12 deletions(-)
>>>
>>
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
