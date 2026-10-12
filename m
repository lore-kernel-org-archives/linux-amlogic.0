Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF82CA9ED1
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Oct 2026 14:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0jvhXGXsF5w/Aj8Jt16uY8iYoNH7u40VM+52F5meBOI=; b=YBXeUo7hO8Fio9
	c4arZuaOr9OiFPNOVzg4GAKp2Ac3F3qkDqKLBMPPinOZDDLmDJLavBmN9wNXZSi2GVTfJrVKtLtsW
	GtEZHhl9kXbYxFrU6OJkHadYEIvzKW3MMlW0bR1jQtL1Yg9EqeSp17uxbKlj60qIT/l0l5/piUhje
	9twNhyaveh8IQ6E3UW3hPKtYFCzHTGuBZOze0fKR765coPhpOKK2+x8374PijkvAFqKTBUmwcXCQu
	dPYZjIZOvWF0/wkYB/a9ae8x1whoZarKzDrfy4hwRVB49CPFTGXDuHKGZp+Up2xWhwYW9HGYkoK98
	iadgdqc0h1NleNsrkG2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGGiE-0000000Adun-0SSG;
	Mon, 12 Oct 2026 14:09:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGGiB-0000000Adu8-2TCP
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Oct 2026 14:09:09 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0GdP3292450
	for <linux-amlogic@lists.infradead.org>; Mon, 12 Oct 2026 14:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mdrAE6CtWkM5g2ZOGMq0Ywa6
	INxDz9OrKN4VJ11fBwY=; b=Ckn2jM7Eo0qepYoAQcndFNeW2qyhGOPwe2Mt80W9
	ElX2mrrRhZErw4oASsxb1JsWQZsCTq95LZUB6q00UegX7Ant666BW9yPZzlaSw4f
	PhEhmRCzi62WwFouLsel3RuvzRIkJMB3boSSmZKUtaG/l2Ec4/KOFVVjuX4KzFiL
	eoDv26PvZMSc2N+4pgI9FO3Hxr2f/FKCN23q0JraCNZMvVYNFvWo9Z3C0RsbnPhC
	tXXYzdAiXPZKjONgWzxKUZFcwyjAt9Buz3p0JiABcZrn0eLRvm0OtSedFsP1nFFt
	uLQ4T+fWcVst5Lpu1qCDKK1jIvc5tY5ch+5PAPHjj+VygQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3hq3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 12 Oct 2026 14:09:06 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179a2035a4so81923406d6.1
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Oct 2026 07:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791814146; x=1792418946; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mdrAE6CtWkM5g2ZOGMq0Ywa6INxDz9OrKN4VJ11fBwY=;
        b=JwxdnzfW9AgPDyxrE4goMs75wCHh3RTm13r1YL+4M6OCQUgQ4I2MrggCbdD6hvh3fL
         p4/M+I4JS11skG9lZzB2lO+Di6Oy5AxH/i04dhlBwDnZCghzR2S6HlWllJmkkb7Iun4V
         3urn8eVsGT88krH34z97dS0UoB2E85uD8SuSejOxvQbDxF6BHxJlFTJfkiF3TJ/mmUtb
         bnvwKcvqZXbMqMFnNlbOsHDvZi3JHxlhybj9pJ0oubvxlry0GV7/TEKValILgF08vGls
         BvxHQ8BrNeQoNXTg/e34o8VEBnlJMQSmuTcHgL5vRGlETZsQ54ta0mG+ggbyyqwB7G4P
         9lww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814146; x=1792418946;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdrAE6CtWkM5g2ZOGMq0Ywa6INxDz9OrKN4VJ11fBwY=;
        b=1EGKmQsJnIXWphbdXGYjd+cdEycQS2ifib4i9C1Jf+CTK5Ds7RVR2jsnaAK2Y13lB0
         y2hXguXLeIK4GpVcGfAcXcucfjMrprvmM5t0ZV59GKyRpVFrhpKqGzBHl5zX5lXkIKsF
         VBYWEaiq7rzfUUO/+kNTE0taPiNDag7HhbnoNT0Hu0P5gKNv0cN456lY8SC+TZeuRfDj
         SM/p6WJXkKbB2V8HtQlCcRt7jq+ANiId+pMRn6qQpLBaymsYfYPEQw4NoSJ9Tjk4xnoB
         1tgr5oW8nabfSCtsuKHVj/PBoZJfyEeqOvy3BpSur+B8wKmbTP83Jd9uSLjbnrmy2D7v
         o2Ig==
X-Forwarded-Encrypted: i=1; AKwUvByzW2cgWM1XUyEwspE7YMjQSFD3Hm1Nn3veEAB26a2dLnbDJVp0dcQOZIh9t2C+Wehdi7C0uXjN1OAANt4a@lists.infradead.org
X-Gm-Message-State: AFq9FYLift14S1RisSiul1Ck6IQeUZjvVXaeyA/1rgZJ/qQU+IGsbDNb
	maRGs7wrt3aHX+ZYDhNLFI00LFE+Z+x5UhcVLR+ousD87feXSYpuf9V6fPHbyhIBwNE8qbXXVhZ
	RIjBwKXcpMQ+iAAiEt8u36nbULyVOdhDQAoYRwhohuAqLkxM/esgGYxTlf56e6iD/uDVYFe2B2A
	==
X-Gm-Gg: AYBFou1nIOT8gX/AoCGddPOZPh4J8XL68NED4t6ih4dwW6vSKFlkECnyrojydinge3L
	KW2zTamobRFIHaItGjL0rsDqJASCy+Ob4TVZrkqd7SipJYJIlI1h9Y04EBU0WZ19PyLCOmc/a9j
	wdDAvEsYlkTvjAxud0E7g3Yp2BbbBEmxbk03f/ZpAAoVQSTXykK4Xfov/jTKvb4iaDYK+N95M/p
	wqxyxNcot4D1zRIsHLiZG3/PD9Tf8KK722kFUIoNoEzN/JsUqLjgY04YUcUC2smUAP25HpMaEvR
	KrXySWJmsy3rlFCeXO/txS57X8iMBitwuHMcS1bDXPP/ypdaJ4C+0+isqwgHkZ3+qLUnw9sDXpB
	vPpLsQsBXUaaCRdgE9mFv5h74gg+jpBTfJiBN5dQeKGzwX8GIZDnvC3mVdKyQDawn4CpsOMVMpM
	rA3rM71Q+klrXm
X-Received: by 2002:a05:620a:3182:b0:93b:cb64:25a5 with SMTP id af79cd13be357-93eb95e34cbmr1568176685a.12.1791814145771;
        Mon, 12 Oct 2026 07:09:05 -0700 (PDT)
X-Received: by 2002:a05:620a:3182:b0:93b:cb64:25a5 with SMTP id af79cd13be357-93eb95e34cbmr1568168385a.12.1791814145243;
        Mon, 12 Oct 2026 07:09:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddcd3fcbsm2883054e87.0.2026.10.12.07.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:09:04 -0700 (PDT)
Date: Mon, 12 Oct 2026 17:09:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dragon@radxa.com, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 15/20] drm/msm/dp: Flush VSC updates when leaving
 YUV420
Message-ID: <3itnyk5vvlj2piguntvera2ch5qn4mmzmqch3aevfmpdjvis44@7zujyc5sauea>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-15-1835d4966da3@radxa.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261009-msm-dp-hdr10-v2-15-1835d4966da3@radxa.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NiBTYWx0ZWRfX0qWd/WOOc7tM
 b/dDahNs4s6uqOERH5Gh7xRf2TwSF9CJ2kx+zMJ/7Cyk1Lyznk68m2FSpmsr5mKwx62JZCquk/t
 uCCPyNeMFWkycwzK6SIs9lij+S3M07yOQmmF16yqQg4UZ6MK5dKm/DRsT9EqmI7Iq+CareUMSo7
 gyDWXCnV5lYjxNAxkMPrJu6Djq148sG3UI4bz7TvsY7BgkUaK8SqCoy8xn1Ky3njsJ2EIU4HGze
 D25omRkJ22OX2x0G63NIxGwUYGwD1SEJVftwIGJzINkizIurLlTGM1M94C6Hhucw9MxK1HgjZJV
 xbNpZc1GNO+D3xPoVXi0lrzIaY8aQqUaM/jcsop9u3xy7jjHoxu3eIeuTEiXwCBeVBZfVo/MrJX
 0nq9kqEuVzBHL23UUPOCEam1HyQmtKt47AvPpbVWQZWZHyPDGUFCYBQDzFdkIk4LwGZIhSDgpfo
 SHpvCAZxq5fp3+IfCLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NiBTYWx0ZWRfX2mznexz8nr5t
 00FMmhB5H/ilurt20zdgnSfphDz8c9hNF0yofupaY9I6g2YHSHpFpEHrtNwV9gPGRqh4hu8iEww
 KM/9KBlLqYqRuCx3kwmCtLusoVUlXV8=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accea02 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=ksxQWNrZAAAA:8
 a=Sq4eR0YASbV39jB7rD4A:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: fAEt6w2u7JjW0Etsn74X2Gb_hw8bfbHe
X-Proofpoint-GUID: fAEt6w2u7JjW0Etsn74X2Gb_hw8bfbHe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_070907_632694_D9093E31 
X-CRM114-Status: GOOD (  21.25  )
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

On Fri, Oct 09, 2026 at 11:16:07AM +0800, Xilin Wu wrote:
> Peripheral flush is currently requested only for the new YUV420 mode.
> Returning to RGB also changes SDP state and must remove the old VSC
> packet rather than leaving its enable bits set.
> 
> Track whether either stream needs VSC and request peripheral flush for
> both enabling and removing it. Explicitly disable VSC for RGB, and write
> the packet payload before enabling transmission. Retain the existing
> hardware-specific SDP update mechanism.

Missing Fixes tag.

> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 7 ++++++-
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 6 ++++--
>  drivers/gpu/drm/msm/dp/dp_panel.h   | 1 +
>  3 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 1f9595ff5fd9..486348113b8a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -691,6 +691,8 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
>  	else
>  		bpp = state->bpp;
>  
> +	msm_dp_panel->sdp_needs_flush = msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ||
> +		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode);

Does it need locking? Can we instead store if SDP is goign to be used in
the atomic state and then pass both old and new state here, letting the
bridge to determine if the SDP status is being changed on this modeset.

>  	msm_dp_panel_init_panel_info(msm_dp_panel, adjusted_mode, bpp ? bpp : 24);
>  
>  	/* populate wide_bus_support to different layers */

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
