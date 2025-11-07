Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22843CCFA1A
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Nov 2025 10:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ZWWyPlwAijTWOTZ3sJ6QY0xY7CaSHQ8cUsqAipRvzU=; b=RwKlrx85vW5qxk
	0ukT6oqqaVvW4aVFJD5Nn0qBiC2BuZKujOOG/VaC05Q9ghpwY3/05idYLPMLaW1zaMsjTIEzeHCtG
	1foI2mAHAMTzTt0V4xjHEY1ChByYiI9FvFZlZnA9s8Ez0jU5Rew6vy+CX3bN9FfrMNSlpMA/agv6z
	dkhMWvPu6/KB6W9RShB867y/r0VbG1hqONNHYet7u37KGTUDOLnkO6cGdFoKbZAe65ptW2x/zf+nn
	eQqKN7jYeR6ohDIuwihZaU8ItwvUp1zX6pRAPyjnwA+crighzVyaf5qSuL/jkWA+PvZiWHdr6Q0zr
	Tvh3NPwR1Pz19djwX7Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHK2j-0000000H8mX-14ou;
	Fri, 07 Nov 2025 10:50:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHK2h-0000000H8lw-25nG
	for linux-amlogic@bombadil.infradead.org;
	Fri, 07 Nov 2025 10:50:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Qy4xZjaDaueCuwPTRvX9IC7D9BFWUmRUOg/PJT9rm94=; b=QqWOQYnX+AyUNCg73cBgp//YGe
	RMwLXG05+30S95Z26zL3nmXk+5PxO0Tg8NNPeIpp/oqrNzuoF+SZEkm33bjrvymMyimmMEXJeVlIG
	jaNK3cRd8khg5CY07w+NJyC0VqMBeL0gdJLUJ8Lmr/l0Zil3OdJnlWYoMcKR7gRBeCT2orNrmRQwQ
	507m1c5WozbioGXj3oDJbxkU30uVCYvMLWWIIef/x5PT6+roq1y5NS6FS/i5T9UiprhnF1C3DM/Vu
	uFNIE8duRe2DkUkJ2YSRKYnpd5v6ddPRhsyS/6S+5YNOlzfintiBTutA6KVWZQRzAPHWp6ULQcu0K
	Qw6fIdjw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJAw-00000006EBq-1PMS
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Nov 2025 09:54:37 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A73kfir583748
	for <linux-amlogic@lists.infradead.org>; Fri, 7 Nov 2025 10:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qy4xZjaDaueCuwPTRvX9IC7D9BFWUmRUOg/PJT9rm94=; b=j19zi5vcZvZc+J3h
	eil5EXgb7o+MHafKBi9Slf1MAsHwht9ShJKuhVBN4IuNbfkFvOasu8HUs+laic1i
	ApQFCQDDkr0nR1Z4s/mFsEJRFNaTWW7B62zkTCNyqa8FVCGzmDgnRi4aJaWpx3yo
	7YBrhqEKVuWBhNuAaoE60NFeKFuxZH+p+rn0tyDvgwMCTDDPUaOdyqcmIN20Yni7
	e+FAQn327eA/EMJkdOZ1oKcI5NWQiBeaIRCP9KmnXRYAWj3UM/IlF2kolv1vNI8Y
	9Rr7K9olNJaawFxFkksQTdDzKZOepplYR1QpfkBYS3jwKcxtOTKS7ODirqnsgtuo
	rorS0A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8yktjsm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Fri, 07 Nov 2025 10:49:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed83a05863so2113211cf.2
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Nov 2025 02:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762512597; x=1763117397; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qy4xZjaDaueCuwPTRvX9IC7D9BFWUmRUOg/PJT9rm94=;
        b=ePPuctBKH8T+FbeCr/nwZjbXiYSZRk30YQeK3PectLOKyJJGVKEPGLHMrx7larHmcH
         nz+0MFG9XBiPVWMpzpOG+hWJaZKSJk8Um97a2CA+nPFyiylq1tr4LqiqbQUPbq1UrQjD
         0oYumTRH16Qhezys+t/YCO4o9CiE5S0HsmJ4+xfuz87RGuRsUmdvmjcqgXl7to4L7wTQ
         xkIf2ULgwC3F2yK/tw4+7Wh5S3bV+EsHhAuLy7lu5knz+xiUnOP0mJdV56RG9OJdE7b+
         xVwB1XqPHvPd7nDjIfxA8L9hMYtJ+y6iygJ/rahuwMzivAs9gsEMacbWTAYmduuZpaJ9
         x5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762512597; x=1763117397;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qy4xZjaDaueCuwPTRvX9IC7D9BFWUmRUOg/PJT9rm94=;
        b=iA6R9VCm6pM2x9/SfOBuNstv4JgHAn/v839BbrmrmAiWQhUDPajd7EVKYxr5HpMA3T
         6rSz+fmEUt5bkrPBSQaKUj90rlK92qHkQpWbnRvIMbakkHb3Pot7QAspneSiTGAeQN1h
         iMzj4f9FGfdqnXbPRyNpiaIWsdy/P3u0qIi5J1mAhWuIiOD2RBe2TtlYwgTKWKt1FQ+v
         4Dqoh/3Cr2xXdaV2sIACg1FVnpgppOKBXZjVy4oWEYWTuzRmt7b6rVrQf1/PFeYGe4bI
         jljx+FYh4s8W8bDPWSkfcxQZoHU50Ern8xYYvHW9aBL2IA8BduY/yrrfIAN57MNKg/7q
         AubA==
X-Forwarded-Encrypted: i=1; AJvYcCWTnAg/pmcKlyBMlPFPynQ0ob9pl+YE3EBHmCVkXguCy9Ol1vZlYi8mpw7OQ8kw3Z7XTU2zrj4uD7DTXyoH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1Azbm/uVfJlRUbLdJvfwo9dM2SitGWPQBt1pcvfP3xnDcjmid
	qYRDEgMnEof6x7S8k5IB/syksOL/LG6RIk44aK6f+PsKmrnXKwDz24zcBJuLHJSo//hHbnLdKCh
	5w6iw9aQvci9YCuCe5J9ZMRrnt7pB4nqxrubfEDsM1vn0Z3u1eWM1TG1sWCvXaxAa3HncdNfGTg
	==
X-Gm-Gg: ASbGncsJl5J4ALQmIj4rt+8WvYqfvvLUflRJ+3whuQ1WKgb3UzlEIz4RjYCZF0/RK/w
	8hPXEHogKGQJR5/NJmISMFksXqfgYDnDgD2skRHJI8Q5UMWw+/nXm2aieO2PK9b93q7plxKn69p
	B50uX/O810wLkhBsoGD/UCHrWfnwsEtBOmlZGOqLsX6Ok8gHybWoRsbKckI9s1nTUYRTaqg0JL1
	IfFbDNq8IZcVfEBgcZrWr3EfN/B3UMAlFHz40rNqe9jxYKMA1QNgcJ8MfzmPHg4kBvoovrOKO+5
	ZG7htrArmrhsZQwatLHRvmWhxNuufdH0JpkbmcuVKBOCYctDnIqn+hXjAWI6MBuw51PUWMj6e/m
	ELtMPK2JE65FYoc9L8JxuaEnPz0nC6Y2ftR7vAvc2XVfQIHWVUrLQoCF9
X-Received: by 2002:ac8:5a51:0:b0:4e8:966b:459b with SMTP id d75a77b69052e-4ed949bb0f9mr18063551cf.5.1762512596839;
        Fri, 07 Nov 2025 02:49:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFb3Xbou/G0Zzd63eLA+eutWoqm0V75Q2RL/wdtW4sHDSzQGKhPaQSn2W6oLQojU83FQkCi9A==
X-Received: by 2002:ac8:5a51:0:b0:4e8:966b:459b with SMTP id d75a77b69052e-4ed949bb0f9mr18062921cf.5.1762512596362;
        Fri, 07 Nov 2025 02:49:56 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf9bc2fcsm204678566b.50.2025.11.07.02.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:49:55 -0800 (PST)
Message-ID: <21a3d269-76e6-4da9-aa25-bfd1fb6dfb07@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:49:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] net: stmmac: qcom-ethqos: use generic device
 properties
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Matthew Gerlach <matthew.gerlach@altera.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Minda Chen <minda.chen@starfivetech.com>,
        Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei <wefu@redhat.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Shuang Liang <liangshuang@eswincomputing.com>,
        Zhi Li <lizhi2@eswincomputing.com>,
        Shangjuan Wei <weishangjuan@eswincomputing.com>,
        "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
        Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
        Samin Guo <samin.guo@starfivetech.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org>
X-Authority-Analysis: v=2.4 cv=bOgb4f+Z c=1 sm=1 tr=0 ts=690dced5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=xTS94RJRWet4TjKJq7QA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: n9ndt8Qe8L3Wq6RPCZb3g5kPtq5xF1xY
X-Proofpoint-GUID: n9ndt8Qe8L3Wq6RPCZb3g5kPtq5xF1xY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4NyBTYWx0ZWRfX0hVojPFLo83V
 VmZqvAoYENQ5kP40/IsvDv2RYp+uvO1a2y024XxgmKLNKxi7Kyg5/UqAkJQ9vlnJRlfMn3dkBga
 MoEhSnpVjEoD09w894OUzeh5XWJdB4GC9+WZOuJw0Sgm5Yt1pyce6xS27EaNqZIlY++Jt6dd4gx
 IDhUelj1nkb95bMzRH9wC2zAg7+KDdD0NOm85ZmqgCf5QISuqKkiYJdA3Gabb15dJgWR6e4d0MK
 EODZUPxELH3AAo/ekNmus2kYiA5qllvmHOQoML8xQ/jZ4kchC+4qK7djiaQUm6yQali0N7hML5z
 Db3mcf+DCRRnORxKBw5usiXoldjG4cKSF4qH5HekJVzsDwxuXR5XnwPm3VnHMFDo0kUV+HNh2je
 4KLAjec6bwMVEqYfrEzk8Wlzjb26Gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_095435_261337_56D5619E 
X-CRM114-Status: GOOD (  12.74  )
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

On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> In order to drop the dependency on CONFIG_OF, convert all device property
> getters from OF-specific to generic device properties and stop pulling
> in any linux/of.h symbols.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

[...]

> -	if (of_property_read_bool(np, "snps,tso"))
> +	if (device_property_present(dev, "snps,tso"))

This is a change in behavior - "snps,tso = <0>" would have previously
returned false, it now returns true

although it seems like it's the plat driver clunkily working around
not including the common compatible and inlining parts of the common
probe functions..

Konrad


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
