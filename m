Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC7DC5B572
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2026 08:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=45ngM9HYkDjlOXEkj51EXEyna6RLJFPQbYPhzWvixbI=; b=iQvdjtdlYG/o3X
	lqeBAWHPpRciEyr5A7wLFTbLdzZwI/5ty9c5kGMJmCUCOEcliknw5YkO19FTH6Voi/8lIUSGmWzZ+
	brR26IyDHrV5YnUxuOH2JfhxCq70gOEhKMgS3/OtGkr1PWJhUnwao2JBpoIGPiufP+JUjDN3ULmBM
	ZE6JYS3+b6276i0er+IfvWjXqI/n3n84aa+5cQclzh+KFgYh6zGND0m7aiWNTkQahR46lD5bq0dMp
	HSgpewDkwj4u6mFYQKJWMiNWy4LNuX+SRTq44lzFtIsPpXbQn06p+Jj5LcVPGIPavZ5HXXG/o3/vB
	edGJ8zrbmvpjvIj7L6jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsIL-00000005cJu-3kbw;
	Mon, 17 Aug 2026 08:02:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsIJ-00000005cI2-1rGD
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Aug 2026 08:02:08 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H7sovs1297230
	for <linux-amlogic@lists.infradead.org>; Mon, 17 Aug 2026 08:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EfLblXrI2Wp6ZlzzoorT7wBL5Mi+F/9m9+D7Kvm7TA4=; b=M4gF4Is06pSxY56K
	W3KOFtNM5HsHAYjpCFDzpoJ8wMRVNUAmT2p7b3Ribex5cvyTG+ubAFfuKJNMPV1N
	AyyWnFu09qGPCbxSLwSBLZTZmiSPOsuxNXRLNAvvWPdtlSTi+IjWVy3VWYIXPwfQ
	s3cgXIHPxH9ppMlXGOgudH0+gUzaTEJ4lrdVj66mpLEk6/AKr8zucnJmH9YvsVXb
	jYf3fYfEroD61AVJdHht0op+O4V7Rmybt3iBm+z8g82NNK6C8rQdJg+Txf+5jWUF
	TEsLJfeveNsl4UAdW2TQSAe3iGzW257Tk8eRvYFsWO8q2Aoso5mtZsqenJy9NGP+
	2WXRtQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xb1g0us-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 17 Aug 2026 08:02:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d91cc174aso46266931cf.2
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Aug 2026 01:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786953726; x=1787558526; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EfLblXrI2Wp6ZlzzoorT7wBL5Mi+F/9m9+D7Kvm7TA4=;
        b=aMvMUCQiES7SkAQ2aXK9qUHYz+Xr4w2qvlsAa2PmjqhbCoS0uESKbTCVO8LiFk6iNh
         V4DxuJCDe9ThpRppAn+6DQgIfYaO9x3qnVzGyWNi2yz41tgQDw1cMw32jOlKqgXZrvOL
         hcjsDYnwLF177qe44KgjQ8Z3kEtucTQsSa43FuLj6aSwTVPr95OF4f+PGm1yfpMdTjaV
         qqhPlAVs2z2a5gqKUg3yLzCfcljdpNFZmw7cqS0ofOx+pjvbvC6eSFIqs5b2ZuGj9pWv
         2ZKNgkNzIFz+MIN8gzWptHuzuYt24o8b3znN4HlNfgvKGYTflUNR7KoEJFfCBV0XXiMa
         0Wcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953726; x=1787558526;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EfLblXrI2Wp6ZlzzoorT7wBL5Mi+F/9m9+D7Kvm7TA4=;
        b=e6D36Nk2xXqSrBWjOzLUIpt4+IdQ9j6SwVILB01Nie5Wtrqg9SnLRf4ezehUp/oKDG
         gCOFpzdarArplL0BsUshppr4gOdv9ZwzayMutNM7Swei5Y+MJVb133CGZpLoyREZXCy4
         YS3RXd5Tsl+7hg8D9vHiRnOuLGZMLQQauXjphyzmFFPsNP6sTkRYemeSjtMZH7YT1dWq
         SOfbInXvaxfuhNlVEfZnTxqPIR3nTyalhB14Y75R3kPH/TdtnlZr6FCNu6AfyIH+Bw7b
         eyvgpH+CzrgBvMTbG/GkPWLbBh0WrwHyKb8pbv3XwK07HkQO346UhBjG8c/5Vg2geFBh
         3WGg==
X-Forwarded-Encrypted: i=1; AHgh+Rq9QgyK0Pr+sbJCQeTp8D324bPBh9rqyhzVto+UQDBX3PugB4XOoCLPIYLkUHubZ9CEx8o+SsxmlDsxGYI1@lists.infradead.org
X-Gm-Message-State: AOJu0YyHZSkhYNt4sPIXkmjbBjQwXZGrwFJ9UU3tfJoUwOHXrFvFKmpt
	J2TzRedV32AWbILWmz/pjOpW2wZxpFPYyjYvtdqsTOMrbnnK5T3WdrZyRpxOSBrygWp+T6ELTo7
	y+a7MjTMZf0WFjTpzrHX6hUEuyfajbMF9zQEIPxSzsHENdW+nSvkX0GiHmPDEIn+LcXw1AZ14Ig
	==
X-Gm-Gg: AR+sD10HpXvJRKIt2NIIcapCSx1MRQa+qgotpQxs27GNIxx8R6FmTFhGl1PZriQ/QIn
	TkRe+T26jJ3k6HO0AuzKS6LbnOnv7BiVUrknyTcMvQSo4INR0P/Amxf+ckU17ZK1SRITYNtAInL
	jiYMbOgwt0orA7S0O0xS8cBXf+9f5Tjd5lnmf2z50a+tmfO34/+20GRm0sAzggEVAqYep4bgd/2
	ZNazfAtxa7gpGmj3eVAhRLQTPVK3Vsp50Iy5wG4mh5mJ4K7/F/GKhQ/ktFKqs3fVLJsADQydX1H
	FZYum1ZREv0Ro/BMXA0CB17D5ju+O1z/hZN9Aaf/szZ7ptE1wWPypVMZK6xSUPYkl1P1EyEOPce
	y0mBZCz3/WHRqiuEeM7tCmGQbc4V8uUebP6YWe8UhcWL2DfAAHKb1O2EnYtkl3G1QHA==
X-Received: by 2002:a05:622a:1488:b0:52b:4f1a:5fde with SMTP id d75a77b69052e-52d85380e96mr249901221cf.19.1786953725757;
        Mon, 17 Aug 2026 01:02:05 -0700 (PDT)
X-Received: by 2002:a05:622a:1488:b0:52b:4f1a:5fde with SMTP id d75a77b69052e-52d85380e96mr249900321cf.19.1786953725258;
        Mon, 17 Aug 2026 01:02:05 -0700 (PDT)
Received: from [10.111.162.109] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52db612c2bfsm8319271cf.11.2026.08.17.01.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 01:02:04 -0700 (PDT)
Message-ID: <af5f2e4f-42a2-49f3-9c6c-0f910c5f9208@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:01:41 +0800
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
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <cgk2httvebzm2jnjnb437mutez66tfozzdk77mjwukfzngdioh@mu46u3pwlf2u>
X-Authority-Analysis: v=2.4 cv=Ua9hjqSN c=1 sm=1 tr=0 ts=6a82bffe cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=EPiK6WrKEJDDbvHRsiMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: YO8JDMrb_PUIBkhgIVbHAKK_DrfMJoLH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA1OSBTYWx0ZWRfXwrbSnXgicJGf
 gfeetjFH3Gg0AETSHPnxjZuhwEbSvZfIDIVLEoOhotcWfVtHO7t2rFEj58N4LY2J2UNy45Ir2Dw
 NSlTUo2jxVmtmUQxoEctGWDrROCtB1oA7/zidiLgPAQeqvqX8IieB3FMcybn3pQqkiBhf+IHAYK
 ThNxqtXsDYsIOMua1lq++vzSh4AWnBtmLmorx8IIcP2h5oCHtJyhFwV1E1A9pPqjQq64iNuRgyo
 0jFV3ZamGQ+WmmfmWYqHtfTGkOCH5YfJP2npQelhO4dYXuIa8tLUyqAmhbPjO68cvvhTOo9s/KI
 oXaXGc37RHVUuB3GZdwipWfONPuUlMXN0Gg3IxG3AVL+MAfShvCcWJ8sxsTILWZE9uYikkiiv5n
 lOkWpMM83iOAjvO0v56CcqvugcOzuWjtRCHZVJQMWXhbb89zi8cY0ISfpqYw/eXqeJpfsxWCXof
 kgWVEmjOKBXabAJGSsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA1OSBTYWx0ZWRfXy+IxcOs5Ke/H
 sGCbp2E3kd5403VCs1P+XmRLOS2AAEceTXqhk1nNPAFDR6eX3rQM3rFww6xeTNlQ8sbCOGwHTWs
 LJecg7GKT4Ypa7JWwIbNajAOgXlHYuI=
X-Proofpoint-ORIG-GUID: YO8JDMrb_PUIBkhgIVbHAKK_DrfMJoLH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_010207_504937_21DD27F7 
X-CRM114-Status: GOOD (  21.03  )
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



On 7/12/2026 6:21 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 10:48:03PM +0800, Yongxing Mou wrote:
>> The bridge connector framework currently invokes all bridge
>> hpd_notify() callbacks and unconditionally emits a connector hotplug
>> event afterwards.
>>
>> However, not every HPD notification requires a userspace hotplug event.
>>
>> In particular, DP MST bridges may use hpd_notify() to propagate HPD and
>> IRQ notifications through the bridge chain while the actual hotplug
>> handling is performed by the DRM DP MST core. Connector creation,
>> removal and userspace hotplug events are already managed by the MST
>> topology framework.
>>
>> Allow hpd_notify() implementations to suppress the bridge connector
>> hotplug event by introducing a bool *send_hotplug parameter. Drivers
>> can clear this flag when HPD processing should not result in a
>> connector hotplug notification.
> 
> Why? Worst case the kernel receives another hotplug notification which
> gets ignored by the driver.
> 
Hi, thanks for reviwing those patches.
Let me try to explain the motivation.

Semantically, IRQ_HPD is just an IRQ notification, not a connection state
transition, and shouldn't be turned into a userspace hotplug in the first
place. However, drm_bridge_connector_handle_hpd() currently calls
drm_kms_helper_connector_hotplug_event() unconditionally after processing
the event, so every IRQ_HPD ends up reported as a hotplug.

Second, MST IRQ_HPD is level-sticky -- as long as the ACK has not been
cleared, the IRQ keeps firing repeatedly, and MST bring-up (link training
/ MST enable handshake) itself generates a burst of IRQ_HPDs. So this is
not about "one extra hotplug", but about a burst of them within a short
window.

Every one of those hotplugs is delivered to userspace via udev and
prompts the compositor to re-probe the connector. In the window before
mst_active is set, that re-probe walks back into msm_dp_bridge_detect()
and performs aux/DPCD accesses, racing with the MST enable flow.

The amplification also isn't limited to a single connector: on Hamoa
there are 4 connectors (3x DP + eDP), and we observe that a hotplug on
any one connector causes the compositor to re-query all 4. So this burst
of spurious IRQ_HPDs during MST enable ends up amplified across the
whole card.

>>
>> A NULL pointer indicates that hotplug suppression is not supported by
>> the caller, such as the connector detect polling path.
> 
> And nothing in this patch makes any use of it. I'd say, it's
> questionable addition. Let me check other patches...
> 
You are right, I will reorganize the patches in next patchset.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
>>   drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++------
>>   drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
>>   drivers/gpu/drm/msm/dp/dp_display.c            |  3 ++-
>>   drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
>>   drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
>>   include/drm/drm_bridge.h                       |  3 ++-
>>   7 files changed, 21 insertions(+), 12 deletions(-)
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
