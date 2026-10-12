Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFE1CA9ED1
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Oct 2026 12:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QFeRIOMq4ZF66yYkWn49exxEdUI47yofpHF1bdZmOZo=; b=M/xq+pYWhwNjwv
	ijHjnVwwUz37SbhInGrc+rdGw/p+bc9ZwjWsdkHYaoAjWH+Upqd+Ygb+pXO+kksRADLD/LKnLxd6k
	jK1jH8K/HEly/1aXJJ7CnKSvYYiBNbKSm7MFZFQX1eQ2ZO2l1yb8GufMLVJoKeGJwGx5CVAFgSE1x
	iZWmdgYxRvsMhC/C8+w3KvkUYThlQrjedJYbdrVoH+PWsGXGcWB/vdSUISm7eOfr8OJggYg2osD+3
	jbPkw2kDzjRwipF900Y7Vga+ub3DjRW/p61XKnOtU3zXkyTWamo84WZ/n/0gtRkRfKkgbdel4NPNW
	3bMi82dzJH42luKGiPaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGFDx-0000000ASqy-44mz;
	Mon, 12 Oct 2026 12:33:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGFDv-0000000ASpn-13Gv
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Oct 2026 12:33:48 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0XWU2252940
	for <linux-amlogic@lists.infradead.org>; Mon, 12 Oct 2026 12:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bs2Jgzs7Tv+fLgxyw08H5RN1
	Ifr7kpK1dx9qY8mqF68=; b=lDMJcHN/OPzq1UlDCuCQ65E5z1RzyVIhBJCOh8QD
	AcYZMy5DsN7x6i0KGs2sryjcj3yWICTOYdljhsJZCHp5YNeHtNSrT1tC+Gh1QzoV
	avhztiEp2vcnh/FO8yDSAhCIK+mEKcD4BL79euU3FtK9eiE2JKGYcPw0HG5IUeFZ
	4507/+Uu3ClC+MovwFh7WB7arRHwVkk4y9zKPx01QYnbP3irlWzExK2sF6RK8RCQ
	cOhBWh4JVbPaxFCquDxV7wld/w/BRw3IEJOSwP/JLhUj0ZUgy0b/03/DnOnyTx1M
	NS0NaNSPm9B3kSNnbafdBJtd2Hh02DPZE4z/OYgKnhj96Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j712yrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 12 Oct 2026 12:33:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc40759b2so437182385a.1
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Oct 2026 05:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791808425; x=1792413225; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bs2Jgzs7Tv+fLgxyw08H5RN1Ifr7kpK1dx9qY8mqF68=;
        b=fxE8EtsEk+G+FxWQXIfHwc3a9ocziKu17hiL8I3R4lKnkLR4S9jHDjO8Bddu87z2hi
         0l7bpbKPzbTwZhyqCco0GyES9V3jnBOAdTj5wPb0mJc9+iC5EKKFbwyq7IrT39WAxsO3
         OLKCB9EJCVuyievLt76Wr60nL4oep1v36saJo/AYegzMWPwaou5/zd2lzYCcCYtb35dR
         tyXXYojX5LydlrNDzKMc8mIfGdU/+kM3rZfnX5qqdQSrS9gvvuVNO6KYwHKj3tSW2yPt
         Zeoanykaal8FSyBXZJxppps4+O3HzmYL3KD6wO3nhW271JOVXpbNxDtVxhCrV0IpvfKw
         VlyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808425; x=1792413225;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bs2Jgzs7Tv+fLgxyw08H5RN1Ifr7kpK1dx9qY8mqF68=;
        b=b6ljYa9W6HE/ZePj5bwafZRTjfrMUpk3dtKKIHxhFcu5EZW3Ea3gvojcQAD0FPfeAQ
         YWI3L+lxfmpahlBnBs73No22BwibcGoNdg8j0kQpZ9j/jL56AcPMR1OKvwyzZhFzkczz
         mCGRmIzu9Oh+l8wrsBYd1eAeO9kwS7eI2Lw6S9cyhqQLgxsH/ik+OdK5bpJdfWAKdUnP
         wZJY0HLvbT297FZtMpMiQWrXBMPo9PwUXNdsCSRSYoYeCMlNVa7gzB0H+DI16AbUv+G3
         mBXAg/yN/6/ky9Ib7GSgsFrm4P+6eO52ccDNcq10krny0Ac5FE4lK3nd9GSahbqHuyoL
         VY3A==
X-Forwarded-Encrypted: i=1; AKwUvByBsdFNJ1amGIhm1DpJ+HXc0q23yV2lvzDDRqmC4GbGcJtlm/MgRp9yqRKS/tPqdAjZS60wa0hoWciyz+mU@lists.infradead.org
X-Gm-Message-State: AFq9FYIbP2DakuUfQ1uyqv3Nq6lS21VbkbFke9TCdLw1xOmY/oIrvI8x
	Ue9iiqawWX0GvaFlkgYo4gip+Q3hEIk7AAlvH6faJ6YSbVYvsA1zYsCg3/soJAzzaSPbPtf9riG
	7X9Hb7dYAfZV3yXY8E0HnLBdKA0wGZh3CY2OKBdYo3eL4iCqUMvN0rZ6BjdvxvXSaxeahBaoMrQ
	==
X-Gm-Gg: AYBFou2OKI8JKljLIk9Olvqy5V4CYR4zGMDXd5fcW0ZMFI6QeqQDJko1hv8+NU3WXQR
	5hMjeK6Rc1WALkqjcaSJLl2g8jFp4CL2HPDAv3lK6tcO6efp67b2WMkoVtOE/xxLar82e34ecEt
	muex89B+vDTEbnWraJ9vulycowQT86xlw+6mTeJg7iz7w7BEOfwl5oZ1F5DUUXRHt+XKv6uFSX4
	xOe2fMz3XKi8mw8rgCSqz8e3kuwgYn3pMNZDzXsbg0VVrZ5snN4NAv88kHPoa+l8yFS7gCmhqHv
	hSmMdII95Tg5QPOORo0ufV75RaFdcsLJbg1QoW+j6uKCh71Hc8Ar000bUJJ349iQysbq5h/A3UD
	G9ue8NA2LNpJLbBcn90Wj+2NI4Kv5qMLiqjh1yadRfowcoSEUJbceuQaacCGlh63FXz4HBRQAow
	YkaCnM+0DoAhq8
X-Received: by 2002:a05:620a:6493:b0:93e:c12c:f12e with SMTP id af79cd13be357-93ec12d0591mr1359655585a.73.1791808425086;
        Mon, 12 Oct 2026 05:33:45 -0700 (PDT)
X-Received: by 2002:a05:620a:6493:b0:93e:c12c:f12e with SMTP id af79cd13be357-93ec12d0591mr1359651885a.73.1791808424602;
        Mon, 12 Oct 2026 05:33:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddea81c7sm2819066e87.49.2026.10.12.05.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:33:43 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:33:41 +0300
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
Subject: Re: [PATCH v2 01/20] drm/atomic: Handle max bpc properties before
 connector state allocation
Message-ID: <mkkc7pbeh3aiyhhnbkis7owqvvpt55lyminlcnu5gun6s76vit@5pmsxkrdey4f>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-1-1835d4966da3@radxa.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261009-msm-dp-hdr10-v2-1-1835d4966da3@radxa.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX/b4/3YCHp377
 WC0i+pqo9+1Rc4IPZ/7clkUeB+0xm7LipABkjTQxiWjoRRamJKt75r6vS1PzbGeAHQCP4JHKmZZ
 c8zLF8G0zsQYYYcZOH3Sp3PajLad+7U=
X-Proofpoint-GUID: MZpJ-qKaLROplxYpQZaS2kfeM9GWSyZL
X-Proofpoint-ORIG-GUID: MZpJ-qKaLROplxYpQZaS2kfeM9GWSyZL
X-Authority-Analysis: v=2.4 cv=ePGGH3p1 c=1 sm=1 tr=0 ts=6accd3a9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=ksxQWNrZAAAA:8
 a=uu4xuC75hOI6q6cYBXkA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX5UUu8N3F0Udd
 tMLtMStbQcNAV6tVc6cOZCsai05vmN+YguY7NZ5f4cFuzfkv8wZfsLZDD7WS7Y7vcTM6eha2/rg
 R385goms3vNG5MAedvm9CDlwMZBpkA5mGdJhh2ejfqNiP38JoNMwZRv+vVnis1v81K7pOMOEKYQ
 3zPwX656U2HVQH/daFn8jM1gHcFyV2Uvg22Pw7HA+c0GKTncJpLkhBo5VrkO+5tTTo9JLNGCbUf
 YCs+Q8O/QYJyO89Cs2bvLG/zCGQpRyArPKQpk35PenWeZlx9ltzXi0Whkvht8wr6j1I4bz1F/1K
 /PIrj2GiaSA4L2yNx89AtI/0xGwnZcO/V6Vf81PJb4kQCxt5IFR0XMcKrJJH42ups0mRz7r1yas
 XVjJ21yJDTu2LiHO9nWpVSIeEkCfhxJZ1vWj+mEbtIc/gPrnDTYHGIaKYlIiZ0cAkSxaF4MXnlL
 p+tS9cAxxfKDLwCImew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_053347_409550_3BB97C13 
X-CRM114-Status: GOOD (  16.85  )
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

On Fri, Oct 09, 2026 at 11:15:53AM +0800, Xilin Wu wrote:
> Allow drivers to attach the max bpc property before allocating connector
> state, as needed by the upcoming non-HDMI bridge connector support.
> Only update the current state when one exists.
> 
> Initialize max_requested_bpc and max_bpc from the attached property default
> when creating connector state. Use drm_object_property_get_default_value()
> rather than the range maximum so that state creation and subsequent resets
> restore the value chosen when attaching the property.
> 
> Cover deferred allocation, existing state and restoration of a default
> that differs from the range maximum in the connector KUnit tests.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c  |  8 +++++
>  drivers/gpu/drm/drm_connector.c            |  6 ++--
>  drivers/gpu/drm/tests/drm_connector_test.c | 53 ++++++++++++++++++++++++++++++
>  3 files changed, 65 insertions(+), 2 deletions(-)
> 

I'd very much prefer if instead non-HDMI bridge chains followed the HDMI
approach, making the state available.

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
