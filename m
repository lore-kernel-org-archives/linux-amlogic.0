Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDDFCEACEF
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Nov 2025 15:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I2NrLJF/WrgfpSJueianMkGNUZnpCRxpk3OCkYDgk+I=; b=mUGKIpCdP1iPhP
	j9y9lB8Xpi7eiI46HGfgiEBR6Gzmpll3wlqG00PEDXEk5rp79gyuAcagR74PZtTb/HGaJGsN7cJB8
	VlSKoGtlQRIXwhpQIygimBG2fs76xvfB6Og1zk1PLtEv4n2OSpyrlQM1DHFsFyIOCtsr+GhSSmles
	3q/+94p8eF06piE6sbHmslsDZ5rUNwEi4LrV/TZO6WXySIjO3pbC4NHOZtnXgpMSvnja6Oon66hJW
	/qTTyq3/rL2xsSKUC6t3vo8WoILSz+QFG/2kZZmgvRagTKIljC2pHG0jwy2tNw0nIBlpeMbMBhkY/
	z3JfCYQJ6hQSLzCGjXMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKejd-0000000EnRY-1Jzr;
	Sun, 16 Nov 2025 15:32:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKejZ-0000000EnQP-347i
	for linux-amlogic@lists.infradead.org;
	Sun, 16 Nov 2025 15:32:11 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AGEutig1587711
	for <linux-amlogic@lists.infradead.org>; Sun, 16 Nov 2025 15:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=brXB1Y/LPVXbRpByEO14Lypc
	5NwpFVTcCsuQsNLy+W4=; b=STV1aCeqitSSB1V44tB0l1zmgK/7jDhruQaVos81
	EssOg08VRmId+HKWwnbjmu1A0oxPC5Ot0Oyvyo87OOJHticVG/YB653NVBPtYm9d
	UMItP9V/wSh+4E91LFlEQhJNuVhFvVTS+/bfsvX8obshzPQA/diigqQyXgEmYa+2
	zxXYJ2F40o0rqOYznjpqhDid9v6g18id9gJ19enQV+cFgUdkWcy+0mxpFb239eHs
	p3aVsMkvNCq6kwdAPk3OKLUDSbymiPKKYAioD2H3p7O3WWKAQeMEmM52tSJ1CZTR
	ylI817cj5MU9L4CVRhwrC+CcUAq4YwWU/UgKqZenuQxUbw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejh32ads-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sun, 16 Nov 2025 15:32:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e2342803so274499885a.3
        for <linux-amlogic@lists.infradead.org>; Sun, 16 Nov 2025 07:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763307127; x=1763911927; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=brXB1Y/LPVXbRpByEO14Lypc5NwpFVTcCsuQsNLy+W4=;
        b=CQefzll6D6nwe0W+pmJvu9nTMaeXGMtZsPLQdGR2f5QUd+sf9g7Bj66c3OYHXV2yPb
         DIdD8x7OH8nNaa4Kf875WAu3Oc9v/RLqBemG1ljkSxAyCDzPGU+0j4Vl4v7IoM9LNSKz
         Im0+5fx8kNkbmEhw8/lX5sBippHJ/w6dMaKyZ69WXdLp7A3bFB6PrAS9V3ooNpQHLkh9
         jqiPkOJx7XnRr3f63bV0aA3xx/lEA7O+RpCVZtdUvIyguXt0MKtVrC1aA1BXZ4FIJA4H
         xgGiG+775hhHaaDNTfEAqKpsRhfYV7w5ou17r7BL/wfAXCKJGdwvDE7GUcfluQklKXUj
         bN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763307127; x=1763911927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brXB1Y/LPVXbRpByEO14Lypc5NwpFVTcCsuQsNLy+W4=;
        b=thcA6FNXe90yGyXtgXG33Y2dNwcG2TANDV9XKmckmk4PYbsqqZoYnGO0pTTaKpHRzh
         iWEH3FSm7PZkamZQriUGutORu0yiya90rhwS/60IjYBjsWr9KbdCYmqXYCz0vz7mqKjZ
         3j3LHX/1IFpQ+X5pAwHk2+Ka8qSTx3GPatBIRoWCCc8bO/46m/+tvVLhuZPUs+EmWApV
         MwG88Yn3PpRi6hBCjKKWzdyAEG1bcCdRx41Z79PiDinAS9Ie50AjxH5xQ7lPH8TMTtgb
         Go98nlG2FOx88DUE3bUEc1sn98F/lyW6Y3FNqZnnFROcpi45wtLQTuMPh1iD5TQOkzCx
         ONgw==
X-Forwarded-Encrypted: i=1; AJvYcCU+v4uSxJtXNjRYuPKC0oszERqnT0hhXp+MDefiVXe4iUXBJBe5r5VY/jWleEcDqSLj5wZeZqb4tZzhBSvW@lists.infradead.org
X-Gm-Message-State: AOJu0YzQmQTyL+6vrbaex3n3lYpOZktcZ9VC8HEhMnvhLOp9GE2aDzJM
	NxFmoBKYBFNnwgm5xaPxIBl35bPUIi8ibJsCTIDsJxiQM2VW8CnuyBKw5yESdS1qr3rggsY97BU
	YXKTHYKF4VBRfOznXfqeStIdspKMcRLdLLNe89jQH8Ct8x5ZHNbfBNhWOY/HKxYCJAhYIs4gnBg
	==
X-Gm-Gg: ASbGnctU0IF/h6lxXc+qkQ2ZbWRVORL23mV3acE6l4UPT/lZvtNqazhnYp0erdVkOEw
	7559ObrrWhHEMK5zoMDfZ2MAa7hlHTjjrogtelUuhTmNKB7/fG88D2qMCmHFFvmoZvBhTd88nbh
	edrhpdVCkvax2OKlZBF/QTGEQBxHfTrPyEkZ0cFDlYnD4ZOjHXQ4vLdKBBER6G5GfdCIZNGPNQV
	+0t6qov+hGHd5H2Yi1sF9J5asjEliRBRenfBrMhvw60BI/40Y6zdJ3dKsYurw3V2ae5ZV8LsqDr
	Z1U2bS6Pl9epbsgo2GqXOxEfm5t8X8/Fklx3ege+kgQaRZD1NTv7Wp1BGZu6X289NhBxlfgReG6
	KtkDjwOIhyxSOJEGza0YVMmpbQ1rRtZK923VtS1dLNTNxFqH5DkawgWDTte/QENGJvery/oozTB
	gdrwJ8HyLT4z6j
X-Received: by 2002:ac8:7dd6:0:b0:4eb:a3fe:53d with SMTP id d75a77b69052e-4edf2177a96mr137560941cf.79.1763307126879;
        Sun, 16 Nov 2025 07:32:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLhJkaOMAE2symS5kOW15WypsaRmGyogTqDdNGkh+5TTdpKm+0QEXmKB8gHRw7DCEiCrhb5w==
X-Received: by 2002:ac8:7dd6:0:b0:4eb:a3fe:53d with SMTP id d75a77b69052e-4edf2177a96mr137560551cf.79.1763307126391;
        Sun, 16 Nov 2025 07:32:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804003a4sm2483875e87.59.2025.11.16.07.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 07:32:05 -0800 (PST)
Date: Sun, 16 Nov 2025 17:32:03 +0200
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
Subject: Re: [PATCH v1 1/2] drm/ci: uprev mesa
Message-ID: <2obhppq6a4ercfnhvm42tbbgh3xut4lz66fc4j7mpev5oxxno7@dydu2wysmgvi>
References: <20251114030056.1139570-1-vignesh.raman@collabora.com>
 <20251114030056.1139570-2-vignesh.raman@collabora.com>
 <prjwrsepfc3b6ozhue5cp66khlcvdrpvpy6jkk23edncmi4l3y@oiddmamgg3mx>
 <42v64xdsaqug5yy76yel4tukh6wkt2tp237vlnpteabyl5qjo5@iigtgujvecwc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42v64xdsaqug5yy76yel4tukh6wkt2tp237vlnpteabyl5qjo5@iigtgujvecwc>
X-Proofpoint-ORIG-GUID: plqiMrQRk4oXG-Pid-CWqJCHrX1sOadR
X-Authority-Analysis: v=2.4 cv=EtnfbCcA c=1 sm=1 tr=0 ts=6919ee77 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=QX4gbG5DAAAA:8 a=zodt2Hv4yxvvtHnNIosA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: plqiMrQRk4oXG-Pid-CWqJCHrX1sOadR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE2MDEyOSBTYWx0ZWRfX2TGTuuH3O2jg
 764SkS3kntdqw+yVzwcMhEF2slkZT2j2TPGfawlnel0nsIC3jkhB6J6o548tkeAOBTQf63aLKgb
 t7vwzZHS2O10YEnLjyOv768dS57pNqwC1DJgstxhroq+4QCWA8gL0skNNsz4qf82PvFR2N2q9/O
 Z6a90+DwMLDzf9WdlFWVZSa2cwXOCPzkXX9SpMnyklNs6MKGHQ/ul4M/lPpdkAhA8+f035nsYyf
 imW1ofEAeqaFZMKNEtd0bd62rwnh7AJexA6BzfPgn6rP5LDVn2J2k4+LiguM20krYnaaA1sGUzH
 pQMngrYuCiK8cEn4dsy4go+l9H/jxfVQDkSwLzFihvNlm1HE3oIMHDP6MUD6VW/OaoMJ9ZCADyY
 sfJBJWDk5XApymVnyQt+xqUeGo62QQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-16_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511160129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_073209_891328_6E7FD64A 
X-CRM114-Status: GOOD (  28.72  )
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

On Sat, Nov 15, 2025 at 05:55:17AM +0200, Dmitry Baryshkov wrote:
> On Sat, Nov 15, 2025 at 02:44:56AM +0200, Dmitry Baryshkov wrote:
> > On Fri, Nov 14, 2025 at 08:30:50AM +0530, Vignesh Raman wrote:
> > > Uprev mesa to adapt to the latest changes in Mesa CI, including support
> > > for firmware via LAVA overlays, removal of the python-artifacts job,
> > > split container and build rules, use lava-job-submitter container,
> > > and various misc fixes.
> > > 
> > > Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > > ---
> > >  drivers/gpu/drm/ci/build.yml         |  22 +++---
> > >  drivers/gpu/drm/ci/container.yml     |  28 ++++++--
> > >  drivers/gpu/drm/ci/gitlab-ci.yml     |  95 ++++++++++++++++++++-----
> > >  drivers/gpu/drm/ci/igt_runner.sh     |   4 +-
> > >  drivers/gpu/drm/ci/image-tags.yml    |  22 +++---
> > >  drivers/gpu/drm/ci/lava-submit.sh    | 101 +++++++++++++--------------
> > >  drivers/gpu/drm/ci/static-checks.yml |   1 +
> > >  drivers/gpu/drm/ci/test.yml          |  18 +++--
> > >  8 files changed, 186 insertions(+), 105 deletions(-)
> > > 
> > 
> > Thanks a lot for taking care of it!
> > 
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Hmm, this causes a lot of failures, see [1] (note, the run is not
> finished yet):
> - On some platforms (msm, rk3399, mt8173) the
>   core_setmaster@master-drop-set-root test fails. On other it seems to
>   work correctly
> - sm8350 seems to have some issues with this uprev, it cant' finish the
>   jobs at all
> - mt8173 and rockchip:rk3399 seem to have other test failures too

I have fixed most of the fallouts, see [2]. But ideally this should be
split into two parts: fix before mesa uprev (I think some of them are
already there), uprev mesa, applying necessary fixes and then enable apq
jobs.

At this point I have no idea what's wrong with MT8183. Most likely it
needs either a DT fix or a driver fix. The driver fails to probe because
it can't build a sensible component chain.

On i915 several tests kill the hardware, making it timeout all remaining
tests in a bad way.

BTW: I see that for some of the drivers we skip the absolute majority of
the tests. What are we actually testing on those?

> 
> Could you please update fails / flakes tor all the affected platforms?
> Also I'm really interested in the master-drop-set tests. Why do they
> fail on some of the platforms, but not on all? This seems to be some
> infrastructure-related issue, since exactly the same kernel with the
> same IGT passes those tests (at least on msm hardware).
> 
> [1] https://gitlab.freedesktop.org/drm/msm/-/pipelines/1547684

[2] https://gitlab.freedesktop.org/lumag/msm/-/commits/msm-next-lumag-db820c


-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
