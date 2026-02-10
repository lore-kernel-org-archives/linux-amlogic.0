Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D98EB2718
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Feb 2026 21:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tTUpRuaG6QfwdSUP6jtQAVsJqoGnSlH1RdXnBZU5NDs=; b=Iw6wPaIMbEF5w9
	OmHKuzwt53bsbI31//KCVMyChXTYN3bQVOkIfAtwvS/cqHMD3esnDGb0ygGC4WVYQmkLtRTSWYD4b
	r7B6PVN6pZPT/NphVKkNpuE37JlQXmSuzCA6U9V7fhhOJHPX2AU7fK93EaXtM0XfcM1TVCyzw7WXU
	Yl0Vc7hmBp8k8b5PDfFNi2HLNAnBb5f0cwbPxPokTwpDfqDmAIE8K3H0trMcb9x/IDKYjIFNmyjrp
	CZEV5hUpM7+5DAxvR+G49K0goP3I/2SnJIUW5vUMA8mHqt9PAQYrqqi/dHQ1AOGd/Wn3quTidHz06
	CcN7eHNlBC5cB55XfNFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpuxS-0000000HVNP-1dgX;
	Tue, 10 Feb 2026 21:07:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpuxO-0000000HVLp-0Skb
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Feb 2026 21:07:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AEHrn53919386
	for <linux-amlogic@lists.infradead.org>; Tue, 10 Feb 2026 21:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WYekD6MnY0SEVsICbNMS91My
	xF2Htl8S3olx63sNyJE=; b=BOj42PKjqHWpHuUFFKX7fABB68llL9h3EjDxQ+m7
	RERiH64TbniHjMINOGhJxsL/cpuR5YC41SHlQk9ilvrSLQ5TzUeIPi+i09rdl2j2
	aAh48Z/KrFLSA4Q3VhLof+0nEPrq4Tsw2aVi8cvG+H57j7nheg60qt29lIzC/59H
	KDB9Ljm9wjXiNBP+W+TJPGxeKGosACMgNDLFAoBHrO80pUA9Msw1HWXhVgR11zsL
	spxo0TF6+3N4sa5NTOoD+34Pvymqqu+KcKOgL1bI7x/xGJ7Tzj2W8gvtiqfvYMPG
	lcNfvwfEZsxPldedJmGFaaJaxM1kQPqAUYd4+vQYw/u59A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c86akhcdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 10 Feb 2026 21:07:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52f07fbd0so1932627585a.2
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Feb 2026 13:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770757655; x=1771362455; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WYekD6MnY0SEVsICbNMS91MyxF2Htl8S3olx63sNyJE=;
        b=Kl+kQ3Q68sKtZ87XqAotBBWO6omN35q4CQ+VJCPAsfY6CONkU8pVL1NjreXj/KXZqn
         /8MH1nLaqlbEr4/uuOHaqqmJ1a+N1/wtsO8YMCkshYe9Z2tKnbDjsw2lvIBmSo8hKQZN
         FnO+94eZwHDqBlKDoksCwnpNg6l6tUWzsxLHxh7Vz9FDY9ngMEkn3ktJCezS/QDn4g+1
         JJXgHCLucIYK6YrfEp7m5ofXVIOCNI6jTyVfHBhNs1hVhCPlnlWWE6RvblLc7b0DJAaq
         kJ49fmuo+9iOkgvooZSf8jRjBaeyvdBbq4lWp1pGWZdNGzGZC12zpBiQSUosHIsjGTA7
         JRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770757655; x=1771362455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WYekD6MnY0SEVsICbNMS91MyxF2Htl8S3olx63sNyJE=;
        b=pwK2RBVbmfgrLtwfGJUdpBV1dni8FxeiPu7WQfc17bbcA8WVj2rbTq5cUEWSDR4I1i
         Fud3wnoyNDEVH0c7XhPKcKRthbjdqVuRPpX0+XQrDDau2KIa6J0NrcJ05UCqYOOI0QgY
         /18q31faIJfybI+oF1HaHR2BCrh0Ys13QAnKv1oADgHUNM1yxg+XgigJQq+FtVlUOrS9
         4N+wRoi8BzvlmPmJAey1vA5Uuy8pcyEzba4yQmB6NY4wA47jyX21GCruC/Z3qu2CG0PI
         ub1jfkHdtMzdHTL/gpvORbnn/2FkcWNgsLyEoIedSlvzL7brano6mOqYW6GzNOjbfCiI
         PDJg==
X-Forwarded-Encrypted: i=1; AJvYcCXvOWO8gL4uPWjiHQj4G/YiOHA7j5TQdaFSXCw52Uc04/6y3WciaFCkVqD2FdIotC3EA5I14p+86NI9qS9r@lists.infradead.org
X-Gm-Message-State: AOJu0YxK8gbGHajE/WZCFmqDfd1zqbr80Gf9Tr1jH2rQcdg3v63qjlp6
	L0eGM1+YwYVBoE6TRF4QRvMyxfv52UWwhcozpevpXK2HyxOxLJmaO2+bUyc/eAZ0ODmEtlyIlAo
	5OYVZ5uF6sDcU+qWloX6ToWiGdip2cLjX685sGY+ViDXqO4rbe2smEPyYb1Enjvf5/4CRx2inEQ
	==
X-Gm-Gg: AZuq6aLVACdU/KzgX9WLn/fpGvluW13PvC6wE5zDd1V4sIz68OX8UDUqtaF+ylp0Aoy
	prv3e1RpwIDJ00vf1Pn5Wr/0Q8gMo9jlrMOuNHoiO5yMyf+bycZraCtsq3OJ4PJvoMxm5d7g1Wl
	q/8xooBTUCCafwuozuIE9MM9gWzvo21266wLCD9SBER+FrRNOrynihwVTBt8GEuWgNg05WuvgqU
	KQLEEmJLhiM3KRvAcnWjuHUA2r7+d2FTWIsX7BHSApM9C3OTE/gFVd3u4x2mfQnYOAjqJHTH3CT
	lK8ha4aBROre2SofNZPKqdDkxstGuYLfdiJI22g2ryeHrelmz0hbLe6Wg0BQrGp0TASsZPshiDH
	lwNPdwRdVBXMT/yTdbwML1zIhuglwQqWmnEGSCYKJvBN6Ut+i52M3GDV9OimfrQuABkz07UNxoZ
	C//MFo0Plhv82w1fKKceuUynr1pnDLbSTo7gs=
X-Received: by 2002:a05:620a:4492:b0:8ca:1240:4990 with SMTP id af79cd13be357-8cb280bc385mr75881785a.86.1770757655222;
        Tue, 10 Feb 2026 13:07:35 -0800 (PST)
X-Received: by 2002:a05:620a:4492:b0:8ca:1240:4990 with SMTP id af79cd13be357-8cb280bc385mr75876785a.86.1770757654672;
        Tue, 10 Feb 2026 13:07:34 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6ee4sm3514472e87.4.2026.02.10.13.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 13:07:34 -0800 (PST)
Date: Tue, 10 Feb 2026 23:07:32 +0200
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
Subject: Re: [PATCH v2 3/5] drm/ci: uprev mesa
Message-ID: <sl7sjcaylfmemxnqfs72wcb4mv4smcn2knhcj4he7skmgawqey@mzgj7wwzjvgb>
References: <20260210071138.2256773-1-vignesh.raman@collabora.com>
 <20260210071138.2256773-4-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260210071138.2256773-4-vignesh.raman@collabora.com>
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=698b9e17 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=QX4gbG5DAAAA:8 a=eEoeB42FsikaTLMEZsIA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: 6W8mhW8sqTmJPIN9f60aUKMSlTZHp4Ib
X-Proofpoint-ORIG-GUID: 6W8mhW8sqTmJPIN9f60aUKMSlTZHp4Ib
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE3NSBTYWx0ZWRfXzDplD4MoAe0U
 rJDT7hH4LFD7rCTDSEUPbI5IpVZXAbjrKpJpedq+T0Md20l8/JW9luCs8sKv8NwSLe8GBoX9LHe
 LaIPT1i0DRe9gdOFZvkwyP+sgezOcfXxEVFHMDhL/ptzLPHMBhdhFXmV6C4gSTNmOw3Bb7au8Ci
 HX8gIiqd5a3s5KM2QspoCaOgRZ2ZpNxQrxBvi0R+3t6fe2K8NWHXUD0pl1v8pyvEXzILK4Us6LM
 xZYOVmOoQV+Q2s51f44VqveWm0Z7SzYR5U9wsz8CeJaoRkPkjmGYqSxsBK9OYJHi4kLgHsfINxQ
 NcQ4trq0lgkhatV5dFOwXllFUNudD/kqI0MECw+csL9p5C11gHcE8oqFIsU253YQnQzP22YQ3n7
 Y4BpnavRyUg2wP8cCaYYIcOdclI/jLOPnprAYdRhle+BaCa8jjBp83nXKaiZ6Ry5hiAouXJHHHM
 4sbiKzPr/YkqLaPrLQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_130738_262588_59DECF60 
X-CRM114-Status: GOOD (  14.21  )
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

On Tue, Feb 10, 2026 at 12:41:32PM +0530, Vignesh Raman wrote:
> Uprev mesa to adapt to the latest changes in Mesa CI, such as:
>  - LAVA overlay-based firmware handling
>  - Container/job rule separation
>  - Removal of the python-artifacts job
>  - Use lava-job-submitter container to submit jobs
>  - Use of the Alpine container for LAVA jobs
>  - Various other CI improvements
>  - Remove bare-metal jobs and disable apq8016 and apq8096 jobs,
>    as these have been migrated to the Collabora LAVA farm
>  - Fix issues with rebase with external fixes branch
>  - Update expectation files
> 
> Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> ---
> 
> v2:
>   - Merge patch to fix issues with rebase with external fixes branch
>   - Remove bare-metal jobs and disable apq8016 and apq8096 jobs
>   - Update expectation files
> 

Thanks
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
