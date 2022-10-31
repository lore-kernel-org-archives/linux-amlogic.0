Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7659FFA3741
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Oct 2022 16:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:MIME-Version
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6swWpZMe2+kUZBdMPq109RVyjjLxLDSbxF4kRb1slB0=; b=Iugs0V/TcIvVKl
	H7jCnYEhzSHy9RYRm9EstrEfI8kt7e8i8gFr/UmOCS6LLhkrNqvdEmD7ekpKiXTkrULDU4MYXK1iR
	z/u9rpby5T8nnayXQSeNqDjtVY2xjbMT2SR6AODrroNGrDL0EJXFXh2zM5gAtk3jJ42g+juC85ZD5
	gPHY+Tq7s5dPz47DXKA77dlmuaoRMngUuSD4Dz5NouzoajvVkcWTNuwA9zcU5q9WybTz+FReJlo/P
	xybFzlCQLCQ5fkv1/j0cSpqKRbE3jZ90YueNGokrEex6x6K++TUklJDBvBnsvJKGqWGx+1Z5Sv4+0
	83bk+otAKi+sR96Mz5rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opXx3-00D5b1-7C; Mon, 31 Oct 2022 16:47:53 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opXwg-00D5SP-2O
	for linux-amlogic@lists.infradead.org; Mon, 31 Oct 2022 16:47:33 +0000
Received: by mail-wr1-x436.google.com with SMTP id w14so16781493wru.8
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Oct 2022 09:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=jxq7Kit5ewu9alvw6v26dSql8rnzDq0nCvqHaHXZbsc=;
        b=BLgwe1DfbNcToNja0I5ablkTHUZTolxvc/J+2guV1ofgW2O0ZkmzsTV+rbohlGCiMO
         6alYezYMn3i1bUec2jl8HIBLbZsSTOPEIuUmgumFBOxKb8joazGFaf81bqFWbGKu8lcQ
         kq9WQo4RnI8nX8ANFFXx6p+bIzoN/j9Bg/n63dyNS2TiCEOrnZVHX3gswMnmkBqy3CLB
         Tv24Fklhb/f56VQKGKx/vvhTMV98yd0SSWhu/LHi5kZRarR6Ncw1i5XgrznM0opIg1qd
         d7nBoVcBy6l81sY1EEvv4CNgFx67bYZq6l6ZOD1kWHVi4JvCOFAAAoFn91k04Z/mr5Nb
         +zng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jxq7Kit5ewu9alvw6v26dSql8rnzDq0nCvqHaHXZbsc=;
        b=q+RJkmtexjwK4zWs1UIBAQ9a1TjlZCTuetrIYaiIevt9KyZm6XhXxIX/EydrHu1UwC
         FFzYDAqMJ8Qlvvd2N27GBros9T4jeaG4ko4r7iFZGMpSl7RA6Wdd0fjB/SQrBilRbO2Y
         FaGKA9vrhnQQoZpXSZqSLTkZrvVe1h3MJmwLfBUhAueRv5RD6QQnIiPdRPC18mXuZQco
         53WT2AoU5L4Dk+OkUGtNC7q0APknPGGQk+BzD+Gh84oSW+XAnBKio3/IMxVkkeR1Gq++
         3Uq/ThfcovjToZI/5m8kqyRjU/dtE1I068oUExhqlLvQNOTzwTyitZIC/YtOyehjTW0J
         62iw==
X-Gm-Message-State: ACrzQf2bA4GgQ1364D2rH3i7M5lbQzajY0j2IgqfJHNj9jRNzbmPqFl0
	E0e7/ZdxEboCL3hcqL79khKQxw==
X-Google-Smtp-Source: AMsMyM4uCIJl5FzuUBvAx55rrePRHBWvJHlDInwsB5i3biXxKtWVuCdFt25ddWPZhDdx0h3GVqlyzg==
X-Received: by 2002:a5d:6d42:0:b0:236:c9a6:5523 with SMTP id k2-20020a5d6d42000000b00236c9a65523mr4378601wri.222.1667234847726;
        Mon, 31 Oct 2022 09:47:27 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id q8-20020a05600c46c800b003b4868eb71bsm7488871wmo.25.2022.10.31.09.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 09:47:27 -0700 (PDT)
Subject: [PATCH 0/4] arm64: amlogic: add initial Odroid Go Ultra DTS
MIME-Version: 1.0
X-b4-tracking: H4sIABz8X2MC/w3MMQ6AIAwAwK+YzjYREAd/U6DRJqQkRV2Mf5fxlnuhswl32KcXjB/p0nTAzRPkk/
 RglDIMfvHeLcFhWrEVa1LwaHjXywhF5RKqGHmLuXBkHwhGkKgzJiPN5yj0rvX7fvF2aJ9xAAAA
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 31 Oct 2022 17:47:24 +0100
Message-Id: <20221031-b4-odroid-go-ultra-initial-v1-0-42e3dbea86d5@linaro.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Sebastian Reichel <sre@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_094730_299448_6180AB6A 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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

VGhpcyBhZGRzIGluaXRpYWwgc3VwcG9ydCBmb3IgdGhlIEhhcmRrZXJuZWwgT2Ryb2lkIEdvIFVs
dHJhLgoKVGhlIE9kcm9pZCBHbyBVbHRyYSBpcyBhIHBvcnRhYmxlIGdhbWluZyBkZXZpY2Ugd2l0
aCB0aGUgZm9sbG93aW5nCmNoYXJhY3RlcmlzdGljczoKLSBBbWxvZ2ljIFM5MjJYIFNvQwotIFJL
ODE3ICYgUks4MTggUE1JQ3MKLSAyR2lCIExQRERSNAotIE9uIGJvYXJkIDE2R2lCIGVNTUMKLSBN
aWNybyBTRCBDYXJkIHNsb3QKLSA1aW5jaCA4NTTDlzQ4MCBNSVBJLURTSSBURlQgTENECi0gRWFy
cGhvbmUgc3RlcmVvIGphY2ssIDAuNVdhdHQgOM6pIE1vbm8gc3BlYWtlcgotIExpLVBvbHltZXIg
My43Vi80MDAwbUFoIEJhdHRlcnkKLSBVU0ItQSAyLjAgSG9zdCBDb25uZWN0b3IKLSB4MTYgR1BJ
TyBJbnB1dCBCdXR0b25zCi0gMnggQURDIEFuYWxvZyBKb3lzdGlja3MKLSBVU0ItQyBQb3J0IGZv
ciBVU0IyIERldmljZSBhbmQgQ2hhcmdpbmcKClRoZSBmb2xsb3dpbmcgYXJlIG5vdCB5ZXQgaGFu
ZGxlZDoKLSBCYXR0ZXJ5IFJLODE4IEdhdWdlIGFuZCBDaGFyZ2luZwotIEVhcnBob25lIHN0ZXJl
byBqYWNrIGRldGVjdAotIDVpbmNoIDg1NMOXNDgwIE1JUEktRFNJIFRGVCBMQ0QKClRoaXMgYWRk
czoKLSBQb3dlcm9mZiBiaW5kaW5ncwotIFBvd2Vyb2ZmIGRyaXZlcgotIERldmljZSBiaW5kaW5n
cwotIEluaXRpYWwgZGV2aWNlIERUCgpUaGlzIHNlcmllIGRlcGVuZHMgb246Ci0gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjIxMDI1LXJrODA4LW11bHRpLXYyLTAtZDI5MmQ1MWFkYTgx
QGxpbmFyby5vcmcvCgpUbzogU2ViYXN0aWFuIFJlaWNoZWwgPHNyZUBrZXJuZWwub3JnPgpUbzog
Um9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4KVG86IEtyenlzenRvZiBLb3psb3dza2kg
PGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZz4KVG86IEtldmluIEhpbG1hbiA8a2hp
bG1hbkBiYXlsaWJyZS5jb20+ClRvOiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNv
bT4KVG86IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFp
bC5jb20+CkNjOiBsaW51eC1wbUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGRldmljZXRyZWVAdmdlci5r
ZXJuZWwub3JnCkNjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCkNjOiBsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGlu
YXJvLm9yZz4KCi0tLQpOZWlsIEFybXN0cm9uZyAoNCk6CiAgICAgIGR0LWJpbmRpbmdzOiByZXNl
dDogZG9jdW1lbnQgT2Ryb2lkIEdvIFVsdHJhIHBvd2VyLW9mZgogICAgICBwb3dlcjogcmVzZXQ6
IGFkZCBPZHJvaWQgR28gVWx0cmEgcG93ZXJvZmYgZHJpdmVyCiAgICAgIGR0LWJpbmRpbmdzOiBh
bWxvZ2ljOiBkb2N1bWVudCBPZHJvaWQgR28gVWx0cmEgY29tcGF0aWJsZQogICAgICBhcm02NDog
ZHRzOiBhbWxvZ2ljOiBhZGQgaW5pdGlhbCBPZHJvaWQgR28gVWx0cmEgRFRTCgogRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2ljLnlhbWwgfCAgIDEgKwogLi4uL3Jl
c2V0L2hhcmRrZXJuZWwsb2Ryb2lkLWdvLXVsdHJhLXBvd2Vyb2ZmLnlhbWwgfCAgNDIgKysKIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgICAxICsK
IC4uLi9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLW9kcm9pZC1nby11bHRyYS5kdHMgICAgIHwgNzMw
ICsrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9wb3dlci9yZXNldC9LY29uZmlnICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDcgKwogZHJpdmVycy9wb3dlci9yZXNldC9NYWtlZmlsZSAg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9wb3dlci9yZXNldC9vZHJvaWQt
Z28tdWx0cmEtcG93ZXJvZmYuYyAgICAgfCAxMjIgKysrKwogNyBmaWxlcyBjaGFuZ2VkLCA5MDQg
aW5zZXJ0aW9ucygrKQotLS0KYmFzZS1jb21taXQ6IDI0N2YzNGY3YjgwMzU3OTQzMjM0ZjkzZjI0
N2ExYWU2YjZjM2E3NDAKY2hhbmdlLWlkOiAyMDIyMTAzMS1iNC1vZHJvaWQtZ28tdWx0cmEtaW5p
dGlhbC01ZTY1Y2RlNWUyM2EKCkJlc3QgcmVnYXJkcywKLS0gCk5laWwgQXJtc3Ryb25nIDxuZWls
LmFybXN0cm9uZ0BsaW5hcm8ub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
