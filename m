Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326C1CD5BD1
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jun 2026 21:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lI4hwhZNThJMm40rcVVpQepGODpF/sCI7BMwdeBmOIc=; b=LHGhtyAF+Oi2R5
	sDLSZn8yc54kF04FhEyzgoJEWDY7gR1+i2XWuyW1QlQnrvZci9+DCbeBOiQ5lbZGEnnv/yBu9vASJ
	E7jAt4bWXqqJIwv2muuxhytXOvhvRKdz45No3IAKgr/miKAyCCJll5lymRSV/D9fYtUsCyVKY1/d4
	7W5vcFL++k6Eig8QiByfb+HQKEq6qgoB7B31FcMTejy/aD6HZIbm5ZpwIQJX1rUmDvwtxcCuob6mW
	HPHNQw1ZoWLpwS9DnJWb1QhUf4V8596WjRsXMw/dx5mACJ2hDrttHg89vrNxYC63oQkWwg4Cj9Iml
	FGGbJ1Q1duq4cJlA2elg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWMD-0000000DnxA-2z4Y;
	Tue, 02 Jun 2026 21:09:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWMB-0000000Dnw1-3Tl9
	for linux-amlogic@lists.infradead.org;
	Tue, 02 Jun 2026 21:09:05 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652EE3GA3303188
	for <linux-amlogic@lists.infradead.org>; Tue, 2 Jun 2026 21:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UkIXV4vwPm6C3ZiF9q66clWGzHoKyEfJVyhB0Lu09Tk=; b=k5kPv9HfnQHBaM2D
	9trDxCOY3rpRAJ8HnKK2a3pXchjDIHY++OnqXdxBbRGKZGqnTODdeH7ZcUVS2w7k
	iRAHUFdzscyWfUT4HaSWh6SICTiJql0d9RXBal12p0MdZ6YVHYKy0muv6taafpjr
	EwJkAZCY9XCvndhRpxdkqMNmWHkNP02l0y2GEWDGzsipLpq0muaGr71Djzz+J303
	GScODQDuGtJvLOQ0JFDrXNYeE3kJRdm4tHnZxAQ31jZgKdffUiq+yn4xqxI/IPYu
	7G87PuGDcCHpAMhhYdU/Y4rDWyahujB/degzUAz6x+8efvK1HonAUGkJxBV/R+JG
	uEE9vg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehu18k9gc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 02 Jun 2026 21:09:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-516d6cf547bso9835761cf.3
        for <linux-amlogic@lists.infradead.org>; Tue, 02 Jun 2026 14:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780434542; x=1781039342; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UkIXV4vwPm6C3ZiF9q66clWGzHoKyEfJVyhB0Lu09Tk=;
        b=a4JsRsgd7uS6MO+VW6yS2n/no7nOMK961hOmCsntJuEPxdwi4kV5rkDjYf//4EczsU
         +qaQn32dNahlt7vwHf1STIeZOXIJC9aTD/etWKPWBZ2Cq16Bp7IVWnIPUIerUtst1usQ
         gTHtD70cfxxuQ0hUiUuNO1C2dk1/JIntNhYFAKXyTE2vDtXG83+A/EwPEUAq8qnuBVDE
         Xi9nKMD2zDhAvltjxa2E8zpls7iBKqljgwV3ujydXLhK4BnGHaURUyrpO0YG7T0PuGe1
         GjXqI5REvYsG2BvyMehlz1nDFfsrC5YSnDl3i2y0wI/HjsFg4pnoRaxCRHKgrJEwEcp7
         ON1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780434542; x=1781039342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UkIXV4vwPm6C3ZiF9q66clWGzHoKyEfJVyhB0Lu09Tk=;
        b=AUoqROVl6utNLL2dwAV5akOXsgB7ykWQxXSjUs7y+72+P140g/gNJpNY9AiOnzZ9Qg
         jOxz78O55RhmW2V8qMHlfQdp+up3eLUhl81hhf/n1V4hb31NJ5zHk0GqcUfnjoX02SCl
         VUO2tMsu7FywTyS0TH/yXuiYuFWYcI/JFYiToWk6Gyv6yLdKGh89Dwec/fM4h6Z67vGw
         QhxCW1bYf7XTvtut6wVwPVwEwO/cFQZYsxbRa9rEyDa0KIxdOaE0KSlKWKCtn46oLMuv
         /8brWpvWK/gCCRa03MTsBAySOFx0P+j+YOhZ6aRVjP3WE8ub3f/B3fNxttbELCZzuDx4
         SerQ==
X-Forwarded-Encrypted: i=1; AFNElJ9DWQZhBO6s7Kc1otk5VM0hTTK6Ob1rl1JnX9el+hUg3SSoWxfFkofcAOaQkrevRH7pKIiusAdOTf1f/qBz@lists.infradead.org
X-Gm-Message-State: AOJu0YwW/viUAeO2/BuFDrLW0xl2KsJAibwbUipuDivyuoJtLE386rHL
	LMtBvFcuHb2SZSqxTjCjZBc15ygwePgraixWOPIiOChZZjv25qy77j30Wrk0ZnEoLxz1Cqt4R0X
	bGkz1iVXxbO87ooWj1mTmyRbGYcyYN+xL9SVfle4mb5VWrDOY1DTztiAKifRhGJy3MVBkpZwcKQ
	==
X-Gm-Gg: Acq92OEN7fJKJaf6PoXHubkfycukDTaaRsTsknz3Ukgs9/1/hWum5nyR3MPygCVHqn7
	lkqvFnKxhUVyqxGwOhFpOvnFGZqHxomaNG+MV9qjDw/Sis64mklGSH7pPV8ggq7bEbLfP8FBf1H
	U+LZ9xa+99x6AESsKOMH23VbVSa6LL7Rq0vqikmb0kLQkCS9jJKN50mPFJgdKESs0AFv5/CyCxO
	7A03eifsb8Mz/KSRooO7TgUpYzTNIE3alOXfl4i41+yOhxQvcu9bedm6qYoN9sYrPqjhlBM6gH0
	nddm5Y1VCzL0r38hb263U4k2QPMz/A5Ig6VKSs9McketBntIvSjxfiK4EQp0IqbkvKS7gMhlK88
	KC+/R6qk4x1Qb1+Obq/OclH5atXhOQ/2z0XPoDEGrydz3qjou+lvDmbqECEjdsrjnQgYnaOqiao
	gR
X-Received: by 2002:a05:622a:552:b0:516:e31a:1a6d with SMTP id d75a77b69052e-517787a4754mr12505211cf.54.1780434542259;
        Tue, 02 Jun 2026 14:09:02 -0700 (PDT)
X-Received: by 2002:a05:622a:552:b0:516:e31a:1a6d with SMTP id d75a77b69052e-517787a4754mr12504821cf.54.1780434541857;
        Tue, 02 Jun 2026 14:09:01 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b614c5easm1957675e9.29.2026.06.02.14.08.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 14:09:01 -0700 (PDT)
Message-ID: <f5118303-d7ea-402e-84d6-794d6860f992@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 23:08:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] thermal: amlogic: add missing dependency on MESON_SM
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
        linux-pm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        kernel test robot <lkp@intel.com>
References: <20260602-fix-missing-meson_sm-symbol-v3-1-6f7f69cd7d6c@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260602-fix-missing-meson_sm-symbol-v3-1-6f7f69cd7d6c@aliel.fr>
X-Authority-Analysis: v=2.4 cv=POA/P/qC c=1 sm=1 tr=0 ts=6a1f466e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=ChcGN87QxgZRVD74oVwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDIwNSBTYWx0ZWRfX80Wn4dOYRddN
 ybT0R6tZTSdyOBg2mYI6OsUdtAEsfK1tqe8Eg9QCvzl3D+dvlNs0DJfrs8vsQD3jbzIxMJMzV9Y
 /4rEWobNxAcPWM/QA1m2bMQomSMzxCwjsmqYxopd1x24SJvBSOoEr0SCtMotbXykVmrogoSv7go
 VNHO8/g37PQryTc9XmXNYw1tw+88vY6P/5PgaeBU69TuOvoCgQZwVVapOcIjWsL5IyEZIFeZgo2
 2Z/AiG3+2HSf7bjBhTaOHRnKXsBBeyAPA0lfD/KNH41RuY3XjFkOoItbFosa2Mf+TdtAaGTFydg
 iLs6ZZ7/Qzc7MMbSvZkg/jFakRv7mLQpey0u1y4bujSrB8a5VULkWNQhrt5k/l7B7un/nZ8mp8B
 x2djE8373PXDo8FLT/qJzGbW/JM5RBcSaKDx4DDPP6m1YJ8dEIdr4keEEoM/zfZ+Bu0XUuRkpCS
 WfOYMxNl+z7RaZ3fxfg==
X-Proofpoint-GUID: cc4CJkNcPH2GPciANR40JE4_SNIoCJam
X-Proofpoint-ORIG-GUID: cc4CJkNcPH2GPciANR40JE4_SNIoCJam
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020205
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_140904_003632_99E2D60D 
X-CRM114-Status: GOOD (  11.38  )
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

On 6/2/26 16:19, Ronald Claveau via B4 Relay wrote:
> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> The amlogic thermal driver calls meson_sm_get() and
> meson_sm_get_thermal_calib() which are exported by the meson_sm
> driver. Without CONFIG_MESON_SM enabled, the build fails with
> undefined references to these symbols.
> 
> Add a proper Kconfig dependency on MESON_SM instead of relying on
> stub functions, which makes the dependency explicit and prevents
> invalid configurations.
> 
> Closes: https://lore.kernel.org/oe-kbuild-all/202605291530.en7aGn7w-lkp@intel.com/
> Reported-by: Mark Brown <broonie@kernel.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---

Applied, thanks

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
