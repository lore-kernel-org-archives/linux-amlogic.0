Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB95BC001B1
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Jun 2023 14:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MnlS7X+07W4y9qQAoePkt4bf/+aV2g39+KKFy0wIgUo=; b=AytcETOwzHQRfX
	diQI+VOoh5IC4BS4Wyzv2ftXJunJQThINd+oB+8E188THpNzNoQU12FKkogeP04SY6JHJQHr6ieWx
	Vvk/70dPr+9IEgyrFIxETYfhIzVbWx9MQkXnuHFenUmvyMlBS85cbpS0Od0oqnPnE/Jvu1dOMgCmr
	WdABvCwwjycNrP4kaOvEw2KTAh09an2urXKIqwGCVIjfDmgFFoGdKqdH+FFQst6eG/zKUS4v66qH4
	9yas8pTtoAHyX/3fUPVp662qZJ5S7T9QfGVTUHeW5iNOfpzMgBMRMvKSgGbFrD0OYmaUdJDJ6S3oV
	OEfQYSw2F7JAMtoOTjFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDQYr-0087pK-1T;
	Sun, 25 Jun 2023 14:17:53 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDQYn-0087ml-1N;
	Sun, 25 Jun 2023 14:17:50 +0000
Received: from sobremesa.fritz.box (unknown [IPv6:2a02:8010:65b5:0:bbb0:f8ec:7bc9:dbe4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: alarumbe)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 05121660712A;
	Sun, 25 Jun 2023 15:17:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1687702662;
	bh=c6A/z4v0Vb7BYDRLc/MAHkq406/oHg3kcxtWC9wdQ3s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LA7zpzp7vJYS0LTXXxzIiZ56k4vnlFfWuoYSJ2RPVZaY6exE91MztSG+76C9URTA2
	 Gj/jLwEuyt948mFnJ8ifaAvTJMgEvJthuD+PWQxeyf2ehEp0G2v2MC2AzaiKisYbG2
	 txDIi8Qt4Bg904IDo6AUL09+o7QcmpdHxZv48alBIsaB+5OVoVB8/zzULofDo1q4Ps
	 z7fnDACgjbyhzWWih4gBFldy+JTK+pAue4LqqHWAxqOHJXXLDsroDtY21Oli/qYIMo
	 5AxYLE/Pf4JN5X8SzlsRJ9E3Pjl8hkeuEb3tJfuYKomBeKr4aa421Dcb8rDqCex2nR
	 bj4X41V0IDhwQ==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/3] drm/bridge: dw-hdmi: change YUV420 selection logic at clock setup
Date: Sun, 25 Jun 2023 15:17:15 +0100
Message-Id: <6230bfae2cd97cf6527fc62ba5c850464919ccf8.1687702042.git.adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <cover.1687702042.git.adrian.larumbe@collabora.com>
References: <cover.1687702042.git.adrian.larumbe@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_071749_615004_33907472 
X-CRM114-Status: GOOD (  12.17  )
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

UmlnaHQgbm93IGNsb2NraW5nIHZhbHVlIHNlbGVjdGlvbiBjb2RlIGlzIHByaW9yaXRpc2luZyBS
R0IsIFlVVjQ0NCBtb2RlcwpvdmVyIFlVVjQyMCBmb3IgSERNSTIgc2lua3MuIEhvd2V2ZXIsIGJl
Y2F1c2Ugb2YgdGhlIGJ1cyBmb3JtYXQgc2VsZWN0aW9uCnByb2NlZHVyZSBpbiBkdy1oZG1pLCBm
b3IgSERNSTIgc2lua3MgWVVWNDIwIGlzIHRoZSBmb3JtYXQgdGhhdCB3aWxsIGFsd2F5cwpiZSBw
aWNrZWQgZHVyaW5nIHRoZSBkcm0gYnJpZGdlIGNoYWluIGNoZWNrIHN0YWdlLgoKTGF0ZXIgb24g
ZHdfaGRtaV9zZXR1cCB3aWxsIGNvbmZpZ3VyZSBhIGNvbG91ciBzcGFjZSBiYXNlZCBvbiB0aGUg
YnVzCmZvcm1hdCB0aGF0IGRvZXNuJ3QgbWF0Y2ggdGhlIHBpeGVsIHZhbHVlIHdlIGhhZCBjYWxj
dWxhdGVkIGFzIGRlc2NyaWJlZAphYm92ZS4KCkZpeCBpdCBieSBicmluZ2luZyBiYWNrIGR3LWhk
bWkgYnVzIGZvcm1hdCBjaGVjayB3aGVuIHBpY2tpbmcgdGhlIHJpZ2h0CnBpeGVsIGNsb2NrLgoK
U2lnbmVkLW9mZi1ieTogQWRyacOhbiBMYXJ1bWJlIDxhZHJpYW4ubGFydW1iZUBjb2xsYWJvcmEu
Y29tPgpBY2tlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMgfCA2ICsrKysr
KwogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2R3X2hkbWkuYyAgICAgfCA0ICsrLS0KIGlu
Y2x1ZGUvZHJtL2JyaWRnZS9kd19oZG1pLmggICAgICAgICAgICAgIHwgMiArKwogMyBmaWxlcyBj
aGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKaW5kZXggM2I0MGUwZmRjYTVjLi5lNmE0NTZiNzI2
MTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jCkBAIC0zMzQ2
LDYgKzMzNDYsMTIgQEAgc3RhdGljIGludCBkd19oZG1pX3BhcnNlX2R0KHN0cnVjdCBkd19oZG1p
ICpoZG1pKQogCXJldHVybiAwOwogfQogCitib29sIGR3X2hkbWlfYnVzX2ZtdF9pc180MjAoc3Ry
dWN0IGR3X2hkbWkgKmhkbWkpCit7CisJcmV0dXJuIGhkbWlfYnVzX2ZtdF9pc195dXY0MjAoaGRt
aS0+aGRtaV9kYXRhLmVuY19vdXRfYnVzX2Zvcm1hdCk7Cit9CitFWFBPUlRfU1lNQk9MX0dQTChk
d19oZG1pX2J1c19mbXRfaXNfNDIwKTsKKwogc3RydWN0IGR3X2hkbWkgKmR3X2hkbWlfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKIAkJCSAgICAgIGNvbnN0IHN0cnVjdCBkd19o
ZG1pX3BsYXRfZGF0YSAqcGxhdF9kYXRhKQogewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lc29uL21lc29uX2R3X2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19o
ZG1pLmMKaW5kZXggM2QwNDY4NzhjZTZjLi5iNDliYjBkODZlZmUgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kd19oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21l
c29uL21lc29uX2R3X2hkbWkuYwpAQCAtMzc5LDggKzM3OSw4IEBAIHN0YXRpYyBpbnQgZHdfaGRt
aV9waHlfaW5pdChzdHJ1Y3QgZHdfaGRtaSAqaGRtaSwgdm9pZCAqZGF0YSwKIAkJCSBtb2RlLT5j
bG9jayA+IDM0MDAwMCA/IDQwIDogMTApOwogCiAJaWYgKGRybV9tb2RlX2lzXzQyMF9vbmx5KGRp
c3BsYXksIG1vZGUpIHx8Ci0JICAgICghaXNfaGRtaTJfc2luayAmJgotCSAgICAgZHJtX21vZGVf
aXNfNDIwX2Fsc28oZGlzcGxheSwgbW9kZSkpKQorCSAgICAoIWlzX2hkbWkyX3NpbmsgJiYgZHJt
X21vZGVfaXNfNDIwX2Fsc28oZGlzcGxheSwgbW9kZSkpIHx8CisJICAgIGR3X2hkbWlfYnVzX2Zt
dF9pc180MjAoaGRtaSkpCiAJCW1vZGVfaXNfNDIwID0gdHJ1ZTsKIAogCS8qIEVuYWJsZSBjbG9j
a3MgKi8KZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2JyaWRnZS9kd19oZG1pLmggYi9pbmNsdWRl
L2RybS9icmlkZ2UvZHdfaGRtaS5oCmluZGV4IGY2NjhlNzVmYmFiZS4uNmE0NmJhYTA3MzdjIDEw
MDY0NAotLS0gYS9pbmNsdWRlL2RybS9icmlkZ2UvZHdfaGRtaS5oCisrKyBiL2luY2x1ZGUvZHJt
L2JyaWRnZS9kd19oZG1pLmgKQEAgLTIwNiw0ICsyMDYsNiBAQCB2b2lkIGR3X2hkbWlfcGh5X3Vw
ZGF0ZV9ocGQoc3RydWN0IGR3X2hkbWkgKmhkbWksIHZvaWQgKmRhdGEsCiAJCQkgICAgYm9vbCBm
b3JjZSwgYm9vbCBkaXNhYmxlZCwgYm9vbCByeHNlbnNlKTsKIHZvaWQgZHdfaGRtaV9waHlfc2V0
dXBfaHBkKHN0cnVjdCBkd19oZG1pICpoZG1pLCB2b2lkICpkYXRhKTsKIAorYm9vbCBkd19oZG1p
X2J1c19mbXRfaXNfNDIwKHN0cnVjdCBkd19oZG1pICpoZG1pKTsKKwogI2VuZGlmIC8qIF9fSU1Y
X0hETUlfSF9fICovCi0tIAoyLjQwLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==
