Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D51C43219
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Nov 2022 15:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LrIu9rwry2wlm6plRcMWqFDM7OOfQdkT3ikUiGlIWYo=; b=Ek4nCJ3xdnJ62U
	EspksANkk6dczhmy+P66i3TSGJ/bQqJonTBpqKlvMqfbvffQaS/R+TGzltdh8v56glPXVSiWypBfk
	FFB9CapxR5Gbyn8je6F5zsAb3QDkcaawxiZKWsIDZ4Bn7KszrhgRFCZTbcct07e4rc/tZ56JSHWJR
	vs+SPYGEN/9T71VKuXVmn0umjXYbplWufsxaFqnKtIT1lSargi0I3dBUtWD3/NaQpOhatm9uJU6jM
	sS4GnjusOSsN5u9+WWo/LzS842i0uNbnezyqRwJ7Y/+tDLznvlvJLAB5XI8rxmAT3FBE1fxpHMTu4
	ng49W/fjxSNkQz594lRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow3dX-0053h4-MH; Fri, 18 Nov 2022 15:50:39 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow3d6-0053Y5-VD
	for linux-amlogic@lists.infradead.org; Fri, 18 Nov 2022 15:50:14 +0000
Received: by mail-wm1-x32d.google.com with SMTP id ay14-20020a05600c1e0e00b003cf6ab34b61so7830195wmb.2
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Nov 2022 07:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZLQieUidZlNqVrKwu39po09Jc+DVA7oSfqP+BkaPT0=;
        b=XqNd0uAyJhWFtotx7vjCSEtvyrwCBbOy730MU2iqH9Bb6DXPmJEGFeKr4QtZDd7Tjy
         7IejBtA0HLuYABlkkjh2YvpHHI+g4jgWFpeisHhAFvP4jeomO1tNgCvNn433rh9zJiBi
         Fsoc1TOdRPVBBwRGj6Os62dOucnSbPdirCII9CdDD4kwp6Dlzck+KwQiXqPnZMIWJX4V
         96psaJA9hMsp1STUmWWHdfwi6SPcY5+T3t10yf7W+5dx9+UDHw0z4PkLIqGbueZbDDyo
         U2b3pzo25Kyup8PT1V9FKlQAQHrKHRzwH8CgHOtBdTKEpN3xPCAb1ckxA8uf4UXmMV71
         eZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZLQieUidZlNqVrKwu39po09Jc+DVA7oSfqP+BkaPT0=;
        b=WWcQjX0vvhSevNuS+JlEAOyKkoi4gDikl7TW24mJKIzq2lIVip+ZjNK2n5j51rUhrA
         oRNU6XTHgcYdXNgLD/Cl/SJMQnvDpsnVpdT1kVr8Lc5xnh/dw7bhvOoAkXXyIlbDH1+R
         zx9dAsx6rOFWuHKYtjeN2ey6CTGpMoiBwiQCPQT744u6rdgMAy8OphhNCOzKEACbXr28
         2S9mvOeYH9Dxv5xD20QZhU8DweoYbK0HHFAecVijySxgez74Zec7iWgQEPNuvruNZlwd
         b8xwsB7FrJAKlwwyQ9LDACAdZqqLFhnZv3Tme/rUxS877CygIVFCSQod1WtxQG0prHig
         dtYA==
X-Gm-Message-State: ANoB5plftP5WS9J/q6SrR8ij9gmM8NzK1nNgO+yrdw5/Q80o+YD6B4eu
	GzQcmo2dzrtA45TPLmzW3lOjxw==
X-Google-Smtp-Source: AA0mqf7cj+n72vPORo59VxFb5rqtLtnKdyXmn3W8xEo2uhlOrcC7huqtnuGH5Z3zdkviwiXoWdJ2lw==
X-Received: by 2002:a1c:f401:0:b0:3c7:84d:72d with SMTP id z1-20020a1cf401000000b003c7084d072dmr8854319wma.181.1668786607821;
        Fri, 18 Nov 2022 07:50:07 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id a13-20020a5d53cd000000b002383edcde09sm3812465wrw.59.2022.11.18.07.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 07:50:07 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 18 Nov 2022 16:50:05 +0100
Subject: [PATCH v2 1/2] dt-bindings: amlogic: document Odroid Go Ultra compatible
MIME-Version: 1.0
Message-Id: <20221031-b4-odroid-go-ultra-initial-v2-1-a3df1e09b0af@linaro.org>
References: <20221031-b4-odroid-go-ultra-initial-v2-0-a3df1e09b0af@linaro.org>
In-Reply-To: <20221031-b4-odroid-go-ultra-initial-v2-0-a3df1e09b0af@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Sebastian Reichel <sre@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-pm@vger.kernel.org, Rob Herring <robh@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_075013_037883_B736A0F6 
X-CRM114-Status: UNSURE (   7.01  )
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

VGhpcyBkb2N1bWVudHMgdGhlIE9kcm9pZCBHbyBVbHRyYSwgYSBwb3J0YWJsZSBnYW1pbmcgZGV2
aWNlLAp3aXRoIHRoZSBmb2xsb3dpbmcgY2hhcmFjdGVyaXN0aWNzOgotIEFtbG9naWMgUzkyMlgg
U29DCi0gUks4MTcgJiBSSzgxOCBQTUlDcwotIDJHaUIgTFBERFI0Ci0gT24gYm9hcmQgMTZHaUIg
ZU1NQwotIE1pY3JvIFNEIENhcmQgc2xvdAotIDVpbmNoIDg1NMOXNDgwIE1JUEktRFNJIFRGVCBM
Q0QKLSBFYXJwaG9uZSBzdGVyZW8gamFjaywgMC41V2F0dCA4zqkgTW9ubyBzcGVha2VyCi0gTGkt
UG9seW1lciAzLjdWLzQwMDBtQWggQmF0dGVyeQotIFVTQi1BIDIuMCBIb3N0IENvbm5lY3Rvcgot
IHgxNiBHUElPIElucHV0IEJ1dHRvbnMKLSAyeCBBREMgQW5hbG9nIEpveXN0aWNrcwotIFVTQi1D
IFBvcnQgZm9yIFVTQjIgRGV2aWNlIGFuZCBDaGFyZ2luZwoKU2lnbmVkLW9mZi1ieTogTmVpbCBB
cm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+CkFja2VkLWJ5OiBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9hcm0vYW1sb2dpYy55YW1sIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykK
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9n
aWMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYW1sb2dpYy55
YW1sCmluZGV4IDlmZGEyNDM2YzYxOC4uZTE2YjVmYTU1ODQ3IDEwMDY0NAotLS0gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbAorKysgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FtbG9naWMueWFtbApAQCAtMTYzLDYgKzE2
Myw3IEBAIHByb3BlcnRpZXM6CiAgICAgICAgICAgICAgIC0gYXp3LGdza2luZy14CiAgICAgICAg
ICAgICAgIC0gYXp3LGd0a2luZwogICAgICAgICAgICAgICAtIGF6dyxndGtpbmctcHJvCisgICAg
ICAgICAgICAgIC0gaGFyZGtlcm5lbCxvZHJvaWQtZ28tdWx0cmEKICAgICAgICAgICAgICAgLSBo
YXJka2VybmVsLG9kcm9pZC1uMgogICAgICAgICAgICAgICAtIGhhcmRrZXJuZWwsb2Ryb2lkLW4y
LXBsdXMKICAgICAgICAgICAgICAgLSBraGFkYXMsdmltMwoKLS0gCmI0IDAuMTAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
