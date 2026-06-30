Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721F4C43458
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 Jun 2026 14:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FqA6iRD3qeD4wMSsP+OhJR3CzOzpUF2CYQIpGTl5XSw=; b=MnycJf+LtpYABj
	Cc/BQrkjb3JPP1L6RODDhRFPTVNV0u1ajNSX/2Fi67KcvLmy2dmJTSW9RDeLadyxVImCcb1oV/JrP
	udW4p3zqCJV60DYmE2+WlfdK8b6x3Rt7D8Gccx5MywhZUQhjcyKwoVt6cTSGpDSCTq7+6Y2t6jDmn
	F/yQK6DbFY25BAXw+Q6dQqlSBn8bL5H2fbOnYYAb/wJ8kjaUEYfaJmVYBmkJUTQo6Cns3OVX0eCsV
	mbGukAA6VUGKDRm5IFOxAVkT2uPYLc1ftbs3+Lo8qGIiNsSlFwylUbfb2DQ6AwY+7NapPXgHsiiuh
	wWfhqBwuwbJqjf9yF/sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZ4K-0000000HFCg-3B83;
	Tue, 30 Jun 2026 14:04:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZ4E-0000000HF7a-05sd
	for linux-amlogic@lists.infradead.org;
	Tue, 30 Jun 2026 14:04:05 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mtXp1522264
	for <linux-amlogic@lists.infradead.org>; Tue, 30 Jun 2026 14:04:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LGt/jVunNdiuTF9CeeIY4kTWF7I8j+mwn+w7wJk+cOo=; b=FGvGLwrYQwb0wTLS
	Z7JvOlsgO0GP294YGQUWXMPOV9SQTnVhfYHluhNk0Wwz718qWtwD+LbPR3RIaO2Z
	/DrgzXqnZykuY5S8OWJFpE69CkxQq7SgXnWGaACmV4WHiQPuy0KG5aWs89ijZem8
	qvDbZOAPwmAZGRnS1frDotFS5V8JnSKUJzbQWMTXJCV64YeK11g7mm5Xm8e/B2ST
	j9mcDfqKR9Q7dlUe0BEM73bHP5yaxw6+2JniS8nDIi7cBbi0tYSLhBjtWqMZ0urO
	/cgqY4TTo88BLrAlPrSt/fpatRnNfo7TJyxpFYHsSUFoPWdZ0omiRALqpBQuhG7a
	TZny1g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3yw93r1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 30 Jun 2026 14:04:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37fc13e814eso1927385a91.2
        for <linux-amlogic@lists.infradead.org>; Tue, 30 Jun 2026 07:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782828239; x=1783433039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGt/jVunNdiuTF9CeeIY4kTWF7I8j+mwn+w7wJk+cOo=;
        b=HuKJnJxXaVDZyA+1e/bEVrjnqmX/To/Ref2sDGhL85yGlC+dEXgr94dXCNVRxhscEv
         jdwwK7TNsbJzD/8kWO3rTse29twcVIo9zgUdiYJtUM1v+ar35sJLccko/kIvUstLWIv5
         z+UWcE3fspCiBy8/ImJgLHpnbHT2+YoQOAbalDrCTsI8OY5by/Tp32PMLOrlIY70y1A8
         e6NmlH2v/mxA/qxyDSQTg2JahRVo0lf0JuJtv7mNBHo0ewzjlpdPColgXCAJoW0nBTFl
         mSesbJKXxKZOyczoT2ERsa9RBkGc/for9DPHETrzF4IO1oiC7IhW0NaiqcDo61W0Qy/t
         Ppyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828239; x=1783433039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LGt/jVunNdiuTF9CeeIY4kTWF7I8j+mwn+w7wJk+cOo=;
        b=DgU928YY3na1/P001llGFMtYi48egc5T+U2q9Ow7Zoy83EeplMETow5iR8kB5eELVm
         4R6WTn3gBqdSCSqY0A/0G4a52YoztOlEyAOiGdhc4K1oE76l5WjclNPQOHyPhj4tBpE3
         nf9QG6qDJkGfs4xGoDGAdg1chKtPZOWp7yQaYkAXBETVkHOvT6TF1J0aV3sFpwTVZVPZ
         JJWu8GIFAvdkXfFBAyD7LjJaCbRWnFHO0nxzzgPrOSYPCU7uYz99c999fubwjbkwRknh
         1gtGdEBP9nmlQ2JLcYWiCAO3Jh1rrAPAr32ArC15Zq828xyTwS0TAR5oCFp06/ZQQP0K
         1fZg==
X-Forwarded-Encrypted: i=1; AHgh+RoydFKyzigTMnNn1FdlTgLmTN1VbscQ7E+pJk5iac5bQTaP7+ctT5yC83qohNRP6ez4fGSxaAguIZzGXKxV@lists.infradead.org
X-Gm-Message-State: AOJu0YxeG/fQ7VX2lCKLjnAMNpcer+rU8Ky33l9Bp2LSoetTZHVu1649
	Z57GE40g1dolmL1kkjA/Xc0lEuecE3BsJ0cGbk0hqRN8LTCWGNmg8QoamolUZEZJFTOxdwc7Ru2
	UuoRLMWZbmIW6x0FsZrlzdYoZBCwtj+IETTgam3XTK7IHXFuRKT6MRCy0+4tN4uVoUnAaiUXOIA
	==
X-Gm-Gg: AfdE7clqO/IOwfgBoD26z9E545O+H9+5RguRKpGppKXnOIL5MyZh90lW5Am3h+oPJAR
	3Svg2iwIJDrdXYg75W4P/ujUdQ+A72qtZZVCmOErDJYjMKOrCQlutetxghmKUor4wENaynAa88J
	HAgtxclqckGWTr/nwKOC9oemciOHZ4SFkcu8jdazk13Dea6sxR+okHWEAUSJc3bL/XTaZvYDAmz
	vlgCh6N47qSPaYsbGMRQYoqyJ997aGEyTEqN+VWp4PC5e3dQbYssraiiny5UVtI2vu3S+UtgNOo
	pRsqQWFq+S4InZiKxWDncGg/3NCMn7LYIr595YtAsw6Mqo02bFg4uDkkVI4XrSgrydkd/VjGtoj
	ghD3NK9BiTy3iGXcpJof4FQCeWmhUejgPaDvoXsU=
X-Received: by 2002:a17:90b:4a51:b0:37c:18e0:90dc with SMTP id 98e67ed59e1d1-38052733442mr2797968a91.16.1782828238903;
        Tue, 30 Jun 2026 07:03:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4a51:b0:37c:18e0:90dc with SMTP id 98e67ed59e1d1-38052733442mr2797918a91.16.1782828238391;
        Tue, 30 Jun 2026 07:03:58 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:a2d4:ac8b:bb21:2661])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be171501sm1600495e9.15.2026.06.30.07.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:03:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Viacheslav Bocharov <v@baodeep.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/2] gpio: fix sleeping-in-atomic in shared-proxy; restore meson non-sleeping
Date: Tue, 30 Jun 2026 16:03:52 +0200
Message-ID: <178282813039.20935.7644113033947538749.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260630101545.800625-1-v@baodeep.com>
References: <20260630101545.800625-1-v@baodeep.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMiBTYWx0ZWRfX0Vz/XS9/tFyo
 OKaPjt2y0YgYLNJbdTJMPdliOEoLTHmA9tUC4Xfwr6CX98y7dICU5ZAW9OuRX/73uHsQT0ZPqz5
 OjnFaaPVIgvLadIxbzGGD8yX+I7zebg=
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a43ccd0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=W7lOHgCGKF-i3LWV3W4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: dW6NKrVNbwyExaVIjk4zG78GKzrUz-xG
X-Proofpoint-ORIG-GUID: dW6NKrVNbwyExaVIjk4zG78GKzrUz-xG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMiBTYWx0ZWRfX6zBJmhHMNFY5
 6UoHycO7ijOOO5PBKqkvrRrh9fmBtgLVNww1K3aBlSHogW1BIqbyUd1777mdbS/oNZGFqO1xbYY
 Gsd0Kg4Yb7tQjdjcxNMh1GVjnFtcVloldxGzNaScK72ELafuGn7s/GPTYXRYILNZduHJyGL4eNG
 /t2+Ghmm6lwqlfM7jgzptjVvnnemSsOfXEpwbHMRwAViDoIzk6RpHiC2I8gyJ6/1jaxZXfbmfPc
 9QUV2yNOTON8wth85annMqUQQvORsi8kP1TZ57/4vm/CTdxFTGK4EdoJ6bbvNJ7z4uJGMooKVB7
 0Mb2JNkDEZlGSnhXK3cBJHexLOs50NoLpBvKxA3Up2QzjcLiXIB8zPynZ8I2qvpcEHg8PnychUa
 qfzwwMUVS/KgHPyeTkbg9VBpcwnDnw1TxESSSjqoMqg94Ompgn52AfgqwzfKJKMVtFiHOpNmaup
 AHTLmm7DlSjvPDND95A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_070402_648291_1AEE1121 
X-CRM114-Status: GOOD (  12.34  )
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


On Tue, 30 Jun 2026 13:15:43 +0300, Viacheslav Bocharov wrote:
> gpio-shared-proxy chooses its descriptor lock (mutex vs spinlock) from
> the underlying chip's can_sleep, but under that lock it calls config and
> direction ops that reach sleeping pinctrl paths. On a controller with
> non-sleeping MMIO value ops the lock is a spinlock, so a sleeping call
> runs from atomic context:
> 
>   BUG: sleeping function called from invalid context
>     ... pinctrl_gpio_set_config <- gpiochip_generic_config
>     <- gpio_shared_proxy_set_config (voting spinlock held)
>     <- ... <- mmc_pwrseq_simple_probe
> 
> [...]

There are no build-time dependencies between this and 2/2 so let me queue this
for fixes on its own and Linus W can take 2/2.

[1/2] gpio: shared-proxy: always serialize with a sleeping mutex
      https://git.kernel.org/brgl/c/efecde8a254d1f207b75c5ebcfba2c51f4c771d9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
