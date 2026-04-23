Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC93CF99362
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Apr 2026 10:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u8yWPziYvT3ZiESKVDALuOLpKq/Plvaqc8299ZIRVqU=; b=N9Hv0Y0CiF8RTW
	lMcOBTe4Rfw+cEoavUP9sSNAJEt3OadxKmIRlygASSieK2BqhnF74whtlEiQ78NbCfIAiyjCSU03e
	0liQ6LkwZ3bSx6vc3Jj+BIvcz26mifTBEfelGbiUka0fNKcam0uhoeasCnj7iapAOqNT5zc0bbcTG
	X5oiQzrO3W+4KA+UEohS5mVqAV6bRMzRXvaJ3ptbLO8ycietM7Ybv3Spg1RoZZn2EDWMffvbCZiUR
	e26g5uLiNyIcIA4S5gTp3E86WT1VcvC/hiMAJ9HRDy1royyW4rxGYCK+b2sDHJDy9d/nln29oMfYH
	eWEFcpO6VxxP/3iXEN6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFrFT-0000000BTg3-02Ij;
	Thu, 23 Apr 2026 10:25:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFrFQ-0000000BTf6-1INv
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Apr 2026 10:25:29 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uJ4M3413398
	for <linux-amlogic@lists.infradead.org>; Thu, 23 Apr 2026 10:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WvCi/CVpH88WMffYYZwdgbtLju43Phq8Lyjrsa4uQn4=; b=Za4tqvfp6iYSc9Ls
	dTFiNSNp8QXlS9irMhg5nJ1t28Hbhk/E+NWH3KDKMjYJ6+iPwHccjZchewLuHs4z
	dGNMqEBdJpeGbuQy7TS5Z2ruavAoQxj7EqnNBUsgtHcseN8gAO0zBNlyYhiqp84c
	QI2v1bRKq2OF2FMkmk27G8dD9ft/Nd8s1hMiRaQl+2sbckGJFn5w7bGDV2RywIqr
	X2VooS4JCHmcGLs6XXAfhhaj2+TN7FamSjya73gqtSZCBKyac2e9Km0+xap6robE
	YWIQvCsz/egCD41xC13lGDJPzHxOLGQ1RNLDst6kncbw29Cf4BL4sY6glKr/qDDi
	wHqaNw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h6be8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Thu, 23 Apr 2026 10:25:27 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fbc70cfbdso61137051cf.2
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Apr 2026 03:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776939927; x=1777544727; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WvCi/CVpH88WMffYYZwdgbtLju43Phq8Lyjrsa4uQn4=;
        b=UJbVc3m7w2sFJezSzNxaz9dJebRv0X2izkBehlcljG9riqz6Llt9xU+GZ+tkuVMh+l
         MWiKjSIXWoG79g4Zni6pCK8SzsARq4ovq7w5BunKzN7D2LyvUC+qanpHzs64w4Q3j48s
         ZXR7sMAFbumXVr4G5H0ODBF0y+j0VGJoSdx4Dd2rzrqIuhbJilygVtuf31d768VGZVz3
         4k2A+v3kuBHajf5jqHiWlLAbQQ5r7e3Y/bD2GBFNTjVDdKOfvzFBhWPjGoHZP4U6+Dgy
         VXmW5ALim4Ttbm0ZiFkdEdYFu8u4fQBI88YPLSIvlNN2BBdoEL9hlas2FBzDutudndBg
         4u+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776939927; x=1777544727;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WvCi/CVpH88WMffYYZwdgbtLju43Phq8Lyjrsa4uQn4=;
        b=ZEbEUqNOvDSIYlpUfuWDJJ7VQdKhdGG5HGx+bgqmIU31sa+JUHFWl5Sk7tP96tute6
         T6tDHfMBOZqForRKtGs3wawoegFMuNQpdUtKxLJpURZBHvbZxe1vMoYcK6fzs4HVmak5
         sro4ZA9NRyxVwwfawZyOcg4QqzJWOw71lJcBDUvA7Kgx/PieljNp5wHLgcWqk+gJymnr
         XgPRB1SPHGBcRf5invYuCKUOaMrx72fpuoz9HP8pHRRVDi1ffHO4oALww07uv8ZoDZyf
         WIG8ozQrW04AUzrg1GqMD8qWVu0wrGrAnGtv42EETtvjDugEFuAmRQ4t2sbTH6xS8swQ
         mO+w==
X-Forwarded-Encrypted: i=1; AFNElJ/LRsTfMtsVHLxJp8IXq1I50+HuFDd4R3JaAUMDhcpk185WD/M6j3N/myPzvYkC38gDWtogeEtUqRsRR7y0@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2NNC4Aee2A/esuLdFz1ZW9l7BohJNmWg55GtngBonERqHiY6U
	5S0YCmDfWFVRJEH1NNcMb+oIHE1K7+ppuSkRJEjtYhHURgwWoNLChjRW0jVGsJa2jZHuKR9RB87
	UV4yIMJWWmGTCnJ+t6abTf3y3yvdRGzneOW29gbCuAQEeO/oBa53edbKlCpGlMKKsJdGVEbeVZA
	==
X-Gm-Gg: AeBDiesLaIiCZQ7R/1R0B0hgAP2wsYvIbR/qATcbaEpSynrLcIo+YFkhY+jsHqhKfyQ
	QK+Lzcfc0PCPTToGGj1P/Y1k3imTaWljln2AJm6fNG6KA1GLv2YcCQMw8AvkbGHbyg1p8WLB1M8
	VFNTWucyjodcTHZMzXgYuq1cL8wv+3BR6kfC1kQrF16iPAhD65Bu3Pq1zEXHPfpyAVNIuOUDmjS
	N1sZBDaYrfVxb0qrsd0odbVnlpszebG5+9KEQ52iOsl3aUTIV+eqe+XWY0ZFGVvtfR0uMkgQ1Wn
	C7wHnH+j6O8d6jC3YEto8OD22nMBIQKRHEylbUAOVIPE1Tkm3sIWYb6JCbVeZuueIzUpdycbTJY
	Dbjyd6J8Uk6m8wluvWLrcybH6Rj04TPGzyzrCT6d1Ju+zXEreecifax1l2HJtgVlb6h9Ges5sIr
	i4jZr5Q34V4Nox2v+NVlM=
X-Received: by 2002:a05:622a:4d4c:b0:50b:4a84:aa8b with SMTP id d75a77b69052e-50e36b87666mr402905801cf.12.1776939926678;
        Thu, 23 Apr 2026 03:25:26 -0700 (PDT)
X-Received: by 2002:a05:622a:4d4c:b0:50b:4a84:aa8b with SMTP id d75a77b69052e-50e36b87666mr402905491cf.12.1776939926181;
        Thu, 23 Apr 2026 03:25:26 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4412e36ff8bsm3890201f8f.26.2026.04.23.03.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 03:25:25 -0700 (PDT)
Message-ID: <7aaa7873-9274-48d8-a6fe-cff4239b03b4@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 12:25:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/8] thermal: amlogic: Add support for secure monitor
 calibration readout
To: Ronald Claveau <linux-kernel-dev@aliel.fr>,
        Guillaume La Roque <glaroque@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260421-add-thermal-t7-vim4-v3-0-a2e7215ed003@aliel.fr>
 <20260421-add-thermal-t7-vim4-v3-4-a2e7215ed003@aliel.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260421-add-thermal-t7-vim4-v3-4-a2e7215ed003@aliel.fr>
X-Authority-Analysis: v=2.4 cv=f4Z4wuyM c=1 sm=1 tr=0 ts=69e9f397 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=SxES-kZrre8EIFdHpqEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEwMiBTYWx0ZWRfX1Qt//i+tKAne
 bPr8R6Iuef3um60v/Y2R8BQUw52N0EJp8Iobp6nj3j33394tUovuaDnMxHluhyzZ6+ng+71ud4z
 bjIdOs7QsAFjyH7u4WElCL68+tWUWJf1+TFaLyHleVu1/Jzef0f1i+tjtafGuL18X1plr7B8HWp
 aeS1vvwF3/hqi2MH9TRk/6AMM/MCKp/PkthaKsfO6++DD76o6XObuuXfdU0EdztZsFRWiY3NFnc
 82+jBE3rRVs872UzcxDtJR/1n+oUs4IGnK8SUZMqwp45YEPmOpD3BN6Oz9X3FYfcxouC2G38vFL
 pOLv3W4CeXp4xR6BydwVflg+9ZtpHwSkmr+NB/Gkd5sqe46DU5ds59xw3lcveDt9mRqv8cXLWfQ
 5pPyhvrAnvdWvgTOYCaI4ViTntUgj49ZorJInMDF5Tj6HvLZuBNaiu/7B7f3gk5a+ZeLbyLAaHX
 xFPcaTEkN7XY4lYh1TA==
X-Proofpoint-GUID: HRuTGtzj9_ArPU1gxzytM6yUxP-Qx-ic
X-Proofpoint-ORIG-GUID: HRuTGtzj9_ArPU1gxzytM6yUxP-Qx-ic
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_032528_385149_74520483 
X-CRM114-Status: GOOD (  29.48  )
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


Hi Ronald,

On 4/21/26 09:19, Ronald Claveau wrote:
> Some SoCs (e.g. T7) expose thermal calibration data through the secure
> monitor rather than a directly accessible eFuse register. Add a use_sm
> flag to amlogic_thermal_data to select this path, and retrieve the
> firmware handle and tsensor_id from the "amlogic,secure-monitor" DT
> phandle with one fixed argument.
> 
> Also introduce the amlogic,t7-thermal compatible using this new path.
> 
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
> ---
>   drivers/thermal/amlogic_thermal.c | 58 +++++++++++++++++++++++++++++++++++----
>   1 file changed, 53 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
> index 5448d772db12a..11e3948cc0669 100644
> --- a/drivers/thermal/amlogic_thermal.c
> +++ b/drivers/thermal/amlogic_thermal.c
> @@ -25,6 +25,7 @@
>   #include <linux/platform_device.h>
>   #include <linux/regmap.h>
>   #include <linux/thermal.h>
> +#include <linux/firmware/meson/meson_sm.h>
>   
>   #include "thermal_hwmon.h"
>   
> @@ -84,12 +85,14 @@ struct amlogic_thermal_soc_calib_data {
>    * @u_efuse_off: register offset to read fused calibration value
>    * @calibration_parameters: calibration parameters structure pointer
>    * @regmap_config: regmap config for the device
> + * @use_sm: read data from secure monitor instead of efuse
>    * This structure is required for configuration of amlogic thermal driver.
>    */
>   struct amlogic_thermal_data {
>   	int u_efuse_off;
>   	const struct amlogic_thermal_soc_calib_data *calibration_parameters;
>   	const struct regmap_config *regmap_config;
> +	bool use_sm;
>   };
>   
>   struct amlogic_thermal {
> @@ -100,6 +103,8 @@ struct amlogic_thermal {
>   	struct clk *clk;
>   	struct thermal_zone_device *tzd;
>   	u32 trim_info;
> +	struct meson_sm_firmware *sm_fw;
> +	u32 tsensor_id;
>   };
>   
>   /*
> @@ -138,6 +143,12 @@ static int amlogic_thermal_initialize(struct amlogic_thermal *pdata)
>   	int ret = 0;
>   	int ver;
>   
> +	if (pdata->data->use_sm) {
> +		return meson_sm_get_thermal_calib(pdata->sm_fw,
> +						  &pdata->trim_info,
> +						  pdata->tsensor_id);
> +	}
> +
>   	regmap_read(pdata->sec_ao_map, pdata->data->u_efuse_off,
>   		    &pdata->trim_info);
>   
> @@ -226,6 +237,12 @@ static const struct amlogic_thermal_data amlogic_thermal_a1_cpu_param = {
>   	.regmap_config = &amlogic_thermal_regmap_config_g12a,
>   };
>   
> +static const struct amlogic_thermal_data amlogic_thermal_t7_param = {
> +	.use_sm			= true,
> +	.calibration_parameters	= &amlogic_thermal_g12a,
> +	.regmap_config		= &amlogic_thermal_regmap_config_g12a,
> +};
> +
>   static const struct of_device_id of_amlogic_thermal_match[] = {
>   	{
>   		.compatible = "amlogic,g12a-ddr-thermal",
> @@ -239,6 +256,10 @@ static const struct of_device_id of_amlogic_thermal_match[] = {
>   		.compatible = "amlogic,a1-cpu-thermal",
>   		.data = &amlogic_thermal_a1_cpu_param,
>   	},
> +	{
> +		.compatible = "amlogic,t7-thermal",
> +		.data = &amlogic_thermal_t7_param,
> +	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, of_amlogic_thermal_match);
> @@ -271,11 +292,38 @@ static int amlogic_thermal_probe(struct platform_device *pdev)
>   	if (IS_ERR(pdata->clk))
>   		return dev_err_probe(dev, PTR_ERR(pdata->clk), "failed to get clock\n");
>   
> -	pdata->sec_ao_map = syscon_regmap_lookup_by_phandle
> -		(pdev->dev.of_node, "amlogic,ao-secure");
> -	if (IS_ERR(pdata->sec_ao_map)) {
> -		dev_err(dev, "syscon regmap lookup failed.\n");
> -		return PTR_ERR(pdata->sec_ao_map);
> +	if (pdata->data->use_sm) {
> +		struct device_node *sm_np;
> +		struct of_phandle_args ph_args;
> +
> +		ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
> +						       "amlogic,secure-monitor",
> +						       1, 0, &ph_args);
> +		if (ret)
> +			return ret;
> +
> +		sm_np = ph_args.np;
> +		if (!sm_np) {
> +			dev_err(dev,
> +				"Failed to parse secure monitor phandle\n");
> +			return -ENODEV;
> +		}
> +
> +		pdata->sm_fw = meson_sm_get(sm_np);
> +		of_node_put(sm_np);
> +		if (!pdata->sm_fw) {
> +			dev_err(dev, "Failed to get secure monitor firmware\n");
> +			return -EPROBE_DEFER;
> +		}
> +
> +		pdata->tsensor_id = ph_args.args[0];
> +	} else {
> +		pdata->sec_ao_map = syscon_regmap_lookup_by_phandle
> +			(pdev->dev.of_node, "amlogic,ao-secure");
> +		if (IS_ERR(pdata->sec_ao_map)) {
> +			dev_err(dev, "syscon regmap lookup failed.\n");
> +			return PTR_ERR(pdata->sec_ao_map);
> +		}
>   	}

I suggest to separate these two routines into functions. That will help 
the readability.

>   	pdata->tzd = devm_thermal_of_zone_register(&pdev->dev

The thermal zone is registered before calling 
amlogic_thermal_initialize(), thus pdata->trim_info is not initialized. 
When a thermal zone is registered the thermal framework reads the 
temperature, so it reads an invalid value because:

devm_thermal_of_zone_register()
  -> thermal_of_zone_register()
    -> thermal_zone_device_register_with_trips()
    -> thermal_zone_device_enable()
       -> __thermal_zone_device_update()
         -> __thermal_zone_get_temp()
           -> amlogic_thermal_get_temp()
              -> amlogic_thermal_code_to_millicelsius()
                  [ Use of uninitialized pdata->trim_info ]

Right ?

IIUC, amlogic_thermal_initialize() can be also split and moved the 
corresponding blocks to the functions to be created in the comment above.


> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
