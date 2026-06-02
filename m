Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF05CD6E64
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jun 2026 12:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GChLC7Q+sezFtafiBew4uJueYuOpyGm9suKWsGoBQF8=; b=sZ5XxtLF86MZo/
	VhEmZe5bQyCZtjNGHRPetPfTWBiCUvE6SJVaMVOVgsv12mv+sOz33UzzA/PPw4NtW4i3bvEzQD37l
	k6w7tSG8ufAF1lUgE0En3zOA3X7aawyU6el7oWzm82sTtFIMjBijFv6kV27n1BXEgGv5T3NHFLWy3
	z8XDxPoknmErq1N9UqtpSo2AsGMbTU4eM5m1p4kT/Kzr3n1WX+388aAGxokIhcPjopCHVzX0K/YhV
	ssHB7ZybqqQEcev7xDcSBhGp9ROr6lPrrZWDN6SfW1QntOB/WQDiBOHShuwbDpttIKeAca8SQINCH
	I9LNK/q7PVtcgCSH/W2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUO2S-0000000CxQE-40Fy;
	Tue, 02 Jun 2026 12:16:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUO2O-0000000CxON-3NvT
	for linux-amlogic@lists.infradead.org;
	Tue, 02 Jun 2026 12:16:06 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6526KvTm2884659
	for <linux-amlogic@lists.infradead.org>; Tue, 2 Jun 2026 12:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ANrwuqdjefDIFHmc5n5pfhXi8/X9vYH5MINxqlroZ0=; b=CDaRNRGTczDxuYRs
	Lf+2do2rIC9cKHydSllTzTE3IPYjVIxzMlQ91EFvnC7TErQnECoxsyUjfSH0qrfa
	hHTB/HEjawVUSg5xIsdKEQX8BqQCGV915orbtiZU3lga6J8QvWdWXGmmJSxYzsAq
	3EJ+HxZ2dhx+1tJ+Zpvc35eSIyhKsEsRAUmkCAQvz2pXzQewyKkRUzrmm8jKZRxi
	m4cTGKXCt+r5DW1VIvuRcti2qMl/ixyJS5Kq5fZYQCKkWcJYVSrhAc0eexdf51jR
	cBLTluwozFBmQdwhi5Fmtn7NW1cgnQWoKbmIBcIgyQzeqPbpVGIrFMZbPgTqAEd8
	v45CzQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsu119rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 02 Jun 2026 12:16:03 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5a10923f7d7so2651387e0c.0
        for <linux-amlogic@lists.infradead.org>; Tue, 02 Jun 2026 05:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780402563; x=1781007363; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ANrwuqdjefDIFHmc5n5pfhXi8/X9vYH5MINxqlroZ0=;
        b=CX0TiurLXQZUjTl2DK5tCXipvyu34zXgKWI8V/7byTfBvb9ioK3d1ziHO/fgWBUjmH
         6Ua8hOTC6tsg9N2ZVCkj3HhtRoodkG0WLCt+diNPCVGNVs7syFmu9mTYEX1jyadBKD7l
         E4T5BG8BgDf4sxa4lSu4kewPtKkNmgCfh8oUxBetRJ5pUfSRwvV/THuqQBujdMdJpIrq
         s3PNh+c96nsH4EIEejSrACf1YhP7tUH9MkVjIpgeK5hTQunumoeEMl2jRdrw5TBan85T
         6ZRCvU1OjXYJ0lpcE4RkzbNmvs3ZNJVlOc28zFf2Eyb8z9UrkThDmqLW1aLZ9xGWcXh+
         3FKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780402563; x=1781007363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ANrwuqdjefDIFHmc5n5pfhXi8/X9vYH5MINxqlroZ0=;
        b=VjnN4T4Q9yHS67G5E6V2tst8V4blfIWDJVcVngXj7RyhlYGpyuNI/N0tuHanKGbHY/
         S3WMZfvLWYrJte2mchJzzn2kgMbBoe+Dm5rbes/mGkcG23aHIc1wZ3Lhkg/0B30q0YsO
         +3jImBedvRpFA7S9nQ+hi4Tx5DWVwwYldaUtAmidWkPPR3IKxH4iM85nNN+AONUYPegU
         UWoo24/OoCPdlN3O5m2f29txb9iPdflfkBhVEoeXcNzsiOQEv7sBhBG7x2zgMP2VWzGs
         8lwBpIws1Za5LOTkdaqjY6P8hStNKn1xU/K6GF7y/t7POqoFHDSplxrAeO4URqf4VGG7
         2A/A==
X-Forwarded-Encrypted: i=1; AFNElJ/L81sbjxADkXkhKBnqrP9YVCmk7ny63IQHXIyCHHDe7M/T9oyYkmvGhoO9eE3UuxUqD/JdXSYzTwxFiN6r@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc1iduDwVFbM3v3qZ4dP7Vy+fq9bvGkb6qZLRwML1ERO7XL87g
	t1cpsDl5cCSQ40P0H5zSmYSCIaVJNZpzVUsm1gkJvHk3FafVGLC1oJtSMFmK3UI2FobDVUnRG1n
	EUo1PoCkO4vBlXjylvvoUETxyV4tlebYHbgxnst58kX8qdkJjgACXXCCEHDsa0rRcZXP8UXxeng
	==
X-Gm-Gg: Acq92OFp5WT49q9aFmSDZ9Hnrhq73v48CZcVX6jpBhCLmQGVgdmLkkro1Uwz9AJjZYL
	V8yBraZ2N6/GqBx6D3p94U694V3r09NrULGlaKvmyICcBzjYstqwM/6iuPrS3OWlSmkHC0JMUG/
	rIQ8aiAzh2n0jv0bUstn12EGz9RcD0oy5ppDBQNKLNbuucy5tbm6DDA+CcmyF2ZHyeXqEJgUeVq
	Z09AFMz6rj1rpX4yZ2qywJF7dp62T8+NI+I2Lg+ycX7BqmCg4jinMH0GuINlL9NC7OAiZDoAXkh
	pqSdRNgwzPjJaBTiyNM7ubaQJLaFktVVz9EExW2hQr+LYFdDDupekpjVl8WlcwIk4a6B6/xDKq0
	oeisaOgEtXVTZgI/2aTPv4t7DT78lNt13l95myFr1ZiAvf3W3hNqFUMP/hg3cQBUgAraZtV7dRd
	kP
X-Received: by 2002:ac5:cd98:0:b0:5a2:497:328e with SMTP id 71dfb90a1353d-5a3ff16a77bmr1158722e0c.6.1780402563042;
        Tue, 02 Jun 2026 05:16:03 -0700 (PDT)
X-Received: by 2002:ac5:cd98:0:b0:5a2:497:328e with SMTP id 71dfb90a1353d-5a3ff16a77bmr1158685e0c.6.1780402562608;
        Tue, 02 Jun 2026 05:16:02 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e7639csm65066665e9.10.2026.06.02.05.15.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 05:16:01 -0700 (PDT)
Message-ID: <49dcaade-4927-40e6-9864-9d4f3a8412d8@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 14:15:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] firmware: meson: sm: add stub functions when
 CONFIG_MESON_SM is disabled
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        kernel test robot <lkp@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>
References: <20260531-fix-missing-meson_sm-symbol-v2-1-1def8c3c169f@aliel.fr>
 <8c11a91b-cfbf-4b9c-a46f-907989bf8305@oss.qualcomm.com>
 <12d74340-0213-4f7e-a494-10ce147844ad@aliel.fr>
 <0c5033f7-1535-49e8-a502-426e54333496@oss.qualcomm.com>
 <59afecd4-7749-4be5-a261-a850634178b1@oss.qualcomm.com>
 <376eec65-20ea-434b-a6ee-edbc12e6d7d9@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <376eec65-20ea-434b-a6ee-edbc12e6d7d9@aliel.fr>
X-Proofpoint-ORIG-GUID: FImALmr16k2odJwFhlUfiuM5pMM0o888
X-Proofpoint-GUID: FImALmr16k2odJwFhlUfiuM5pMM0o888
X-Authority-Analysis: v=2.4 cv=MKFQXsZl c=1 sm=1 tr=0 ts=6a1ec983 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=LwlhRjmIQBesJAWEzoAA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDExNyBTYWx0ZWRfX0SFjHcjFJXV/
 cvgR17144PsRGXsMvXqgc+b4Hr0rjhR2owX/GCrDCbwBg8IS1uHddmRYZTOoMjxdKh38V0kmdBJ
 qyf99/o99hQDp0FyATe6Nj4uDqhMSHrnmcWdxt2priov+9ZAfX7Qb/ws4b/9E28zM4nyQnfOCFB
 KQDxO+8Du8zjuqqTShHlBBzUai1fT4mUcg9I2saDTuuAxUJ9cfFQw8xzM9Q4jpDiCV2r7t/U4mp
 khlqVFlPFLUr18qq4RoeA7aLFvlcGGUxIvZntvkNbhEoXJY4168FVFAiedrANArE8L2+KDmFsNx
 itCiaclP7qpK7rVs2t4awu72XmqYr9+/2SE+jh1t8KzpPeg9FmKRY3W6sLmXOieT9IJDKxQcMNH
 3nzVXFmTsS3wHqGu4BxKAnIeJ7ioRlhFpALX1W9Y0MWHn3ovPkRgS964hUpRBh6QfHiENlQY6i3
 DhR3CpCE7Qe6YmDeiqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_051604_963509_06D90828 
X-CRM114-Status: GOOD (  12.52  )
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

On 6/2/26 13:58, Ronald Claveau wrote:
> On 6/2/26 11:57 AM, Daniel Lezcano wrote:
>> On 5/31/26 21:58, Daniel Lezcano wrote:
>>> On 5/31/26 19:49, Ronald Claveau wrote:
>>>> On 5/31/26 10:41 AM, Daniel Lezcano wrote:
>>>>> On 5/31/26 09:51, Ronald Claveau via B4 Relay wrote:
>>>>>> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>>>
>>> [ ... ]

[ ... ]

> Sorry for the delay.
> The module issue was raised by the test robot here
> https://lore.kernel.org/oe-kbuild-all/202605310154.bmdMBZHJ-lkp@intel.com/
> 
> If I understand correctly we can drop this stub change and only use a
> "depends on MESON_SM" for the "AMLOGIC_THERMAL" config, is it correct ?

Yes, that is the simplest solution for now

Indirectly related, where is the mod dependency telling meson_sm must be 
loaded before the amlogic thermal driver ?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
