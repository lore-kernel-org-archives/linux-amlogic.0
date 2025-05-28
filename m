Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABBDC3ABB2
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 May 2025 08:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Py0kChf+32sxRrobCHNvLrbjkhDdgrY0ViyexA+wFv8=; b=2Ql/FGnMthui2L
	PEufyxw/zmZDOmvANDIH8sjcwp2qQmZZoYlpSgx028q6EveCEzuM+lo68kIA2uBrIlMCRDdbsAP6m
	p28bM36vT78wK3gchpAFUZo8MCnywekX7iJIbAqbiTFb7L4s+G4Ux1I17Cu/AQOM9zPypTN6782Im
	S0ZhZ21qxMajj5hCe5al8VFLiWa/Gt6W0FNuaQWPnUvpKvMD7VyB1a4K7FvI3ILB/jJa24+p+F8aZ
	9c1J9eIQHb6JDEiSi9/s4efqC+ZQZ1pFeHe5/qGrXX4Y7Y7Sa2I31ual3g+b2jxPW/cmxe1pH8h8P
	q1pRGCacAafLHChW23xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCTy-0000000CckV-2rdi;
	Wed, 28 May 2025 08:49:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCR1-0000000CcUO-0D6k
	for linux-amlogic@lists.infradead.org;
	Wed, 28 May 2025 08:46:52 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S8kn05019648
	for <linux-amlogic@lists.infradead.org>; Wed, 28 May 2025 08:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DRzWkDK3ft+iwkKji/GjVMzB
	ocQDwCbSuP5DIc/EUys=; b=NYX8fy24OEESH86jLxZM9FLzbN+nsk41j6+K93rW
	ueBNg7KgmhdpslFMbhhc4lTXjuX2liHHDZxYeQ/+t5uz9RssxOwPIu4W9c2tZM+J
	CGtb5ziTFEhYj5WTXFiQn5KrflxgZV78v52nlevTu5N0Jjc4c+qYaCk8LOv+Tn+X
	X9OkFAJ3pBEtSkNYly3WQ2nZCCsEO0I5MNBO/kIJSpabr4MU67xuXpVyT/mgYo2N
	NHHOxlvQLJOx7rtO0uWJ3xj2jV7gU37aeb1yVu/1aXV7A4de+16hUocYKszCct8r
	MsQgCFogJEUBfWNdmeQitrcpH8XZeyPrbMesdFQBdkqzXA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fq9tbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 28 May 2025 08:46:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6faad1f2b69so41041086d6.3
        for <linux-amlogic@lists.infradead.org>; Wed, 28 May 2025 01:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748422009; x=1749026809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRzWkDK3ft+iwkKji/GjVMzBocQDwCbSuP5DIc/EUys=;
        b=YMswpMFx/ZqbDofC9WvrcjeFjcRFanat4lCBGMhCpQPuijOZtDYJUVlUYb0622teaV
         3I/N0u/qaArlrtsevF2w+Yi2yIZUJ9e+rSdX7uu3JCoG32I9ruunpk2/zNOVUGhKmiRK
         qvUTSPtaDVguthITo/SqaoVnL1dBJzKByp9XKpJ6DQPJvxoN4gbxi6C/mhFlyO+fIhY0
         Y0axP35N4Jm8/vTWV7E1vHi1VN+eEkN/vouoskSRl3PmfrjRuV76CeMEcq/sbRrPloKK
         L652vUtHngNef/SqSa0wpXrfYGB6BxZl3IlY3zAuYWzKjUjfuXgWT9saTYaZwkzmJibH
         VWKg==
X-Forwarded-Encrypted: i=1; AJvYcCUvfJPwIXGzFklNJcvjntQztctBxs/ps2ra1fcolV+iya9eEYGncT2x7RxWszVR0jCnWRR5+iBxHdmhpn+N@lists.infradead.org
X-Gm-Message-State: AOJu0YwOjXyhsxn7W2BVFl3Pu0TiMiH97ehWP1joeT9xUJnLJdEeCuAq
	phigAggVaKXbUTXs5KV0OZURWPV/d0H34DlmS1KTuTu192PkPxE/IPSqNKzyKllHvDJOJMNUjvs
	wxdaZY3DMoRVx6CgX5URGdDHgH8TZAQjpKJZpO7E69tykJYrabg5hb3kvAVrUQzMg+J+SuT+h5g
	==
X-Gm-Gg: ASbGncukiuodrJ0Zeg6X3IPCG9rUtRtjUn9UJ6Kd3U/2LiJoY03EGoG4pu67NvZ/Jm1
	ZKj689dPAialK0F6+/BencZIIPUCWsbxOLJj9uKoIoIB+I03XxQt1lWH4QeBff7YzUinDN0F3ms
	1xRgfzsv1qQpZhz6frGdB9ZQg58Ha5F8dlk5CjxzgEruOKhZHQyKONcQ6kc2Ick79mUaiMvbcHo
	qqP+46Mmo0xLKrdZtzsxe7mO3nKyRFztZAOKMPb1TE3cCEm9duSWh5ZVjfQ0keaK9r0QKG96FwV
	qt48XE8uJO3xhcirHA+RkexEo5UB/sI8c4dzSe0X28Xw65RM6CViJR8rTjQvXP5HaSRJ2m7/AAk
	=
X-Received: by 2002:ad4:5b81:0:b0:6f8:e367:8440 with SMTP id 6a1803df08f44-6fa9d0330admr302008836d6.23.1748422008975;
        Wed, 28 May 2025 01:46:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo9qqoQrF01ykPGF/17EjYHoPs6gmbavsSE2zy6sawKd53Clq0hMx0BlOXLpAzfgtNG6M5ag==
X-Received: by 2002:ad4:5b81:0:b0:6f8:e367:8440 with SMTP id 6a1803df08f44-6fa9d0330admr302008336d6.23.1748422008535;
        Wed, 28 May 2025 01:46:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f6b3e3asm182752e87.234.2025.05.28.01.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 01:46:47 -0700 (PDT)
Date: Wed, 28 May 2025 11:46:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ai Chao <aichao@kylinos.cn>
Cc: perex@perex.cz, tiwai@suse.com, johannes@sipsolutions.net,
        kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
        broonie@kernel.org, jbrunet@baylibre.com, neil.armstrong@linaro.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
        nicoleotsuka@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        srinivas.kandagatla@linaro.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
        kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 6/6] ASoC: qcom: Use helper function
 for_each_child_of_node_scoped()
Message-ID: <vjtgxpbpaowlz7ftryudf44f35jyaislvkckuzrzlpj25z25cf@vytjvui65gec>
References: <20250527082446.2265500-1-aichao@kylinos.cn>
 <20250527082446.2265500-7-aichao@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250527082446.2265500-7-aichao@kylinos.cn>
X-Proofpoint-GUID: TBBj8s0D_Xv40WBAJ1qIBlRdVBOXbp-J
X-Proofpoint-ORIG-GUID: TBBj8s0D_Xv40WBAJ1qIBlRdVBOXbp-J
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=6836cd79 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=uJ6pKfArofpzZCl0i4YA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA3NSBTYWx0ZWRfX7VGPj+ar38iD
 JRo0RO6jDqw1a+9GOOeHd15LLOTGT1Ywxh6lWt8lkSavJFHNe0L4mXY/X3+hf0WVJCYixkpH/pJ
 7aTd5rMJOkyaNdx7WMSgC5I0aWA0EMuH2s643R8+nz3IUMP6vxco6Ad1RvU1BnAhxz/kmFjreZV
 pPbYIVNGiPQFmiuHO+RGyyFc4A3IFYDLCWecG3Wud7ZxfzlFqP9dNn0YCs8N/46M+e0LfRVXmJe
 5Upjelt58x5/MLJ7AVN7lHJpn/7J+vEjmMJigK7dB+dkSVP+iHZ8ziN3rxgcDZ07grgkxyPIAND
 dzIewAKmBraRGejcesCTp6gjiiH4wWDO9RpSan7W09uiSAeIWfxXxfPoq18PZndvKUOIoMf1yXa
 HN+F1zTahzzqQQ4tJsqQLGsVgye7607QVEv/HwNvh/5/OJZlJTtywcyIFK1JhtDykkmXNPAG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_04,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=522
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_014651_201799_D5124F38 
X-CRM114-Status: GOOD (  13.18  )
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

On Tue, May 27, 2025 at 04:24:46PM +0800, Ai Chao wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically.

There are no calls to put the node. In the patched files the nodes are
already automatically put by the looping macro, there is nothing to
cleanup. Please stop sending this patch.

> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
>  sound/soc/qcom/lpass-cpu.c       | 3 +--
>  sound/soc/qcom/qdsp6/q6afe-dai.c | 3 +--
>  sound/soc/qcom/qdsp6/q6asm-dai.c | 4 +---
>  3 files changed, 3 insertions(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
