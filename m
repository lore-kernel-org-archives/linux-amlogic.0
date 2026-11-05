Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA22606A31B
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2026 13:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F63Or7hB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fzfhnCGS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kd4olU1h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cFcZY1XRevKTlbAdOuhLX4mqBwu8eQvvOsk5j6NHVvY=; b=F63Or7hBQCj21J/612USHkULhB
	1VxzCSD/7ytm60wa7/PcBYnO5lzmgdmHouOhD08ExQb4SOsAnLPbQbumCuuVecfLx/A6DChemG5tE
	4O1UZSY1E25UlYm+xmshPnWXWidJSKahuRjl41mCJFBuZMxiDfLEhQrYnaKSF0E4NmaNYUDWXwfuk
	45rTO19XhVTgoQkShmh0Vbvvv5e/KUUWaTDCNoR2GbWuqhN1BBZEJaqsW3avi4Mk8Xl4FtXUOPLTL
	P4uQSnmadQ24dwqzyT8fgSRwESl9ECA7nWAAtB6N0SejUwPnz4+hXXTDr4sG+/QDUSb07pMQatrGZ
	nK7GKP/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxcW-000000099dK-0hfe;
	Thu, 05 Nov 2026 13:35:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxcT-000000099cF-33dR
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Nov 2026 13:35:11 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5AiCxh1583267
	for <linux-amlogic@lists.infradead.org>; Thu, 5 Nov 2026 13:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C6les2P6C3VYvsc8kD6y8hS8
	7HftniHxNnR9mHrsnsE=; b=fzfhnCGS61R5KeLTKzhUcDeAl/a29wFH1O5NR8ZL
	Iw6z2btcm6+JaEDnK9eSRH8JWClTBhbiW1AFYg/luuhSwwunNo2lkKeM8EYe8rvZ
	TV7x7CaQX3OrmcH16RuJqyNZaCGDINouoX1PTlszEStB77ayp7XVqjs4moIZ4Xso
	E6/GKvXrqnzlh6tuy2aaE4RkQ/asZV+KBiDYP4qK9qy4XiIAloPmt7N3Uj5FTN0f
	HCbfzWU/oCCQ7Jmpz8VKhvc9YoBR8esCIXqkfvzL9IGE8Mvw/QTBa0j286UPKh9Y
	aM/5s7PwOIzIj6WL90/6ma44jvKpdaijgodIthb/ysITBA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrraarpu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Thu, 05 Nov 2026 13:35:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbf2fd504so370350685a.2
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Nov 2026 05:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793885708; x=1794490508; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C6les2P6C3VYvsc8kD6y8hS87HftniHxNnR9mHrsnsE=;
        b=Kd4olU1hKDi8pfANBH91POsv/q7lYn/HXWg5t16VhVJWfouOcQFYMtXF1H0yfkLiXJ
         Vn9kLZDXeAzXbNuTm4GLCW50NNQFX7F4V8oubnBu+cGu4RFoDdqryOGfikAfO8UDKiBh
         c3bbHwOi5YlHXDrFfNtiZFHkPuxHGlcGirOQ044s52+wlC/EgbeaHsI069LJpq9GcdbQ
         Tp2X6noC4NsFd7oGoKMDw6PCRV3cbIMZJVgRocmHGCWTdijQH0bqjl9zUix3Fvjj/b3C
         0JBKsZcWp9ZQGL+BgOOsIYeNTF5alPtvbtcyhrW6CRQlppSxJCEIfrLjaTvhQHe0qeB0
         bxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885708; x=1794490508;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C6les2P6C3VYvsc8kD6y8hS87HftniHxNnR9mHrsnsE=;
        b=xNnJYJEbAgFf4mmuzoWv4fzHsOBSeMssokbNpIkk2rTz0DpTm8vyTLKOYXtjsoDWT/
         b3gofSqZlQPxjAPax56Jn6rY39JWUhMjONOgauZsTmgCw1QU043X4CVPpjyrtCyxQbwg
         Pp4+Axr0E2etX7EScsGEvJQM4ePlAv5u+oK+5k7jnmAsivc/OvQCcrAakuV1HJbQcXpN
         uCE36UmEeHbJd1JeiYTX49t4GkFm9Jpm3sZzJ9vOzRf8C4YzC3Fq091xizfuPQxPMjqG
         tnfZ5QhI2WaN2ROyo49Fqi+iAw0KfmwJuaNHdr2/P29HpeqXJolmg6vTIoOqXs28hGmb
         lIQg==
X-Forwarded-Encrypted: i=1; AKwUvBzwC7IjVPiU2fs+ErMQ2TJVK39aOWrZ07cXl46+llacWVCx/ng1wwDCvmLwhnNuucBG2t9Eevt8Fq2shYCK@lists.infradead.org
X-Gm-Message-State: APuU4Z8r8k+jAUb1pcsTVQskSASdCvKREHqqTOSZSWwugI5CPmSC8xuQ
	MjoeyVGQP8oL7xt1kXfBp9a3IyNSpy/vmFGdpTqY5FotHzAVGroL3bAjUrIETA8qPzmKEdCpLkF
	SgtRSG84ga1ciOoXLg1hpiDgeNhRi/umo4p5HoqkByKvgdYzhSZ/U6N5bP7CLmkCuV1dmlsqf5A
	==
X-Gm-Gg: AYBFou0RZthEO7WTWx266SdkYKvhzN1g26v28jsM6T0NifsPmtEzdmhlUbpBzQBHbZd
	kw4ww84MXWKu9I1rjs1H8ongDt7HSV1wj1d22d7KLD5s2+xtMJTdCJwldH2qEjRijMbg4xNN4Db
	PCPF3DNiI4MUg5jxzQnay6PtAH+mFzxFp8vyj90G5yQ5DXzJ07u0ukeoRvd4Q/uIu8d0di2MCfM
	zdC7awwWS8M5AJqmkx4BipfrvA69+izKy11dpX95q+oUkwcL9T3u4XZ2lVXUhCNcqJgKPBhOLto
	lUFMOdLwUB4ZWdeD9z8j8lOMqOesz4GUN76t1nYTpKGAD3A0Qmzk9x6qWXyEddnFB7vFwyZY5XM
	dIzWmV3+PWtWKm39VRij8wLtns3C+vITxUPb2el95c82Q/L/iMsia92xyBY2AdmNMq9DGsgNeTR
	Gqb2GFT609FZ8rFOyuYWKmEoYJS4E2Fi7aNUO/4m4F6TqfqKmYNF3ezlW0Gz9f
X-Received: by 2002:a05:620a:a905:b0:945:b9c8:de5a with SMTP id af79cd13be357-945b9c8dedbmr1578449485a.20.1793885707659;
        Thu, 05 Nov 2026 05:35:07 -0800 (PST)
X-Received: by 2002:a05:620a:a905:b0:945:b9c8:de5a with SMTP id af79cd13be357-945b9c8dedbmr1578445985a.20.1793885707078;
        Thu, 05 Nov 2026 05:35:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6e07fdsm10695471fa.28.2026.11.05.05.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:35:05 -0800 (PST)
Date: Thu, 5 Nov 2026 15:35:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
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
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH v8 5/9] drm/bridge: aux-hpd: let drivers pass IRQ_HPD
 events
Message-ID: <6x7dtyvhbk22ri6nnpuo5jpk2ijphaebgbbchoramc4fhnvgjl@slhivetxacte>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-5-6ee949e7a384@oss.qualcomm.com>
 <179387924494.1025980.3024349339803589757.b4-review@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <179387924494.1025980.3024349339803589757.b4-review@b4>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfX4fE1WRqz47EK
 09p406NMm44E+5qgbfvFFfKs9yMx5PfuE0Fie7yP87AYhweNR2PEYaEPtauM9XxUpLyTGD+Jz8u
 2YDmVQcMUIESwlLL3t3bARLBXFRceh8=
X-Proofpoint-ORIG-GUID: b5iMioYsWEuZZc3Kbzxzqf6-TQ_l-JAJ
X-Authority-Analysis: v=2.4 cv=U54Hnuru c=1 sm=1 tr=0 ts=6aec860c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=P-IC7800AAAA:8
 a=oSBH3dYeosbuySqTTykA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfX6YGzwp/qYd7C
 S/VafyP2WqZwK34tnQrtD3ml8SpF5Gd/IQnT4gyZsLszgtPtE7m41CqvO5uZXG/L2MKuH8QdqU+
 7mjXmo7PTn/RjmB+NXdrxGY6eNXSxVPqB140N5MBhfd1JDH9yhYySSnmMD6ucqQogfGh5DaFwrc
 PpOWH/w3JbOpDBZDMXS8RyisWJrnTXlYseSp2u1z33eHSLztPNU8/sOdRz3Ik+lUO2TRB4vniei
 d+I7coJpoTrRQ6yZofpAHuUtQ8a5A9IA4Kkpo+JsJr2BxJmqcWNxaz3gyV82F1kxWmf+6dy08eH
 onfR3TON1GtKD75MXT88N/HNPrGR/UKaSMrfhp5DTSo0E78vvd2fNVppY0X4m49d35SqT+I4HZT
 GHj4gravTXpLGGMo0wMUDPwGdEyQ2nCzLBWLLUU6iP5W63P2P5INa5OuEvWRvgTXGqQBzG8a1K6
 908NUlcnSHZaW8YT7yw==
X-Proofpoint-GUID: b5iMioYsWEuZZc3Kbzxzqf6-TQ_l-JAJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_053509_770714_833AEC20 
X-CRM114-Status: GOOD (  19.37  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 12:47:24PM +0100, Luca Ceresoli wrote:
> > The DisplayPort standard defines a special kind of HPD events called
> > IRQ_HPD. These events are used to notify DP Source about the events on
> > the Sink side.
> >
> > Let users of aux-hpd, the UCSI and PMIC GLINK drivers pass the IRQ_HPD
> > events to the DisplayPort drivers.
> >
> > The drm_aux_hpd_bridge_notify() is kept to ease merging of the series,
> > preventing extra cross-tree merges. It will be removed once all
> > drivers are converted. The drm_bridge_hpd_notify() function is kept for
> > the drivers which only care about the connector status and will always
> > pass DRM_CONNECTOR_NO_EXTRA_STATUS as the extra status.
> 
> Do you have a plan to later convert all drm_bridge_hpd_notify() to the new
> _extra() variant, then remove drm_bridge_hpd_notify() and eventually rename
> drm_bridge_hpd_notify_extra() to drm_bridge_hpd_notify()?

I'd say, only if they require the extra status. Otherwise, it's just a
noise which is perfectly handled by the wrapper.

> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
