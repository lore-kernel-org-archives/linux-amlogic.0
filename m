Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C833C982D7
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Sep 2026 09:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zd5iBgaZhrY6TJlgeS+NzTk/6C+mj2Cov0L/2CAorHU=; b=jfLzUH6q+4amLW
	/SIP6NLu/K4BdQRuXABUSTrIP7EFppyeM4lgu+d9NjRyHkvJoEtF1QpoQnieESSIQ4419E2PhZZAw
	4w8nJkSUD57zzQ0gug8cODPohq9blBTL/i/7guysyIn3lMoUfGpDwu+JSIUwwdk3bZ0M7fVaTl4eG
	jfjkWyTj19niwGlGpKk10suxrwwK22I0Gf+TmS8O5YzmJ3N2f0zBYUNeWF9xUzwnUhI/HNysFxHSg
	wsVboV1vWH/w6VILS7sNHyTwKS1ELaoKFKeXnPSLrSU3hYpTxenCmY8kzjblSlMhwCDvcL7f46ER7
	qy5lw4E5ce9tp8L83RtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ue4-0000000Du6u-3kyC;
	Fri, 18 Sep 2026 09:12:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Ue2-0000000Du68-2mkQ
	for linux-amlogic@lists.infradead.org;
	Fri, 18 Sep 2026 09:12:35 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5xoiw910630
	for <linux-amlogic@lists.infradead.org>; Fri, 18 Sep 2026 09:12:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8KWbZAe8YVsxv2ruoBpbVgqJH0J7SyBNe9cK8WaU73A=; b=UCVq0oo8hh3zpuNN
	YkqNqbz3333d1T73kirv80Sdf81VJxW51udbIcADdlqdimOPwFrBroXRMNZmCa76
	kAeBZfibEQL0ApMCmDR5Yli8Eb+1FTGBUYooe/kIfRqwteQSs/Q9Kkw/lOQPmJcC
	P3C8IMJkP61fVh4FHZ2v/Dm7Wj+kidskCGgUH9uRCWb5JOlb7RmHS3xb+JwgGWeI
	Gp1UtYJuSXW/GoRn0ybRNCpk0pyvklL31mHpqb48WnvgoievVWUZysFa0eqKW9nD
	JzzYetzT3VYrkLgMM2DHhuCBz2nVo11zppWkJAlEXh3mCCNygH+p1RyoFvOwI4V3
	gMIuqQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grtdpswmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 18 Sep 2026 09:12:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93918756165so98426085a.0
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Sep 2026 02:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789722753; x=1790327553; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8KWbZAe8YVsxv2ruoBpbVgqJH0J7SyBNe9cK8WaU73A=;
        b=Jvau5ehBwudwAJcdxWeGM6ZOWF7abXZrtmItJ1XVg4WQapLqrs7K+aAVfxqqd1OaH/
         6/di/j7geEYihlqIqiPV+iwD0EkcAB4/wYz7Mw1Q414ZWxStbZ6d2+bICUkCHfrkRwDp
         C7z+fxcudKCc4KTWLcGpEsYyAIebv+epkb03tkDca3I9AiOK6g8XSmypygPI+GjD3eNb
         FmnFUFKsBAcrrS0GL3UhDJUWgGUTufzwBGPDc2pHffF+CVvG1pgPjZR7BRJx+K7UuHhb
         uvnWQVl0b+od2Ls1P8Fg6K3DhNiJe813n/t668ZTOPiHUjjjJ75AgdHt46DVYhCCDSuw
         GPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789722753; x=1790327553;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KWbZAe8YVsxv2ruoBpbVgqJH0J7SyBNe9cK8WaU73A=;
        b=Z9UTb+dC77z2GNwwww/qKXXdJbNlct4Bt+B1e62WHcWgpx6Klk6+syg56/BCGKxvKF
         LR3YUo0FGrAgMVe+jMNW74jlpPfgu4BIp4cppiepyLx54aetMd+vhcnJGPw2lxpHujd7
         NTyZotc3V1Vtw2iIYAMlNJcxr+MEgMXW2X+5xswQwgpVDKB3VDFVc+9Bqp3dz8WOLpfn
         fyg7IICSZvVDJBMCuffObACr23pui8BqKIoxgXgyCoCp6djxfDM11F0wUy5AGAzedzPL
         wTH9IfAlH9+P4rM1XxBNdT51vhOnXfzduzSHq30dgFuo7Tatl7u+XqNzw+KZp3x7oCTm
         AfMA==
X-Gm-Message-State: AFuF++lmFUQvij0mtU57m1GvM1Bo4CPO9W3+XIbvs7r8YDcLNP4ZxMDj
	EQjCzAVhOzq2m66zjLmigxtjb0/kqwxECMsA3AZIeab/6Wo7QIjmAz5hhIk1L34XclEaW2gFBSv
	0SKdvEcTob7jtftlv5hi8w08cXnEjQejMFStlSuS9uIQL1hF7MCZRAK57jKXTvwR+kqSfGDjfhg
	==
X-Gm-Gg: AYBFou1zpn03dKpv+6w3Qy1DdTwHuOxK1eDKaUErEpIPivUCCGMLaXydmbfZwUGtUmq
	KVOf4hXJytw7pAHPXKWomd5TSF2zvxIA5/ubXVHPuwdlT1o7atAUDtDWEFT4ZPfkwOlk4sTCT7R
	fpSV2l3qo8QkEiteUiKa37HcOSo4I9osjvUocVUAY+eTQG5bNQgz6IG67PfcqAIC/hH2TyIjFOX
	QCx3pKcVM0yo4E9Gv48ifxWmyV9tnmXwSIxgg5+XDcl2zq/3ofiZMUAO5RytF9bufqC4tmCt4gi
	1GEsq8lD+Y0dM8VWsuwsuYVB6vM+IFKoKAHWh6k2NkDdsZfK+G6VEvQXq+q8IKbCRrihWCsqwzD
	1ZiZVhKdZHYRuNPTLJciPm9KAvmFcKtqd2TMBgMY7ENNQ1BHM4r8fMjY4uWzo6Tk=
X-Received: by 2002:a05:620a:6010:b0:939:f513:cc3b with SMTP id af79cd13be357-93bdca3b239mr216694785a.42.1789722752700;
        Fri, 18 Sep 2026 02:12:32 -0700 (PDT)
X-Received: by 2002:a05:620a:6010:b0:939:f513:cc3b with SMTP id af79cd13be357-93bdca3b239mr216692185a.42.1789722752340;
        Fri, 18 Sep 2026 02:12:32 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc58a1176sm31018885e9.2.2026.09.18.02.12.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:12:31 -0700 (PDT)
Message-ID: <45768828-d0a7-40c1-8eec-3a1fb2d66a71@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 11:12:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 4/6] thermal: khadas-mcu-fan: Add fan config from
 platform data Add regulator support
To: linux-kernel-dev@aliel.fr, Neil Armstrong <neil.armstrong@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Beniamino Galvani <b.galvani@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        mfd@lists.linux.dev
References: <20260917-add-mcu-fan-khadas-vim4-v12-0-497cd543a148@aliel.fr>
 <20260917-add-mcu-fan-khadas-vim4-v12-4-497cd543a148@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260917-add-mcu-fan-khadas-vim4-v12-4-497cd543a148@aliel.fr>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEyNiBTYWx0ZWRfX76UMWqky/n5h
 1kzsvJS5EkfUBW0DvPOvxH/I0N6einSb02OU3v1zWBNC1WW7f3+1jJS+mIbd5W5bzi26ZVti966
 uhY66nv+JT6V0Bq2/eJYOYyo9bhL0lA/sNCbzWcLr2egWS5RDzGcHTZj22ITDyYeDodndSNu7Qe
 Ct3EL6w96L7RlyH3y6sxFAU79H+97OPA/7TFjb5XuJSnGPyDnlyQjRr72viB09+OIx+WfHBQxM8
 GZMOsBwC9nvm65rMeS1XwGaZCs6Ls35O+qWLbh+Qcvqj1rtwLrp6FeV3DO1mGjKNQRlA2hNLtUZ
 U9rbHh07ctjwrk2GhV50jvKyJXpaSoCTAyBmplg8D7sU88teII7zX4FF543Sywx/nCjacPIM2GC
 fcAhSx8AFG1VPwzJlnUjNqRVjujbv1hnGo+Q6lL5tekMfxHvoXE8hKVzWSd9PvACuPMYf5HVPi+
 tejkKoVG5a+WnuY5epw==
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6aad0081 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=YaFGZCiNkOP6CsGDcAoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEyNiBTYWx0ZWRfX7UJ+GBCeYKmX
 fNIap1kej5CoFrecTijuaNgbUwN4NlfG3pFD86oNHhgEbD3Kde2Go4DL7Ju2EDW5qkqlc4ihbJZ
 kTz3H3h8BPod/jK+odboUcsBvP6qHJI=
X-Proofpoint-ORIG-GUID: HkyxCLBcdNqUSMzNajPy9b5pMUupWMXs
X-Proofpoint-GUID: HkyxCLBcdNqUSMzNajPy9b5pMUupWMXs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_021234_711437_4161616B 
X-CRM114-Status: GOOD (  13.08  )
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

On 9/17/26 09:59, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> Introduce platform name, control register and duty-cycle
> levels per variant.
> VIM4 uses a different register and level set (0-100)
>   declared as a list (0, 30, 40, 55, 75, 100) compared
>   to previous boards (0-3).
> 
> MAX_LEVEL is kept and bumped from 3 to 5 to make
> the speed change more gradual with the newer MCUs.
> 
> The cooling device's state is stored as an index into levels[],
> and khadas_mcu_fan_set_level() writes levels[state] to fan_reg,
> rather than writing the raw state value as before.
> 
> Optionally acquire and enable a "fan" regulator supply
> at probe time and on resume,
> so boards that gate fan power through a regulator are handled.
> The regulator is released via a devm_add_action_or_reset()
> callback.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
Acked-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
