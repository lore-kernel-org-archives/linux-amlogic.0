Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED00E606A31E
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Oct 2026 00:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e3qftLkG;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=gIznYCzz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J+YPz7wc;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BcmLruQG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ICisXo/KvkTUGbKTpoftKGmIM5jc18otTqMrIT9SecA=; b=e3qftLkGlggN7Zo9AIZPU8edHm
	NqYDlqtzNawyTbZEN4sbTQFP7AARwILa5Jj9pd36vlmrDDm5RkRvMXHeWwJLumgYC9jRthNuDHcUY
	xSZ1cVXTuZsdbR4WjiEADtzgCipSuG6TKF4mZPngbnrUBivlID1h1dKZUWQ3MNSoWfYhbQbFidY65
	BSnmOfulJzCgqdm12b1dJcevT6h8A0HUv5lMCW4CXbeJWQtT9OpA/zOt4QWWQmgHPbqmq5Fgvu3Kk
	5ySk665fMZPF3PdQ0iO2Yo/PIrkmxzqhf41UL3Y9Nw+kzF4KlPQzfKl6wjehdPWsu7rBO5LlJrqda
	FreDDV0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPkK-0000000HGW9-2Ige;
	Sat, 24 Oct 2026 00:36:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPk8-0000000HGMd-1aE5
	for linux-amlogic@bombadil.infradead.org;
	Sat, 24 Oct 2026 00:36:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=; b=gIznYCzzkDq5XLe9dPqFKPZDjB
	YbEIJGr2HZ4vINB9JsY/crLO2PE7/HB8SVAg4YMdS1wyST4NGHP8DCN18IN8KPM8Tjj0WTeg140Tp
	kU3RyiA0C2zkESpssSFF90HgWIZJmzX9UgqTxSDbGkunM2EZsvkyObZIYMpgZfReHRJXznqIl9hX4
	xPjrS0s9Y/QfdlLVuCyFZadCtuOmuW56AVwReJ0ZDO26yZ+esjZBExbKdlUrT6dIoPLBxTOCjXo6Z
	lU8wetvehIiqAf5nPmnbdlgKynkNV3IlwMTGiqy1APliuPSmuAag6Uq/jkw7l6HlZ8CEMjj5/AzwZ
	koR2p7Fg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPk1-0000000AvNN-0Nnq
	for linux-amlogic@lists.infradead.org;
	Sat, 24 Oct 2026 00:36:12 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvUeA3684536
	for <linux-amlogic@lists.infradead.org>; Sat, 24 Oct 2026 00:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=; b=J+YPz7wc/wXRkN2O
	/qWs+ZbaVilBwmcQTJyrbtXOAeMqeThtKiRXpi4A/NpM8tAXAc1U6YA24zFappTG
	bKsKyvIkjuaE1Gq6B/vMTXO/NEk0pHqrpsBKxIYGEyYk9RVRD4HIy6p0CWdtHCK6
	H2STkgeyyPB0upr3Si9ydSXMkI/dXDeh4B3IUEWh5bCCMJ58fNxx7BhZ10zn3WN1
	K1Gvsm21yU02e4FWnNrxnU0rQWO/05YbtIAhZqAwLCGHCJXdzi6c9yl+eXZJJlNE
	tr54sLbbaRhNODu2ut6tn/EVi7L4FyqYVs3/TqK8bHUMqkMVeqzgTTGMoAcTdbLf
	c7youA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas6sg71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sat, 24 Oct 2026 00:36:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ce7a85f04so287814585a.0
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2026 17:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802167; x=1793406967; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=;
        b=BcmLruQGn+3LObRj2Ooz5gW5s3ZoPMYJkgdgXxGoZCXPEFsjUXyjA1EusN+KpPD8N2
         4PuPB6xAqlDn0BC3XFPHJKbk/MvtiQo23IWuXPSnG5iatRif2trHN+/AqiA2sxwOV52W
         T31YMqkcNLfTcpHt74eKwO8k7Jh1CWcwHZ4riEnBwnfif2++TIVvLupBhPjWX1ogCPxm
         gtWWNptqo8SVWn1+tO7UaBHxI5g05tZhOXQxf9hCUMkmrwO08lL/rnLZprZwDuVzADGf
         EQbNQrc4pHCZtlQIvetRItTtj4YG0Gvg6oGdnuph4h2vJmeSJXqzE2Bvum932xyV/wzB
         tK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802167; x=1793406967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aEK+3aXppk+SulvbkA+LMtBDzo28ARemmdD/SR/wIWc=;
        b=YDvAYJm327zAx9BD7msbt81rUwXFTuDdfbLEyn5oA/j0l99489MoFgcbN1O0A+yXr9
         LINmtlPbBoOYXe0DaJJvpBPd8ok66NfxgbACcNALc/I5TUViLf9bnkMtZRaV3dXv9OGL
         eJGgC77uxor7hZIMTxSll6+PMk5+UuERqDKA0HWttFDkQJhN4LIZic1LRi1jc9hv2WM2
         qNqE9O0iOGKjyexflQP3URUpL6GOJk36U90I3UzY6SfT5uUWATwmMveva31Ke2IFmhwX
         JG9j+ojMpReDKtu3NA132K6dCe22PJE6QxwMxtobAPGuYIPgRqXVKjDrCEW7iH3SxGpx
         QE8w==
X-Forwarded-Encrypted: i=1; AKwUvBz5MDdYYaH139qQeey/PSFxm+IBxIUOaMpQ8KRBx4TzX0GOFyU1tulHdoWCnnND4nFKvhg2B8Dmsnhxwy06@lists.infradead.org
X-Gm-Message-State: AFq9FYLCkPTBGDvYqvhvJT3gZnbPQ6HZZPqHxwYrzT0HwCaQpCHaJ12V
	5yW7B0M261Bhxk3XoCmFqYFWVPVeKb4/GfbgrCZGP63AHKJZg9dsvCnLjYNerIbtClk9JM6hFYP
	fNJwrVNcscBGW99U+MfK41iPQgdAdDZvBwTjVGny/PVfzx5wwI3PSrb8mrf0hDmZNvOy7NVZDcw
	==
X-Gm-Gg: AYBFou0JpF+b/gWH1jkeNe4Jh+iUV/WUFYDH08+v3RB4RSecBgFs9T3F8WR3sKjOu8v
	woLxQs5FK9RTi1PIx6+9KPau/IHroH3WFtROSA7QKCKdzQJwT1BVfu15R7TqkB1+C+LrBObHMQs
	uaVZnMniSuGs7SQ2HYdVbs2yG6V6IP+akbU3PC9PwF8FDErBLlfWLKpYkQsCe5qY0LmjvRQRgUk
	WOUq8My19ohHiVJfoLojmbQkt4AUTVqmBl/O+3Bs0OHaSpb97ox7rwvPl10STVAo4nls4OMI8FA
	OkbRU9PXkqBEAtVSzoUR8+IvLkH0s6lmOrWAeF0fON1WJTQJn0pE5RsH43b7s1Se53j6Xu9/5Nk
	mZ98zvKZ5OybNrPvRfplmXivbd1rdo1x8CRvCqVbhp2xcnpVexzY9c9lGnxQ1JnJtzfj8I7Of4j
	JM+pdJNNEXJMD7
X-Received: by 2002:a05:620a:4408:b0:93f:5843:1055 with SMTP id af79cd13be357-940ef8fcd84mr106703885a.13.1792802166913;
        Fri, 23 Oct 2026 17:36:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:93f:5843:1055 with SMTP id af79cd13be357-940ef8fcd84mr106702085a.13.1792802166482;
        Fri, 23 Oct 2026 17:36:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:36:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:23 +0300
Subject: [PATCH v8 7/9] drm/msm/dp: handle the IRQ_HPD events reported by
 USB-C
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261024-hpd-irq-events-v8-7-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
In-Reply-To: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
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
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=VD1bcqfARXRbU99XE94wZup/nUa58ME0mMv2ZOe59d4=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGrb/VOgyI5r3WOrGPADO8HFThBlFhdMoyLUc5IOFOCCd8lmb
 YkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJq2/1TAAoJEIs8ij4CKSjVSokIAImr
 d3EvdLukc5qeDThRl7OAYBd5sCyOGRgGJL6gPmPsMCQlaqA93SbRaQdlHe/asMr+X2+Ui1YaSsV
 p8LZ23dmV2u2mnN+losDIcIObjYElFx1HQ6t5jidjTnjJ/unIFs9t1Le2OpxFbVvMMQnLGwcIhF
 jjwaHFiOj0BjokPIcjsvIS6tvO4oQVhK5OVnfj6nydXw/yPBrEPzUPmIYjC6CFMhj/XTSPvuKxP
 6JMXu/3eauaK8fpauY4Zh6nm1kkX0hdR1EAo/6ma3QdCG+B7ADcQbuwzaK25hzzFs8wb/qCqrLQ
 VUYUwhy9q+KulXT735Z2FSv+NPcOe77FBV+4mBY=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX4/h0RG8/i/cp
 pNxtm0O5w/ZZt/M67/oGgIDXbPUiNgFxOsGXBrIq7Y/KB4qNIxZv/Ah5pEnJxKUHb/CchN9b40c
 NBDtkedjknDKSwZEdc0qOPFqYokuZpxzujuUtZy3IzfG2LtUY9USMk8SGY26JZ8/SC558n03UD8
 8rzzrGaEuWAp2PMZHDSRnrgXcisfULEyipPklyLP1bY6NqNAP1uGsJ4YR9872VJjJ9IfMHMHOMM
 gUIlkhqfAf6Ea0zuo0CfTEkvR3cxq5USmVr8pteNtwONvNRadH0qP3pSaPoJkdu+1VVrmeoy3wC
 Gg9UZTjmCrOILne/Yu1Us48B0oEGPukT6fa993joLtgIVojdT8uEIlk4VrFhnzg7vSgzrQtPsxw
 /6HARIkUX2w1bYJo/Iv+w1HmuQ9ZWoTdgCNxtAJfj98Q6PCKWMOnUHoBIZu/+rPqmbcqUa3Ht84
 x6zT3jA2ovO5Ii8Mw3g==
X-Authority-Analysis: v=2.4 cv=DK0acCNb c=1 sm=1 tr=0 ts=6adbfd77 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=ecQ_yDMs5xLrPBt5tDUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: odoLtAh-LAT4naTC1bkkedcELa2LTBRc
X-Proofpoint-ORIG-GUID: odoLtAh-LAT4naTC1bkkedcELa2LTBRc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX7Rp4b3yqmPQL
 tMgjPCOvN+B+h0TDp2iLQqkFGiQoNsO+SF/ZT+HmyaP0hrL646U35bz5FSGSmcMTfFX86CLMzyo
 IPruwTwbEQlP/mSzmmno4EKW+EOvG+c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_013609_595677_55CB07D0 
X-CRM114-Status: GOOD (  14.39  )
X-Spam-Score: -0.9 (/)
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side, for example DP MST events.

Let the MSM DisplayPort driver properly track and handle IRQ_HPD
delivered over the OOB events (e.g. from the USB-C AltMode handler).

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ce919a26fba2..771c8b0744ae 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1566,11 +1566,13 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
 			msm_dp_hpd_unplug_handle(dp);
 			msm_dp_hpd_plug_handle(dp);
-		} else if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
-			msm_dp_irq_hpd_handle(dp);
 		} else {
 			msm_dp_hpd_plug_handle(dp);
 		}
+
+		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
+		    event == DRM_CONNECTOR_DP_IRQ_HPD)
+			msm_dp_irq_hpd_handle(dp);
 	} else {
 		msm_dp_hpd_unplug_handle(dp);
 	}

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
