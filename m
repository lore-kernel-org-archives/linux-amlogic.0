Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66EDCD6E60
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jun 2026 16:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YMv/yJb+DaV72OcyP1ZJIfjB8xy0zBqWtpULikGBOf4=; b=2lY3+FaCCRjEHv
	cP3o/T7J2EwgcIyvFftxlPeisz7rIO574NLoPHn/V6q3daYJ+mrSVzs5PZRQsZ19X/D91cE6BA3O0
	bg0sotQfIaDl1kL5WgyhjezQyBHB+UROm3Qt0+YsY5b93QIEr+LmbCy2I9NwD/Uabi9OJz8cb9p9o
	LYkzGtubHMNJM5kJaMFgKr0pVtmofuTgsTzCksXPy1IVC3J+Qs2mC8bA10Q6zzu2bSeurIywlSZ+m
	+w4MHeqZHnbs/2FiimkudHXTq2gC5vHHpAt6eNow1SiqaeQYBbun15Tmarh8Sl05DDlr/m5O1oCSY
	CgnRDrfBCQsLpyzfBSZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURZ1-0000000DOmO-0dVv;
	Tue, 02 Jun 2026 16:01:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wURYm-0000000DOcc-3M1b
	for linux-amlogic@lists.infradead.org;
	Tue, 02 Jun 2026 16:01:57 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652ENiw13302651
	for <linux-amlogic@lists.infradead.org>; Tue, 2 Jun 2026 16:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9cHo+HdLfWszrxz8FIlQUKjxLUJPM3VQU+KKIaZgzs8=; b=ecnlHgn9Mot6/zjN
	P/Lx9gAlO0F9M5Kvyys6oergtAHmwf0hlMC/HPcSzcdCKheQFuMK71KnDqiEfI6d
	5DuV7b0zGAXkDtD0/6wRkIGlOG8vdpY1uGDoEFEJvHDgGS+ngjGxhXHUgNGDWR6P
	Kf6+Dd9zji1rcznj+z9+EsUrpcQjEOQCG6S1KCXE4dAVYno1cVJaVyS50SCiAfsZ
	N+MnBRBijUy66CdEy25rXcteN97sWzBHdf4Vfy0sJM8USRWa87SQh8KkM1oUao5f
	N20FQe41eDuQq2kAxYpSFuIFIdeycxrJsFbAwIysRq/6PKFwZRZrLr5Q/BKl/f69
	oKE2Hw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehu18j1vh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 02 Jun 2026 16:01:43 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6cfb918a9d7so3674284137.0
        for <linux-amlogic@lists.infradead.org>; Tue, 02 Jun 2026 09:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780416103; x=1781020903; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9cHo+HdLfWszrxz8FIlQUKjxLUJPM3VQU+KKIaZgzs8=;
        b=fWHo6GaCxHILLJO//QcoaWkoiy378P/4MSjS6TWvVKDvoDEurYH6wF1mg6p/jrjckP
         W9shNgqSEETbwslY2sYL7uGFHsxX7pcI8B1whHv27E6vaq8cORwmKXdir9ZpnVZt7qH8
         zt8kwfs6+WCkWsMK6FdwHFtlXsD3M2aGr/VsDVYWbAxtofDQC8xaDzpWbk7qwkIYiTCX
         9DTsj7W4GmGg7EOJDbtHNbuz606L/Ls+PL3Q4mELGJVmy2ABptLO3z10gzandG6hQdLv
         wqFoPsadRpxUicwq9xApfpxZ4xbivVOT1sA8IjYxUhUds/+d0y3ooN4MxxZCNhuCSlE5
         dg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780416103; x=1781020903;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9cHo+HdLfWszrxz8FIlQUKjxLUJPM3VQU+KKIaZgzs8=;
        b=DhnheHQhQ7Ztg1GfqrkIKDzKLzOmILiUp5p9ouw1+chj/0lh7Ord9wXW8+ECALTzNh
         R2tYyC/O7AzZxg/hcko5cRU3sFjTMnLNIkP99VfZ4PV8HpSF3R+th1rBzmTtXirmEoyb
         NbERw44o0SRD5C4U76kQyZfAhh0CP54/2cZxsPGkH/gQiNZnXNVU8GnNB1x4MIwvtgQx
         8tdIFfS4OKF0KXhSKHzob8/aMX7AtAuHydw3fmIIH9TKIWJX3RM4ri+4SvjVwzTG4ExL
         odzhENwuHjp7910xs+AhWkyrk2o2fo3g/6cHMv/cZV2gQoxfUr85Hf5v2vqQdKfwgVof
         9KTw==
X-Forwarded-Encrypted: i=1; AFNElJ8Ghoa0vCOqKuEumkPeA6f1khqw9KUncdEBZAtkonCsTDAfkhRIUFELEFRWZnf5r3CagQHaZbRiNqGTPBtO@lists.infradead.org
X-Gm-Message-State: AOJu0YwMU58hU5rSTOopGXcQhn5gmKxIHnCUgpn9rM1DHcT9lOmogRBX
	GK71beiTCftFU+qg88bCwjgbRZHyb7TxipvXSUxo+cYd/DnOVZ1bRMDAGqQTgcefiySLKpoKPwZ
	4uZ7YhOH5aXc6Hxh36e145zT+HhkroSlRj6DeOKGh48oR1QnHLfg1CbXD9qwpyGm87TnJ4aU4CA
	==
X-Gm-Gg: Acq92OGJCsR3Q/bO9T0uRdNavSN6KMT2OpgLd5nbQhfOxiOZzTNjyJry/dw0IvXqsA1
	vSIcbBFNZWqJuTMLDbrtHJefYNkHVWp1MPHd3yg+04IkYj9sVK9JEsCZ3AcSzwAUVYhIXmTx/sF
	Wr4VYzyxkai45vpgFxZwxdsKf1FuE3oqyNgu1Sqzx2CB7vyKbOzKtk6nDvfSqhli1X04kwgq+Sp
	3J7nRcgbJ14GaN5KKI8Zidzi7kY3M/yIfYLqUQjylu6ZmyeGwr8FepCLFEbuFReKOEKvzv36aDA
	3qZe7xde90YprlN+iCz+/0INN+nntXgCDgdDhLQYeJK9qTq3hcCDIWU2e1WJNpjcNB7u250Sw7n
	d6OybUhVbfFqViIJBM0euNwITCg4e1Zl8C4t3Srx0PH3ddNrqMlIth8N8PraTtm/VRiEnGvqgwd
	sT
X-Received: by 2002:a05:6102:a49:b0:639:4bb7:c916 with SMTP id ada2fe7eead31-6ea1cc674f6mr506771137.3.1780416088630;
        Tue, 02 Jun 2026 09:01:28 -0700 (PDT)
X-Received: by 2002:a05:6102:a49:b0:639:4bb7:c916 with SMTP id ada2fe7eead31-6ea1cc674f6mr505747137.3.1780416079609;
        Tue, 02 Jun 2026 09:01:19 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351d40sm199325f8f.26.2026.06.02.09.01.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 09:01:18 -0700 (PDT)
Message-ID: <9adbe3cb-d42e-4b89-b6d7-62dd58b98e15@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 18:01:13 +0200
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
X-Authority-Analysis: v=2.4 cv=POA/P/qC c=1 sm=1 tr=0 ts=6a1efe67 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=uw/3876vWhRnNVL35W6mqQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=tv4TSO8pNUtKKAd5OgUA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE1NSBTYWx0ZWRfX/14Lrj6DGuZn
 dU3bEJXCjBNKiCH/nthZN129crSCc1ou8QDHz+nNoFA/8pYB8RDYK84+Ndj1nCXjBakU4j/7O9j
 +qDAHWGzqwi/S2yuVYxdl/q07bCfKpn2r5kshUn6WyEf76x6264tURrDZnilVQHCHsJ5jX2vZk+
 ZOpJHzNvq1GlcJxP9anENn23I8UsU15E0WxFXQxRPKgLJZNU26pyGovKc+4DFXe+OufoEPotdyO
 Vpe9ivIVSTCA4dyRpj3iNg4JMfJpy6NeF/7dUpNpW+U8MBU8CJV5AhMBLi21MpGkWLKWUqjwNlq
 e8r9LQWcrg4SdRykxcdYwTz7cMgoC3LQpgXsYiy9XOmLcsXJ59oICGJNFm3jnVHdxkZlvXR77u3
 Rw6h7IbNiIezWlHnRdBO941BdEJq2MAq3Tf7ducv11hsiWPqTJJGjBjdNdwQH9D7JlSO4GtIFKB
 XhqagYl1HiLXfuTFo5w==
X-Proofpoint-GUID: LhLSP3StJSAS0TWJzoN0Orcx7qK38Hc-
X-Proofpoint-ORIG-GUID: LhLSP3StJSAS0TWJzoN0Orcx7qK38Hc-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_090144_963743_AC8875A3 
X-CRM114-Status: GOOD (  19.91  )
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
> Changes in v3:
> - Add a dependency on MESON_SM instead of stub functions.
> - Link to v2: https://lore.kernel.org/r/20260531-fix-missing-meson_sm-symbol-v2-1-1def8c3c169f@aliel.fr
> 
> Changes in v2:
> - Replace #ifdef CONFIG_MESON_SM by #if IS_ENABLED(CONFIG_MESON_SM)
>    to cover builtin and module in config.
> - Add missing trailers for kernel test robot.
> - Link to v1: https://lore.kernel.org/r/20260530-fix-missing-meson_sm-symbol-v1-1-3fb672b989d4@aliel.fr
> ---
>   drivers/thermal/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/thermal/Kconfig b/drivers/thermal/Kconfig
> index 1c4a5cd5a23ee..810eeccedfbab 100644
> --- a/drivers/thermal/Kconfig
> +++ b/drivers/thermal/Kconfig
> @@ -436,6 +436,7 @@ config AMLOGIC_THERMAL
>   	tristate "Amlogic Thermal Support"
>   	default ARCH_MESON
>   	depends on OF && ARCH_MESON
> +	depends on MESON_SM
>   	help
>   	  If you say yes here you get support for Amlogic Thermal
>   	  for G12 SoC Family.

Did you forget to remove the stubs ?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
