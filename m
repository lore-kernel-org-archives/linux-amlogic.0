Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 660DECA9ED0
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Oct 2026 21:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EYO3oJvwma9kfgjie7epw3eJBYtawXsd6oWKezFCFj8=; b=EyN0W4+bR1tHom
	0K16gdnm6RUaDlzHaLLx70WXHrMj3RygIwPuIcPd3S9aP5PD7tb9Q2MNku99jALE052M8ClqjsXsa
	3veHJTnPo8J9Vedf1hBLJ2m5K+YykyATs91MP0uD6DIGC2LFrvlRgL5nD1A7JzxjbAvkwdssL/Aba
	AeuXNbrAJctPm1Qpik9NvPZzhSMg4kRiezR0tXgro26QSkYKezeNtz+netfREc8y62gxZdslq6SfP
	I3Rwvha2HWbCkU2fLQ+k9IldfHrleib5GQCxUQNm5Wk39/TpC5witDFRmNz9UCNSBlN/Hv+9YaKkB
	PmAiqc/w9IFniR+Ohi1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNwy-0000000BaCt-2jhB;
	Mon, 12 Oct 2026 21:52:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNww-0000000BaCE-25A4
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Oct 2026 21:52:51 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CJMqab3258163
	for <linux-amlogic@lists.infradead.org>; Mon, 12 Oct 2026 21:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K+fv5z59h3BrsGh9ocdCXpDS
	hfQmJTPHUsOE2PlPFqM=; b=DdAOuTmjL52rL3XRAhWdcUSgGBfsa18vzPxlcXk9
	WxjTb2S5wwvYud+MgOIP5Gp5Tsa1RoaEahGC7erKxQftuVmFbRCwVNSqN3aEcyxb
	fRRLD9jLK55vY/4V8b9ocux97ItVdebIUuusF15Qi+sBp9wR/o+BH9KVWHXN3gVI
	NzZPx7ZESfGuKVBHvf7pschn6nTgI4cw5DnREAXLytJ7XyB1UH8YoC3XjWKE0rqI
	QUd4TafUL2BJRXDaf8OlFm33A3jO2x/xtNOv9ZNgRr/vhWajOii6fdUfjgw0xLgq
	sOHAZesQsNY9iXsm3U0Xl31B7ta1IYB3i+WqsTtMhmRXQQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq3keq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 12 Oct 2026 21:52:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea8067974so609037385a.1
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Oct 2026 14:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791841969; x=1792446769; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K+fv5z59h3BrsGh9ocdCXpDShfQmJTPHUsOE2PlPFqM=;
        b=EdTCgHZrc8ROeE1qVQd+UEgNR0oH1cUeZ2S4W97gESMkZ8RdJl24+K8kCwwW3fL5tz
         KGaPxrSqj9fgu/0bvu4fXO92+p3bat4Q9dFWiIROosttGz+LaQAhstTrtW/VxEqmGozu
         GqxmCISlaLKOPuIsFAp37VuRqvMFxqxgo/jBPktoocqbCi+WrOK9Uwis9BIFyad+dvrj
         nWdG1x6a321LmxkWpD69DgPfYgLpfM+jZJZf9B+wsXUZcIMzpO6HWK/TDRmVNHJbUDxp
         vbf6oNLq/DwT4uJRPFKIpjZQDmA2lP341hT+UhoDvip3xvSV9YV2LHuqDwacvAiiCJn+
         CONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841969; x=1792446769;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+fv5z59h3BrsGh9ocdCXpDShfQmJTPHUsOE2PlPFqM=;
        b=COPh1WSDECC2yZFoAKZIvE0Ua3+19UyvczhCwR8S5pvIOHjahlzh1jlrxNKi5Ci2yJ
         auDgqKr7STkNzvdcLdFfY/fVKcLz5la5hfyIDJ7VawrUCy1H9ugvxoxONgEys+7o1FWg
         1rLnvbheuxnsmP/yRddCnN9qWJdrDpvEo+LRF2Ui9sNfg6cHnQfUeJNAQXPPmv3UVher
         cRBA/XZjBXRHVxwC/5ZbXmLizsQyulhioL/iABaB+ysls9hY1Ku15TSVau2+jzsbdDr/
         WMxoZQMxyVfBnaYs3sX4vM0r+PjxByRJifJZB7CHOZx2q8yCi8eTwcKsH53dkIyuSw3s
         nH0g==
X-Forwarded-Encrypted: i=1; AKwUvByZ2R5V8Q6XEHIWnuwTKI3D4GwVoFXae7yhm1P1G5gGeJTIjlqkZHWOllLVevKNTgiBUbQP0xnFqkeoEVOb@lists.infradead.org
X-Gm-Message-State: AFq9FYJV7xbHUvQpshrHv3iID+XCAc5MD1GQrIw76BPp/x4xV1EsaTWs
	4z2jLweoUyIhph+6jgkVU046QdtRO+BxfrvPvlEPwqgmydyv0mgx7VZ7VzDKSP2N52FFkHcDKCz
	C+voEStkRIaxGVWHaNA4ttes9SNetz6PbJrN5symk8JcqO0Z3n20sZp2evQdsAnKVQsZopo6Frw
	==
X-Gm-Gg: AYBFou05/yPHA+HqE2weBI4/tpM/lLpLlHrpe1QLg4r2ugHGjO6fOfSwIL6nLbW0/uC
	gYgaZQxUr/HOsgXO+si8+8ErLim6dLVzMJhPCa9NSvWPeS/ldGYduCR4Li2Djg7dq7D7dEaHHpd
	VXuAnyJQ7q0/RrYgyOVuKCn/kzlPPnp9lt2aSQ0iqf0ilPBm7d307UJJbfaUJDlEKNIiUtTSwWw
	r7+lfspvvz/BirNj1Dp+A5DifaItlM+SM84sKhDehX2+2bbNArDX9xqiwzufEGF7s9v0u9RZJ4y
	vTB/7ti7a+kgvQmL+PUmIIqsgoPzYg8wYlqdBGUCMb1MS70L0UoGqde8XrEay6TA6OYkfr+rwQi
	r9tIXFFpkxSS808IoCLo1Sf5pyuQDH3idsraWT7pmXgOzISFzeqx16q4Jjm0+aUOkOUa6HuPV7F
	xUDhCd9oZtzmKM
X-Received: by 2002:a05:620a:25d2:b0:93e:d5c1:da49 with SMTP id af79cd13be357-93ed5c1dd35mr1101463585a.82.1791841968905;
        Mon, 12 Oct 2026 14:52:48 -0700 (PDT)
X-Received: by 2002:a05:620a:25d2:b0:93e:d5c1:da49 with SMTP id af79cd13be357-93ed5c1dd35mr1101460285a.82.1791841968289;
        Mon, 12 Oct 2026 14:52:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde91537sm3083268e87.16.2026.10.12.14.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:52:47 -0700 (PDT)
Date: Tue, 13 Oct 2026 00:52:43 +0300
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
Subject: Re: [PATCH v2 19/20] drm/msm/dp: Serialize video test state changes
Message-ID: <gcvermba6qq7jw7svx644fncfglqvwt3fpj72ew4habdq6gsn7@arxwbb4bdubb>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-19-1835d4966da3@radxa.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261009-msm-dp-hdr10-v2-19-1835d4966da3@radxa.com>
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6acd56b2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=ksxQWNrZAAAA:8
 a=kznJ5srmxMGE6xClfzsA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA4NyBTYWx0ZWRfX/lFAQbh6epZ0
 62Y7aQ919CYaYod6Au51NzTFMah5+4bDTXPYpurxqoUDsaA/7FI0wvtlkTQIA0QbuXIhv0EpttD
 cIA9lw1cbXdLo6GiW/AiUrVXVwMj/Kw=
X-Proofpoint-GUID: n5moJHBteMDPL5AAv7X7YU85u2MI69a8
X-Proofpoint-ORIG-GUID: n5moJHBteMDPL5AAv7X7YU85u2MI69a8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA4NyBTYWx0ZWRfX8LJ60WETirjt
 /VGGG/nN7KbEzSVmiHe+o3Tj5YcZ0YBJYtJg2GJbvCmPCTddmRyahPxddTJMzUA0/SQwvtlUfHf
 9eK7061d6wgrW4kJl+piQdAAZC+PtCVnA003D9x898fQfiNKawh96q4fbPCVWpbf5aScADi6wav
 Qsvs59p2FMZqnDo3YGAe9aVWEyefg4dbwx0J7WKYLDFxQz2PN31XXhL8M/SwMCGbl6GdWiOOYu0
 MGwwFD4TNLiXE6OPDc/MLBAsi2VdMffreDCtZ9NpHJvRcUSMY3tsfKDp9+1a/Y1ZF6jlOa5FFgn
 4A/KR/xK8qWKoRRnFfeuq9SvKvDBHidhDFfrGKJmn5UGZriKYPK6ABkzHmFMENAY98tzXWyhyAn
 d/gG7UZOcGsKr2/60bTD/uFX7OaTwJe5NzVfugJ9jekFPgotWklz9dEMxYwCfc5V0cga9OeEQPh
 D3sIS+j/h/CVWlBe+ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_145250_543571_222782BE 
X-CRM114-Status: GOOD (  23.55  )
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

On Fri, Oct 09, 2026 at 11:16:11AM +0800, Xilin Wu wrote:
> The debugfs test control writes video_test directly, racing HPD handling
> and mode programming. Reading the test flag and its requested depth in
> separate calls also allows those values to change between the reads.
> 

Fixes?

> Route test state access through the display and use plugged_lock for both
> HPD and debugfs updates. Hold the same lock while selecting the test depth
> and installing the mode. Pass the display instance to debugfs for access
> to its connector and the serialized test controls.
> 
> Preserve the existing SDR test behavior. The shared setter provides the
> entry point for rejecting incompatible tests when HDR is added.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_debug.c   | 27 ++++++++++++++-------------
>  drivers/gpu/drm/msm/dp/dp_debug.h   |  8 +++++---
>  drivers/gpu/drm/msm/dp/dp_display.c | 34 ++++++++++++++++++++++------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
>  4 files changed, 42 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
> index 00fb1a7ba40e..c26b356f998a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> @@ -21,7 +21,7 @@
>  struct msm_dp_debug_private {
>  	struct msm_dp_link *link;
>  	struct msm_dp_panel *panel;
> -	struct drm_connector *connector;
> +	struct msm_dp *dp;
>  };
>  
>  static int msm_dp_debug_show(struct seq_file *seq, void *p)
> @@ -89,7 +89,7 @@ DEFINE_SHOW_ATTRIBUTE(msm_dp_debug);
>  static int msm_dp_test_data_show(struct seq_file *m, void *data)
>  {
>  	const struct msm_dp_debug_private *debug = m->private;
> -	const struct drm_connector *connector = debug->connector;
> +	const struct drm_connector *connector = debug->dp->connector;

I really don't like this approach. My (eventual) goal is to remove the
stored connector.

>  	u32 bpc;
>  
>  	if (connector->status == connector_status_connected) {

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
