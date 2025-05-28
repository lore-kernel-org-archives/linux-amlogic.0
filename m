Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE02C5AE59
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 May 2025 19:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8X3Yt8TX995eDbL5GL2Q4unGN1i5m+i9Qv+4gGAGnpk=; b=vDnWKr72LOWcs9
	K6BJrhG955qv3txNtajo2WAqcjDr+mtwdYAVZ3xBdZw72qsX3MJ+Wat4To9x2DDrAZdu5baVzqeMP
	ylDsJBH6aLumcHBirw+48iXyZmm6UCGeOZX060+CRNc8yj0bivePl4mxUf8hVwtP7X/LQ5WxMBWa4
	faPTftWVPhobrAu4zE5x0hYSTUW2A+IrNPYq0zhPuP/4ZTtWEqnvd8/ZjCLifLdMraWiy5PWVcDCw
	x2VTTHAZ//GMED06aNvbGpEQnK9y97TFS21BPZrxV6lgrU9JRh6x7WPq1/OiUzsRTB0abW8ZO0iOv
	zo9Was0tSL0L28ZPMm6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKMOA-0000000DzFi-0xo2;
	Wed, 28 May 2025 19:24:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKMNH-0000000Dz9k-22DQ
	for linux-amlogic@lists.infradead.org;
	Wed, 28 May 2025 19:23:40 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SFss7l002109
	for <linux-amlogic@lists.infradead.org>; Wed, 28 May 2025 19:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tGIelMzb7anlOtz8UeqEqZt+
	4i8vYbVYnWcSqbgsCCE=; b=lhTYe1pvmICNCmLlgitNFi8n7jkEBn42BKSOuozy
	gH5q8YtAam5lLMoB0oEU/11m93Iptsqgb59u7tPaTCkLI7YllyONTGKVsOkzZhkQ
	dM6Ort9SaBW6z6lxQFCTxpFlKOsRe+swVpMccrmKVQN/YGJuZF0Yi5YLFbmPVud8
	/MEJ4S+ATaR8SZb11UXlyAfHGjjO5gX6ym06MU2YCs8j3DSXVVkgwFMGhsLpZCvc
	pWEHhYU691ynpJkDlOwmP9lF4XrDDwvMQwLVk8cj07ycyp/CRvsjzQpZ9XqumCL9
	TrhK3XMbNaJzzXu8jw1ljUbSNO73KRJdwCUEesepO1jnww==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavkw5mg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 28 May 2025 19:23:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6eeb5e86c5fso2762936d6.1
        for <linux-amlogic@lists.infradead.org>; Wed, 28 May 2025 12:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748460217; x=1749065017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGIelMzb7anlOtz8UeqEqZt+4i8vYbVYnWcSqbgsCCE=;
        b=HDpxZm8bv3+PAAXfRFTAJav5z7yEsM2UMGRTRvXrJ9I8hRxAedqmi5pDdFAME+6lYL
         ux7iS2Gw4xSKtPz9hrwkQVX8eDIVlqDWE+Id+uQzsmXWVA8wA3esW2ydDGqT/T7ISW+d
         ivbC/K6zkMCpIfH29lVWBlf0/MLI05p/yAWPCYg+8eiMcAxzFtzb0wR/cSAMRBT/m5Dx
         4zg1Or7FR6FNY72EsPJD0snMA7FZjmr5fR+ngBDuV3nrBMJgECGxcN2Csco6sGmPrLIt
         4P68GjIswCpt9Q7gUcC3gXXJ55dnZxUKCrOTmlMT8VsZqL+KdOXnSzo/zW6q4wtiTj+k
         Z28A==
X-Forwarded-Encrypted: i=1; AJvYcCXCiyHPjXKdK0x8FUBo7EltQsF9isY7g7PKXpnPYEWXR/4No71996In/3QhYFd7nmuiGfi6U6jLwi/W2uYQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1JnZPg0m7YvG3A30O+V+2mi4EzniYOpbCO6xy8zQiOZEd9Qjm
	oAsO7/qlb01XJOowf4cyUBOM9DvctN0dGgezXraX8z94fu0eX7eYxICPRtZEc6HStO4NXuVbbvK
	UonyhLmCWKvOvOY3i+/jW+vXjjQdBF8iOZ5j+gNUZpsytYhsomsOBOuobjXB6BFGfLl54gaVh+g
	==
X-Gm-Gg: ASbGnctQ24pUWXU30Nzdv7+vaIdAhjzYwi9wf5IvEW2Rf/GTmbQlOosLw4f+4dW6EMH
	JuQOiNxNW8EtCyg56yHXVwIwgvkrQIhfXvVk3ZVMqnw+xBo2m2FruR1qdU2t6za3reT5TvkgHSg
	TGqA2B3L3Q09FnBTe7S0eOjHkW214SP/FY2udqipHlZ8K9OdHswOUU7arACIC/0uPdOJ79M0+VR
	KXexUFWa5oFHOn2SXMRyLHEb/IL9B2Ut+eqtMJz1MHSucWtC2iVBqdQJj+Z5s3gg7ITpeqM4sfL
	/NEnIXjVkAPa3CIda08U9ZaZiEn4paxEjqWndYfkd16oAn1fT1F+o4EEyXfG0Px+zGUTYZ7eCTM
	=
X-Received: by 2002:a05:6214:234e:b0:6f8:b4aa:2a4f with SMTP id 6a1803df08f44-6fa9d00777amr236028106d6.11.1748460217327;
        Wed, 28 May 2025 12:23:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMPfAIcdcaS91SNuuMoIA5lDePhcYw7vO3zvie75YA1Cd8oqTW+ZaMVMUi8YvVPpHABq/2ng==
X-Received: by 2002:a05:6214:234e:b0:6f8:b4aa:2a4f with SMTP id 6a1803df08f44-6fa9d00777amr236027826d6.11.1748460216971;
        Wed, 28 May 2025 12:23:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a79eb95e5sm3635891fa.30.2025.05.28.12.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:23:35 -0700 (PDT)
Date: Wed, 28 May 2025 22:23:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ai Chao <aichao@kylinos.cn>
Cc: Johannes Berg <johannes@sipsolutions.net>, perex <perex@perex.cz>,
        tiwai <tiwai@suse.com>,
        "kuninori.morimoto.gx" <kuninori.morimoto.gx@renesas.com>,
        lgirdwood <lgirdwood@gmail.com>, broonie <broonie@kernel.org>,
        jbrunet <jbrunet@baylibre.com>,
        "neil.armstrong" <neil.armstrong@linaro.org>,
        khilman <khilman@baylibre.com>,
        "martin.blumenstingl" <martin.blumenstingl@googlemail.com>,
        "shengjiu.wang" <shengjiu.wang@gmail.com>,
        "Xiubo.Lee" <Xiubo.Lee@gmail.com>, festevam <festevam@gmail.com>,
        nicoleotsuka <nicoleotsuka@gmail.com>, shawnguo <shawnguo@kernel.org>,
        "s.hauer" <s.hauer@pengutronix.de>,
        "srinivas.kandagatla" <srinivas.kandagatla@linaro.org>,
        linux-sound <linux-sound@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-renesas-soc <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic <linux-amlogic@lists.infradead.org>,
        imx <imx@lists.linux.dev>, kernel <kernel@pengutronix.de>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
Message-ID: <mpj5pvugs6gz3rhjtntshvbwbtmi463zg6jc4tatmvh5uuljhe@44kbv4di2b3s>
References: <2aq0nyvyf7t-2aq4hsc7kp6@nsmail7.0.0--kylin--1>
 <7e708dcc98c6f0f615b1b87d190464cfe78be668.camel@sipsolutions.net>
 <eb1ddeb3-06b6-4ac5-b20a-06b92c7f1363@kylinos.cn>
 <23aadbd78d3585c900c579c26f360011cf1ca830.camel@sipsolutions.net>
 <9ec008a8-b569-4ad1-9206-fe241fb1712d@kylinos.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9ec008a8-b569-4ad1-9206-fe241fb1712d@kylinos.cn>
X-Proofpoint-GUID: ooE1KhFOOwpm-VT76MkUfMNFLLTZ8rG6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE2OSBTYWx0ZWRfX7SnIltvd69f/
 WJgFR51eVtoSyxb52d43eKWX+gkZcQUv54tJfX4Wsu/USwLv/kLIICasgZA/vfjfnhabgONPzl7
 UPrvYVOxcYj+NS/TJC3VN4VcoR0rQylTeac8l2Vy7meSnexrVhAWgy9Uwzoq5seRaAsGxd/zW4t
 k5scMjbyvly94Ps+jrY+k50CDswagE0jGwJ8exv1rQuZ0/mpmRFm5Nd6vCuvc/uV93XNG919GbZ
 BhLOKceOCmmESc99NyUCFk6RxuKVIohT7yahqK2TsrDuMVl34ELoN7m1ChOpBojuMsycLRCFNI0
 j/yHoG7uWxNTyuFv4X/ZMKbjBe52cJu+9/o+vN3aqY+Yrp2y4sAsKGxHoXGmzgUjqFvjH+i5cUb
 HTLCY0AYMxD+HbeumhNLSvVX8berToArMnBZWfxz/8LIHQikfJ1pySPG1sYuyDJTMBKfLpFA
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=683762ba cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=3idkMoHJoOCuPmDIWoEA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: ooE1KhFOOwpm-VT76MkUfMNFLLTZ8rG6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=479 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_122339_542334_A51FDD23 
X-CRM114-Status: GOOD (  20.43  )
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

On Mon, May 26, 2025 at 04:20:37PM +0800, Ai Chao wrote:
> 
> Hi Johannes:
> > > Hi Johannes:
> > > 
> > > > > "simplifies the code" is no need to callof_node_put() .
> > > > Fair. Except that's not what you _actually_ changed here. Like I said,
> > > > either it's buggy before or after.
> > > > 
> > > In the function i2sbus_probe, it not return a struct device_node, so , I
> > > think function for_each_child_of_node_scoped is better than
> > > for_each_child_of_node.
> > You still haven't explained why it's even correct.
> > 
> > johannes
> 
> The for_each_child_of_node() function is used to iterate over all child
> nodes of a device tree node.
> During each iteration, it retrieves a pointer to the child node via
> of_get_next_child() and automatically increments the node's reference count
> (of_node_get()).

This is not complete story, you missed the second part of it.

> Each call to of_get_next_child() increases the reference count (refcount) of
> the returned child node, ensuring that the node is not freed while in use.
> for_each_child_of_node() increments the child node's reference count in each
> iteration but does not decrement it automatically.
> If of_node_put() is not called manually, the reference count will never
> reach zero, resulting in a memory leak of the node.
> 
> Best regards,
> Ai Chao

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
