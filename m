Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8827AEB597B
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Feb 2026 08:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q1A0kLdFyBUpHy7ywJxc1oiE0C46yG4BKTeJi7YYsbg=; b=vSGmF8vA3Y+Go/
	djBhrbh7Wy02rJCavCXNpm3rOaes0eq+7kVgtvvIVCJ2sW8fVjp5xzBEpToPhyY+SCM+qZne7tJnO
	2DkL/LfdEwZOsIciq9e4HWKb+q49qFLvylX3pEFEvA7Uk3wWknOAeuvf+pHXb3E7/3/bgZyL9xRlV
	0a8lc32wg7vIQ3KZRMasAEDqd/p1x2l0nxre7ZEED1knXVUhD3eGiYi2ED7NneEZQqpf9TMaE1KvO
	LdQgTEZ0NYoLqs3M+EKaGsgnhecxbza06hiSXIgNO8hOuKZCNSS306D6zdo5nYuKA+jxynwoDusin
	MlA+nYdrdN7X3KLAZ8hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq5ga-00000000OeC-2ags;
	Wed, 11 Feb 2026 08:35:00 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq5gX-00000000Odo-1gQl
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Feb 2026 08:34:59 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-436e87589e8so2746818f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Feb 2026 00:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770798895; x=1771403695; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfdcqFM0/eCHybIVXUmOHj6K5wyJWfZBIgSuomD2VWA=;
        b=gys5OJa3ll1CW2rmNnqFuBg9b3n4TUTu4bKNGqXOlISlpLyTgz5R7QwPcZWtq1CnEJ
         DJRBVNrD0k4mIWWc9kLV2V1yzcq8ZMMmY/5NB1nGOka0AiSkgWyUdWZCvcDc41PG9+wI
         JT1xEF8tsX4wh0aE5GVRSsXy0CCCZ8vv8WfK86a2ifePnM6m1mzYRdcX9QCBTuDZexcT
         Z7/Lfs76dDG4wJIX/YfIYlFYemvtTz0YHUX3TOE2rbGa3WSjD7ikeWCi7JjTjGEUYWZt
         WkoHgxCCCyLPZ2AXe3h6sN1Ls1xv85a6Rj3xPXl5TKapgDdvW9ok0woHsHLmCRlGvr0x
         E3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770798895; x=1771403695;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vfdcqFM0/eCHybIVXUmOHj6K5wyJWfZBIgSuomD2VWA=;
        b=uvphCXfnH8zai3EmVs/4ghDZQPJAnWN1J5qggLgi8V6k7osDNvX6WRmaY04v+tNCYy
         KjOcrZMbaHRRNyuPAIBcm1ZcGDnlZZ1GLeKFMzvY+Vt8/xZmTXqsZx9zMZhvmYbeyt3o
         g4Heq9yVh3mcVb4rLGzZVD9jVctDdAG37aVWDlPhmjY0bB0FRMB2iZsklX1m5akQXBfi
         LWWLFmUCkCoQ9iwjAZgvQ99NrSDnEzzA1IOBJBl2hryZk5n7Mh/S2wv+r/MJmdko2tYn
         Qm7TL084R1GOeJ13E9U7PbAET8Iy5S+98AxQIt62k6GqdRrX/Zr6DdnTpAx0jTk8VllW
         GGZA==
X-Forwarded-Encrypted: i=1; AJvYcCUl6D5BXdtMtOPwqnpdNNQT61hy6LFlQSJrkESOSwglsbwZ9bUka4TVsd88n39l83CSrauGI0ODNNk6ar1n@lists.infradead.org
X-Gm-Message-State: AOJu0YzoGE9fu/eSmPW3iLTsp96+tRvPRJF4iYb1WI1IyMOixkbmYX/2
	qOa3eqK2P90TjliIaNJ3SKSjrc2hMuZe1PBYyx38SNM/ODZq1Fwe20Qk8eWHCuXvpks=
X-Gm-Gg: AZuq6aKxaq3CJGZyGHvUUxruOSz6bDrCsio4L6abuF8ulHfzACM3KNC3OQcX/lEpYml
	j+hzKWI47Y74Oy231ABzySjE6+S70ViJdLTgS2sqqa14GVnmZvx7+1IUdKsygV9bnVH2EwBwl0G
	vdYvYr5607Jq/gYaccvdwD6EiTNySRqtTzsYWffSrO77OqcUvokQEuFhHxmeHixMFSN75h0wcZ3
	i4CTPmrLYDGcPLeL+fOhEuumCN/kdN94LDmS8cepx2Ys0D2qUrDY4F7/U3L3tqHQUMxYBR8Re6C
	i3fe+1I2e0cjtNEkOhdri3Y1pt3SYSMbKcVeOnsH7rke/mcEoOVFoO6NWgSOT6Z0FxKj5oNoDpt
	8/dn4qEt1L0HDGfnzlR4sfpbfp5f5Xepa6Wk6fLZhfwy8ZOcpZhKWw0bOqlLY+qVhX5lO3zU1aL
	O4swWC6/d/RfTGJ/o7jlkaGA==
X-Received: by 2002:a05:6000:2386:b0:435:dd81:4f4d with SMTP id ffacd0b85a97d-4377a534f67mr8447959f8f.26.1770798894983;
        Wed, 11 Feb 2026 00:34:54 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:550e:9544:443b:8507])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43783d746a3sm3075953f8f.17.2026.02.11.00.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 00:34:54 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] clk: amlogic: Introduce A9 PLL and CCU driver
 support
In-Reply-To: <20260209-a9_clock_driver-v1-0-a9198dc03d2a@amlogic.com> (Chuan
	Liu via's message of "Mon, 09 Feb 2026 13:48:46 +0800")
References: <20260209-a9_clock_driver-v1-0-a9198dc03d2a@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 11 Feb 2026 09:34:52 +0100
Message-ID: <1jseb7y8yb.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_003457_734578_F364595D 
X-CRM114-Status: GOOD (  17.19  )
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

T24gbHVuLiAwOSBmw6l2ci4gMjAyNiBhdCAxMzo0OCwgQ2h1YW4gTGl1IHZpYSBCNCBSZWxheSA8
ZGV2bnVsbCtjaHVhbi5saXUuYW1sb2dpYy5jb21Aa2VybmVsLm9yZz4gd3JvdGU6Cgo+IFRoaXMg
cGF0Y2ggYWRkcyBkcml2ZXIgc3VwcG9ydCBmb3IgUGhhc2UtTG9ja2VkIExvb3AgKFBMTCkgY29u
dHJvbGxlcnMKPiBhbmQgQ2xvY2sgQ29udHJvbCBVbml0cyAoQ0NVcykgaW4gQTkgU29DIGZhbWls
eS4KPgo+IEluIHRoZSBBOSBTb0MgYXJjaGl0ZWN0dXJlLCBQTExzIGFuZCBjbG9jayBjb250cm9s
IHVuaXRzIGFyZSBpbXBsZW1lbnRlZAo+IGFzIHN0YW5kYXJkaXplZCBoYXJkd2FyZSBpbnN0YW5j
ZXMgdG8gcmVkdWNlIHVubmVjZXNzYXJ5IGRpZmZlcmVudGlhdGlvbgo+IGFjcm9zcyBpbmRpdmlk
dWFsIHVuaXRzLgo+Cj4gQWxsIEE5IFBMTHMgYW5kIENDVXMgYXJlIGV4cG9zZWQgYXMgZGV2aWNl
IHRyZWUgbm9kZXMsIHByb3ZpZGluZyBhbgo+IGFjY3VyYXRlIHJlcHJlc2VudGF0aW9uIG9mIHRo
ZSBTb0MncyBpbnRlcm5hbCBjbG9jayBoYXJkd2FyZSBzdHJ1Y3R1cmUuCj4KPiBUaGVzZSBkcml2
ZXJzIGFyZSBkZXNpZ25lZCBmb3IgcmV1c2UgaW4gc3Vic2VxdWVudCBTb0MgZ2VuZXJhdGlvbnMs
Cj4gZ3VhcmFudGVlaW5nIGNvZGUgaW5oZXJpdGFuY2UgYW5kIG1heGltaXppbmcgcmV1c2FiaWxp
dHkuCj4KPiBNYWtlZmlsZSBydWxlcyBjb21waWxlIEE5IFBMTCBhbmQgQ0NVIGRyaXZlcnMgaW50
byBjbGstYW1sb2dpYy5vIChzZWUKPiBkcml2ZXJzL2Nsay9hbWxvZ2ljL01ha2VmaWxlKSwgc2lt
cGxpZnlpbmcgZGVwbG95bWVudCBhbmQgZW5oYW5jaW5nIGxvYWQKPiBlZmZpY2llbmN5IChzaW5n
bGUgaW5zbW9kIGZvciBrZXJuZWwgbW9kdWxlKS4KPgo+IFNpbmNlIHRoZSBmb3VuZGF0aW9uYWwg
QTkgRFRTIGhhc24ndCBiZWVuIHVwc3RyZWFtZWQgeWV0LCBJJ20gdGVtcG9yYXJpbHkKPiBwdXNo
aW5nIHRoZSBQTEwvQ0NVIERUUyBmaWxlcyB0byBnaXRodWIgZm9yIGRyaXZlciBjb21wcmVoZW5z
aW9uIFsxXS4KPiBUaGVzZSBwYXRjaGVzIHdpbGwgYmUgaW5jbHVkZWQgaW4gYSBsYXRlciByZWxl
YXNlIGFmdGVyIHRoZSBiYXNlIEE5IERUUwo+IGlzIG1lcmdlZC4KCkNyZWF0aW5nIGEgbmV3IHZl
bmRvciBkaXJlY3RvcnkgYW5kIHJlLWludmVudGluZyBzdXBwb3J0ZWQgZHJpdmVyCndpdGhvdXQg
YW4gZXhwbGFuYXRpb24sIGNvZGluZyBzdHlsZSwgYnVpbGQgcHJvYmxlbXMgLi4uIHRoZSBsaXN0
IGdvZXMKb24uIFlvdSd2ZSBvdXRkb25lIHlvdXJzZWxmICEKClNvIE5BQ0suCgpDaHVhbiBoYXMg
YmVlbiB3YXJuZWQgbnVtZXJvdXMgdGltZXMgYWJvdXQgaGlzIHN1Ym1pc3Npb24gdG8gdGhlIGtl
cm5lbAptYWlsaW5nIGxpc3RzLCB3aXRob3V0IGEgbm90aWNlYWJsZSBlZmZlY3QuIEkgY2FuIG9u
bHkgc3VnZ2VzdCBvdGhlcgpyZXZpZXdlcnMgZG8gbm90IHdhc3RlIHRoZWlyIHRpbWUgcmV2aWV3
aW5nIHRoaXMuCgo+Cj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9jb21t
aXQvZDZhODJlNGNjZTY3NWZhNTE0NmM1ZjYzOGMyYTkyNmMxYzhjYjFkOQo+Cj4gU2lnbmVkLW9m
Zi1ieTogQ2h1YW4gTGl1IDxjaHVhbi5saXVAYW1sb2dpYy5jb20+Cj4gLS0tCj4gQ2h1YW4gTGl1
ICgxMyk6Cj4gICAgICAgZHQtYmluZGluZ3M6IGNsb2NrOiBBZGQgQW1sb2dpYyBBOSBzdGFuZGFy
ZGl6ZWQgbW9kZWwgY2xvY2sgY29udHJvbCB1bml0cwo+ICAgICAgIGR0LWJpbmRpbmdzOiBjbG9j
azogQWRkIEFtbG9naWMgQTkgUExMIGNvbnRyb2xsZXJzCj4gICAgICAgZHQtYmluZGluZ3M6IGNs
b2NrOiBBZGQgQW1sb2dpYyBBOSBtaXNjIGNsb2NrIGNvbnRyb2wgdW5pdHMKPiAgICAgICBjbGs6
IGFtbG9naWM6IEFkZCBiYXNpYyBjbG9jayBkcml2ZXIKPiAgICAgICBjbGs6IGFtbG9naWM6IEFk
ZCBjb21wb3NpdGUgY2xvY2sgZHJpdmVyCj4gICAgICAgY2xrOiBhbWxvZ2ljOiBBZGQgbm9nbGl0
Y2ggY2xvY2sgZHJpdmVyCj4gICAgICAgY2xrOiBhbWxvZ2ljOiBBZGQgZHVhbmRpdiBjbG9jayBk
cml2ZXIKPiAgICAgICBjbGs6IGFtbG9naWM6IEFkZCBQTEwgZHJpdmVyCj4gICAgICAgY2xrOiBh
bWxvZ2ljOiBBZGQgRFQtYmFzZWQgY2xvY2sgcmVnaXN0cmF0aW9uIGZ1bmN0aW9ucwo+ICAgICAg
IGNsazogYW1sb2dpYzogQWRkIEE5IHN0YW5kYXJkaXplZCBtb2RlbCBjbG9jayBjb250cm9sIHVu
aXRzIGRyaXZlcgo+ICAgICAgIGNsazogYW1sb2dpYzogQWRkIEE5IFBMTCBjb250cm9sbGVycyBk
cml2ZXIKPiAgICAgICBjbGs6IGFtbG9naWM6IEFkZCBBOSBtaXNjIGNsb2NrIGNvbnRyb2wgdW5p
dHMgZHJpdmVyCj4gICAgICAgY2xrOiBhbWxvZ2ljOiBBZGQgc3VwcG9ydCBmb3IgYnVpbGRpbmcg
YXMgY29tYmluZWQga2VybmVsIG1vZHVsZQo+Cj4gIC4uLi9iaW5kaW5ncy9jbG9jay9hbWxvZ2lj
LGE5LW1pc2MtY2N1LnlhbWwgICAgICAgIHwgNTIzICsrKysrKysrKysrCj4gIC4uLi9iaW5kaW5n
cy9jbG9jay9hbWxvZ2ljLGE5LW1vZGVsLWNjdS55YW1sICAgICAgIHwgNDM1ICsrKysrKysrKwo+
ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9hbWxvZ2ljLGE5LXBsbC55YW1sICB8IDEz
NCArKysKPiAgZHJpdmVycy9jbGsvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDEgKwo+ICBkcml2ZXJzL2Nsay9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMSArCj4gIGRyaXZlcnMvY2xrL2FtbG9naWMvS2NvbmZpZyAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDUyICsrCj4gIGRyaXZlcnMvY2xrL2FtbG9naWMvTWFrZWZpbGUgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDIzICsKPiAgZHJpdmVycy9jbGsvYW1sb2dpYy9hOS1taXNj
LWNjdS5jICAgICAgICAgICAgICAgICAgfCA5NzAgKysrKysrKysrKysrKysrKysrKysrCj4gIGRy
aXZlcnMvY2xrL2FtbG9naWMvYTktbW9kZWwtY2N1LmMgICAgICAgICAgICAgICAgIHwgNDc1ICsr
KysrKysrKysKPiAgZHJpdmVycy9jbGsvYW1sb2dpYy9hOS1wbGwuYyAgICAgICAgICAgICAgICAg
ICAgICAgfCAxNTYgKysrKwo+ICBkcml2ZXJzL2Nsay9hbWxvZ2ljL2Nsay1iYXNpYy5jICAgICAg
ICAgICAgICAgICAgICB8IDIxOSArKysrKwo+ICBkcml2ZXJzL2Nsay9hbWxvZ2ljL2Nsay1iYXNp
Yy5oICAgICAgICAgICAgICAgICAgICB8ICAzOSArCj4gIGRyaXZlcnMvY2xrL2FtbG9naWMvY2xr
LWNvbXBvc2l0ZS5jICAgICAgICAgICAgICAgIHwgMjgwICsrKysrKwo+ICBkcml2ZXJzL2Nsay9h
bWxvZ2ljL2Nsay1jb21wb3NpdGUuaCAgICAgICAgICAgICAgICB8ICAyMCArCj4gIGRyaXZlcnMv
Y2xrL2FtbG9naWMvY2xrLWR1YWxkaXYuYyAgICAgICAgICAgICAgICAgIHwgMzY1ICsrKysrKysr
Cj4gIGRyaXZlcnMvY2xrL2FtbG9naWMvY2xrLWR1YWxkaXYuaCAgICAgICAgICAgICAgICAgIHwg
IDI3ICsKPiAgZHJpdmVycy9jbGsvYW1sb2dpYy9jbGstbW9kdWxlLmMgICAgICAgICAgICAgICAg
ICAgfCAgNDIgKwo+ICBkcml2ZXJzL2Nsay9hbWxvZ2ljL2Nsay1tb2R1bGUuaCAgICAgICAgICAg
ICAgICAgICB8ICA1MyArKwo+ICBkcml2ZXJzL2Nsay9hbWxvZ2ljL2Nsay1ub2dsaXRjaC5jICAg
ICAgICAgICAgICAgICB8IDU4NCArKysrKysrKysrKysrCj4gIGRyaXZlcnMvY2xrL2FtbG9naWMv
Y2xrLW5vZ2xpdGNoLmggICAgICAgICAgICAgICAgIHwgIDI5ICsKPiAgZHJpdmVycy9jbGsvYW1s
b2dpYy9jbGstcGxsLmMgICAgICAgICAgICAgICAgICAgICAgfCA3MDEgKysrKysrKysrKysrKysr
Cj4gIGRyaXZlcnMvY2xrL2FtbG9naWMvY2xrLXBsbC5oICAgICAgICAgICAgICAgICAgICAgIHwg
IDQzICsKPiAgZHJpdmVycy9jbGsvYW1sb2dpYy9jbGsuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCA0NjQgKysrKysrKysrKwo+ICBkcml2ZXJzL2Nsay9hbWxvZ2ljL2Nsay5oICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICA1NiArKwo+ICBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL2Ft
bG9naWMsYTktbWlzYy1jY3UuaCAgICB8ICA1MyArKwo+ICAyNSBmaWxlcyBjaGFuZ2VkLCA1NzQ1
IGluc2VydGlvbnMoKykKPiAtLS0KPiBiYXNlLWNvbW1pdDogNGQzMTA3OTcyNjJmMGRkZjEyOWU3
NmMyYWFkMmI5NTBhZGFmMWZkYQo+IGNoYW5nZS1pZDogMjAyNjAxMzAtYTlfY2xvY2tfZHJpdmVy
LWRkZDkwMzU3ODQ4Ywo+Cj4gQmVzdCByZWdhcmRzLAoKLS0gCkplcm9tZQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
