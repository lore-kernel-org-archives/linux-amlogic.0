Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEBF606A31E
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 12:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ivitm5Nn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nb75Bhnk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kdJAf6OR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sSoD9MWEOtcERz6r/VksBWvUfTJ9sH/YeZtxvxI15pY=; b=Ivitm5Nnsdmqv9vKspKKI4mz3r
	U1csanTymGcNPBtPg7++eITH/ue6CDo74LhJiRhl6sfVR9uJaMujorTkj8Y7KI+Zz2jmWRvFEOH5o
	3Y7hyAeCp2qXloKsoSqcLlNRhbCVkM1OyP57etMJekos7p6KUFdgOT9iEutZ6DLhX7EWe2C8Hz9kl
	MSPnbWrk/cFzmX9BXt0hsraMNRVPvZY9MRHfWXcn0qimJns+q3v+KAcd3rH2C6aOcLOhgYScp9QCQ
	7DfCY7qhgPSVG0EZzJ7Ksqqe4JXMe6J96ib3Bi1T15Tx1Y5KtHzUE8DQDOKpFwK1p0Rfz9vSP0Bt8
	yq7XhVhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYDM-0000000D6r3-0pFY;
	Thu, 26 Nov 2026 12:04:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYDG-0000000D6oT-0Bcx
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 12:04:31 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVnuC633204
	for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 12:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jC5fbmrjeahgJSQY/yuWAzz2qq3dYpFpTS3cMwzVOs8=; b=Nb75BhnkD+24lshd
	TN3D1/aSnF7vHIpkHWwHrM1kKC6YkQu6oDHCxehUDM21hbKbjJyKXraJpSLvlXam
	gnP48d6B48IUH8DyGbf9NtPmsHJPfx1s+Xvo5g4i/6YSn7IKpv0RiuFj1u1B9HCJ
	nrsS14m61D4eNFRt/O9DQMyuIHBNkyiU42V3jRVb+6Xe3JU1uiB2RiZqWOkGZ5t3
	rUyoTCQJYk9dWVXIeVjI5rchYL8/hXkY9Ti0nM78XMS0H/uKHppIWpJQhPXEUnny
	GUDcDdJMJSAEmIBUWh+5vuzpXWLnzh/Y4mOkufX6bT7G9X80VxDZf+8DGg53esvd
	P3Nrtg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6gne0xs1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 12:04:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso4716148a91.1
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 04:04:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795694668; cv=none;
        d=google.com; s=arc-20260327;
        b=HMG4QKQMYgbe6NiBF+rrPEwSM9+k5AqKYcqlfBP3Jy7LKVoliQEHv1Q9YDq389uxPo
         RYQhsIUNeO78vzA1mTW+epT1Z6Mfee0TPnpmmjftwuMwWr7UMCh50UvgHTeGreFRAXH4
         zLCwUCySSbAtcclKOO/VNUlm9EMs8W/xZtelvIwS4hwXQGoiU4kCRHbhaZ7ht5ytDWdr
         zDj+XLEpaa35mRXZN8X8fxJYKDItaybod/WQOH74wuIaCf9/w85h+/BYDdypGxWOQ7eP
         UVBz/g2z4rMEqGqAffRBsTlTsAzszbrkUk6cVpRiLzu/WF+ZcyGsrOUA0EKDHdv8iJlC
         hreg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jC5fbmrjeahgJSQY/yuWAzz2qq3dYpFpTS3cMwzVOs8=;
        fh=MouJ3KC6MTuNDZDepGYEh4co5CHx1jDt3sma2zw4v9I=;
        b=ef0+sp5Tr1oilgfauW/xFdpnqvwApwqS2JuGg6jD88sMM7SPEY2qKVwI6b3XXvK36k
         w2ZNuOJKn/NY9wBNNdrTNAktGMT8OMn5ockhMap3nXLAj0Aw68gWQW5UBZeL06sonu91
         duR/HuNmOga+/Is0GbmThcGuV08YhAqMIn57I3NphhtZepuzg+Ebo8KGoHkUwkezvOCv
         5w1UpMcHPAe/OXKT7+GK2y8E9JGw3Sie7Ma+fN4PPXv5aZrDGOyO5dVY9YAwBXTBy2Pi
         qGnLoRGF+/bRFsR3eYS1LdRun0bHfQr5In+0JgEB5cFAzbRTa2MoeWekWQJl4bnP0wle
         rTHg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795694668; x=1796299468; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jC5fbmrjeahgJSQY/yuWAzz2qq3dYpFpTS3cMwzVOs8=;
        b=kdJAf6OR6M2rmBiR7Y1uTdyCJfj8MXjluvO1AOpIkkL1oTRS3a9FSLSDjselxeOqwF
         VAKFqyi6LOWOC6iTzmuaAiDnTQ9WkvTb9JJKRA9UqPb5x9KmjsWcDS3kv93cLEOAs2OA
         WTdnELS4ntJ1PfySaXTdzZTOKrCQ/xnxup2sfxuW2IhMBP/+O0UHzuPsYOEPG21lWt7R
         2rokgcVtkUoHaNy/7TZoztiecd5iKmOC4z5YMnxb9mRDVEypi1oKYHAOIMkGAy1ftAqi
         7/kQ9677AmDLggenLUK9C4YP0sN+wIgSoI6M3JGdwUG2Qcxyht6P4OGcj9ScyrU0PUxb
         yyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795694668; x=1796299468;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jC5fbmrjeahgJSQY/yuWAzz2qq3dYpFpTS3cMwzVOs8=;
        b=Ch+1qiMl3/f7pvh0RFoQu+rRGeqJCtGvabslWjPGDaDaPNXeSan8N9Q0P3HdqqGd7n
         5c6O7v0jb956gDTOG8UJ1u5oRAhG9iDiVw04Byqn42X5dk79GM+ZwDInQkHeXuQNy4vj
         RPvmCJuR+YBW2biVCdEoiuw8jCwRgilwGIFGIGRkMQgBUOPsbwdXc68jDOZB/KOZPbjC
         +bUY7Lv86q7sCAO8A8hvMhQgb2dCxBxJu03D5gbCL+SQ1FCUdF9s9lVku0VX5v3rCleQ
         R2qdBW79G55qZgT9q5XgkOdnMlfgHbyeWNQh+NF+GvcnYg7B1e+FzuGJx0PBOsqhKjc0
         OF/w==
X-Forwarded-Encrypted: i=1; AL+hErF/fAFY9Ry0KPVPd0OyjMef3HCYZA7EI2IbYadz+sQMdCheMJubHB+YRnYltD8Oyysz3jNok1RuUtpEEIRg@lists.infradead.org
X-Gm-Message-State: APuU4Z94R5UoPdZLiVA1QVvBBNNq07CpzrqrL84HAKAWX2mtSf/1swvQ
	HDrXgtaZRclzZGpfRJbfZ/lx/LhvfV0mulnOJIetb4l09vky3S9/0TNR6tIogsdfqxYAWSmVYOg
	akpnCQlvYudxd26RrIynoraktDww7U2BQE/bGj6VU9Mw2cW+OO7uGj7r6gNbt4ndbPXH7zfbOMU
	JCA43HxZMAqH9xCxvsy7p73ILpiboSGJ5PosdvocsYLe+OS1Gk
X-Gm-Gg: AZFdTZc+E+1NnwRhLHNN6sbJSGqfOGuZuXv0KSMVdrZMYQtaKDgo6wimViHZNrI4zWX
	iFxMaK6OCnpxukhs4ty68gS3LbqmClxvRIUmDDMsi9ZyDNgIzumwdxt/q9BiSPqkinzIHM9oTWA
	P38O/G8LafiunPA4IAR0lMyHRKturwRi45GMRvpmbrF48wB3qFjttB3/N1Qg==
X-Received: by 2002:a17:90b:2f8f:b0:3b0:9bfa:72b1 with SMTP id 98e67ed59e1d1-3b41c942d13mr20572890a91.49.1795694667859;
        Thu, 26 Nov 2026 04:04:27 -0800 (PST)
X-Received: by 2002:a17:90b:2f8f:b0:3b0:9bfa:72b1 with SMTP id
 98e67ed59e1d1-3b41c942d13mr20572850a91.49.1795694667362; Thu, 26 Nov 2026
 04:04:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123-meson-drm-create-hdmitx-phy-v4-0-3fb94f5534ca@aliel.fr> <20261123-meson-drm-create-hdmitx-phy-v4-6-3fb94f5534ca@aliel.fr>
In-Reply-To: <20261123-meson-drm-create-hdmitx-phy-v4-6-3fb94f5534ca@aliel.fr>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 13:04:16 +0100
X-Gm-Features: Aa3M54pnB9NhEO6Ylxt6lEzs1c2Wp_th_l5IvL7KXYy5McWsZMXy_VANhdE7X6Q
Message-ID: <CAPx+jO_K+sEwm4CCBUdYz0FzJuYNhKizy4VDpQ=Ystm1aPxbZg@mail.gmail.com>
Subject: Re: [PATCH v4 06/11] pmdomain: amlogic: meson-ee-pwrc: power up
 memories for boot-enabled domains
To: linux-kernel-dev@aliel.fr
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Ulf Hansson <ulfh@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
        linux-pm@vger.kernel.org
X-Authority-Analysis: v=2.4 cv=XpVvqlF9 c=1 sm=1 tr=0 ts=6b08204c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=zH7TnIvAWWhA1n-d4cAA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NiBTYWx0ZWRfX2It2lVmBkVMh
 15m1OAmCmtLGDQn4Nm3SMwes3YixPNYP+N/rBmvGse5352ZY4vKtBMII6ON7GAQ/47t93oiqK1/
 wmTN1zSajyOzVFGPtL5vTh6umsZrtW3egiaoxUTeFOB7snnk74rLVb7clulF8iJAXkei3IZNXwl
 7DyW0n0AGAqLw8lkUFeOM8pCKq7zoQM114Brpj1VrxEw/dz4p+forLlCCHJgRCoGRotu4JIijyX
 FYO0XQvqmy4yeUM8TTQxuYDNBUEEquyAHl8IV6mhzY2Jqj7mYVqL0DEpO8sYukQYWzcoBWa/53A
 3b3wMrrVVELu7IBjn3ifFMIER43zwwa4PPBS7qrAdPUNaO/vrp8UWcD9Sx6gQQYHgNm3GkQWwix
 +D9GOQiCOvCrzNwQGEzqtoSJCy7/u6zMFUDKAgeDmZo7HV+6OZViATWlht0Vq3ebcOtLOnZ7jGr
 BVayBvtTe4BzpRRp9rA==
X-Proofpoint-GUID: Xm8A4KkExwGC8RMO16wb-okUQmQXv9oc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NiBTYWx0ZWRfX/gTvzGsTkztx
 SD+vJBrEU5wY29OJ6aMnHfnjmyqdbbqEhczUw/NqYJbt4k087+iLBdUMSVmgpF3VrAnMWPbpvOW
 ejnOE3PIQn3AG/1XZKLCgu896P2prmc=
X-Proofpoint-ORIG-GUID: Xm8A4KkExwGC8RMO16wb-okUQmQXv9oc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_040430_196032_67A3FE1D 
X-CRM114-Status: GOOD (  27.79  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBOb3YgMjMsIDIwMjYgYXQgODozOOKAr1BNIFJvbmFsZCBDbGF2ZWF1IHZpYSBCNCBS
ZWxheQo8ZGV2bnVsbCtsaW51eC1rZXJuZWwtZGV2LmFsaWVsLmZyQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+Cj4gRnJvbTogUm9uYWxkIENsYXZlYXUgPGxpbnV4LWtlcm5lbC1kZXZAYWxpZWwuZnI+Cj4K
PiBXaGVuIGEgcG93ZXIgZG9tYWluIGlzIGZvdW5kIGFscmVhZHkgcG93ZXJlZCBvbiBhdCBwcm9i
ZSB0aW1lICh0eXBpY2FsbHkKPiB0aGUgVlBVIGRvbWFpbiBsZWZ0IGVuYWJsZWQgYnkgdGhlIGJv
b3Rsb2FkZXIpLCB0aGUgZHJpdmVyIHJlZ2lzdGVycyB0aGUKPiBnZW5wZCBpbiB0aGUgT04gc3Rh
dGUgd2l0aCBHRU5QRF9GTEFHX0FMV0FZU19PTiBhbmQgbmV2ZXIgY2FsbHMKPiBtZXNvbl9lZV9w
d3JjX29uKCkuIEFzIGEgcmVzdWx0LCB0aGUgbWVtb3J5IHBvd2VyLWRvd24gYml0cyBvZiB0aGUg
ZG9tYWluCj4gYXJlIG5vdCB0b3VjaGVkLgo+Cj4gcHdyY19lZV9pc19wb3dlcmVkX29mZigpIG9u
bHkgY2hlY2tzIHRoZSB0b3AtbGV2ZWwgc2xlZXAgYml0LCBzbyBhCj4gYm9vdGxvYWRlciB0aGF0
IGVuYWJsZWQgdGhlIFZQVSB3aXRob3V0IHdha2luZyBldmVyeSBtZW1vcnkgYmxvY2sKPiBsZWF2
ZXMgdGhvc2UgbWVtb3JpZXMgcG93ZXJlZCBkb3duLCBhbmQgbm90aGluZyBpbiB0aGUgZ2VucGQg
ZnJhbWV3b3JrCj4gd2lsbCB3YWtlIHRoZW0gc2luY2UgcG1fcnVudGltZV9yZXN1bWVfYW5kX2dl
dCgpIGlzIGEgbm8tb3AgZm9yIGFuCj4gYWx3YXlzLW9uIGRvbWFpbi4KPgo+IFRoaXMgaXMgYSBw
cmVwYXJhdG9yeSBjaGFuZ2U6IGEgZm9sbG93aW5nIHBhdGNoIGRyb3BzIHRoZSBleHBsaWNpdAo+
IEhISV9NRU1fUERfUkVHMCB3cml0ZSBmcm9tIHRoZSBtZXNvbl9kd19oZG1pIGRyaXZlciwgd2hp
Y2ggcmVsaWVzIG9uIHRoZQo+IHBvd2VyIGRvbWFpbiB0byBwb3dlciB0aGUgSERNSVRYIG1lbW9y
eS4KCkEgcXVlc3Rpb24sIGlzIHRoZSB0YXJnZXQgdG8gZHJvcCB0aGUgR0VOUERfRkxBR19BTFdB
WVNfT04gYml0IGZvcgp0aGVzZSBQTSBkb21haW5zLCBvbmNlIHRoZSBjb25zdW1lciBkcml2ZXJz
IGhhdmUgcmVjZWl2ZWQgcHJvcGVyCnN1cHBvcnQgZm9yIHJ1bnRpbWUgUE0/CgpJbiBhbnkgY2Fz
ZSwgdGhpcyBsb29rcyBnb29kIHRvIG1lISBEbyB5b3Ugd2FudCBtZSB0byBhcHBseSB0aGlzIHZp
YQpteSBwbWRvbWFpbiB0cmVlPwoKS2luZCByZWdhcmRzClVmZmUKCj4KPiBTaWduZWQtb2ZmLWJ5
OiBSb25hbGQgQ2xhdmVhdSA8bGludXgta2VybmVsLWRldkBhbGllbC5mcj4KPiAtLS0KPiAgZHJp
dmVycy9wbWRvbWFpbi9hbWxvZ2ljL21lc29uLWVlLXB3cmMuYyB8IDE5ICsrKysrKysrKysrKysr
LS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbWRvbWFpbi9hbWxvZ2ljL21lc29uLWVlLXB3cmMu
YyBiL2RyaXZlcnMvcG1kb21haW4vYW1sb2dpYy9tZXNvbi1lZS1wd3JjLmMKPiBpbmRleCAzMzhm
NzBkNzdiZjAuLmIzYWU1Y2Q3YmVhOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BtZG9tYWluL2Ft
bG9naWMvbWVzb24tZWUtcHdyYy5jCj4gKysrIGIvZHJpdmVycy9wbWRvbWFpbi9hbWxvZ2ljL21l
c29uLWVlLXB3cmMuYwo+IEBAIC0zOTIsMTEgKzM5MiwyMSBAQCBzdGF0aWMgaW50IG1lc29uX2Vl
X3B3cmNfb2ZmKHN0cnVjdCBnZW5lcmljX3BtX2RvbWFpbiAqZG9tYWluKQo+ICAgICAgICAgcmV0
dXJuIDA7Cj4gIH0KPgo+ICtzdGF0aWMgdm9pZCBtZXNvbl9lZV9wd3JjX21lbV9wb3dlcl91cChz
dHJ1Y3QgbWVzb25fZWVfcHdyY19kb21haW4gKmRvbSkKPiArewo+ICsgICAgICAgaW50IGk7Cj4g
Kwo+ICsgICAgICAgZm9yIChpID0gMDsgaSA8IGRvbS0+ZGVzYy5tZW1fcGRfY291bnQ7IGkrKykK
PiArICAgICAgICAgICAgICAgcmVnbWFwX3VwZGF0ZV9iaXRzKGRvbS0+cHdyYy0+cmVnbWFwX2ho
aSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRvbS0+ZGVzYy5tZW1fcGRb
aV0ucmVnLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZG9tLT5kZXNjLm1l
bV9wZFtpXS5tYXNrLCAwKTsKPiArfQo+ICsKPiAgc3RhdGljIGludCBtZXNvbl9lZV9wd3JjX29u
KHN0cnVjdCBnZW5lcmljX3BtX2RvbWFpbiAqZG9tYWluKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3Qg
bWVzb25fZWVfcHdyY19kb21haW4gKnB3cmNfZG9tYWluID0KPiAgICAgICAgICAgICAgICAgY29u
dGFpbmVyX29mKGRvbWFpbiwgc3RydWN0IG1lc29uX2VlX3B3cmNfZG9tYWluLCBiYXNlKTsKPiAt
ICAgICAgIGludCBpLCByZXQ7Cj4gKyAgICAgICBpbnQgcmV0Owo+Cj4gICAgICAgICBpZiAocHdy
Y19kb21haW4tPmRlc2MudG9wX3BkKQo+ICAgICAgICAgICAgICAgICByZWdtYXBfdXBkYXRlX2Jp
dHMocHdyY19kb21haW4tPnB3cmMtPnJlZ21hcF9hbywKPiBAQCAtNDA0LDEwICs0MTQsNyBAQCBz
dGF0aWMgaW50IG1lc29uX2VlX3B3cmNfb24oc3RydWN0IGdlbmVyaWNfcG1fZG9tYWluICpkb21h
aW4pCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwd3JjX2RvbWFpbi0+ZGVz
Yy50b3BfcGQtPnNsZWVwX21hc2ssIDApOwo+ICAgICAgICAgdWRlbGF5KDIwKTsKPgo+IC0gICAg
ICAgZm9yIChpID0gMCA7IGkgPCBwd3JjX2RvbWFpbi0+ZGVzYy5tZW1fcGRfY291bnQgOyArK2kp
Cj4gLSAgICAgICAgICAgICAgIHJlZ21hcF91cGRhdGVfYml0cyhwd3JjX2RvbWFpbi0+cHdyYy0+
cmVnbWFwX2hoaSwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHB3cmNfZG9t
YWluLT5kZXNjLm1lbV9wZFtpXS5yZWcsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwd3JjX2RvbWFpbi0+ZGVzYy5tZW1fcGRbaV0ubWFzaywgMCk7Cj4gKyAgICAgICBtZXNv
bl9lZV9wd3JjX21lbV9wb3dlcl91cChwd3JjX2RvbWFpbik7Cj4KPiAgICAgICAgIHVkZWxheSgy
MCk7Cj4KPiBAQCAtNDc4LDYgKzQ4NSw4IEBAIHN0YXRpYyBpbnQgbWVzb25fZWVfcHdyY19pbml0
X2RvbWFpbihzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAo+ICAgICAgICAgICAqIHByZXBh
cmUvZW5hYmxlIGNvdW50ZXJzIHdvbid0IGJlIGluIHN5bmMuCj4gICAgICAgICAgICovCj4gICAg
ICAgICBpZiAoZG9tLT5udW1fY2xrcyAmJiBkb20tPmRlc2MuaXNfcG93ZXJlZF9vZmYgJiYgIWRv
bS0+ZGVzYy5pc19wb3dlcmVkX29mZihkb20pKSB7Cj4gKyAgICAgICAgICAgICAgIG1lc29uX2Vl
X3B3cmNfbWVtX3Bvd2VyX3VwKGRvbSk7Cj4gKwo+ICAgICAgICAgICAgICAgICByZXQgPSBjbGtf
YnVsa19wcmVwYXJlX2VuYWJsZShkb20tPm51bV9jbGtzLCBkb20tPmNsa3MpOwo+ICAgICAgICAg
ICAgICAgICBpZiAocmV0KQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4K
PiAtLQo+IDIuNTYuMQo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
