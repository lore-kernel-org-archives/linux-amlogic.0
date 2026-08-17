Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8C9C5B572
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2026 08:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LFYJTU+E8U/R3K/wO1mj/Y+P1A51TgaZK5W7o2g84+s=; b=v5FbUdmtLoO/QE
	3dGApPM8+JoGEb29QkEDOyfCUrGAhBixo9EI9UWyQOZwQIDQ94IgLv8G87HCD+Pa+eqO0nfHQ8P/A
	MYaVi5As3+pUBusxrrv+Fsl0BwiW/n70X1tpmoDR8PrVFGdRmJC8mMz2Ivcxk352bJJf0cry6VXu7
	Q+OOAeWKsqmWTg35aMnCzukHkEAp9uxt1A1H0cdD/1bAl0Ce8ZPDZDGiurkzOg+tJuIEV3bCMtMvM
	QemVUyhFUQuZNL+7jX1/6TtsRrpVKBxYgEJp3gCbljUAVf0rI1EaZM9XLhxBxZ999P1SkHrRWc8pV
	Il4U9ynLWr5+cAuWRxTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsI3-00000005cCl-26mR;
	Mon, 17 Aug 2026 08:01:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsI1-00000005cBy-1DbX
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Aug 2026 08:01:50 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H5oFH61328130
	for <linux-amlogic@lists.infradead.org>; Mon, 17 Aug 2026 08:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E8f2R7uAkkm58Igw9twxKgRRf+vTxm7dlB/hN8w5EL4=; b=X6WqELsgDmfc817u
	RWHmT88QxmrDY2V5cXRZcxKWIkOewsmsSD/kA1mC4v6EQ/0Y1A+ftbHNQRXAKTSK
	V4qUO1NkYHUVYS1Bf8eZOSgym8wfIScwiJaIebVhsuhyHsWK0CxGsdK/K3+l+g/8
	xsUAuHjHE5/SJsclPejggLavZ9d1Uy5WJs7lGb0jdw+uwVfqZbRWGx5Av6sQOmNX
	Uwubv1SnfZP2qVMlQ5l81b9rKoU/7TPDDKOn+AZunCkf6fTU81xhBy+C8ggJAglu
	qkrS8GSJIJbNDMUEM8J+NzKq11Pw2LB6PFrD3aHLASPG039fHsniRu988oXGQTWt
	wwSU4g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3vghrkn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 17 Aug 2026 08:01:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c21c01cf3so59989451cf.2
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Aug 2026 01:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786953707; x=1787558507; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E8f2R7uAkkm58Igw9twxKgRRf+vTxm7dlB/hN8w5EL4=;
        b=GPgb60mXWBD6+SN1mw00/G+nO5EsVjQ0aX62jwW85NB6j1S3o9fCyKYXT03wqD3zt4
         flCt1b8ZvBZ/KvAX6mx4biDQPnqUAM44EJFm+JLUCWNOr8lBmXWtTY4mi3Dvr+m6oasY
         5wxf1XShxCrgb1mYIkHqvtQt+aM5pEAXM3MjNUm8xeO6FCx1grN5V20Cs70NTK5we0Dg
         W/BhIMZX7lpIbcgJGkZxwIZIdGdnpUxcbZfH0FqpHM8/PZs4Z9Bs5lpHjUTgC14chFGT
         hXTSqHc1csTAybjJovi6nQNtVT6H6dfKWq+AVrmSjl8/Vmucw1QciPFYfPn5gqF7GZ1z
         j3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953707; x=1787558507;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8f2R7uAkkm58Igw9twxKgRRf+vTxm7dlB/hN8w5EL4=;
        b=fEx7yUxmYZM/GQsQ/e3axmfVIDLRsCudWRaOxu73cDIrEhvhGCVIHFPmVSuHq8Ysbo
         XV9FVL2rrzvlocAdlUmanFT4mnbl+xjVxkYJOLEk9yhj7WQxHtPMYNMF9zLzVAXfqpkG
         ES62IUaAiyas6n42bgUVhniXTLlcWEUIzlEMblyANckyeZJ/1VFkfL9JqLvhx8zRG41D
         wzmaFBkUMIwHv1+jgwRbybNir2siBpjRB+Y3aeKTtaIfKCxQfej+93sbLWPraekpc1zv
         pg234DPEac+Bgy0HcK1L4sQGvvG4BJdv+OtMwKPJmf/U5gw7Jh0Ka6bIAZh1lhgiJdAv
         FQWw==
X-Forwarded-Encrypted: i=1; AHgh+RqlBX0DYvJ5jZqIM87jMz5/EkupAPfTiz7YlYOsl3pnqS2ulKnwgjJPDXkb0ev66T1HJKrGB2gi3G9lHuAA@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp0BFGMle5AYhCHA+ryqHYAf5YaSWY2ustvTI6Ajm8+rQ3KaWL
	UxUt9qOpJ5n4hhZtVqXnLou2EsT/3jh0YPiZzyYt84tyraQXwnMjwGn9uhTrOGZYsjzWyY37gEY
	Phb6EsqsCwoxMgcKjrbf/AD9I/ocdIXaiYe8fDzmZS/eFuXKBmHvxhvV7mkZxBQE3e/7kQYYQlA
	==
X-Gm-Gg: AR+sD11MKMoF1X6mNqs1KX9zmvcYIt8V70VYX+L16wpZtezk09Fg5cUvcyct3EF34Kk
	xF/BnSYvVidkQeQF0L7Vfig1julBR1IKd29BSE5PwXL14BY6rqX02c6wWtEjAbJ9z1xTx3lAzfl
	wpysKdWt83aamu5+0vQPIq/MwB/70d2aT+TiLCXXetty1jUZIfIjXdszrAgLGZQvHY+lxZVjGi5
	Op06kSlJmbv2xlCznNYha7OFAJA6TwhBkCJwgPk7qjYScVguQaIZzmwFWSdVufEr3gbvzB+bi+L
	YdGZbeqCl9sCb9C9Vfx1kFw6ycrdEJBc7N8IRwrfarHxLGZ9KUI0N+su87c+QHto68LpijbwCUJ
	u2kZjioBt8+brgsR9ULNWjs2ttvc1W5pJvU3EM+n6JTukN7mrdbTy+pJ+16s2JVE8zg==
X-Received: by 2002:a05:622a:1341:b0:51a:8b64:69e2 with SMTP id d75a77b69052e-52d8530f131mr247367671cf.7.1786953706603;
        Mon, 17 Aug 2026 01:01:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1341:b0:51a:8b64:69e2 with SMTP id d75a77b69052e-52d8530f131mr247367131cf.7.1786953706112;
        Mon, 17 Aug 2026 01:01:46 -0700 (PDT)
Received: from [10.111.162.109] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52db612c2bfsm8319271cf.11.2026.08.17.01.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 01:01:45 -0700 (PDT)
Message-ID: <96344518-c0d3-4424-804a-c315eab3e39e@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:01:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/msm/dp: mark the SST connector disconnected when
 MST is enabled
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-5-646a10256233@oss.qualcomm.com>
 <sijdmdhcbxyg23gh6c62hspruvbnyqbdrtv2er3bh6n6ftolsp@b6o4khv6dofc>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <sijdmdhcbxyg23gh6c62hspruvbnyqbdrtv2er3bh6n6ftolsp@b6o4khv6dofc>
X-Authority-Analysis: v=2.4 cv=P9gKQCAu c=1 sm=1 tr=0 ts=6a82bfeb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bLWUdw4gizuqmWSpfScA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA1OSBTYWx0ZWRfXyjf0l2Q9KUFq
 TPyBWXA8iltqi45IWoPbN8+WZoZc6II2rCBIPza3lnn4FMJfYIMM+1M/RM/SoD7Q0s3C9x5SYpO
 Pw0OwmCCiKKeitSRPxyKXtcPSjMKJ4Y=
X-Proofpoint-ORIG-GUID: MrAPXzxRTgGED7RxJrtWbEQWn_soxMev
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA1OSBTYWx0ZWRfXzsMjxUiHFCIO
 m2kLprdVM3CGxV5ZuzzhSqj0J9hFTNUbvG9PMBsgwZJmj5K37Wy5cthaEHpL613MmRJ/gyeooM0
 I24KPoVOb8fbdkyxC57o1QPGioJRcO07V1NcdZPJ0M34hK7UhILjUrbuAfDLG749bJjaxsXoIT9
 FzZcUpAmiELqIotR9zaUoA9xbGm37se7TCc/UsCpUg5Q+hWqAGWIgKlBmf37DhFkSFKLBKf0RS7
 OvserjPHPOHBN1wT1sNoCHsXk82AijNt1nguam7Dfyyg2Yg57hScYojr2ZXmPkkxqsiwjweSnpI
 JW3nXkWyj1x96EHp2kURVtV9hLkTq5QuKCOJidOhDciFype9ghkMps/XFr+qxep9AklKjhFboFB
 XPgvV6VQrURIJ5gZuCNtyzj8FQXYb9pOXNNEtnPJ9X7QFvcC2y9H2vCp7fTq2ekZpvj6KkcoNjB
 tdzW/FkELijRK7/DhOw==
X-Proofpoint-GUID: MrAPXzxRTgGED7RxJrtWbEQWn_soxMev
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_010149_440485_44929E86 
X-CRM114-Status: GOOD (  18.40  )
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



On 7/12/2026 6:56 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 10:48:07PM +0800, Yongxing Mou wrote:
>> When MST becomes active, the initial HPD plug notification updates the
>> SST connector state to connected.
>>
>> However, the subsequent SST connector detect path reports disconnected
>> while MST is enabled. This connected -> disconnected transition is then
>> observed by the polling logic and may result in an unnecessary hotplug
>> event.
>>
>> Set the SST connector state to disconnected immediately after MST is
>> initialized so that the detect path does not introduce a transient
>> state change.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 4ee391cc7165..f8ca60d6d714 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -352,8 +352,10 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>>   	if (dp->max_stream > 1 && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
>>   		msm_dp_display_mst_init(dp);
>>   
>> -	if (dp->msm_dp_display.mst_active)
>> +	if (dp->msm_dp_display.mst_active) {
>> +		connector->status = connector_status_disconnected;
>>   		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, true);
> 
> This should be a part of the MST series.
> 
Got it .
>> +	}
>>   
>>   	msm_dp_link_reset_phy_params_vx_px(dp->link);
>>   
>>
>> -- 
>> 2.43.0
>>
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
