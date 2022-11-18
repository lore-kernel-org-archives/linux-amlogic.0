Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DDB4C43217
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Nov 2022 15:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:MIME-Version
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a5bDrho0gfOFYqXj6ywsf/CDJAaKvR/iH3yeYrQOnJk=; b=yFKOuP+q2NpMuS
	jKOBjoKrA0PU3QMIF1CYWCnW7plNpm6cHow42HnH7p80UUEnloueuybFpcrqwwyQxKz8CLhdVmY+K
	X0eXcSD534Kr0yiyEm3vqLz7tkiKmmWEhmmrQ/4i6QibsteovimiBD/McMKDsVaitJ454UFi1SSQ9
	65BGPmO2zEom8Y5rCRgbjYKdUm8K8vSv4Uqeu0G5d/9K2oz79FCR77uDzxAftb1NV2qZBL4icb+c3
	biZC8oylqrCFvnA71Hnr0/MXB50C5jb1W0DVaCmxXd6BT8cmstzIqTlxdWYeSTiyW2tVVbNSdoyd+
	fDMhpFFaQDdeUj5YUxyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow3dX-0053gu-AO; Fri, 18 Nov 2022 15:50:39 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow3d4-0053Xp-ND
	for linux-amlogic@lists.infradead.org; Fri, 18 Nov 2022 15:50:13 +0000
Received: by mail-wr1-x430.google.com with SMTP id cl5so9843627wrb.9
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Nov 2022 07:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=CmTL+mg18Z4AepnU6eZyDbtFVjUFILiYsH5hlR5uEro=;
        b=OKMKBVZQLGFbwj7QynAdCsT1VPXH4Rioy1t2pjuIIwxWZix6jBtDy7618JyJPVVbKc
         9cyV2lgYpSqGprBK/Zo5n0gBEwNItE5wk5Gn9gntUX2rkuu0ze1qAwFs2OWCJn+nFkcl
         JAqCvez9iMlY31ZS4LunN34VGNDFXbZ3vWTgbY1e/y+4E+EpNgB7JTLS3KsHPGVn8q3D
         unjpp+2+9+3F+IeR0mpzwPO5FSgMd1PgXO5xo8ymNxjTuTysCfEcwqT0Z6UAln26Rlcv
         7+h/5k5SFS9tYojx/tMVyRFw2tCzjRc3rsQ6wEoArQ40uBTijfLSQD+45DjsTzDCm51g
         ZFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CmTL+mg18Z4AepnU6eZyDbtFVjUFILiYsH5hlR5uEro=;
        b=kUhSg7k72gO/ggtnkfz17SVW7xIyx/LsH+LnwEzmFLhP9NnpWWPGDREwzwISI8T+Jt
         60CLovWAHeikLk2lYhRlIh5stRAdcf841f57GXg40rlKZOots8shcJ7phYT822mTsLzH
         x4Mqc4Ny4DFSTHExcSfvjgLdRO2X7Sd6Tm4n1WVASRjiNeuyGLdJSkHiThR1Hg8wiXPO
         EdjckiNBnx3gPkOC0dVXRZ7gMzVbpU4w2WvxZCOB8zH1mwoGEIlDxUS5IJQfiD+HJE6n
         +dQ8DWz0KtjStvoDUc7GMKXfV99wumBkX1rLX0S6MP+whCLpnBDZ9D5WxGMd8+Xscha/
         Yk7g==
X-Gm-Message-State: ANoB5pkpN0rOcwybugChznYbHw45Dxo386P8kSdycoXH7CgsVj7ufzOQ
	fbL5pnuL7trKOUC8hsesaBdlbA==
X-Google-Smtp-Source: AA0mqf4VUH/lC1IDoaI1Aq0Zpxjp4JBMofLzpxPK1c2Yw11pg5JIQHZmyxkopn1qIikCQ7p5Weaomw==
X-Received: by 2002:adf:e78e:0:b0:22e:32ab:c37 with SMTP id n14-20020adfe78e000000b0022e32ab0c37mr4831201wrm.317.1668786606917;
        Fri, 18 Nov 2022 07:50:06 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id a13-20020a5d53cd000000b002383edcde09sm3812465wrw.59.2022.11.18.07.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 07:50:06 -0800 (PST)
Subject: [PATCH v2 0/2] arm64: amlogic: add initial Odroid Go Ultra DTS
MIME-Version: 1.0
X-b4-tracking: H4sIAKypd2MC/42NQQrDMAwEv1J0rkrsxKH01H+UHuRYJAJjgZwESsjfa/qCnpbZw8wBlU24wuNygP
 EuVbQ08NcLTAuVmVFSY/Cd967rHcYBNZlKwllxy6sRSpFVKGPgMUyJA/ueoAkiVcZoVKalKcqWczsX
 qava5xfcXZvXX+7dYYeD5z5FpvuYwjNLIdOb2gzv8zy/1JQWNcoAAAA=
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 18 Nov 2022 16:50:04 +0100
Message-Id: <20221031-b4-odroid-go-ultra-initial-v2-0-a3df1e09b0af@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Sebastian Reichel <sre@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, Rob Herring <robh@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_075010_774413_3E3B7A6E 
X-CRM114-Status: UNSURE (   9.34  )
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
czoKLSBEZXZpY2UgYmluZGluZ3MKLSBJbml0aWFsIGRldmljZSBEVAoKVGhpcyBzZXJpZSBkZXBl
bmRzIG9uOgotIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMTAyNS1yazgwOC1tdWx0
aS12Mi0wLWQyOTJkNTFhZGE4MUBsaW5hcm8ub3JnLwoKVG86IFNlYmFzdGlhbiBSZWljaGVsIDxz
cmVAa2VybmVsLm9yZz4KVG86IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+ClRvOiBL
cnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+ClRv
OiBLZXZpbiBIaWxtYW4gPGtoaWxtYW5AYmF5bGlicmUuY29tPgpUbzogSmVyb21lIEJydW5ldCA8
amJydW5ldEBiYXlsaWJyZS5jb20+ClRvOiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1
bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgpDYzogbGludXgtcG1Admdlci5rZXJuZWwub3JnCkNj
OiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZwpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1zdHJvbmcg
PG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+CgotLS0KQ2hhbmdlcyBpbiB2MjoKLSBEcm9wcGVk
IHBvd2VyIG9mZiBkcml2ZXIvYmluZGluZ3MsIHdpbGwgbW92ZSB0byBhbm90aGVyIHBhdGNoc2V0
Ci0gRml4ZWQgRFQgY29tbWVudHMgZnJvbSBLcnp5c3p0b2YKLSBEcm9wcGVkIHBvd2Vyb2ZmIG5v
ZGUKLSBBZGQgQWNrZWQtYnkgZnJvbSBSb2IgdG8gYmluZGluZ3MgY2hhbmdlCi0gTGluayB0byB2
MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIyMTAzMS1iNC1vZHJvaWQtZ28tdWx0cmEt
aW5pdGlhbC12MS0wLTQyZTNkYmVhODZkNUBsaW5hcm8ub3JnCgotLS0KTmVpbCBBcm1zdHJvbmcg
KDIpOgogICAgICBkdC1iaW5kaW5nczogYW1sb2dpYzogZG9jdW1lbnQgT2Ryb2lkIEdvIFVsdHJh
IGNvbXBhdGlibGUKICAgICAgYXJtNjQ6IGR0czogYW1sb2dpYzogYWRkIGluaXRpYWwgT2Ryb2lk
IEdvIFVsdHJhIERUUwoKIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1s
b2dpYy55YW1sIHwgICAxICsKIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9NYWtlZmlsZSAg
ICAgICAgICAgICAgIHwgICAxICsKIC4uLi9kdHMvYW1sb2dpYy9tZXNvbi1nMTJiLW9kcm9pZC1n
by11bHRyYS5kdHMgICAgIHwgNzIyICsrKysrKysrKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFu
Z2VkLCA3MjQgaW5zZXJ0aW9ucygrKQotLS0KYmFzZS1jb21taXQ6IDJjM2MzOThkZGZhYmY0OGI3
YTBiNjZiNWYwMTA1MmJhNDNjMzYzMzcKY2hhbmdlLWlkOiAyMDIyMTAzMS1iNC1vZHJvaWQtZ28t
dWx0cmEtaW5pdGlhbC01ZTY1Y2RlNWUyM2EKCkJlc3QgcmVnYXJkcywKLS0gCk5laWwgQXJtc3Ry
b25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
