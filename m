Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FA3606A322
	for <linux-amlogic@archiver.kernel.org>; Sat, 24 Oct 2026 00:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uWbRFfpa;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=CrJaCLkU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X5PXkxML;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UE5vMAOc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jjjRpw2uRUMrim5VWn/01h1dT0pNTB+apEtQkH1loLQ=; b=uWbRFfpajMYF++02rf34ul9/CY
	mmeioV4x3qme3g01TE09AvzroT5BjKDZ32fJ95Vgf0i9sZcppzxfcXXWSpAduRqXuz2ct5qpWrtYZ
	8ml9FrfvuzeWh5kZ6yEnCfYu2r84mYbujSG00BSRLLyj1KYow4/cDXuHr+zf0LzQySqU+16giEx/e
	T8Z1QwzCzlTBMhNYz/iS9wnTFPOqzRGLPJj21IMurvWn6P0p83kBvkc5Kw7RAN7/vMSYpufn8Y9dS
	NU+XH++JwOZmtqrrHBXESmlBI+dvtBoMkLyq1YcZiKFqXEEQutVpAzu+ne7CDxxYyjZvNq8LwI2Dl
	QYlHk8Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPkF-0000000HGRH-1OrY;
	Sat, 24 Oct 2026 00:36:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPk0-0000000HGEG-0laN
	for linux-amlogic@bombadil.infradead.org;
	Sat, 24 Oct 2026 00:36:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=; b=CrJaCLkUM2DGmrDKkeYbxssV+W
	uYBrSsVB6YMl9rqhqNI+n3nwBElNMvJX7l4lBKgtq3naA2AajjzBWWFR5Em84ifpJoabUJ1p+E33+
	HqFIFO79D16+BRwUFNOwAU+EGli7szheEWfitpUoOTXsDjjfKUcRMiMyvE+l614jey9vpAHhKzFcH
	8yxcOagW5bi1GCJKEu45CguyM51x64xQe7ElcpA6EWii9MbyELcZ+nYDUZMOfakhRMo+V7nkrKxmN
	fYAxN6SX0uyK2alLhmvY8KcQsIIn7A72HVjcz2j02qgbTWTO9Sj8UKkweGVGEOfenwffpRxrpGsyg
	yFTZqjmQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPjx-0000000AvMZ-1Fk0
	for linux-amlogic@lists.infradead.org;
	Sat, 24 Oct 2026 00:36:07 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLv78E3683570
	for <linux-amlogic@lists.infradead.org>; Sat, 24 Oct 2026 00:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=; b=X5PXkxMLShfVuQpn
	RNM1czD4Xr9K5BPvqE5YMV5/fkXBKuCvX5kaFmCAc3N2KE/EOAGeT0pjYdZXlZX/
	4YbST8blcDp5A2NDlKMgOJkd4VcJZ6fwWHJwHWUXU8zRTVJqrdIM8RjHeWrhU5uP
	SfOj/cTcskr9F+dxhn7Pf7EAKjRjMmkRo1x2CU2ILKMvwptPdA2kn8Xy7hQ0dnxN
	lZbDddUSi7av9O8I6waKW5oZZA861JtZbsDQrJqS6lv+G87HkfOEZ1meQvOSAb7j
	AmbSPuhLRvG5atn5Qaj0U8mv+QzkdHMce5ud9yuUevdmMhtU8wQEMHgIQxa66Wbn
	Z0+ibA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas6sg6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Sat, 24 Oct 2026 00:36:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844e383so258139285a.1
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Oct 2026 17:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802163; x=1793406963; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
        b=UE5vMAOczpm9E7t5qSirBZ9RcsvMoRvfs4Q4CodNrsZU/GLVu83rOcLYAZQOZjxdwQ
         HIzZWXNZXpDHF6nwvswws1m7MRxxHmi3CmY+PKgSbS5/Nq8kEYE7nTQcO0Cjk/ei4EAw
         IVsDwG+UJizibdwfTjmKXaHBgz88shSMoPfmKGy9tmgZrZJ8bg1IjOxl1RDiHybX+tJ+
         9jwAuSgzhwzn3lUdoPNMcbbATJWCZelVQ0mR5ephWMnmdl71csASlfWJuFyLUtLyMvOy
         zfhfovAoL1+DEms1b1DeP57boZzXxlKg/nD40ufIm2ci2VPlRvIhaGvhIrX6vky0ZfA6
         C5dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802163; x=1793406963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
        b=L4LI0xJfXn2nnj3UIXYU5G0YZ7CuOlxj8n8Vvr62uG4fJHCybyIRVJQ21XMFYDqOSB
         LnSeDavBYhMuvYOBfIsiO+Bne1oA1a/+afmxPR//CI5fgszEriPaYXtS/gP4sI4Borhu
         mjmfLi5qThR/JdbjIcPBYGHiM3LurYWE3Ea/ZzNHYUssp3aVWw57MwPx8R6/POMXQrZ4
         gKkqyoYwRxybswND0gCSZoKVCYCJQfC8wHuptbRK0Asto13h1O9zjVajTxCVWvxyZoYu
         cc/oNRO3RR3OLCxXD8Tk0MAsFdC/SPURxgjUXMcbGqkbvIu8cuQ8IHCdaYrC2YTEMz2x
         ln0w==
X-Forwarded-Encrypted: i=1; AKwUvBwFWSkwfufojHZ1Lx5l7KOe58c4AXt41mZyLdMp//njaWH7T/DLDIyI3WxMuPzvc4WclKXGiOElL/w8ly5o@lists.infradead.org
X-Gm-Message-State: AFq9FYLQcK5zNIRZH1cqV/acTo7sKKsOSP1A1Wi/GYxWyzH4aZPg47re
	kotutpohQm/LxmHES7jbT2nzEhiQtwCCFzku8mFV0cZlc/SeW84UKaAhaYfBcwlYA69V/h8S28i
	9albnDvlt6H7zun+pXcCL/yZ6YTKrpF7R+/AlV82ZWIz+oHr9aReZJjqdc79JJ4ZwZjjxr27v3A
	==
X-Gm-Gg: AYBFou0W7oKePi/+4wv/3QP8hPhHDR0l6iHNOia8ocIIxCUPe5XWVJkWaO+ifZzljLA
	Zvu2C5Rrf1NgIkyJiER9ArPcd+0BUudMPFbs3mH6+2HQwb9fpPjMUxQbMHGTR+jQtA+YXm75+/h
	lEqt/4aTP1mG1rwkSSRD3jODYsZzibfFZ1IQmB2JRmXv/dWxYmELiS9M/ik12qAg/PMxtAG1voI
	xqz2BjIcOYunW9UE3TmN7zxo51aRfXpNp9wAW12Cd+mdWKNMZrPAmz5tJg3hkk/dR0Kvxi7vMnf
	LfhTjT3ydwJeZmDb7fHqBKu8hASg6UfiD3qCA60tNSpAepkvuWfewgyd62ccDUFkhdMz6Zs74RG
	R8HX32GvBxCJQ0NY26QL92Y4/LrUuPZ5KoKxw8sI2677pJjSUjZOh9wvwg4qfpk6215gmPXThJ3
	9csj0aovDzFT4l
X-Received: by 2002:a05:620a:31a1:b0:93f:1e3c:4a3d with SMTP id af79cd13be357-940ef956c10mr109940685a.46.1792802163184;
        Fri, 23 Oct 2026 17:36:03 -0700 (PDT)
X-Received: by 2002:a05:620a:31a1:b0:93f:1e3c:4a3d with SMTP id af79cd13be357-940ef956c10mr109934285a.46.1792802162668;
        Fri, 23 Oct 2026 17:36:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:36:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:22 +0300
Subject: [PATCH v8 6/9] drm/msm/dp: don't take extra references on multiple
 plug events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261024-hpd-irq-events-v8-6-6ee949e7a384@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=903;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=y6Q7UwG8h2RY53M7Uj/FBYAupAUz6hR7YBAr9z2d9v0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2/1SgHKkiJWw2Q/RmkX21UPsNJT6d9sWxsWfN
 lGk1cDfUG2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatv9UgAKCRCLPIo+Aiko
 1abQCACx1C1gEiCjh/JA22nJY5oMv2sH85fmApV29ur3ZJHiuL544WoNV+08rQuI+2s1l7u0BfB
 pSH3B3HC6A7rQlqhDPIA2ruMLYYYjriz6QSC6lw/1JonyaVTNNm8xvMZ/VOSDO60jZpXprD143V
 EqlmhijNpaAWTY4Echcgkl1UjRZvVlWDS+tyd+BfNjvz5PIPoLfUR50gMU3moSgcfAV4eIbHFr3
 LQcvtn/0yLkoo4o5hAATZZOchduLmibkjvq2qCB7lkAlkqZMg6CummmnUdc3zBbEqljwccC3sPw
 wbS9DfpRqegDI381OagL0f5T4ASlv7jgolH3vPOzjKcXhbWk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX4iowoyPA5gHw
 V1NE2MQ4UEmue4YhQIdh1xbUD/pXnl76C4jU4yn8SlM4KRKfINw/XaP2UKn9j+od2ghkh7ku1Ys
 JcGHBxAKbVeJG8ZXHlzTIstcNlBa9BPR8csp7f+5w0yhE2A7nxCad5ybl/LMJwSksOjIrC13GCi
 JinUuZOHHVuAAC8Uhig+oxIYaj/3TANomNzPQP6HFznbq+8sU5npVczNnEW0V+mKl5LOPwCmJFP
 1h/+8xFdwvXpyrxVUnzyuHk3fxgJ7+kTHAYW0g7ys7REFj3UaoDhkgc4m8b0uJb1uoHp+V6wXk4
 5b9YfHlAjqfZk7Y82XSBWyPqo+izAayHIi0siA4mxalQNs8ac1TJHXnJL8/Z7ehp8KWMVWUhAwD
 6sceGfvJjRbitVuz3AlROiry+V+nu5xldD8LFYrRQ+GG+V5A2s+HssdXHKZl8NHK9en9e4OVWXT
 IO/48CTP18MG4hYR0rg==
X-Authority-Analysis: v=2.4 cv=DK0acCNb c=1 sm=1 tr=0 ts=6adbfd73 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=2dNI1gAXBh0p5IwnqgcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: mygW1OYHqq53aj3SHDovevDgHnJdMKy9
X-Proofpoint-ORIG-GUID: mygW1OYHqq53aj3SHDovevDgHnJdMKy9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX/cNIHtennQdz
 TKL4McyVcMYL9vTTLYduiRpuYIjdF+R3ap4SPPFIhv48cIoFozz+60LitdYzbIOmG0j2P0jXIgH
 Pme7Pru/KAsu80QvtEf2AGpu5Wwlq1Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_013605_561299_8CACAC74 
X-CRM114-Status: GOOD (  12.98  )
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

The upper layers might signal multiple sequential HPD plug events. Don't
take extra references and skip all further HPD plug events until we
receive the unplug event.

Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fa8942922b53..ce919a26fba2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -412,6 +412,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 
 	guard(mutex)(&dp->plugged_lock);
 
+	if (dp->plugged)
+		return 0;
+
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
