Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E680FC43458
	for <linux-amlogic@archiver.kernel.org>; Sun, 12 Jul 2026 10:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5s3R43FGZhhzBp/tFF0AvlJa2QgMXlPNmoLFl0w5sGA=; b=TKoVT3mYxH8iVy
	qZ2ioTqaAAuBJuOsaAerGk0cf9uew65E0jHh+6+u6KCCRW2sELVK3AdCnj40TxdWtQnb8LDB+ZM3Z
	fhj6187to+/0QffgUGtMXZlzt2+K+MSj889JneFlrJ9XDv5N4+vIn/YiO6cUxjP6Uwl0V8AAVbmVq
	zMJBgs5cS50IwIstCA3kzLAzLSxtbP0vKMsYKf++JCOJqwex10sR6HcKKBZRwGeO3c2LgXYSgX91g
	GKN3NqcYGie6IPm5NtMHr7ThSyVB8GZc3+rMopmkvzTSZ1pA+y+YPeZEN4qZhmzxsGNLQGYQSh09x
	3yXT7SdkhC+AcnSm1ODQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirrw-00000007O9T-0CzA;
	Sun, 12 Jul 2026 10:57:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirrt-00000007O8d-3EaD
	for linux-amlogic@lists.infradead.org;
	Sun, 12 Jul 2026 10:57:06 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CAclp62403099
	for <linux-amlogic@lists.infradead.org>; Sun, 12 Jul 2026 10:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tBa6sEiBydXVWZOOLxPyxODj
	FUcBwp/AoovX00pVO0w=; b=PivHYZLu1uWprgW1eoB58HG5svn53cKX9CFOT9Ra
	DpXOIjfOFNTFYsugwlWIptjpLmaNaSTXEd3czJ/nXmH6RMJj+3yJ4yaDLOre7fwE
	wImX06xb2nsnhzHUig10cmOJhAJ4/dgaVrfIO1AG4AVFKVb3CFgQwCJk0B7plWie
	ID+72F8Zv1lnO7tR+fhprP6PVgn7NcZJXxXJqOiLCwLdYCLL44Qv6sPMIS8wrNf0
	AeUfeOZrUZfD5OOzcoCA9E+3MygWDCnUzPMk9qGU42IoTSqClF5gynN5rTGSS2hd
	P97lk5bHF2ZL/ZbiXZ5tVk6ZZZm7MXmJGTybAYjEXi4D+g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbe9hjp5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sun, 12 Jul 2026 10:57:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a8c689b5fso28588171cf.0
        for <linux-amlogic@lists.infradead.org>; Sun, 12 Jul 2026 03:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783853823; x=1784458623; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tBa6sEiBydXVWZOOLxPyxODjFUcBwp/AoovX00pVO0w=;
        b=GemJydweEMycCmCAdozZCOz78HqAunQRVQXZSLNCr78wF/rtdJRjkCN4LHdYKpnppP
         ss/bq9neax9UYOGjHKlV4CTN9nyssbV/RVvu5D1HOJcYRPtvGice/reiTSSTUa+ef33z
         J1LQDskdQlJZLIJlawCC9Ze7Z6Q4VfFh/a3hgKgxZmaHb1HMcjJc1kUhVjEFhHei2O5o
         o1B9WfQgeaoMTwDBqozOiNRhmFVyWBcTJZ1bgc9h5DSmhQa4rxriUPi/O4EaoQOD9OFy
         IL7e9UDckEzUe/T+PDGB6j61ymdDkSQqZ3VBIiYu/W+hNqp7nmptpqeR6VYbBVeKM+zm
         Td6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783853823; x=1784458623;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBa6sEiBydXVWZOOLxPyxODjFUcBwp/AoovX00pVO0w=;
        b=cs1tam9xj2jEeVP3lk0prbpPelq8a+8Yh/aeJzTP/YyC+YRGTMp0sQCuPWjFl5A32U
         QL8S7HphNz2XUHJiKHBwVfqr5n7Kfwwx0MRuGgZX4P7JtBwg40B/96AHsFBWVHT2rOTe
         nDYj3W1Eb3UF0fQ1JfmMgdsPr4KP/hkupid2U+pNa41NSmnnzDB2L78pEkBO1Un3nfQt
         P6a1UuQC2uqNPmUn+/CwqvOtD4QMfRTasuHEtChlrIS/ZZQdBWbdLvMWEKoXHZ1Bmr0/
         kUoBhQX2JTxEUBsT1WbRvCmytg7QEM+55N0ElEmKENTl5neOGXINgcgRg4uYBbUfZ1F4
         /U4g==
X-Forwarded-Encrypted: i=1; AHgh+RpC3XZv/bNxL5DETXtpVgwQFEWC6Y3MIniWWg+JGC4/Don4mtJR+mHAChKDWVWGQ6263sayjoB/fy5iZUt3@lists.infradead.org
X-Gm-Message-State: AOJu0YwKIzHTU3xKmlJEudH9UuTK3fTHIzpcEx2daV5QuLhJb7B7KNtV
	6IceeJH2/dtyFSUgr8iXOCzurLugzceMw34FD9Bajf9M0c1I73O6f3L3k+N3kgWu+Se/VLTBUvf
	HeDE3RongPrlftauIAZzLrCky9/A/ENgvnqKi4IX+jVlQ2pbhq65sH1tQ+7OE4dFp3gcQ+YAmJA
	==
X-Gm-Gg: AfdE7clItgLmfdzuJYhQaXehZrzc5SvU94PqJUEnwbCIbAItoa4JtvKIgZVjXUuFVai
	JX/VGbLoiuRF8pv+WO/LyzcxSirVyOin8jcsq7i9GWe5u5Gxt6zBJfvlxWJCPKPGy7z+jRIZ1UD
	PYlIBvCHfIC+j4aXDdyoNEk8vf8WKyWOKkkazuyLx23SGgqgPVVstY4mKQffbde7lL4eEHRLEN2
	okkU6jNhPj3bR2m3h5UOUZiVGfJRNjRaEK4aP4mFIcRADBC22jNNxJTwGfbDIsqfqDo/DiQylFa
	sQDCPp77mfCmleSKHJ2wci8XbRWslESIS/7IqcvEyR8Q8gH32cg9fNAZIVj96NKv1xCzFdPR2eH
	VGVyeGYT4eta086b2SNO2Fm1UwQBmcUcadVwL8QLEoLP8AHurP118X26vT08qTxCXLgTIy8X0yA
	adopGDH5wAbxlG2yPLm8eD1eNP
X-Received: by 2002:a05:622a:591b:b0:51c:25da:903e with SMTP id d75a77b69052e-51cbf264fc7mr51677791cf.58.1783853823034;
        Sun, 12 Jul 2026 03:57:03 -0700 (PDT)
X-Received: by 2002:a05:622a:591b:b0:51c:25da:903e with SMTP id d75a77b69052e-51cbf264fc7mr51677491cf.58.1783853822639;
        Sun, 12 Jul 2026 03:57:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca9ddfbsm1969378e87.54.2026.07.12.03.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:57:01 -0700 (PDT)
Date: Sun, 12 Jul 2026 13:56:58 +0300
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
Subject: Re: [PATCH 5/5] drm/msm/dp: mark the SST connector disconnected when
 MST is enabled
Message-ID: <sijdmdhcbxyg23gh6c62hspruvbnyqbdrtv2er3bh6n6ftolsp@b6o4khv6dofc>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-5-646a10256233@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-msttypec-v1-5-646a10256233@oss.qualcomm.com>
X-Proofpoint-GUID: Goph9TVQSseG-QBHwqvuU9Tz6dbXbj43
X-Authority-Analysis: v=2.4 cv=SajHsPRu c=1 sm=1 tr=0 ts=6a5372ff cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=EGGHxoTsPsDd0Tq__ngA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Goph9TVQSseG-QBHwqvuU9Tz6dbXbj43
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDExNCBTYWx0ZWRfXy8InwEtXiVJC
 GojeeqU/D4QNp9SRTUXfjfQz+Sncc8qybjmDZ8EpeuwGUw9AOU1/By5SiaRBcltK2TBvZTwSZHr
 Ay8E/K43wbtQvEDEHFpqrtqLf79VVqDM0nUhpGWYvsLwoBIF3L5WD3QOmx5Ap/VZ6goS8gbG72g
 TKIaHEECuAfaqDQttnGS0k7tik7P/vvJyc0f4DngLM7dhjkCdLffOoi8NslDK8buo2kc2ugvho0
 P+LEehpynHbvbd2pGoJ3WmrOQH26W3zw4AoAl26jegRLwSGT456tXZCiDcY5UYR5iEVYT2pO8vT
 OD0WvqvMi4UcvqE/wgvGvL6Taxdp4je6Ny3wA5fUPP2bBXTZtivlYnheul/TzUi0WYlF2rrXbPx
 kPkzk4wXHlEZ1Lz7Kvx0e0qGAE4P/3A837xYAKDrKFf0Unlkkymhabdu5YI52SfBL7AkdWDGZG5
 wvSG+iF4ZJ97eJwgxaw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDExNCBTYWx0ZWRfX0C/qj1oSunWR
 zGO+39Ce23cEp4bfvBp0fCZnfCyxao71c8D/aii13z0RWqecvcuHKI9ydQk83JkpWuZxObOYtt6
 64mmrTnY2G0Kpa0vtWHRpwWS0CfcCng=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_035705_918784_27261775 
X-CRM114-Status: GOOD (  22.45  )
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

On Mon, Jun 29, 2026 at 10:48:07PM +0800, Yongxing Mou wrote:
> When MST becomes active, the initial HPD plug notification updates the
> SST connector state to connected.
> 
> However, the subsequent SST connector detect path reports disconnected
> while MST is enabled. This connected -> disconnected transition is then
> observed by the polling logic and may result in an unnecessary hotplug
> event.
> 
> Set the SST connector state to disconnected immediately after MST is
> initialized so that the detect path does not introduce a transient
> state change.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 4ee391cc7165..f8ca60d6d714 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -352,8 +352,10 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>  	if (dp->max_stream > 1 && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
>  		msm_dp_display_mst_init(dp);
>  
> -	if (dp->msm_dp_display.mst_active)
> +	if (dp->msm_dp_display.mst_active) {
> +		connector->status = connector_status_disconnected;
>  		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, true);

This should be a part of the MST series.

> +	}
>  
>  	msm_dp_link_reset_phy_params_vx_px(dp->link);
>  
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
