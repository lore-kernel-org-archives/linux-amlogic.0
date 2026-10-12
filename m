Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3D9CA9EC5
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Oct 2026 12:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OX/8naeNknrX2tpnwPpsb1bckizRCMPSK991hARH2ms=; b=xFDApuX+Db0a9P
	EAE3SsbUkOjvtWDeWFo6n3LB+PkLR/OL2XFzEiUMUaXwD3o5UU9l4iNLFH+DiYeVkzvVclO7mVKDR
	zFUbDjPsPyVIU/K7TrzpUJZ0YTfT0KkY84m7kuso62BI+LPH9EgHtkRC4eX76qlQ10OdZlV35f3y2
	TYSJo4m8gwW4t/hXdgEJ4lgcDXh+O730JN1hgE6Mw/dQkgQdK+TeKd4zoZggTWMatZHx4jKW9SrLQ
	TYnAO7Q0X3k/K//ADDfbabT4x/HY6iUXq1Uc7IdTwMwMjL7NdHuZWnobcArco9ykpBcbGAEhp9UC/
	D1oHhWOuz6mRVGL2pvCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGFSF-0000000AUsq-3Zhw;
	Mon, 12 Oct 2026 12:48:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGFSD-0000000AUs8-01XB
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Oct 2026 12:48:34 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CBxshm1404351
	for <linux-amlogic@lists.infradead.org>; Mon, 12 Oct 2026 12:48:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=47vqK7Iv9Xuep7A6C/o1Hemt
	gJkLnTAUGBL9UovdPBg=; b=c1SpKsnFABlG0oAUswbhng32HHGQaOPi3tQ7ktDu
	V5WiKbfuFdchJ6e7rBuZvdNNGkQPPQKCIkgxdJhtxzOJoCC/jA6nfTyI5kT/C842
	gC75AimibBYPtQ/L0SYvdTgwAWBEAjOeeqvrHlEHUD3fii6/89GHrlHHj2Mj1hgK
	qmYzRj0Ks2DFd34WYKZ4nDRvpLxjd5lm9cDshTqGHaDtCi+damY3HhYITrPjUduf
	QT/jl+bqpGHP25gFeRJ98A0MsQ0dKtRZTXJrDcVpy0rckjVoTuClNmk7l+mMrNzs
	GK+2t6XmhAqT7WGJOL9oRnyPsRQHj2TwstivL8mE5mNbzg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7ks4fd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 12 Oct 2026 12:48:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc40759b2so439389185a.1
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Oct 2026 05:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791809311; x=1792414111; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=47vqK7Iv9Xuep7A6C/o1HemtgJkLnTAUGBL9UovdPBg=;
        b=fiNjS5zFK/kekLLKKkLD2xpWmBQ8VurEzkKlfu29WwJ5GK1ToybF4IwFV3lHak2/Zs
         9RHQSrcfcsToRZPG3jtkey5EcJdnDUUmMHu6OaGeUweSsH2KkyDCaNdOODuLqVDr9Rdw
         aMdkJ5V7SjhUhV0/v2veTG6lsImb3nEyChrDW/w8CZSDQcTgxogPPTwm9DPrK0mKjV0Q
         plmtnkqr2My1pg7Vi0tVFKTqBExSVdx0oPNbe4RSqvRXzuSFgS4U559DRtmw/FCDVtTd
         2EMyg2TvtRAqD4j2T3nHJVOkxFKsE96/NQAVA7cCHEmHayfP4av09iKs95Giv1OogYgs
         raag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791809311; x=1792414111;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=47vqK7Iv9Xuep7A6C/o1HemtgJkLnTAUGBL9UovdPBg=;
        b=0TOY2GpuCOetfNzoohdpA57qW4rqIcxKm/vgQhjpLh/MpMUxQIb3RHC33Ifz9J2QHQ
         cVfOxeL4dWM6fZpVkNFDJ62BafiNLrOhh/kGM/cfZd+K4wVJmr7dsQ/A24JIzWR0/Z0n
         +WrPAtyHyuPnP1KQRfvJEqbKAbTZMjpl+rZfcg5U5ks42mGUJV3Zs0fijdpHyKV32qZ9
         yJjKuPIbMhUbtmlX7rlGdyo7N+IkLPovREwVCEDT2P8aTYrK5hS0zB+7Fm5a83ZchQQZ
         oUjNEx+lnecuI5aE5duUEpvUlLfbBJueRuceASsfvejG4wlhvjijFMi+7Agi0LK5e04A
         pw+Q==
X-Forwarded-Encrypted: i=1; AKwUvByv8T4DuOmJMD/9g7oyCJ2jj/OxigNXRX/8eHMAQRG4xnuJzPkW9ZwHJB9Z7aCZZBekdhuEFfW2hWjTALZJ@lists.infradead.org
X-Gm-Message-State: AFq9FYJZVyFA4HUFjMYElUOcUjSHxa0RACE/Zi6CQ73wUEGW8V3dKh0q
	OI0U3CyUlRckasZR87pmAbMB/zKTQUCBDQ21/DgEvRJhGW/DP72uP4/qReDDSJcKnE5W5Gq5wmy
	cThVg3I88fwrIpchYjxWWiu9tvFctfXaPxA7T0YszyETz3NewVt/hcjB3+b2TGkaJIO3pgbLOoQ
	==
X-Gm-Gg: AYBFou3gIgbSRyi+gWGspDxsBgqifVRe5u1uuULDVfQ5HcZVL3i2aGoc8DY5mvkYaEP
	DsKB2i88dh1V3RRwf2k5kDPWzrZA1diJkvU77yg1vPDTqxiV3twiB9D1mRovHkoYFqoEjzHwmoe
	eC3BQY27bymQEWdOigBQeMqOoRcHr1OOcLftbQn5pf0AsHuZvOnySaSNPra+G9R8OChhOtgSLXR
	Yzg5cjiP0hjiDp/Kx8E16oxhtvDl+hXIOJdCS7Do+aaoxWr0UB0jJOr6v8qxrIh/IUrr8Xx4siE
	9Tt6P5xyHYVPtFMnIgbzV6BH7SXvrhBH0bbVDhcVcqV6IuxseUR8te7A22js3XrhmZPWcsI5ZpM
	rWvQW2Jo3dlxsIXcog08AUfXIb923Bd/rhbfwB0cIwDMYbXd9WzoboeLBppvSIRv2PmNqjMnCAN
	ZO2quBW0s7N49J
X-Received: by 2002:a05:620a:7118:b0:93e:9cc1:7b95 with SMTP id af79cd13be357-93ebd24265bmr1568717885a.58.1791809311386;
        Mon, 12 Oct 2026 05:48:31 -0700 (PDT)
X-Received: by 2002:a05:620a:7118:b0:93e:9cc1:7b95 with SMTP id af79cd13be357-93ebd24265bmr1568711685a.58.1791809310825;
        Mon, 12 Oct 2026 05:48:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde912a7sm2753995e87.18.2026.10.12.05.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:48:29 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:48:27 +0300
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
Subject: Re: [PATCH v2 07/20] drm/msm/dp: Serialize stream operations with
 HPD processing
Message-ID: <wk4gnn4pq4jkm7rwxle4ivleqj5eb5jpllfkjep4x3kacbadim@5bsg6g33e3es>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-7-1835d4966da3@radxa.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261009-msm-dp-hdr10-v2-7-1835d4966da3@radxa.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MCBTYWx0ZWRfX1YqVwOxRTeay
 2N5yf8dO52rKhdcVvJUXeMh6MCoqAOHOzdKln4Y6pmv+R2KoxsaFDldG/sgkM7ao3z6DVLWugfR
 blSrgWGA7IIM7XkWq7yb5ek3vr/LcMiPO78W7OFT0ZQaJktPTT8Yo9tSe4/jcmV9LoUvYXnimMW
 6ucHOC9nTcJbIu3eGc8h6h9fariCKjrZilPgYzM4IBp1Zt978SrTrFLdAmnQP8WoRD7Gj7MAemA
 xrhcaOjBIUV7+aYO28HKhzsENeOdxvIt5RLG4IAIqia/NPBg2oUd4553nTz+JINIViY5rW1+O+o
 QZoIYN239jmJQgvn7EHPknIJ7gbGvt37RInaFkiehZPCzL4ltktUBdMB+7O1aDgi+uUVrphdwTs
 0Z+bLGTJhoMv6F5DsH8hSYLhbD3COFeOXTPHJIJw6rBJrAplXYGjJJPsNpSvahtZE4uKIu2r6sa
 1+/jEtKtUjXNuZTkfuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MCBTYWx0ZWRfX7puaKxWOrVgW
 KxEQvjCrMXi66poic05hGNxwYOSpkjExSd3OCBWtTrKL8/WedM8sN+iuQQBWh3bEyHFhhC3AdUt
 KiScCIUTfxUub4Fw9z5nACvdFxi1uck=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6accd720 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=ksxQWNrZAAAA:8
 a=gPIhC6YDpAGJdL8mzGgA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: R0K-xa558rx6s9afPwXZdDBmuELf-_j4
X-Proofpoint-ORIG-GUID: R0K-xa558rx6s9afPwXZdDBmuELf-_j4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_054833_085693_B0E10AD8 
X-CRM114-Status: GOOD (  17.63  )
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

On Fri, Oct 09, 2026 at 11:15:59AM +0800, Xilin Wu wrote:
> HPD PHY test requests stop and restart the mainlink under plugged_lock,

What is HPD PHY test?

> but atomic stream enable and disable do not take that lock. Both paths
> can check a resource flag before either updates it and acquire duplicate

Which flag?

> clock or PHY references. They can also reset a link while the other path
> is training it or enabling video.
> 
> Hold plugged_lock across link preparation, stream enable and post-enable,
> and protect stream disable and PSR transitions with the same lock. Add
> lock assertions to the internal stream helpers. Acquire the runtime PM
> reference and handle the eDP plug event before entering the critical
> section, and leave audio shutdown waits and runtime PM release outside.
> 
> This provides the serialization required by PHY ownership tracking and
> the subsequent stream enable rollback paths.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 42 ++++++++++++++++++++++++++++++-------
>  1 file changed, 35 insertions(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
