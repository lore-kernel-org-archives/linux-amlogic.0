Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A3FC79FA7
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jan 2026 17:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F4DiOpy+jAelPvKLM2FpHcKRJPbfG2+4glHvRx8SNbM=; b=eLSRij6u2K8s5C
	quQSX5aiJujmlfrnHUpeCXrxIyCjGKzvL3jGA44tRsGInXa0j8KHVuqLo3F61k7vQAv4AaJAIcaXi
	XDFPSRFzrbx4J0cUzZf3zlKwzEaC47dVMMuBz7Hu1xueoM/stsx/o2YwQt2uSb8jtRUczOFvqjQ7t
	PVBfqj6T6vVzNd1CWSaddFxQzgkpASOiFB7NFDXAdygaLU58FsQ/CfY+o7Ln5Ts7SiqeEh9mPnn3A
	5fnHcqgRyX90eW1+TNyNKTLv0PsZRYEjngUMNCXyaCyLXJ+ago6z4ppk+OXdn0ViKyUxtLhIPVbcZ
	CrJthwUWscxynUwytUfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoBg-0000000Bnqj-03O4;
	Mon, 05 Jan 2026 17:16:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoBZ-0000000BnpK-1EDr
	for linux-amlogic@lists.infradead.org;
	Mon, 05 Jan 2026 17:16:11 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058wiPx594513
	for <linux-amlogic@lists.infradead.org>; Mon, 5 Jan 2026 17:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BP6Gu/c4u72ZuJtLgtoBCZcMdP8EzVQc6SErXMu+NVM=; b=iJK2TIcElu/UfXQV
	UvzgwnNdTKPmjV+ldOkt+wmncU7M/+LJK8zj7oxg0lQnKO9M3nVatd5QseCCMdlm
	v6Gf9MfKK1QWOptn1ZfV4OUGZGA2OawuLhP1qZo1TY9E493FDAbuSi8QlWI7eVFr
	0nd6Ie6hremkkOfX5HjfV8L80MUEVI2cu/4akS8xssybFVCiurZ2NnXhfUVhV4cs
	jEyavDC65WsZZdtzEGDX/Xw0oQcuXrHVEgEzUIu8UWAEdUn0jX7Y/Vmk7z5v3GXM
	6M1Nk/2oSjIfJIH2QVS+1xTieirzDgWkStxqNKs36epIh5mF/T4c2inJeobU0BMo
	Od8Z8Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bga8phbas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Mon, 05 Jan 2026 17:16:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f2b45ecffso1233675ad.2
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Jan 2026 09:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767633364; x=1768238164; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BP6Gu/c4u72ZuJtLgtoBCZcMdP8EzVQc6SErXMu+NVM=;
        b=FdHLHc8Yr5fBGvB9ZKDuOsdJZpWDKgf0hfO/KZPUC3ou3EpO1BQiCzH3I0lciqS6GE
         zatLpUxHyRZpG8CZ5BNCgbfCQfJlk+cvAspXZkCVAQTYULh4MS6ZX/oneT/MXg4JzS+j
         kl0K+Yl0Uhm/5YOhXu0hIccwP2OKGLdomroBRKIcBRCnTsmkiIOvBMmvRxi+cieTIIHW
         SO9sq6IBXRAr8hPhECYxz55bL8eNUChnCkiu7rCjmjvChttpynT/Qt2wYNeFEhWN6ba+
         2cPpjt0xixdgaPWr89vi2Kshc6udpLEYTnZH3aWKcQKElN2Rtlw9kl/WSDmJX+kWqGCq
         yUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767633364; x=1768238164;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BP6Gu/c4u72ZuJtLgtoBCZcMdP8EzVQc6SErXMu+NVM=;
        b=cK3rUoYIMmIMQJlihKvwXmeyccf6qzS4lWhRF7GTKBoN1J3deUzsRw7sfaAO3Wny86
         gS9MqM0Rr7/YVciaGMB3cScLQ6O+NW+36t3k5B2Uz3SsDglQCqhijq++4Y/ESbAUocc7
         3xPrm58PzqlAzqFk0Q9CCyyjb8Rzf+l4yFZzaweFO6MdheoGkLCMRRp0kQsDaRgMldcu
         /ANucn4rXx0bkhJKdxv0Qu9X/lGaHV/J3Sg6BBLemC2GCTIG/DZV6icPVibG/4BnCa5R
         UrLODzeSPOSqLiQOKvUPzN9V3KZOXOvG9LRo9NWzoiqSGvkeXQ8wZ2gp4l3a1/2v3EI7
         8FXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZEeLzeSI3BnNGmXWl2jl/CiHuJCxUMwg4Hc3zdPRaLLKwUE17AquIjMMMenaFFTPPbnzbTeNFT5Gr4QRr@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8i7aLf8ylHc+7aVFrpsWoOVzQ/Ukzd51v+NxMaM5HQMw09f3d
	awWnngPg9HtwJ5qgb6HhrjX3P6UnpbWxRHfHiFL7bsXZ0IttAtMpeKtDsuVBpUCx8+a3MA22DoQ
	SOLyJNcWV7m8zKkfGCUCsp0PRTiuf8rshDG5X/il6NbLfGTDNtm+MP0hOwXqjeMuDD6ifaj71OA
	==
X-Gm-Gg: AY/fxX6aMRSjnlTDkwjq5dpS7tS1Jy7CsnhkVJjUtARW/gEBEI2YQRwKD6HAIL9yaT3
	W7kCILsPwAGuPqNuuiDYlnm7qOrCtxXyBRnAemdThBB2egW0oYKNkRY2I/KflQbSi1mzNETsiq7
	V6QNF7K+ZvnfsokG+enLjYPwgaJUGkLbcCKk8xUxli9Qe6CKXsAhMM7tgbv1H2sORSAkR7jUH2l
	G2R4+dETFix48MHUPyL6lSlDH/M8sg+gEgFpcjutCiDp+r9fJfaI/Pr8KvpHnJLYVnyeXF9aQjv
	iqGUXFFnQmUMa+64RTL7upz/52qMN5ZirqK3U64xWE5qEUIhJ6h3Nce9fIRKJNTJJ8vtaNuj4VX
	oBDqOV+t5S3H+1qu6bEmtg6L0AA==
X-Received: by 2002:a05:6a20:3c8e:b0:371:53a7:a4ba with SMTP id adf61e73a8af0-389822fca65mr45917637.30.1767633363793;
        Mon, 05 Jan 2026 09:16:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDb3ibB9yyf+XjsFBKFvP7NjPBf6cbuRzUcRVAfkOINXdA704jnRwHCauACbYKxkz5R4nWrA==
X-Received: by 2002:a05:6a20:3c8e:b0:371:53a7:a4ba with SMTP id adf61e73a8af0-389822fca65mr45883637.30.1767633363170;
        Mon, 05 Jan 2026 09:16:03 -0800 (PST)
Received: from work ([120.56.194.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4bfca6fbccsm199197a12.3.2026.01.05.09.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 09:16:02 -0800 (PST)
Date: Mon, 5 Jan 2026 22:45:56 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Bjorn Helgaas <helgaas@kernel.org>
Cc: Yue Wang <yue.wang@amlogic.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Linnaea Lavia <linnaea-von-lavia@live.com>,
        FUKAUMI Naoki <naoki@radxa.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
        stable@vger.kernel.org, Ricardo Pardini <ricardo@pardini.net>
Subject: Re: [PATCH] PCI: meson: Remove meson_pcie_link_up() timeout,
 message, speed check
Message-ID: <2veit3krpnauq67smexshnknbahup4yuckjgd6bxqisfqswkqe@dbhcgpiaajga>
References: <20251103221930.1831376-1-helgaas@kernel.org>
 <176603796183.17581.9416209133990924154.b4-ty@kernel.org>
 <CAFBinCAPpiq=M00ZQXAB4Pu2Myjo8gpXC7DByKkGN6Z_Ahqafg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCAPpiq=M00ZQXAB4Pu2Myjo8gpXC7DByKkGN6Z_Ahqafg@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDE1MCBTYWx0ZWRfX8XUU0L8EmZ7C
 CX2k2JgS9XmTzW0OT01UjqLw14mZ/WA9OpDLLx/dh9VSJS3WMKD2I0uF7aIhtz1EivlOxZLqhLN
 3kbdNLyc2+7ObtqJ/ALu4mjXg0lTnnDZ1bAt+6d420AinedGxEm/JQfjiWoiq6H5gUI5Io6+Da/
 MV+8OZtYTKejae0SVPyKFsQN/VVWaFh9nJ5T2CjXKjRdUlTHqJ1E0LaRV7l/duFWF885mYYK01B
 Y37REeHZueZyPR9S6MikQApgpvXXy2XhyirAFaiBXUp1SSnI9dNPnKDZsW5ssV9gvdyo1RCNqwT
 hlBk3TnGmmgQ7Elg60MWhl+aKO+h36PGlJDPu356cqMhq6/b+4OGPtN5BV5nmj5pbE0JmNuTaAT
 a4GM2ou9N0/vXbxepb/8xpoFnW2gSXD6wn3U0T534HRUsKHS0jLFR97V72SYnX7vYp3NTBaQ9y7
 8Ezn/zX+OWAHrUC4KOw==
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=695bf1d4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=3dEILRYKsVIWdVk4w2Qziw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6FUes5m74a-6EvCHSkUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: JA3dx5o-0dqmXTAPI7v88DT4Nlp1tsxy
X-Proofpoint-GUID: JA3dx5o-0dqmXTAPI7v88DT4Nlp1tsxy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_091608_648435_7670B4D7 
X-CRM114-Status: GOOD (  20.98  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBKYW4gMDUsIDIwMjYgYXQgMDU6NDk6MDBQTSArMDEwMCwgTWFydGluIEJsdW1lbnN0
aW5nbCB3cm90ZToKPiBIaSBNYW5pLAo+IAo+IE9uIFRodSwgRGVjIDE4LCAyMDI1IGF0IDc6MDbi
gK9BTSBNYW5pdmFubmFuIFNhZGhhc2l2YW0KPiA8bWFuaXZhbm5hbi5zYWRoYXNpdmFtQG9zcy5x
dWFsY29tbS5jb20+IHdyb3RlOgo+ID4KPiA+Cj4gPiBPbiBNb24sIDAzIE5vdiAyMDI1IDE2OjE5
OjI2IC0wNjAwLCBCam9ybiBIZWxnYWFzIHdyb3RlOgo+ID4gPiBQcmV2aW91c2x5IG1lc29uX3Bj
aWVfbGlua191cCgpIG9ubHkgcmV0dXJuZWQgdHJ1ZSBpZiB0aGUgbGluayB3YXMgaW4gdGhlCj4g
PiA+IEwwIHN0YXRlLiAgVGhpcyB3YXMgaW5jb3JyZWN0IGJlY2F1c2UgaGFyZHdhcmUgYXV0b25v
bW91c2x5IG1hbmFnZXMKPiA+ID4gdHJhbnNpdGlvbnMgYmV0d2VlbiBMMCwgTDBzLCBhbmQgTDEg
d2hpbGUgYm90aCBjb21wb25lbnRzIG9uIHRoZSBsaW5rIHN0YXkKPiA+ID4gaW4gRDAuICBUaG9z
ZSBzdGF0ZXMgc2hvdWxkIGFsbCBiZSB0cmVhdGVkIGFzICJsaW5rIGlzIGFjdGl2ZSIuCj4gPiA+
Cj4gPiA+IFJldHVybmluZyBmYWxzZSB3aGVuIHRoZSBkZXZpY2Ugd2FzIGluIEwwcyBvciBMMSBi
cm9rZSBjb25maWcgYWNjZXNzZXMKPiA+ID4gYmVjYXVzZSBkd19wY2llX290aGVyX2NvbmZfbWFw
X2J1cygpIGZhaWxzIGlmIHRoZSBsaW5rIGlzIGRvd24sIHdoaWNoCj4gPiA+IGNhdXNlZCBlcnJv
cnMgbGlrZSB0aGlzOgo+ID4gPgo+ID4gPiBbLi4uXQo+ID4KPiA+IEFwcGxpZWQsIHRoYW5rcyEK
PiA+Cj4gPiBbMS8xXSBQQ0k6IG1lc29uOiBSZW1vdmUgbWVzb25fcGNpZV9saW5rX3VwKCkgdGlt
ZW91dCwgbWVzc2FnZSwgc3BlZWQgY2hlY2sKPiA+ICAgICAgIGNvbW1pdDogMTE2NDdmYzc3MmU5
NzdjOTgxMjU5YTYzYzRhMmI3ZTJjMzEyZWEyMgo+IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0
aGlzIGlzIHF1ZXVlZCBmb3IgLW5leHQuCj4gUmljYXJkbyAoQ2MnZWQpIHJlcG9ydGVkIHRoYXQg
dGhpcyBwYXRjaCBmaXhlcyBQQ0kgbGluayB1cCBvbiBoaXMgT2Ryb2lkLUhDNC4KPiBJcyB0aGVy
ZSBhIGNoYW5jZSB0byBnZXQgdGhpcyBwYXRjaCBpbnRvIC1maXhlcywgc28gaXQgY2FuIGJlIHB1
bGxlZAo+IGJ5IExpbnVzIGZvciBvbmUgb2YgdGhlIG5leHQgLXJjPwo+IAoKSG1tLCBJIGxvb2tl
ZCBhdCB0aGUgRml4ZXMgdGFnIGFuZCBtaXN0YWtlbmx5IGFzc3VtZWQgdGhhdCB0aGUgaXNzdWUg
ZXhpc3RlZApmcm9tIHRoZSBiZWdpbm5pbmcuCgpCam9ybiwgY291bGQgeW91IHBsZWFzZSBpbmNs
dWRlIHRoaXMgcGF0Y2ggaW4gdGhlIG5leHQgZml4ZXMgUFI/CgotIE1hbmkKCi0tIArgrq7grqPg
rr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
