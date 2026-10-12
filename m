Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5812CA9ED1
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Oct 2026 14:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1gXHv913BUDXeBNiCLSXjsBZkVqrD87mQXOC8cHQyYQ=; b=P3DBtAIiOjFgQ1
	G5tVnj6RENMHF3CRMD2vYMqU7C1Ohq7odkn4SU/PiM7ST4vbt+tiZNYLIGsurgMx4D32C5H0if006
	pyCJD4D47EpU8B00jHI5Ctm2PfWXf00b0NpILlc0L+Ytd46Fh8hkr2qgwdqFVlkFf5STxQYGSmSkd
	kAQZCP2p8EG3xaiFtKLuQ9nZp57zIN1rIx1DOzrxwxJhdzXdlVoyViz9bJ4IfBqI36tWtkG1fRU0i
	stN/rjzEPFvFW243+qFj25Eh1Aq94Xyj0Idb+tL1/WULJobDVuALh5ko0WwbhaRHi9FmgYsQiqT6j
	RGweiNrwSNC3O0TYmO8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGH8u-0000000AhZL-0n1o;
	Mon, 12 Oct 2026 14:36:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGH8r-0000000AhYR-0Poo
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Oct 2026 14:36:42 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC09451686401
	for <linux-amlogic@lists.infradead.org>; Mon, 12 Oct 2026 14:36:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J9HMb+rbLJfcyQVlt0skqJmt
	qpokfqdjdof9s+dJvi8=; b=INGTTlaKgMcesmWieZ5+nkXVfzKBctT08I2hS1+2
	lrAfjshdJKeBapa44nzbbOQK+iIA7HCBxWG7HeVGPhMG+S+CtJ8BpiJOkiw7J/xR
	Cnbnnk0ynBhXsCo5nHSZO5sICr/dOsKCaQPOorI1LmIlykwa1bu/tDI86QxYUMee
	oTjT3N3DvWCHn5LGjoIzrAplCoX9cbFVQrCJzaxvlTF0pj7fLcEGEejbA1fIw0YU
	TrRYsefKmZ/aIhja8bFTxb4EfWGarC7VB4kSdBASJDKCMOP0uACKfeDTRgv0fSvU
	cS+uBNPtjRUiBW2aF8vjernE9mvzGV6Sut95H4MkvAu6VQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc18an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 12 Oct 2026 14:36:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c5ab5c136so335341985a.3
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Oct 2026 07:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791815800; x=1792420600; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J9HMb+rbLJfcyQVlt0skqJmtqpokfqdjdof9s+dJvi8=;
        b=TvBn1HvNjbBszoIg6QZbYoU9lBHmhKOV7iFxtvOh03+VInWPaXrZWdd7xOGiGMu3MS
         /8+7MTdnvZlAFe5uo1bFZmkGrGozk2gNiC2dbObyfxbnjEzVHW83bo3TEgNAZoJcd3XM
         kiZy2V6XdIUmCjSIuvi4m8LglYo2VK3mfzXI0wn7weo3F/t7+0ETvrGEUBe/gSkpUXaF
         JwC0Xd4tzylJmQtLQfK+Pidr0MnTUy5AwBkJ31pex4Cjk6l8qzoOZZsT98KkAeiU/RaV
         YBsMlBGqnINumfZZR2QYmAph0iZsxPV9U5JVEylc99Vz7sUhCwm/2iT+R8v62BAFCl6M
         3Qvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815800; x=1792420600;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9HMb+rbLJfcyQVlt0skqJmtqpokfqdjdof9s+dJvi8=;
        b=S1vm/NVjND76IFalMrt8+G6AgSXg1aU0wPxYinm14CUMnzngMg6w0/VGDxj+Sc1Sup
         5B7fL7Lop3bG9zfACuEKXe46fAwcexJZjo48yXHGk+RIuJMh+wmwilKrz4UEfEDSlGta
         Q1NJfm9/DZRwyefZqJ+fe9BN/wNVm3ZwFNtyMIkcjwQkVb0Q2JOTOLZF0O/Tzo47yQtO
         BMIpTJF1FrL2vf4gI+AwkR/lYrOM5PiXhP1vGoSY5zWnPdT4mdo8G+vEjQgCQNNMvoUp
         4rXZXmHIYkMIbHDnHcsDuxbcVfKht4CFHbGt2cmZxkSWZnY3oYvckJ8ao1LjhPZO7HeE
         0lqg==
X-Forwarded-Encrypted: i=1; AKwUvBxbpB0XP3KUDN1XdNSpVxUusLlS1Yr2iR+5m4qJsTIqMkCvAYNj2fJKucmxhQ/rgXKtemlN8LSSwsVDmegQ@lists.infradead.org
X-Gm-Message-State: AFq9FYJDkxJtFLOo2kRhI3OX82qqCc6/KB5wb/h4KTHnArJFHwhMjgdD
	UJRnNwn4EZAwM3m/vl2T8dZ9/G7+thnOXzN6miEJwS0yFEWLL01+30cFlWhtyrT0eGCWBpjE4Qa
	cuEt276VdS7j9O4b0AqdwX2MmVa5kyHlngLRtkBqEYx//fRiGSdZC4CaHawNw/uPuoiqr6gOmVw
	==
X-Gm-Gg: AYBFou0oXbvyTiT1J/n1xJoQz0AQsoitJkCHVKcyJhpZnQZJ7uSPoqdGz2TYyTHO60J
	IaQnA8rXk3YtQk2GWlcL/bpgcyaQM/DQzsjmJbPBaEMZvS0SeSPCycLGL9zIbODpYMd1CjpSVdW
	NRPOCqpq9TGC5CF16aVLbkixE9j4D7GUskVQgcfIXDI9FYnqyVt7uFTZBr8Dv/nezU5wqQeDqmr
	iy0JS1t12aTY67PXhjes37cki3qaojBaAM4pltcpkMwMYL2MbDfqzE0EtfkLxZNjqMgozfMQseo
	PhsyjXaM3jvIKQ/EVRVUMUC3oPNbsnHYZGdKTANwqx17yS4NAsHYHDq6kIji920S0yTNYwu4Lt+
	9VPnvUdNR4GVJfJggRKpjI/SKw9dO24f6qlelFhHx14r4dc+xSYxVp4TCD9AmMlQYUDUpvPqXIw
	8UNzg2ChAOZNbI
X-Received: by 2002:a05:620a:2b9a:b0:939:a0f3:6aef with SMTP id af79cd13be357-93ebd1ba6eamr1634168085a.23.1791815799513;
        Mon, 12 Oct 2026 07:36:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9a:b0:939:a0f3:6aef with SMTP id af79cd13be357-93ebd1ba6eamr1634164385a.23.1791815798995;
        Mon, 12 Oct 2026 07:36:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde36693sm2933145e87.3.2026.10.12.07.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:36:37 -0700 (PDT)
Date: Mon, 12 Oct 2026 17:36:35 +0300
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
Subject: Re: [PATCH v2 16/20] drm/msm/dp: Disable PSR for YUV420 streams
Message-ID: <oxdplbus736krf5p6ilqattox57iv5htwlof2otcgk62xgkxrh@wg2yt2iogwjr>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-16-1835d4966da3@radxa.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261009-msm-dp-hdr10-v2-16-1835d4966da3@radxa.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfX5d7PKuf1f0gV
 Bp7+rT48dkHaOL6uDgVUD22p/ppCoTcDumNv5OBeqTBFTTvnQrtHl3j0meWRWRlKI6YhCjMqfJH
 qm8dqjFtNPk7rGSiNVj/W/6w/Owpy/E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfXy+S9aMq40jfB
 PaRjGjdtkXsZizyEbUwIPlCikGV978EpxlsZvFMZctFcZFw4RphoAeAcbfMCg2neDZY6pEMP/0P
 367vAbWFOkVNZ6jsS62t+IzI4pM99FnG1nuEeaRYch3bjS1PJ0devDlQ0YTGCw6NWesN8qbdCv1
 Nlj/3Mp8/GoJqVS5/prLuSruCiJrW+xU5plVrdM1AEW7NoLbn7RxSvJffN3zRPdSfhw/AaD3T7C
 98v5lmQmREw+pDLSW08+YJwiv3GlJ2Y9/qyYppOUtTj3AlLXJtCeXU4lwx44/v32mBeExZoLzVI
 MQlLx33bRPk/WkwcyPQ0albAGCFNArlYePL7EMae/5LzUSy3gDTclNHvYQJ7PQaPMigywDh8Ex8
 +TLAijdGFbD5VAlmuTCBJGQnGrdv9t9ovgRWFS/Wl7mHg8Pyhkq/RYH++O3MrBTY0Cwylr3lTaL
 H4egJZnrJHj2Mv1Ahag==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6accf078 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=ksxQWNrZAAAA:8
 a=q6X74nQK2RvUw6JQmdMA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: F7fUd7q1x4TMiq1yS6R5bv4KJT0Vsiby
X-Proofpoint-GUID: F7fUd7q1x4TMiq1yS6R5bv4KJT0Vsiby
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_073641_144561_F990E125 
X-CRM114-Status: GOOD (  15.17  )
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

On Fri, Oct 09, 2026 at 11:16:08AM +0800, Xilin Wu wrote:
> YUV420 uses colorimetry VSC packets, which cannot share the automatic
> PSR packet generator. Do not advertise self-refresh eligibility for
> these streams while disabling PSR in the controller and sink.

I'd need to check if it's possible to handle both. Otherwise it looks
good.

> 
> Compute eligibility after the common atomic check and reject an
> incompatible self-refresh entry. Clear the automatic VSC generation bit
> for YUV420 and restore PSR configuration when returning to RGB.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 19 ++++++++++++-------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 16 ++++++++++++----
>  4 files changed, 27 insertions(+), 13 deletions(-)
> 

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
