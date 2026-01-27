Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97204D2F037
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Jan 2026 14:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wj4cL5/L/R7qXc1TgUpsgJjCK6uVgtcGyMKf7UvvApU=; b=o6THBj8UVJbIrV
	I+LtlAQRWafv/5RpoYg6AqbegzHebUbBrPve+xTqDJFgNjWG7u9EwAHIPx0+hZqNWG1KS18J6VOT+
	WGaJB0Ie+OrKLF+T/r5PjNMKZfIKy2fVnwbCuozHXjaAhPIn7EWnrOY/dO+CWrQf7JYtDBCy21sJS
	ZiNArGDPXKstEI9MgeH+Bfvb8P2BtMu6phSNsv+qZ+aXvZpc1zCtr3mrBkI2IRvCT8nUGqXOhsmBx
	1gOpBx6EAeAs8e/1BsERLC1ojYZ0NBYR3hxF7/mKL47HxN9uR+9wIKldLRXGdvqAcUarMZKP5AEhC
	88JOMTbtUKwx5PnqpBNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkk19-0000000EO6M-42Fd;
	Tue, 27 Jan 2026 14:26:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkk15-0000000EO4f-2wZm
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Jan 2026 14:26:06 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAcNqh700191
	for <linux-amlogic@lists.infradead.org>; Tue, 27 Jan 2026 14:26:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LeBGXuVPBeSkZrySiP9d01PK
	e2NSJk5/OBYu735H4lg=; b=D7eUaL8F/NQC5dIugNwP0PYoJJ8XMLVA/hWsVtxI
	TzAG0cBfSO/OEVWj3LXovywqEr0h5KcKGsN1gbRNggn55uj5TJDlj0P5rz3fxiR5
	uQTSTvRKsWKqq+4Cy0kPTyOMgUonpOpduLhMhALGfpBU071fhmEWYSFjNYvI+wJF
	Qw+GJ64tAdNnxMco95gcqFEP8Cr1Tr4YCjwDaX9mFimeBof8Mz2WvS/HCLCk+o5V
	NNWFIh0XXSbz7xwg/dg13RYXOfzzxDzHQr+sGFOaI8oTYjsA8wPvpEwmb+ChduZp
	Y0HvDtg61ADlLO1qUzsxlcZnVGspsBhvv/VrlZEvFhPK1w==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxew3u38r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 27 Jan 2026 14:26:03 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5f52597aca4so6221469137.3
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Jan 2026 06:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769523962; x=1770128762; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LeBGXuVPBeSkZrySiP9d01PKe2NSJk5/OBYu735H4lg=;
        b=NZEChKekvwOp3yCEGoSYO+eHfEGTDd0fkyhl29hKeJEeupNPx5lUnYontCk52OHtAW
         ZzGTlvK4SVyhtQAt1A+UkJCPIfD5wKl6Ck5eD7TroSZctOY+bOL7MhyApMDOgFwSEBPQ
         IXGnCx1oUv0yCADDVun6SpO8eRRtxhPNNZ6etqia+ga1+ThQE2Ni1m9FFeyzRjjHHK1/
         C0JgRKtY0wi+rpnuu3wTgRuPehYH7Zr8xRmH6z9c5uPhgSErjBjB7XmeHVV5lvgWrG37
         LExjWuosQtrtCtaihZO4kJapJwH75Rt6uYbJ+lcxc+hTFg45DoHAK5IkpHb/QF7g5qu/
         XC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769523962; x=1770128762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LeBGXuVPBeSkZrySiP9d01PKe2NSJk5/OBYu735H4lg=;
        b=f9Z8vUS4C0av7YEQSxo1jc4kxLge7KFYfkmlHM8lB3HHfy3cEMviC+oDeHIA7+LLuk
         ppxIfZx6LMnXTMbmwMI/eDwFdFmTKWmgiGUNE/6b5JSGCuf/kcq6l+SLTsYFsdrnW8M8
         EDRlD2UXntcKQO1DuJphQg02gvK5ehsu1cMpyonhyYv4o6JboFxSF20N9T+jRoC3G+e4
         MJlxyrif4iDLjzUj3hoq2WW5Rgbnj7584OfDLXE0MNtelnMFBSd33GuF6h5kHMu38iYs
         MhiUI63YoB8muEZDc0o0yLxqxBBfP3HCzXhbsYZdgxO6oE2oNNJZlCd5gU0skMMbc2zA
         fYNA==
X-Forwarded-Encrypted: i=1; AJvYcCWkLagiWbW4gXcxdlzAMpp96E9aCFcD2KqHVZMjabN67HR6jiqvZr1Jo61QPFPHpV8YqUUERlnZ4Iy/dbgE@lists.infradead.org
X-Gm-Message-State: AOJu0YwTc0P2rfe/C/XsJNHuf2+cqWiQfPxupCrsJTjpzvmAX61lgf6W
	sC8YeVUk4wCgpCExaCq7kS4S/Ecz8OGh3jvIsJuBr5UcEbC2tBDelBiWNRokahOy8M8VMFn0G7f
	uqH86lPzsEhdYuusQPC3+CY100DK6y8v7TfHs/ozYrKW5AbvXVZ5cEAtUA5FfGrcH2tGFReXYQw
	==
X-Gm-Gg: AZuq6aI1Iwre4tsp/IXe80MeMgC4dU4l5Jl2uH6SAh6xThqQuDKDZT0h3r+h84eHQoP
	OzKQh7E67F8lMghgdPxCGwlIVx9/xzKrqEgWmcxfR3Z3yFahj5g7ZJqBIe/iUjNL/3MRw877VgY
	a1GxnyPEt5g466HAjTSO2s6xWX2YLC5G+41uH7kck4kxuGPvfPN3kKtVj0hJfQQ5kPZUTyz0xOS
	Pwa+q/niZbjEoIERhm+8q3cyeat7td9grFr28XGKv4bcH60XrpY/QG85Ko3dDbjtNMU6xpxchEd
	W/gbkQipefhA6hKvoVd14tLxBwrEso+sfrHfjh5wL646b9g3Rj8kUzeLIuwVmVxcGXLJ5Dqg2Ei
	kwOLaOBtVkHCmZwBX1tgtiSlCpWQ0rrlEEKHdI5RPibofJwltDjp5ZDmLZfWwTM6DLjEd1PzZml
	msqJ7sXl54456cY10gmXPr00Q=
X-Received: by 2002:a05:6102:4610:b0:5f7:24db:fdb8 with SMTP id ada2fe7eead31-5f724dc08c8mr478873137.25.1769523961055;
        Tue, 27 Jan 2026 06:26:01 -0800 (PST)
X-Received: by 2002:a05:6102:4610:b0:5f7:24db:fdb8 with SMTP id ada2fe7eead31-5f724dc08c8mr478854137.25.1769523960506;
        Tue, 27 Jan 2026 06:26:00 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59de4918965sm3637789e87.55.2026.01.27.06.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 06:25:59 -0800 (PST)
Date: Tue, 27 Jan 2026 16:25:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
        helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
        lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
        guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
        valentine.burley@collabora.com, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
        amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 6/7] drm/ci: uprev IGT
Message-ID: <5vxrhiilcsaull2airasmc3pjqazvswrtojozz264i5vk3m6zl@pgkdwq46p4ho>
References: <20260127104406.200505-1-vignesh.raman@collabora.com>
 <20260127104406.200505-7-vignesh.raman@collabora.com>
 <zi7frtnecrzyei4fl4nmwmth3icnsyycxxobbrcwovbqfsfq4z@eh25dyfrjkqz>
 <9949e82b-6ec2-4975-939b-d6a709ecf43f@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9949e82b-6ec2-4975-939b-d6a709ecf43f@collabora.com>
X-Proofpoint-ORIG-GUID: BmEI4e1X7PmpJxIXZmfV0hH8efC16b7p
X-Proofpoint-GUID: BmEI4e1X7PmpJxIXZmfV0hH8efC16b7p
X-Authority-Analysis: v=2.4 cv=J8CnLQnS c=1 sm=1 tr=0 ts=6978cafb cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=ocmXNzLk5YWpj9Dh6n0A:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDExOCBTYWx0ZWRfX2TxVfye/QkEo
 Qb6xkNVym7UFL2JYKbQ2GeEuOnqCTSZGxvTrGttG1fGHE5W6I0AK6RJr9fqML7QmYOtKotoqOzr
 BKwQfk/AGMiQ5IM12wi5gukx3LoWkdO/B9W9VRK/720G8X6/ZzoHPStI/2EmuiUlR+CRFHgM0/X
 66LdPDwNuHKnKB17mgtp9AjxUHvg84Jm9oGRcbb2w1O22o9eAgcJeL3YqNEQITwjooZFo8umui+
 f/jw7Jckq9jmktVXkI0Tw4e4fc1YCyul8GVUULVe+Xixry2oLB1yWAQWbM5wuDM5iT5Btadw9vK
 iUdQlzAdsgdrEriaLbNG2EL4X+O7YEfJW70zFn/n+BZv6IpJj/JNk7XcszPIhnd9JeeCi/mYsjS
 32H42168ST+IMBvmDbFJvP2LIkIk7G8tzlapGwn+pEfhqGjee+5prG/o3MNDZfWEobCEcyKF4PM
 slmBA4LCKTJdUNGH6NQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_062603_739839_7DC3DF8C 
X-CRM114-Status: GOOD (  18.89  )
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

On Tue, Jan 27, 2026 at 06:26:11PM +0530, Vignesh Raman wrote:
> Hi Dmitry,
> 
> On 27/01/26 18:01, Dmitry Baryshkov wrote:
> > On Tue, Jan 27, 2026 at 04:14:01PM +0530, Vignesh Raman wrote:
> > > Recent IGT [1] seems to be broken on MSM hardware, with many tests
> > > failing due to the old_primary->index != 0 assertion. Uprev IGT to
> > > the last known good revision where the tests pass, and update the
> > > expectation files accordingly.
> > > 
> > > [1] https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/commit/a909ab05
> > > 
> > > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > It is not clear, which parts here are due to Mesa uprev (yes, there are
> > some of those) and which are due to the IGT uprev. Please split into two
> > commits and make sure that Mesa-uprev passes more or less clearly.
> 
> The mesa uprev and the IGT uprev are already split into two separate
> commits. The IGT uprev only updates the IGT version in gitlab-ci.yml and
> xfails.

I think I was not clear enough: Mesa uprev also causes some of the
xfails. Those needs to be a part of the Mesa uprev commit.


-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
