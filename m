Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C019ACD8C8E
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jun 2026 06:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O1CMl0LC/emq2zx+k02hN+vbRyOrVr7N5VI0YZOTqCA=; b=NB4HgDUPe9BcGL
	Do2klXINSktTlxLZlFA06TqJh0aGHfCs/yzJYPRMOv7lSaV0RgM+CjEDCARlO4HreHqi6Gxo/AdmG
	hmaq7nm/LGgpscNJlMNJ6QWIkVFd9UD4Rd5pMOGgp4gBCASJccmAqUixijmtUL1d2xHnWDBcodJAr
	0hxVIgTIoKA4447eozn5qvDU861W8B0kjdlfNYshVjuIT6ld7qhMTAHEJq4AsBrbNx8x59+GRPfE1
	iQhkI1yh/+8d8Y7Ze/CdXenmZ1JrCMm+7CRYEtxBbMbJkcnub2k2C86E8RwgbfgCSSb7Gxq0Cq2lI
	kDoFXRlvKglXSPSMXhVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTDf-00000002srx-2UDB;
	Mon, 08 Jun 2026 06:12:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTDd-00000002srO-0TQx
	for linux-amlogic@lists.infradead.org;
	Mon, 08 Jun 2026 06:12:18 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580F2IC1573556
	for <linux-amlogic@lists.infradead.org>; Mon, 8 Jun 2026 06:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WVKWxZsnq6xE/GGUlxylGRbf
	kAGhFykn+8ukYkAUUnY=; b=a5QrppdWR8HfJPGIoCxldQjiWTwa/DbcP8h0DViO
	mOCw3RXN0L9ivo59eUzgfT84IpOVdfVgdhEIUgmHF5dOqRI81ULKcvn3ZPGD80My
	ZgC1Gfm+2Ex50TGgTAb7AIMo2B1FWU0P0jQQBYJq0kv+dOn/FKXKjryvj1locdHe
	p/e88rUQKs1x4zf1zpVF+E5EVAzKjyEEDVBeq6MDAPB2m0N4o0zI9eXfc6ogaPRe
	jHU/3gfCEhq9XzgTfT1uSSBSwPvEztSL19Q9IrA7ewDyB7Z6iHuipxK9qLeGwbdX
	X5C2LrcWuWXDQ6t1ISoUBxjNXPLitB8FFEbGg8drJYBXJQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcu8wyut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 08 Jun 2026 06:12:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ccd77414afso53801806d6.3
        for <linux-amlogic@lists.infradead.org>; Sun, 07 Jun 2026 23:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780899135; x=1781503935; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WVKWxZsnq6xE/GGUlxylGRbfkAGhFykn+8ukYkAUUnY=;
        b=bFik9R+V5kFRwSLuFIMrtMC15vih+ZruIeRPojy2sNjtlXSmuLcADveQmqMiARuEfP
         obf9eMB2cF6+EIPE40ZUkRQ6nXw6RHR/+QGz9xxuIahpf1M+1ss/jQCLWZCX6z+NwkEd
         TmX8VDP3NWgisJjAJQ8ZdWVbSnKZrdZSmltodGAeL61Y3uFXL6AawSouUOEkDDsUaz7l
         FoHwdorwA2eCISevtmTW318quFhl/QubWjuvJV6or6We0qAGieXBE0vhN/bYUZ8c3WIr
         rniP84YGCYq16dKkS9HJR8TxjDa/roesHODZcFYDl5k1F7G8rExI40mNupQdThT62uH/
         IOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780899135; x=1781503935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WVKWxZsnq6xE/GGUlxylGRbfkAGhFykn+8ukYkAUUnY=;
        b=iC9j+c+5Wj5+8BC5lFbjAlHo+TNHIoJ5z1dXLf24EE8H6JZl948VbXUF0oWtbfXDWg
         CkNm5e3HFAwFIHTINa6OXFJwRqDavbSSVCvk0cLMW+KSvFbYEoDyX7Vydc2UHJEn6d9K
         N+3Sq89T6TOpNbu5YOD273cI4aA3/CJ6+LwzKpK4uxPwU48GPSYnNGxEYEcXD3UncjQ3
         OgEqSVGuf6tgt4BkH/c5AA42+niQsJY3RV9DYBxcTqjHAr8+HUSE60WwxYzXm3m+fcJl
         aQgeQthk49LuqimIyAotoWzty9BFu/HTGeenmVcAJGubYzx8h5r+rVmhYrGuqPfVxXog
         AsTQ==
X-Gm-Message-State: AOJu0YxGsehd/eV6IS9mvKnXREiTIXvDz8PQug1fY8sSrSrwyOhwemAh
	xg0C1odrI2pdT7ZjYbJZYLqISMHJKVwQp0didStzwEXSzAbQv/BGXl9NnT877uVITgi9kiZuzlz
	nwIeKz3MxAc25wjXHXU0rCB+vrc1UNLztRCymcyg5pSH5f0nsXqkVDcx692ADCbk0O/CgE9+Y4w
	==
X-Gm-Gg: Acq92OGutl5tQzI9QNlMHZhd9fbhjXB7yZvh9ySJafaIA643/VgR2bKZgJkOpuGJc42
	xi3N+pqkQUFS8noL3s887BBIe4mWkTn8u5DG3coSxAaxMvmiqLeCw0KQRSdfYTnQQVFDYGw/m4y
	il9qpS2jZgSu9zBWaCKXnUMrk5BXXnc1iuadtcsSiX2Jxj5iGVuWLA9cJMthcMN4BQR/jAWm2Ko
	VMWSY4PWXx9NNYqpLKV17tPFPXpA1S2HwEBYStYMRtZsR/9lpj5vPyS43iAiILc8wOKqhVWgf3q
	TwmxRmhmdt5p7esMsmtcTk0dTR5sYDmq3GQm0qQgOlFpPijFrvdiMlvaZwnrBOUsneNAQPVYjP3
	kWS7T0sa1ugRI/Q0q27htdXt2rRRbFSSxdnSXvLcKd1WIjrh/yvL6yK6tDurYuPyCC24sIZdI/u
	9eUnY2gWTz9N/D3VsMNjiiyAMo++RFwHp1JE2G47pVGu2nQQ==
X-Received: by 2002:a05:622a:1388:b0:516:e031:9343 with SMTP id d75a77b69052e-51795a829e6mr195423301cf.11.1780899135482;
        Sun, 07 Jun 2026 23:12:15 -0700 (PDT)
X-Received: by 2002:a05:622a:1388:b0:516:e031:9343 with SMTP id d75a77b69052e-51795a829e6mr195423001cf.11.1780899135009;
        Sun, 07 Jun 2026 23:12:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2be2absm43191071fa.23.2026.06.07.23.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:12:13 -0700 (PDT)
Date: Mon, 8 Jun 2026 09:12:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, dri-devel@lists.freedesktop.org,
        neil.armstrong@linaro.org
Subject: Re: [PATCH v4 6/8] drm/msm: dp: handle the IRQ_HPD events reported
 by USB-C
Message-ID: <w34p2gevaxzr7do4gxzgqbbrtadnemkzrafcuroeytd2dphrrh@qgw5ld4rpylf>
References: <20260608-hpd-irq-events-v4-6-30b62b335487@oss.qualcomm.com>
 <20260607214829.B05091F00893@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260607214829.B05091F00893@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: uipSBGmDB-VrhIOWb4QhsL01NGHdeVnu
X-Authority-Analysis: v=2.4 cv=deGwG3Xe c=1 sm=1 tr=0 ts=6a265d40 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=vviSY2pRISl9Lsm2BZEA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1NCBTYWx0ZWRfX7ksie7+N+g6c
 zhspjrZvirZkegZk107fL8Qh8ZquE+/5kMDiLZb4tTF3y2IUhojSKq89da1YXee6U0OReeTBQg1
 0FmNb+mGv8b8tULgBs8cG1u9DQkI2jeG5l7nxHzqDlQceDNcPmkPGU5DAaj5lmlxfk2/cajxtCB
 UCSNJBTT7WP2WX7WEw3B1haIPP+sk17VEyJlbeHha4rbEOncx6dsS8R3qdETOgF8syu5zgCBC5s
 Fst2x1k8065KHxuM4utO2OCsbR1wzg8pOtNA09ykZrPrVAdxql//sXgx7hD+B0/6LInYF2bA36l
 zIsFJ4NkB+sLJS+9SRNfu1HNAAzW9Pp5nteFrfuoAgQINvh/6O/ZjZtoaS0CKgS6ad7HB7gWDuP
 VCARkgcAZ/vWrUev3tiDUXJ7JzO76z7QI5h+0Ux5v4fIs4AfCO8vPDCeofgWGAkyfwEVBrUEcYj
 PljdbnncAZP77/SRfEA==
X-Proofpoint-GUID: uipSBGmDB-VrhIOWb4QhsL01NGHdeVnu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_231217_156774_5BDFA293 
X-CRM114-Status: GOOD (  12.07  )
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

On Sun, Jun 07, 2026 at 09:48:29PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [High] Initial connection and replug events are incorrectly bypassed if accompanied by an IRQ_HPD status, leaving the display disconnected.

Indeed. I'll fix it for the next revision.

-- 
With best wishes
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
