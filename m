Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C428BC5DF7E
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Aug 2026 03:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SXofoP6Dy/9dJkO1RQ2iteC2tKYhit5cvE5LEmXuhaU=; b=Rt1D4GENaCuOK5
	wXuYjfcoUhLyEnX/B1jj8Al9W9UPw6RwbqaYQOfffIRm84zJz+ndfaHrfcDgQpVNm6HBpQ+Yu/9Os
	3kgAHZ7WTXg3bx0X7YXnqQ2ynnzSoKr8v6JE1z8iHUNh0oYOI9PVaaDYC39ZkMMwPUS9UBv2SiSSH
	oZataaIu9ShJcnczsGeiy9jzNSU3BE4X+vdHE4uEmf11hYgA5sTUO5zGKCx2gufE39wNA2MGJXLDW
	eELKDch5KacXEP/7mIU9of5iLuIo6auBhgzfMKca2NpxNYFQXHU+msIrT2gnxBvmCAEykgrTYSIeC
	zxNKCQ28rxSdnr397yxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwAQe-00000007BKa-2iL2;
	Tue, 18 Aug 2026 03:23:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwAQb-00000007BJq-4BPI
	for linux-amlogic@lists.infradead.org;
	Tue, 18 Aug 2026 03:23:55 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLkoX43882319
	for <linux-amlogic@lists.infradead.org>; Tue, 18 Aug 2026 03:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/Mj3SzAcaCvmOfibRhtunrb3
	JChcTu1mYYWf77aYRPc=; b=gi7yg6CS3RxGzgedATshcmJaiGXWKnB2gLVvLaXH
	hblFxCEsGbQ8T+Wfp5yRC73yoh0cDC2MmPHF5vmXT994rkU0z2erOup7s7coJW+T
	LarnShSR/xs71I+vPuRdYJN2Ti7V7Xz+Ahqz+qDd2yv5DW939Sc78whe+eDLzI0v
	Cpob1u2wVHwQ0GjwH5CYJwCzy073L0Ktd6hP8Yy1s8uttIomxS/7hXfFyVfZUAT7
	8OaAPCeptjLxrQDG+lWbWF48QMqc+5J/Egy2f0wF/j2a/JNkqv+sN1BjauysRPFQ
	J7G7MXFCpMDwiRqATI9FYOqwoR1Ze5mqJFVQcN5ogSsI9Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y77c7nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Tue, 18 Aug 2026 03:23:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934979ee9f1so530881385a.2
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Aug 2026 20:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787023432; x=1787628232; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Mj3SzAcaCvmOfibRhtunrb3JChcTu1mYYWf77aYRPc=;
        b=b+iPynBPCQ/JWFqaot54/8Y25uYq2Kh/8tHP2Ae3ze7QC8aAt87NuOMCyngj2h0YP4
         A+QbwpnIBrj8/Tq6WqD0HkuNMXNZpcyMoR7FMNCti7nHKhDzs8wbHqoYvWop/L4/4hL5
         fAs6mgshC4ezb+35aFs0UQO6fAD1YQ0n2r+UYaTAwfz11X20pZNUwX5OHYwLVLVAMZZn
         39SExkR9qNpSYcEVNVK206J3hFUewsec+N3bGjcsaVCEOFtIk+B6SncBfhHhDPfsUHBV
         qOArlcPk+SdiBW6MlQmQCGuflAT6nMZM8AtubgVpOZ6TnDVigN8ap4gkRq+S6X4XOVBW
         Trmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787023432; x=1787628232;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Mj3SzAcaCvmOfibRhtunrb3JChcTu1mYYWf77aYRPc=;
        b=RzCtrFGemzksLyylQjPTqufJ0RrREVy7rkeLE1SjPXP7nWt3+lL+sfXnjYHjZyfAmt
         yIWMvHVerq6pLlEZGLtNaR85OjnOwv2SELkHNAKT0jPjQ73vGW8h9ZVFuy0UU44FpXi/
         lrLipnx00q9Z7TofhDDLJ54ZVLshRXlqF6mRLEL/tqvEuwyjeHWGZV05dXus5jaIAUFy
         4N/oDO0YAttm10YHQ41Cl4RYJgb8CcrEju+9FArOnZOAN7Gs/hoZ4++nZ2r4x7SJvujS
         Trl5LYQ+tdhcN3ds+JvDvwLb81RlgOS/uZxoc4dLdGYAHdJJGcpvH5b3nJT475t1LV6n
         Ry4Q==
X-Forwarded-Encrypted: i=1; AHgh+RonwKA7qyfBY+dmnE+SfTmPmx7dFx8QD5nnL5lejnY63J4eGX/bxzopfZn/wIzG2+CZxvPTCX37butaV9fr@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe0Flu0YtlPjlXZe9FJF8TKrYwt9H4AVYGUkp5SsM+ZUZTkmQ1
	7MzdzWn5OIHW72i+sOkGLb3gKZhP4n+tX7/ck5crn421upbmigFyRLY03KjYcEGvD1Mm8kxpP/O
	jl6KnoorTbVijfg4GBhpHhC5r6TMHQOo+RzxBC9qJivOXh/lxsAPbAJb44wOxaxhLd9B8HpCE4Q
	==
X-Gm-Gg: AR+sD122Pafh7q35Fe4tz9kV2Od/SOoqc1RZx4wDojZ5O3sXRqztfztWQCq7/up0p3e
	j79dg1EfARAhCc4nC1M+n3+sc2UKR6p4z23gBLtAPPshrG+ohjcBlQzfyjnuzg6UnZU0BjzMGeP
	x1pQkDR+7tDTRw4euMBjwOh9T1+ky/PqZz92AbNRjJOWcTiDM46HsvUzQ47mOoar5ObNVtuJTC/
	K019JH7fX6jOhT/hQ4M9UqZKuVbF6aWFPU/PLJOBF9Uq/J4EFYi/zydmPwtDITqDSUPQjJcwPsa
	UG4R/zQUF9fb8FObkbik0NgPAsbArsUZ5mqp5fm8Ht47M+EaxaY1wy+CTV9gfvTYG+xLgTRHKNI
	+ipfbtx+T7R0zDyfUhj/E+743NsZGA3RCqIRKFuc/QQUlrivA61sjIB7Dghu8+Db+CY3MOIJFdH
	uotU6ucTZAVbys
X-Received: by 2002:a05:620a:1786:b0:936:cd74:4f45 with SMTP id af79cd13be357-936d232e6cfmr2796688085a.37.1787023432418;
        Mon, 17 Aug 2026 20:23:52 -0700 (PDT)
X-Received: by 2002:a05:620a:1786:b0:936:cd74:4f45 with SMTP id af79cd13be357-936d232e6cfmr2796685385a.37.1787023431954;
        Mon, 17 Aug 2026 20:23:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cfa096asm835514e87.19.2026.08.17.20.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:23:49 -0700 (PDT)
Date: Tue, 18 Aug 2026 06:23:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
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
        Dmitry Baryshkov <lumag@kernel.org>,
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
Subject: Re: [PATCH 5/5] drm/msm/dp: mark the SST connector disconnected when
 MST is enabled
Message-ID: <ue75tcf5hwigfvo2pdcmkako2ovvgoxte5oeqs5an7fsupfqk2@oe2adzbdhv5q>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-5-646a10256233@oss.qualcomm.com>
 <sijdmdhcbxyg23gh6c62hspruvbnyqbdrtv2er3bh6n6ftolsp@b6o4khv6dofc>
 <96344518-c0d3-4424-804a-c315eab3e39e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96344518-c0d3-4424-804a-c315eab3e39e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAyMyBTYWx0ZWRfX2lUQBM2Ywn6T
 +Z6wB2ZIIcz8PZeYtuZ4uHKbic+28OP4R2zT9z0Sm3+Mj/dgYk+BdF1p35DFnxqjTsPst+Gb7YP
 cJcUbBP/7qhmow13nfr0d+ahoX9peKkWNgxd2sa8H2hTZmuyH/k2s/NxNyAm8fyhO9q/S6PIP8z
 kwZfIlG39QC8NY2LgCFHDAZz/HNEFLRkMf33eNrSaI6TctqroCE5zszAgdEdBxvXDYpUnyoQ4lB
 lkqNGjvn6mCOsaEzTb+nZtauYM5vGjqwM5LE16JyvzgNUVSjPRNsCIUsGoMQC2G/v/wr8liwMmS
 /39obcoc3I/Mp5IUUtJSGtxZw6uaUyE6NRG3LZVoha9WeojyP2lXOwLcx006Cq9ukVzdPEb7t5v
 jIu3Q2+OLea67Gt3NFTQ/aO2eV07LxwMrlBQ+TusgvL0/A9s58UKInwh2VabKteRnXjqDK4Nkqd
 1HnItIG+lJ/9sXZHTQA==
X-Proofpoint-ORIG-GUID: oIlA9eR_IRCq_8Q6yuD2rCKcgCg44L1x
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAyMyBTYWx0ZWRfX3wWDTUAWlh7z
 fButxo/OMezO/UyeHG7TiyrUjUHhjOLs85S5/gQnq4oOvLvEVA5z87wK6A5Rl0P52/+nJ8U5/B5
 NiXKZry/ywroySXA3eDM4huEi21CIaU=
X-Proofpoint-GUID: oIlA9eR_IRCq_8Q6yuD2rCKcgCg44L1x
X-Authority-Analysis: v=2.4 cv=WNhPmHsR c=1 sm=1 tr=0 ts=6a83d049 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Q8SuEDP3D7tb5lYi7iAA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_202354_149571_C537C33B 
X-CRM114-Status: GOOD (  27.03  )
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

On Mon, Aug 17, 2026 at 04:01:34PM +0800, Yongxing Mou wrote:
> 
> 
> On 7/12/2026 6:56 PM, Dmitry Baryshkov wrote:
> > On Mon, Jun 29, 2026 at 10:48:07PM +0800, Yongxing Mou wrote:
> > > When MST becomes active, the initial HPD plug notification updates the
> > > SST connector state to connected.
> > > 
> > > However, the subsequent SST connector detect path reports disconnected
> > > while MST is enabled. This connected -> disconnected transition is then
> > > observed by the polling logic and may result in an unnecessary hotplug
> > > event.
> > > 
> > > Set the SST connector state to disconnected immediately after MST is
> > > initialized so that the detect path does not introduce a transient
> > > state change.
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 4 +++-
> > >   1 file changed, 3 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 4ee391cc7165..f8ca60d6d714 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -352,8 +352,10 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
> > >   	if (dp->max_stream > 1 && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
> > >   		msm_dp_display_mst_init(dp);
> > > -	if (dp->msm_dp_display.mst_active)
> > > +	if (dp->msm_dp_display.mst_active) {
> > > +		connector->status = connector_status_disconnected;
> > >   		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, true);
> > 
> > This should be a part of the MST series.
> > 
> Got it .

Also, you need to take the lock to modify the status field.

> > > +	}
> > >   	msm_dp_link_reset_phy_params_vx_px(dp->link);
> > > 
> > > -- 
> > > 2.43.0
> > > 
> > 
> 

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
