Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD41DCD6E4A
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 May 2026 07:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ObFOQwZqKnunVG0NS5HoaOH815I19onilpjIQEjl1j4=; b=XDAh3g6GT0752S
	oAtmM9dxBNRRw4c1Z/KV3pls2dJQNkP9rrkWJPTa67DBdVXcVs/LROP1i4LKdB4Zf1yUF2uZAcqCm
	EQjcZ5nCthPOW0+mFNvo8rlw8U1JuOWSb08nT3Sj81PLIEjMmGiL2eBswp8N2NHrWfu7J3NmxvUID
	Xw/rj8lfd3xZMxdcy8EqLy0Ii/os+BUPy/u0kQnGI83HMqncGRNwSTUXT2mkkYPoMRILaDaCiNETp
	Iq/aVNEmu0BlP+N+Rk1TFsKHzDtNaX/2lHN6/3gIXvFgYU/Crn0bFMC+FdyCFOsuhBjxRKpgFNpE/
	fp4+PpMbEjqwr+8bqudQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTDun-00000008VW9-2Onb;
	Sat, 30 May 2026 07:15:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTDul-00000008VVH-02R4
	for linux-amlogic@lists.infradead.org;
	Sat, 30 May 2026 07:15:24 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64U3Q2jb1399325
	for <linux-amlogic@lists.infradead.org>; Sat, 30 May 2026 07:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zpLL/bJKhYc82nklFMC3Foe+8nUBtL56C8X+bnVjl+w=; b=gbrnMjF4LLenVLGs
	S6X2Wxwugv8VOgBYzORkSgsKrqYe1EmWqZEv6erzqnqaITW1zIjvX5VQKfdt4l3R
	9W6+1iIDi8/ft9A7CJ33GSZ0kIo7h22MvO7CT1UZOmroPRF7REfyin4FkQ6TtTjR
	8dcCQ27zjkni4WMh6YUhTRsudTa0EVc022w8io/Rm2tDIiDLB3xO6RkMO2TPpy2S
	iq3kkJqrv+kR5EW+YHKO+7ExMIfGQii3Ac8mqC9a8hoCHoSPNWTYPPu3ai3G+KzL
	IbTBB3NuW6QjSARj1fIBM707JJ/t4sgMPFC5nOOLS2lOagX9mEMsXRUzQt4s24+V
	gJDX/Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efqyurdsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sat, 30 May 2026 07:15:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516d4a9e852so35163501cf.0
        for <linux-amlogic@lists.infradead.org>; Sat, 30 May 2026 00:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780125320; x=1780730120; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zpLL/bJKhYc82nklFMC3Foe+8nUBtL56C8X+bnVjl+w=;
        b=Hq4Z/tm8v1Yohc1NsG+kqkjnb2gWpgAPyJbfrqh5uvi8tIFSwwOKBqwAvat9e75CyJ
         Pn0iogzcdN3ha07FRavfwsoUaX6MqiQYpGu1k78LRvRl/tqsghuo3ODM1YvTntlDeHHx
         R2pt6dr0OmQm3VLq2RRZ+0ucjJgUl8OoHPFjsYMqc2cWOPvU279B+sXBkmbb37Re0R1G
         EjYUf5hJIrg7fFsuifrKPRJjkmA71NhL8CyyImzwbkkxfdc5GluC/zrnFaOhyfPV3HOC
         xeKrR1lDN2fYgcI+H3JvpVCMOF2BJHS+fb8ZMiEYXUCQsAqxna+sHonnPiH5A6pM5Cq8
         6GmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780125320; x=1780730120;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zpLL/bJKhYc82nklFMC3Foe+8nUBtL56C8X+bnVjl+w=;
        b=gQ0F0rDKIW9ES6fsVJY76LWyEiwyF6ZxHuD0xYQOvW9IK+sbs2Pj3LXX0wFnp4OuPP
         xdzG7ucKpdKd04C4YTngZf6irQL9x5nPdjWASBCDAqhNKXMFhEz3vojxMNepMxgx58rR
         MZVI9CYM/Du6gtgPJCD+DMBkAw7/ESAy2vpvOGrH1IyOA26mCcJ3QDcL4aMPNw7CMCKr
         gcMWP6GCaV3p7LkEwyg9YxUHiHHKWfj7P/Xy0OPSlK+qGKAJevCGwSZcCiiXAol8JSqu
         o4JOgH/rSoeZZjCL0ZHe+fNmYCzt9iZJj5f7UvLt+B3yNUS1PpFFj/uvwyz0BvOIGQFs
         O49g==
X-Forwarded-Encrypted: i=1; AFNElJ+vzTryBOYJyUTxJydGpAHNM0mXJk52GYoHibW85PNrwoFEyKFWRs9qMMElSEvjOTTy4dtruOs0j0Qviuhv@lists.infradead.org
X-Gm-Message-State: AOJu0YwsyV+ro9n1T6dGdFjxe24ox2xutoU5tmrg4jM0kf4s5aYVnxUw
	HmyVQjzZbX1r+mwZZYQRp+FryPDo80tTN2yC7IODwk7J0MYXT6OrVmMUg/N3kQo19i0M6QyQ/6Y
	NmRQecda8kZxjQZ0R034Cv8BbH3dH1Ch5LfNMslwwptttoTj4cWX4ssmvPgkyEPCnSYJp6rdkpQ
	==
X-Gm-Gg: Acq92OFJyyxkihwhH5kxZS0mu8v2C68KzJC4VyIwaNAI82691F2YIwav5wDPcXv/4aj
	st6UdfHa/5apaqObajmbAJGUol0ASHcOicKaC41ZE3ivNDGgrOgucPO2bBUEPkEbf9yUMCFjyiT
	NexU2TIrYe6q4Ga/ZOxXFsBmEgwIGoAk/mH7ac6y4qAFZ+z/OLpGcFMtf8FzuLIRo1QR+zvWKzg
	W3abOZfNiqOpf08J51c2xAjmDdQmVB3gR1Q+cLjooJ2yjZmnPQ5bDWPtQXidpgEluIF/BV/qypt
	D8Lxw5hq+9mjOcIO6qJSFXf91OYrIDZJC9pzAtoDjbmguHyO8ILsRRH1lCTnih21v/wIrSTSBFZ
	5IuaiDUgqrFLQbTksQeFvnJwI2WCL5QuOLFwPUCzbe280P18Kc+IjMgjqhF15BIUEOEv9q733AL
	KJGwTkCmb+MoAeeU1LP4Q=
X-Received: by 2002:ac8:5896:0:b0:516:e4bb:3bbc with SMTP id d75a77b69052e-5173a64a71amr36309901cf.22.1780125320151;
        Sat, 30 May 2026 00:15:20 -0700 (PDT)
X-Received: by 2002:ac8:5896:0:b0:516:e4bb:3bbc with SMTP id d75a77b69052e-5173a64a71amr36309651cf.22.1780125319739;
        Sat, 30 May 2026 00:15:19 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c13276dsm30282215e9.36.2026.05.30.00.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 May 2026 00:15:19 -0700 (PDT)
Message-ID: <946af0af-6c4f-4e3f-9e8c-408b2c2b2a11@oss.qualcomm.com>
Date: Sat, 30 May 2026 09:15:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: meson: sm: add stub functions when
 CONFIG_MESON_SM is disabled
To: linux-kernel-dev@aliel.fr, Neil Armstrong <neil.armstrong@linaro.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Mark Brown <broonie@kernel.org>
References: <20260530-fix-missing-meson_sm-symbol-v1-1-3fb672b989d4@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260530-fix-missing-meson_sm-symbol-v1-1-3fb672b989d4@aliel.fr>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDA3NSBTYWx0ZWRfX+8xJ3nuvX838
 04huFANMbh7UbxpGXvqBQ86ze1fCKLVfI3zIvvdK9jsKThHutimyQ2mAcXHvv9i6aFNxq75yBQk
 EeK28iSy/TIKBT27IFzCR/onIOjksisDLtNO7eplrLOH+IuFHIQ1PdsZlehzBYbuQ+d2gxJxs2n
 8ISfsexn4xJkGkk/5S6/7Ei08IffEBh+8Qd6U07FII2BrsjtCRhCzXXS8Z9RChZROslsmHCyDlN
 t8q6Kc2omEBdEZ4Pc1urJUMPPFE25g+s/f/y2Rwy9nq5myV6YJMgypaF9clFa0vv+CQUfckCdWn
 cnzebdrA1wLti7jq2/QlJ3htCfgd3dW2c2fC5/4nPBTjvqJhTQM80ECo4mB2Ggg+LjObycpZ4En
 1yeOadLXe0kdCvXS7mE3KgMOP5rxjTaX2wuJtlU7ZoVGyk8r28cvyBZ3i+fCnEtRCovXQVQdsNC
 yHrvEYnuOAZzEo4zdSA==
X-Proofpoint-ORIG-GUID: 9qzV69t99Z0wTpyx0DWKx3KNOHO0N8Aq
X-Proofpoint-GUID: 9qzV69t99Z0wTpyx0DWKx3KNOHO0N8Aq
X-Authority-Analysis: v=2.4 cv=B5uJFutM c=1 sm=1 tr=0 ts=6a1a8e88 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=UWCdJKDxNioY7VXa7sQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_001523_155533_4787B55C 
X-CRM114-Status: GOOD (  10.60  )
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

On 5/30/26 09:05, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> After merging the thermal tree, linux-next build (arm_multi_v7
> defconfig) failed like this:
> 
> arm-linux-gnueabihf-ld: drivers/thermal/amlogic_thermal.o: in function `amlogic_thermal_probe_sm':
> /tmp/next/build/drivers/thermal/amlogic_thermal.c:196:(.text+0x2f4): undefined reference to `meson_sm_get'
> arm-linux-gnueabihf-ld: /tmp/next/build/drivers/thermal/amlogic_thermal.c:205:(.text+0x320): undefined reference to `meson_sm_get_thermal_calib'
> 
> Add inline stub implementations of meson_sm_get() and
> meson_sm_get_thermal_calib() behind an #else guard so that drivers
> including this header can be compiled without CONFIG_MESON_SM .
> 
> Fixes: b21d88de6918 ("thermal/drivers/amlogic: Add support for secure monitor calibration readout")
> Reported-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---

Also added:

| Reported-by: kernel test robot <lkp@intel.com>
| Closes: 
https://lore.kernel.org/oe-kbuild-all/202605291530.en7aGn7w-lkp@intel.com/

and applied, thanks !

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
