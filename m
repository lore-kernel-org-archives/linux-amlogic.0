Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA74C5CFC1
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2026 08:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BYXnJOzYMIVY3YdM5ydWCGtKuFXFnZyq9nAoKdhmIaA=; b=VCimFGdiTjHmy2
	TJ85TjeJsJCuNttTzsqjh0UZ+8Sk9oTS3IEckuNhPtleJP4EmC12aaJvl91GGApvkcizHBKfN1b4o
	dNf1n6jL/e+yIvci0IvIKVaEvRQZqDTXBIu0/PFWIHCZleTjjLzk8dX1R5LmjUDhZveswFiFFFuay
	hJDcoWnuUJoMvLj7iaSl3w4pYPnDa7LCfxq1omnnrNY68IQVUMmJpJ/jNNxSpg6F9M6A3fNEzOwJ0
	3BXvCGmPkBwXZyamvR0BUVz6YOSCfhInQlIwo1JTF5gpwtfiuYalr9zwarrQua1NH/yZqIPnLmnf9
	SGtTxZyBVFDJJEQvuS5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsIe-00000005cT8-0pAc;
	Mon, 17 Aug 2026 08:02:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsIb-00000005cR3-0lrC
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Aug 2026 08:02:27 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H73e28164106
	for <linux-amlogic@lists.infradead.org>; Mon, 17 Aug 2026 08:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rdLyylUE5b6H5mJfPKhLhaC/fcZHtchZG+7kuZxWmc8=; b=ZR9HJbvsksB9XvRq
	sULsFfHCIYHSf//AXumseNMzuTQqbikY5wNz6yzatHNjcUOy3BRxNau0ieE+mGJi
	lLHC9ybmLvaWQfSuou4l67Tm6vi2uOMveMp+8ri6PeSsdejVej6QmgVHYMZkdzUz
	jyQVARS6hbm3gNmba0iSUa+VRsHSzDVJppn1ebxSU/BTmAfX4+QWW6f5qXqQ21B7
	VvSofF0vBBXwSQG2GHg22qmtxVL1dhseRqTvTUrNLZrgGXuBio668Dl/1tRgVFSf
	kuiNYfBLgVfzwQq+jEgTIVYMxYbUihu57vnqpl+OQkzkFl6uHJwF2ZgAik1P6qZi
	ftb6hg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghk5y2v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 17 Aug 2026 08:02:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfe3fa93bso31546181cf.2
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Aug 2026 01:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786953743; x=1787558543; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rdLyylUE5b6H5mJfPKhLhaC/fcZHtchZG+7kuZxWmc8=;
        b=VISNLxhUG8odiqzVqPZLLGwC27vLA0A39Yh6jY3GLNLz19xCH2mKojidraermrqCBA
         AW3Z/VnLSUfV4GqGWJ1Duhm6hVhW/d6KQieoR0Wx0PhQcSz6CIvZ3gJGumfLtzUF/9qF
         OhKuWJDTAy/SUDpGe8hiWFvadUpEQq89HtNw5T3xDWpCaOY7/q8YlSIcehEQdpIxmqhR
         NYZz647dp434Afv4+d/f7Uje2+eXez1HIfllyo6vUliMPunYFozkRcG5HjBq3K2LdCiE
         Dd4Uatg961Z5TzBZQPrm/X4rgn2Q8yjdB0ufP/CuUfzBO1pfeiTHiqOspwu6KWsHOctU
         nQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953743; x=1787558543;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rdLyylUE5b6H5mJfPKhLhaC/fcZHtchZG+7kuZxWmc8=;
        b=KlFDe5N0vuB9icBEWKSyTIJQtOeoH6GUjdycaFIWhRzE4nIWc643g7SoX6lnh3lEKJ
         Vn9nD+COsF+8XKJjVVfe0IgKqkFsACslveWA1bGw8TJaM6Mbivl37JkLWV7z7soxobtz
         z5jyo3co11YWsaHRuYR+km65kaldB+q4hSK+2YZwxKVGP1k48sPIDlyxTeElwyaBjUKr
         sS9VTb9b9Cfn4v9a5KfNTPnCS4LeYH+lAnDp1l6y/GPp6KeYDVPoXaM3LbTqzLOlXjhA
         Nz6iMoEMTnqBytSkdlwEIpdsJ4Pdm6INH6RoX7BDgG2K6et/cUGtmOkXpEW1c7aK5+sH
         Pmzg==
X-Forwarded-Encrypted: i=1; AHgh+RpRdVj51/3W/Lm/mJov0AC1DCeSOS/djRIrwCIn9Cq938deIxJsOGG8zX+RnsDQ0sDtMMLmpHQ1M7H6PrkR@lists.infradead.org
X-Gm-Message-State: AOJu0YxC7kqfvjOMxBK+DtNHAGqEkjqPJtW96XVl4qEcCT3MWep7e0Av
	MeCPsQetKavIYPoMhxg4D75xn1IpwytPcy9Rnjvwm6abeUnqx7EWhvad7FpUyJRM2oweOo2w37Y
	gvoGUAw1MDoOyWeKZKCryj+31Wc9FmedM5nHNJPjr+LsFRMtqF/FD5huxO3xqcTwB81arleQd3w
	==
X-Gm-Gg: AR+sD11+3dlD5ozl9jZPCFjkdyf4WC/n0pRcJgB0bbiyNA2/bVcRh3ISqHZLh8Ud1EP
	q3fQhYl6GUSri8fAXLWtH0cRcDrLx9nvw5SFpSL3a+zAgAufbA0unJNbRUSBYOLk+HxI1g1H/fT
	NwTpwOymXUXgpjLW+xmhXILSCwbB9hMUDR7KjVPVDNlgvhzWONX0jYb03Ux9MSQFP9qFrpLyT22
	8v3WZjknl3BwuJ4HS0YX+KWatB9kqZ1lRopseifkeStdoQDzS1duNFJCnatKdc69axTSToikojk
	VpOb+77okI6cHKDv3qAEA8oCl6p576TtG+FidJ/AhrhbEAzFbUWE84kGQvLUH6VAs9naQ9KkWgx
	oT/JHX+WJTvpZLjLHaLGY7yQjKDc/TCqapf6BJhfuEcNcuxb98havYZLnGS/cXyx/5A==
X-Received: by 2002:a05:622a:614:b0:52d:41d0:89e0 with SMTP id d75a77b69052e-52d855839d9mr232646461cf.40.1786953743278;
        Mon, 17 Aug 2026 01:02:23 -0700 (PDT)
X-Received: by 2002:a05:622a:614:b0:52d:41d0:89e0 with SMTP id d75a77b69052e-52d855839d9mr232645661cf.40.1786953742432;
        Mon, 17 Aug 2026 01:02:22 -0700 (PDT)
Received: from [10.111.162.109] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52db610b491sm8343721cf.8.2026.08.17.01.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 01:02:21 -0700 (PDT)
Message-ID: <2351cc75-ccf8-4ff0-a558-c29ccd2b86b9@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:02:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/msm/dp: report IRQ_HPD as an IRQ-only
 notification
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
 <20260629-msm-dp-msttypec-v1-4-646a10256233@oss.qualcomm.com>
 <zmnftag6s6mxvnoqdzouhpdcbwscm6sfzrqkzgwrcptgbr53cx@jetw2gtov7qp>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <zmnftag6s6mxvnoqdzouhpdcbwscm6sfzrqkzgwrcptgbr53cx@jetw2gtov7qp>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA1OSBTYWx0ZWRfX2jTv8LJMaboS
 E4JdPGiZ2WQZxt+yAUBbFCIDHQZnEUMtPKg9u2JqkeoNXtW9Dn+NhIxqYD6J/SQhTu6Skh9PRke
 xP05kgEgJ2jQw/Y/6J2hobXI1tyWFLs=
X-Proofpoint-GUID: ACFJSF9v50ezLJr1oyAchUhrpBoATdgk
X-Authority-Analysis: v=2.4 cv=f+14wuyM c=1 sm=1 tr=0 ts=6a82c010 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=tg9PfV-btg9rSNVD8o8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA1OSBTYWx0ZWRfXzNjMY5BXOIjG
 UoU4lj/yiA4LzFMmS2X/wGuRTuxAvaSwIDkm9e3F1v1j5JV97/zRskBU8icr35pgf3IiN6PQcFM
 wlfHFsEWyxIzyN0PUHuVW9y311mwereJIfIAW4U8F9wGIrgnYNE/L/Le4QW8tsOWPkOstIqWc9W
 bv+hwBon8pwoDfVNev7pQpQJgslbWeD91crijBK57ehRfny60EuF1jEC8/xigAuMy+JX61swpMT
 grGVlA2KMV/PxofhAIoECXiqnz+SZlDe1gi1aL30AauQbEAGFO2Jyny1YTWpnCiY3fqV06Mbef6
 xDKur4/lqya0iBmP6ZZzu/TFinPuj1VnI0I7YtmJlUkBk/QHE0L0n5+JgMgrLMlJteWc5usjO6t
 2mtuHUGmi8ECOfV5lmoSdgD5YxqIKnO5qkt/KhgqFVC2VKkm4pGUx1V0VQlClAqSdbieitb1Fe0
 7D7d66PEd9o21AUAtqg==
X-Proofpoint-ORIG-GUID: ACFJSF9v50ezLJr1oyAchUhrpBoATdgk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_010225_354364_2D46E8EE 
X-CRM114-Status: GOOD (  30.22  )
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



On 7/12/2026 6:55 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 10:48:06PM +0800, Yongxing Mou wrote:
>> MST reuses the SST connector bridge to propagate HPD IRQ events through
>> the bridge chain.
>>
>> For IRQ_HPD notifications there is no connector state transition to
>> report. Use connector_status_unknown together with
>> DRM_CONNECTOR_DP_IRQ_HPD so that the bridge connector framework treats
>> them as IRQ-only notifications and forwards them without modifying
>> connector state.
>>
>> The DP driver handles IRQ_HPD events based on
>> DRM_CONNECTOR_DP_IRQ_HPD rather than connector status transitions.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c   | 22 +++++++++-------------
>>   drivers/soc/qcom/pmic_glink_altmode.c | 14 +++++++++-----
> 
> And which tree (and why) would be able to merge this patch?
> 
Emm , I will split the patch and reorganize it.
>>   2 files changed, 18 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index bc93b566fbca..4ee391cc7165 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1119,14 +1119,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
>>   		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
>>   				      connector_status_connected);
>>   
>> -	/* Send HPD as connected and distinguish it in the notifier */
>> -	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
>> -		if (dp->msm_dp_display.mst_active)
>> -			msm_dp_irq_hpd_handle(dp);
>> -		else
>> -			drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
>> -					      connector_status_connected);
>> -	}
>> +	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
>> +		drm_bridge_hpd_notify_extra(dp->msm_dp_display.bridge,
>> +					    connector_status_unknown,
> 
> It's _not_ unknown.
> 
Same as my reply to 2/5 -- the status is indeed not unknown here, and
using connector_status_unknown as a sentinel in v1 is not appropriate.
I will fix this in v2 along the direction discussed on 2/5.
>> +					    DRM_CONNECTOR_DP_IRQ_HPD);
> 
> This should be fixed in the MST patchset. You should not be doing any
> actual handling in the ISR routing.
> 
>>   
>>   	ret = IRQ_HANDLED;
>>   
>> @@ -1781,11 +1777,11 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>>   	drm_dbg_dp(dp->drm_dev, "type=%d link hpd_link_status=0x%x, status=%d\n",
>>   		   msm_dp_display->connector_type, hpd_link_status, status);
>>   
>> -	if (status == connector_status_connected) {
>> -		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
>> -		    extra_status == DRM_CONNECTOR_DP_IRQ_HPD) {
>> -			msm_dp_irq_hpd_handle(dp);
>> -		} else if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
>> +	if (extra_status == DRM_CONNECTOR_DP_IRQ_HPD ||
>> +	    hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
>> +		msm_dp_irq_hpd_handle(dp);
> 
> ANd here you missed the case when IRQ_HPD is being reported together
> with the first HPD event.
> 
Yes, will fix it next patchset.
>> +	} else if (status == connector_status_connected) {
>> +		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
>>   			msm_dp_hpd_unplug_handle(dp);
>>   			msm_dp_hpd_plug_handle(dp);
>>   		} else {
>> diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
>> index 946eb20b8f83..28ab8cbb5ef9 100644
>> --- a/drivers/soc/qcom/pmic_glink_altmode.c
>> +++ b/drivers/soc/qcom/pmic_glink_altmode.c
>> @@ -373,11 +373,15 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
>>   		else
>>   			conn_status = connector_status_disconnected;
>>   
>> -		drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
>> -						conn_status,
>> -						alt_port->hpd_irq ?
>> -						DRM_CONNECTOR_DP_IRQ_HPD :
>> -						DRM_CONNECTOR_NO_EXTRA_STATUS);
>> +		if (alt_port->hpd_irq) {
>> +			drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
>> +							connector_status_unknown,
> 
> And this is completely wrong. The AltMode driver (btw, you also missed
> the normal altmode driver for DP) doesn't know if it should handle the
> events in some way. It should report the HPD and IRQ_HPD as is.
> 
Will fix it next patchset .
>> +							DRM_CONNECTOR_DP_IRQ_HPD);
>> +		} else {
>> +			drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
>> +							conn_status,
>> +							DRM_CONNECTOR_NO_EXTRA_STATUS);
>> +		}
>>   	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
>>   		if (alt_port->svid == USB_TYPEC_TBT_SID)
>>   			pmic_glink_altmode_enable_tbt(altmode, alt_port);
>>
>> -- 
>> 2.43.0
>>
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
