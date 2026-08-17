Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE53FC5CFC1
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2026 08:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zkbfSbdOm/1T4TEL4IS+xlduqugx8uQupKwRy6u/n3I=; b=uD4EmmkZEHUXy/
	go9iy4w30QLTxUbgi/TwERv9tXF9fsxZrcmyUWEn0dc0wZVkZmasDr5fWb6yIJPahOxaH99i8lYin
	EKKfhXGL7r72kvF2pRvooeszYNpHW7eq+Ti8jkbARYCoDd+lB3UBwkE1vH15msMQYslXd9KN9xOkd
	lsjk4QV7Nju4yjRBhVoRgmgot6wKCNhAfktMBluZrPVgRctH08zU2p26jzrbo5k2BrLllzOAxc99c
	RZbww/YX+nOoPse/R6rWA1921uoOw+7+hX+1Oe/1WPL5OZLYnBhVYHAXCaFlLqmWZtWAv5Dpd4VNQ
	WJL+FZUuACGq6WUbHcKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsIC-00000005cFE-2MAe;
	Mon, 17 Aug 2026 08:02:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsI9-00000005cDn-3j8x
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Aug 2026 08:01:59 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H74bUg373131
	for <linux-amlogic@lists.infradead.org>; Mon, 17 Aug 2026 08:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eq8SMRnl+krHyl5tGUy7vPAIIuXfNAkaAWBYuPBe/EU=; b=WSA7haT7QLcAAVEt
	ONRKNoDofW1w8mN1KBhyv1VtIavVNsAZMGd6TJRH3nOCfCKgOgzvgeaMtyj8qscw
	vN7o/MPqQXOmHKRbcn/WW4nw3NJ+m0mi/2CQIzUefxe9K79ureQNZRJe0Dvw2imq
	Bbks4wdqt+M0oWPU2bd+HfNNz1QLxlmPeUOvThVnVCjFCNYZTtMdWz3f7UG4LJpn
	1oX7x2Bv/3MXghQPecuKhF23mUOlAPpj/28IwdP7m7x2nV7xEJ/WMLSId12AqK/i
	sWUHbwxmPd7Dknd5ikp8Rw/cZTCULcXBI3eln8hs0CNTC5wMZVTu34IAdSu7Y2Jn
	Bbjbng==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wke07r8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 17 Aug 2026 08:01:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d7b3b6aa2so32228771cf.1
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Aug 2026 01:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786953716; x=1787558516; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eq8SMRnl+krHyl5tGUy7vPAIIuXfNAkaAWBYuPBe/EU=;
        b=Y0vreCbuz5kWJbM4ysgdfbcfJlIYzYdgmeZTFXExSy8BnmcZ31liWY+/rcs1PXYzMm
         ZISMeTbDU99SVF/qLIqXj5CvmWhVUiP5WcBWnlLmsZO6sArPf705LPfdJFGTAuFRF1T+
         dwHMrFvF8o4ieyo2OQl1UYbYu94eiM4sIBVjl6YE45UtEU+0eQFwipzmtc1LsmUpYfOb
         BlvVmNb1jjtXj/zB25+P2ZSZ/N97PBYFFiORxaorMIRBZjnkV3gqrVp4+05zGsvFW2oz
         wbvvODh7+pcOrlV74qQidYCUMrtfu6X53FR3G80r7Yjelq8odNyalieJ0UhyajvCQVug
         nyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953716; x=1787558516;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eq8SMRnl+krHyl5tGUy7vPAIIuXfNAkaAWBYuPBe/EU=;
        b=bR2xm59D6xNJ1/IsTr5GO9Hw0/HY0NeiZ+v3xxZVFy9BP8QZM9ShX1lkniurlgl7/J
         iITPUayLEiVXQr8Tf7piHFhuprwrcw0sV75Mpa+AlduhTB3Asn1dWnTbXq5Sxps2tHi3
         mNxcqvdmYWrEWtHoZZ5dtOZyqLMdUhQjWuzwaAV89i0mH/a8YZq//2mYPdWDUzQd/2c/
         ZfNr2Ph48Sukhpi8WyFIAOnC6Xr2M2TE63Ps/myG+LB9Q+nesyd1eFFwQWc3jc5NgNGe
         5TB9yALwK0cHkuaCN+1sjY2rueEvuvTpXLBEMVzOK08NnAOG8pj+XQ5oIXaVhnNxDHqF
         2l8g==
X-Forwarded-Encrypted: i=1; AHgh+Rr6KQvBXTaM3gZO/y0eP+xxt/vL7VYKCk5Yl6r/kEBCEDHmOo5+2UIrgXmEAt0xD8fp7s3MtIePShJz149g@lists.infradead.org
X-Gm-Message-State: AOJu0YxLgnQkfun4+l9+XuH7RlzK4EbPsx24KkXgS0ZpXGSyA56R50vg
	Q66kJ614/jkgIYzXrm9x5UnLldDgZX7x2JXVs7osdrfdTS53qHwFJh0YKKA4YcrmORCN99LdnWa
	e7pTurXYiivHA+3hgG0/Vzh9JwZ0pR2u/YLnLlWI6FCwS2JURHMWcMbzbUbsDvT7TR+rOQWy08g
	==
X-Gm-Gg: AR+sD116sKfRhpEgS7Gxz+ovx0vMnq4xyl4NhCMKRuO5OdE7E/m0XUBGwiS1Z1ihsZd
	fPDUK62Z/HeMsUtmzVwMx2HlQBQv+L8B34wqHcO2Qasik/IRLagjByz/fhpn8COGNCPjUM8mMzC
	6JJX3/Niv1qWSbQNxA3N8M/Z8OqFkek3fxOON5GuGitWMceGqAxS6scLfcZeo+76E9tbhDKzN3x
	8bJZXfCAUTzxm2irU33FQ2jEaMcsfZaqIYK7f1sjWhwLng/YS3BWvecysVO9Ly7lOf7hS0zMMig
	3aoFL7BpQuCEHSzp4E+BJhrHXbBHTspq8Cf+zXtjqztVB75jzpIAK8Uh/Q9nit6wzNdtV3k0QDm
	oWF4Fs0GrawPY0FU77CEGdo66GAzT3B9HfZMv7aLx1uJzz8WmbIDy1DKrUJgWu0DTMw==
X-Received: by 2002:ac8:6104:0:b0:51c:92a0:b2cb with SMTP id d75a77b69052e-52d854ce987mr241475761cf.26.1786953716182;
        Mon, 17 Aug 2026 01:01:56 -0700 (PDT)
X-Received: by 2002:ac8:6104:0:b0:51c:92a0:b2cb with SMTP id d75a77b69052e-52d854ce987mr241474961cf.26.1786953715521;
        Mon, 17 Aug 2026 01:01:55 -0700 (PDT)
Received: from [10.111.162.109] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52db612c2bfsm8319271cf.11.2026.08.17.01.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 01:01:55 -0700 (PDT)
Message-ID: <d4e96255-814e-4fb5-8d97-50126a61c20b@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:01:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/msm/dp: suppress bridge hotplug events during MST
 operation
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
 <20260629-msm-dp-msttypec-v1-3-646a10256233@oss.qualcomm.com>
 <fozk5fz6bgat55vmlgyvovnmfzabjprna46cmcaoh4jyrwmbtu@k2qtjgip5vg3>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <fozk5fz6bgat55vmlgyvovnmfzabjprna46cmcaoh4jyrwmbtu@k2qtjgip5vg3>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA1OSBTYWx0ZWRfX5QOy8PRjWfua
 9s9N/YZYQL3f4TYSdRncPZdoP04z3p9nkfMTCeMQvgtZUnD/oKopEotq/57aEbeDq2Tt/Ny9YBc
 wjAUqrAvHEAe83ygIHGLyHLqn9eWaezflwvLaFspHuBiLLbjaKKTEZHV0QLard9tfLMIR480I5j
 7zEE8z/Ni5eZKPhSPrm5FQrhvx4MkdsmwcA3qubnFjzwajJ8v9U2AWw2odl4348AiYjZV/tG4tA
 B3JjBYy3/pjK3L+el7Lzp1vRcQ9dTXFVSgbR9byp4M1qPDUY3h74HGzdVCYGUHrvYUYbnXF/7xb
 B8bp07pWvAWwMJeqTMEDqC4ujvksVyLqc3XHUdfZc6f0XUM0vL8NbMzrauLC7G3n32mPbec4xWE
 tvhmJGkJvMT/GWKlmGrq+pz9joaYUBJmK4x/pu/aYPZIjOUK2a9irkZScVHUj/rGwxDtoeIY1AW
 tmtsQ9sFotEGfFPqJXg==
X-Authority-Analysis: v=2.4 cv=QetWeMbv c=1 sm=1 tr=0 ts=6a82bff4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4e0XemQSoReXIs4U_p4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: HC3Pnh2L2thEJorP5nv9tHHo3q49c6Fd
X-Proofpoint-GUID: HC3Pnh2L2thEJorP5nv9tHHo3q49c6Fd
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA1OSBTYWx0ZWRfX8dBUDpOZA6PA
 e3CrFIVx2wIwuPkqU94oq5CUn7wOp1tav4Vsoc5pnbwR8udMtcRPar5TBkYP2n7FNLPWqbIvElI
 nalpzaK+Qw+R7kwEgA35FtUUssVQbMs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_010158_073863_DAAEB4C9 
X-CRM114-Status: GOOD (  26.82  )
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



On 7/12/2026 6:44 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 10:48:05PM +0800, Yongxing Mou wrote:
>> The DP MST framework already generates the required hotplug events for
>> MST topology changes.
>>
>> Suppress connector hotplug event generation from the bridge connector
>> path while MST is active, and continue propagating HPD notifications to
>> the DP driver.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/display/drm_bridge_connector.c | 6 ++++--
>>   drivers/gpu/drm/msm/dp/dp_display.c            | 9 ++++++++-
> 
> No, it can't go as this. The drm_bridge_connector part should have been
> a part of the first patch.
> 
Got it.
>>   2 files changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
>> index 7334d6677604..82ed0dc450ab 100644
>> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
>> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
>> @@ -162,6 +162,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
>>   {
>>   	struct drm_connector *connector = &drm_bridge_connector->base;
>>   	struct drm_device *dev = connector->dev;
>> +	bool send_hotplug = true;
>>   
>>   	/*
>>   	 * IRQ-only notification: extra_status carries the event but
>> @@ -179,9 +180,10 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
>>   	connector->status = status;
>>   	mutex_unlock(&dev->mode_config.mutex);
>>   
>> -	drm_bridge_connector_hpd_notify(connector, status, extra_status, NULL);
>> +	drm_bridge_connector_hpd_notify(connector, status, extra_status, &send_hotplug);
>>   
>> -	drm_kms_helper_connector_hotplug_event(connector);
>> +	if (send_hotplug)
>> +		drm_kms_helper_connector_hotplug_event(connector);
> 
> But now I can also see that the idea seems to be incorrect. You are
> preventing the kernel from sending the events, but it doesn't really
> matter. If connection status oscillates, then other components might
> notice it even without the event being sent.
> 
Here our original intent behind suppressing the hotplug was
that, under MST, hotplugs should be sent independently by the MST
framework, rather than being emitted along the IRQ handling path.

Following the extra_status approach you introduced, would it make sense
to let the bridge_connector layer distinguish between long pulses (HPD)
and short pulses (IRQ_HPD) -- a short pulse would not update
connector->status and would not emit a hotplug, only forwarding the
event to the bridge driver. Does this direction sound reasonable to
you?
> 
>>   }
>>   
>>   static void drm_bridge_connector_hpd_cb(void *cb_data,
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 6835c68fe510..bc93b566fbca 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1790,10 +1790,17 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>>   			msm_dp_hpd_plug_handle(dp);
>>   		} else {
>>   			msm_dp_hpd_plug_handle(dp);
>> +			/* mst_active is set in plug_handle; suppress SST hotplug */
>> +			if (send_hotplug && msm_dp_display->mst_active)
>> +				*send_hotplug = false;
>>   		}
>>   	} else {
>> -		if (hpd_link_status == ISR_DISCONNECTED)
>> +		if (!msm_dp_display->mst_active) {
>>   			msm_dp_hpd_unplug_handle(dp);
>> +		} else if (send_hotplug) {
>> +			msm_dp_hpd_unplug_handle(dp);
>> +			*send_hotplug = false;
> 
> Why? Disconnected events definitely should be reported further.
> 
In MST case, MST DRM framework will send the discconnected hotplug by 
msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, false);.
>> +		}
>>   	}
>>   
>>   	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
>>
>> -- 
>> 2.43.0
>>
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
