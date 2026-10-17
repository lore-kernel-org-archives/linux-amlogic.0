Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56954CCF2CA
	for <linux-amlogic@archiver.kernel.org>; Sat, 17 Oct 2026 16:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S04HowELAyJQpF3V65CEWiDl5WSpeoNG//dkApZ3kpY=; b=dzrF4tQY+Y5ch6
	L6HswzlT2TS1CLUuHPGwNc37wgYl2dNKcdFK6VVrXmmvR6G5aL61kD8nLlzEHtaZ7QqSjXRXW3Hs6
	GTE+122y6mQIOMhhnmVcGI9jUk1R6vT/mSW+b1If9lQAMV37knzu53LUfImTPdS/l+X6sRfqQwiU8
	VUugdP29cnlKtrrtGVq3VSqaimmJn/rctnAW+1OyUzlxCMx0dks3q4f5e9GhO4rUY+kVhRSoV5eOi
	EFH4kJdU+lCtHyjbwT/cxfEvMCTRvjmsyjp8WjFVFcRB3KFEXd3En1zREl/5TdoHi6ew1OhDXk2Mr
	h7RdJGUjTGXQqERUtlQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7dn-00000004xiI-1Dms;
	Sat, 17 Oct 2026 16:52:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI7dg-00000004xfh-2iV6
	for linux-amlogic@lists.infradead.org;
	Sat, 17 Oct 2026 16:52:12 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HG9qFH018852
	for <linux-amlogic@lists.infradead.org>; Sat, 17 Oct 2026 16:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YwGr/VFcVBThPZuxD7wslr2Y
	PtoE5+81Oolo9GzuWu8=; b=ddkdEhfxlYdg0WsHZwg9YM05OnoCCx+IZFh7CpvA
	fZM4QzivJbpNpTR3Qtvrat7NqSk6ZsAwVBAwG3CoBTtAjfQGMNpWcuQ268iZAdGt
	b60a9SGpXkDLJ6ph+xnqDDr9mh0at3I1KPAALHtr+svlkjG7/Nu0r9dSvr1TPFdT
	ASyOqglJ2l2IcfKTLLF/bBQqY7QXhXz2vgiuIIoH98GsX7hItE+yHIikqJ9+b0XE
	900wrUHa54nqfofviVcxz0LDmr5v/J2R/i8OjdfSzkD3oOKAXZspDdj/WuXU8KkI
	nVOP8wkXAUnOP9wrXm5HU6qi64684cL5vBonmhbOSiPozg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc26k17yt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sat, 17 Oct 2026 16:52:07 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35cbea41088so1363994eec.1
        for <linux-amlogic@lists.infradead.org>; Sat, 17 Oct 2026 09:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792255927; x=1792860727; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YwGr/VFcVBThPZuxD7wslr2YPtoE5+81Oolo9GzuWu8=;
        b=PTsrsF4/L79za26wwDOBUUUmkEtyFD3oZjQcnPYAq/7DbmAzwJqJOlvHdLPmEfOjA5
         dRdz1MdECnsA87aAz4n2on5QCzLZ80txRZtczzEliF/prreOo+ggLH35lCE6ILW8f58H
         AtsdifyrNMrcNMcd4Dc5pRLivejWt/r3RUjZdLmH0WF6n6Qo3MxcBZrRLhXccvHljDmW
         ZP1GaoEfG2VA5Rb+wd6J1lfu/Qoc+9PFUbD7Wl1Hy18k6Md9lRlSd3xYZ6gRmrAgDS++
         iuvphVl594dGn/SCJuZ16cn9rCc7cP8R6aRluP8SwufnrsSNdtkspIUqexbPcgoS0yX3
         S36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792255927; x=1792860727;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YwGr/VFcVBThPZuxD7wslr2YPtoE5+81Oolo9GzuWu8=;
        b=g+x4+9hXjvcvHS/l7kcqhUizJADOHF+Ii5+wZ+zYkR44tIjPpiNa+xJiLXjqrRTkMu
         Mfs1xmBi+2a6E4/fnoi5fcZHJY7JksgYhXAtnkaQ12VHLr/ntZD8eeJZqKPuHQs/3ZPl
         V+FmBOSrYbcYtItTkIYSj1shFkhRfVs5R4sakYuLZOeVLIclcXDTkP7FXXGFFH39d0LP
         /HjPDFY5ADyBJCUtix8K8uN7KgcWf/YHR92J1Qx6Gn1P8VdnE7Kwlb36sOIfwMvC6GQ7
         EfCIr6SJArozgFTUArrRILKTkCtpi809snVIOzntRZSbbGR9KzvCH9ERmW/SJ+rPEPv/
         R5bw==
X-Forwarded-Encrypted: i=1; AKwUvBwu1YIrMiHPy0eXy10Zzs1Hys8p/P7Oz2ogQBnsdw/N/PNNoRM2VIK14KLcDRNJQ3SAld1ytBwwIPXr7OTs@lists.infradead.org
X-Gm-Message-State: AFq9FYLsVW373+OORq3KQIZ2vrGzMQXo3X77p/yuU8Pt98RmOKYe9Rlg
	PvpUdblX2yfakkG+plda1KPAx+C6KJJdYQEgYcuc3Tms1J73En64eS6O1z30SP6m/PRa3IWs0Ms
	OYFHL6F5OgJe93H6tKInMzKQFfhcH3cLNeeJPqpNWo/CVUf6vGyONi2upS8JXwuEnBdU8LQBb/w
	==
X-Gm-Gg: AYBFou36oDnlBbeiwwdjTUygh+36gwSMWuG3o+3pQqOADSdD9OlkvgdjH4i4MVUHazU
	zZbCpddlbSu2SdgL7taZnCmRic9BefrGRXEWitAKhypaSvvYqgZhPADiD+S10LoFaAb8l+KEAqc
	OrmjJDGeV1SS9dFM3qdpnoxQjCSYf/9+DDk0CLthQrjEfNDtKkbh91keCtOnnhyJpbf1XQiySP5
	Hcv+xYbrgdhq2cw7X9PyJnxuM/mBwL0zfBtdVC7GKdqrtnAMVka9q5eknMZW7e4mFfhb+fpvxRI
	lwSf3v55NRVmr+LiWQcm+jMa1Y6IL5oeku+Sd4fMy2m2ol4da2S3nVoQ52H92XUov/71R5xnLX9
	t0/cnJXs9bP8U
X-Received: by 2002:a05:693c:884f:b0:35d:4e41:d2c2 with SMTP id 5a478bee46e88-361a2c38d17mr4246689eec.33.1792255927202;
        Sat, 17 Oct 2026 09:52:07 -0700 (PDT)
X-Received: by 2002:a05:693c:884f:b0:35d:4e41:d2c2 with SMTP id 5a478bee46e88-361a2c38d17mr4246646eec.33.1792255926579;
        Sat, 17 Oct 2026 09:52:06 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6ca5sm16487376eec.9.2026.10.17.09.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 09:52:06 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:21:50 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Radu Rendec <radu@rendec.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v16 6/7] net: stmmac: qcom-ethqos: factor out
 linux-level setup into a separate function
Message-ID: <atOnpkct5QYK9VW1@oss.qualcomm.com>
References: <20261014-qcom-sa8255p-emac-v16-0-0266c2ead980@oss.qualcomm.com>
 <20261014-qcom-sa8255p-emac-v16-6-0266c2ead980@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261014-qcom-sa8255p-emac-v16-6-0266c2ead980@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2NyBTYWx0ZWRfXx2zTqHGrsf8i
 1WxNjD9FPimSfaTx/bHFq8ToqAZhMiMr3qopXvR0B9p2Jp6JZRMjzJG8dUvZvlhIH7mmjiHOKwf
 bBkfzHOJs0Nf09jkfTWb2Y0pWsoGZsyruRshFAvorcssTH0LT/2+B93eYOCKkOyevMJF0ekY+nw
 8TSkWLeFGNYk+JDOmp5pEQQ7Dd+MPCBSz3YfGRVrHjj9WnFy7zmeZHD3E9RFUU7xvUPs8JA74ph
 1gc+kVQt75IPSzZbgjz1mIZIlU7z+5ZOPc/EDZN8XQTxhCc1NFM+bRxo16hHoNaqM0Z74fH3A1I
 v5J0RJH13utAeKEOHFFjVtvrJHxrC7Uwnsr9ziIeCAEhxqax0idZLfwlY1eozDAfuSUllZYeiZz
 Zsz6ezHKySZkqdmcux698b1tPQeSNEPYP6rRnNIOpsTXprGQMlDdR3rVkppx7gD5ETa/dIVpNyW
 pAI4ifj5bdOAy8ql76g==
X-Proofpoint-GUID: 5ih0XuorpZEeNmGsZQgdjopbSGAc0ZL7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2NyBTYWx0ZWRfX474UatszYdMm
 cxNHukeYaN7K1EcEmPuReqqwS99B5kTcX53z2+ERoHnmZa9X9CXJ5heA4zHOlPO3DWt/Nt7lAp2
 SU5t1YXC9yKyZjlM3Rkl1XQw4N/txXI=
X-Proofpoint-ORIG-GUID: 5ih0XuorpZEeNmGsZQgdjopbSGAc0ZL7
X-Authority-Analysis: v=2.4 cv=Cowq4X4D c=1 sm=1 tr=0 ts=6ad3a7b8 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rqvSfYwyKISaz1XZPbMA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_095208_696676_F4E79826 
X-CRM114-Status: GOOD (  11.24  )
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

On Wed, Oct 14, 2026 at 02:36:45PM +0200, Bartosz Golaszewski wrote:
> Ahead of adding support for firmware-controlled EMAC variants, extend
> the ethqos_emac_driver_data structure with a setup() callback, implement
> it for the existing models and move all operations not required in SCMI
> mode into it.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
