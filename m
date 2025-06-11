Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC091C677C4
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Jun 2025 16:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1It7nmUkhBGA6XsX1zzNxWLzbX9u49hmgSVSDTz1Q8M=; b=jKQp0OIIbe0Bx5
	VkmrNFUCDX5KnBxuNkDPFTUYg4nfwryY9H2rddkuOhodOZgoEY5h5p1J97Nhji/TZkh4XXOkw5e8h
	tWRkmQ51TlV4M8gzDfaJ/9qdT6sz9SxpXKtBtSU/fDK9jmVvpL591T4Bop1TiLhH9oItM2GS1PxhR
	M5I56E/lSXL2Ox1ZhLr64U39Q+2ZUPIrEm8sd3Rgj3Avi17hAmHIlkFinYPnrNKKPazPdAIDeF9t+
	8sp3IVgJ7gdMgbcVrzeJ3fbBcuJXNGNvOcsU17CcAalHnDlsD8+UIv3wO5e8DlCMMdydVyW9595WL
	/k7vQ/ttrASzRYQ+e1oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNzV-0000000AYDG-0UCG;
	Wed, 11 Jun 2025 16:07:53 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKy9-00000009t7k-1IQ4
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Jun 2025 12:54:20 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-451d7b50815so58048715e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Jun 2025 05:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749646456; x=1750251256; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1Cool/KkGodX8Z3AKXl7cQge0BzoVtk/glY1zU+OpQ=;
        b=0KaHEqNUlQlmcibJrX6TywoGlW+wDGwzmIVy/wa2slf5yOL3UtDWxim33swZEScgng
         s2uSQ9O729KQR6xG8jCDvOn0P0JtCVeoEsX96LK/0c4xr7YDe4l14gejPgy0epgpvUcL
         +4S8CqQFjDy3y56rCg9pKq3R4J4V9FFr3AGc3V83L0gA0hcyZU4mdY8TNudc7KQ3azrz
         Eb/ugmOByslNqxbiFFZ4eN/960AACwBZ3d8KeuZE7KA9lr+L44pDDt4bEvTGqvUbLz1g
         O8SGewUo/IQ7strxv0Mv4vBVR1Jy9UbLHvxNFkRB7HEMsQ2cE5x0SsHl530cfkTMcE1p
         czuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646456; x=1750251256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1Cool/KkGodX8Z3AKXl7cQge0BzoVtk/glY1zU+OpQ=;
        b=X63T8tbXkPNVNBDx3MLDSTYsihMVmghGP27vuGACXh5xEgBhuV6D/TdvncYvyx03Yw
         geUFbZwKX4c8pnyynzRSlSi6lsgII11DzeB0mSIB3A2jMdSP2OdspZ1eKAeOC96t78Ua
         cUAnVxwrZzy1I8KtOEd4RSxiEBz8z6/+VkcZQe+obHTicwP50RTcBhMXbMArRG7TZBdd
         aBAvsKJMsh+SoXus71NwHHqlidBWly4hOp94p0RcplVbztF/jqgh6hUOOuOr1Ps5S5hp
         KUGq2esdILHNa+YEPPxT/ftFXzrMG8nx1Iz8MTHnV1yVUFqC6dNSPg7QXG7NLtiOpHAj
         yh2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfU8UL3VbwKZIv5+IRkXuk2qAQA1l9pv8ItsJJc4+gEIHvXOrTyA1tAVlXj+ACNCCbRAJOvdb8dCiG04kl@lists.infradead.org
X-Gm-Message-State: AOJu0YyVOKZIHxCDLGYPiXcuXWKbvhR3gNk4w21NIZnJi11fXMWEs0vL
	GC6BoFINvHxA7fpao8x5tqv1ji8eXE6rihxPZrOIM2T5T45GEzizpKt9eQR0bHL2R3k=
X-Gm-Gg: ASbGncsAmnPgm+W3YShhosuug72duXT9QYsJyGiWdJtWx+R8ML/lzVGFsh5pBC5QokY
	vDl4MoVDDh+2RvOo9j1BD3O6J5H7ZmRHx+EAxZ/tGlmGGj3/6Su5diR7evqeTbIbuDrxLhAeiW4
	2HJg3RSySxJGdCdjQahxJfDp91pVqLqbeILnXSPJUQnz2QmiZPlv/YCDmx64RHYOv71Au+oXjuK
	JM7Rcl/dPkbyEA8jGj5HXSWQ4T1q9m6bilqYxeZPy54Q0tYPFntXPkmErqECeXqsoq7Axd9yLCl
	jl3pUiqOAKKXKSsAGckICHmxioXiDW8kIWjeI7gO1evRJtIRUFH4W7735kdZnrmuvwRqygl/3Sx
	lQxJ2GlRs9Jg=
X-Google-Smtp-Source: AGHT+IEndovK5i60dXofmzfCQEmqHj9LiO/Bu6tcHs2EUY63JiHkYLaL474UbWr6R/p7cwzGJjwkKA==
X-Received: by 2002:a05:6000:4202:b0:3a4:c9d4:2fb2 with SMTP id ffacd0b85a97d-3a558aff029mr2487239f8f.46.1749646455662;
        Wed, 11 Jun 2025 05:54:15 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ef3:a82f:ccaa:91b5])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a53245275esm15225486f8f.76.2025.06.11.05.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:54:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 11 Jun 2025 14:53:56 +0200
Subject: [PATCH 1/4] clk: eyeq: use the auxiliary device creation helper
MIME-Version: 1.0
Message-Id: <20250611-clk-aux-v1-1-fb6575ed86a7@baylibre.com>
References: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
In-Reply-To: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3080; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=911xKOJApKviZC+11zfPOxyXIb2TukqSX6c3EVx5nkQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoSXxyS4LF2NgHh6lDt4HtpPg68/w9OJYyIIHRQ
 pbd31+wpYGJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaEl8cgAKCRDm/A8cN/La
 ha5hD/wLniXN/Wdk0lE+moFPoRY5SqMESsaeB9W5MEi4ILxdPOGqiWLOjtZpsU9xfWIUaT0GO8I
 402HkOAnI8/gcBsBz7Xo663TN8FIChB/+plsclM8Yx4h0wjbZGA7O8FWT5mqDZkJ6QAKCtxftz8
 Y9JTHm7P2e4hGrVO+P6xiUkSQj8QZx9CRlcqpXA2JLlWA8t0WY6f3/5Q5ikgkK9AQpxmg3d/SbI
 F4eykgdy83+m7Sar8XsrSvwnbQMQ/eJU5PQewYVOOnkDHjss7jsdCU7aTxJHcD8WrrcnjzrqlSX
 pNybSBpRETU1JpLH9FOuV+dXTP5hBw3WB9whiYRoSWNjOdGuyk52zeSbNbmR1KK4Kp0Qx7kJ4hx
 CNFIDJ8/oBf3MMRjVa8TWO6zYa4ZvuH854db0sOivyrMS6Xxml3if+HpTAqQ6R+McVG0j4sBxec
 OzQ+QOTvaGsyZ/vuvnIT9ymNpzYNW2X4eqZOim4IFhXWs03rm+/9BKSMAj+WpwQT1SKIB2+/BHM
 Z1syPc2I4UnlAheE2uHP1Tkuo6SBUbfIvs3+43BU/e72C0UdNSQ+Ec2aGSdqiR/+Epsi0IZhKcE
 sMWbJC6gfc1WYr4Ua9VFkaoa+EOU2aYylmYQpq0CRPCmNfYsfOKs0KfHY/2e7Z7TAAGyb59FQ36
 LgtNe3dkZbYLE/w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_055417_347730_74A37E7E 
X-CRM114-Status: GOOD (  13.02  )
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

VGhlIGF1eGlsaWFyeSBkZXZpY2UgY3JlYXRpb24gb2YgdGhpcyBkcml2ZXIgaXMgc2ltcGxlIGVu
b3VnaCB0bwp1c2UgdGhlIGF2YWlsYWJsZSBhdXhpbGlhcnkgZGV2aWNlIGNyZWF0aW9uIGhlbHBl
ci4KClVzZSBpdCBhbmQgcmVtb3ZlIHNvbWUgYm9pbGVycGxhdGUgY29kZS4KClRlc3RlZC1ieTog
VGjDqW8gTGVicnVuIDx0aGVvLmxlYnJ1bkBib290bGluLmNvbT4gICMgT24gTW9iaWxleWUgRXll
UTUKU2lnbmVkLW9mZi1ieTogSmVyb21lIEJydW5ldCA8amJydW5ldEBiYXlsaWJyZS5jb20+Ci0t
LQogZHJpdmVycy9jbGsvY2xrLWV5ZXEuYyB8IDU3ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygr
KSwgNDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvY2xrLWV5ZXEuYyBi
L2RyaXZlcnMvY2xrL2Nsay1leWVxLmMKaW5kZXggNjQwYzI1Nzg4NDg3ZjhjZjZmYjQ0MzFlZDZm
YjYxMmNmMDk5ZjExNC4uNDA5NGYzNGFmMDViNDg4NTQ1Y2M4NzA0M2ZiMzM1Mjk2ODUxNWE3OCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9jbGsvY2xrLWV5ZXEuYworKysgYi9kcml2ZXJzL2Nsay9jbGst
ZXllcS5jCkBAIC0zMjIsMzggKzMyMiwxOCBAQCBzdGF0aWMgdm9pZCBlcWNfcHJvYmVfaW5pdF9m
aXhlZF9mYWN0b3JzKHN0cnVjdCBkZXZpY2UgKmRldiwKIAl9CiB9CiAKLXN0YXRpYyB2b2lkIGVx
Y19hdXhkZXZfcmVsZWFzZShzdHJ1Y3QgZGV2aWNlICpkZXYpCi17Ci0Jc3RydWN0IGF1eGlsaWFy
eV9kZXZpY2UgKmFkZXYgPSB0b19hdXhpbGlhcnlfZGV2KGRldik7Ci0KLQlrZnJlZShhZGV2KTsK
LX0KLQotc3RhdGljIGludCBlcWNfYXV4ZGV2X2NyZWF0ZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHZv
aWQgX19pb21lbSAqYmFzZSwKLQkJCSAgICAgY29uc3QgY2hhciAqbmFtZSwgdTMyIGlkKQorc3Rh
dGljIHZvaWQgZXFjX2F1eGRldl9jcmVhdGVfb3B0aW9uYWwoc3RydWN0IGRldmljZSAqZGV2LCB2
b2lkIF9faW9tZW0gKmJhc2UsCisJCQkJICAgICAgIGNvbnN0IGNoYXIgKm5hbWUpCiB7CiAJc3Ry
dWN0IGF1eGlsaWFyeV9kZXZpY2UgKmFkZXY7Ci0JaW50IHJldDsKLQotCWFkZXYgPSBremFsbG9j
KHNpemVvZigqYWRldiksIEdGUF9LRVJORUwpOwotCWlmICghYWRldikKLQkJcmV0dXJuIC1FTk9N
RU07Ci0KLQlhZGV2LT5uYW1lID0gbmFtZTsKLQlhZGV2LT5kZXYucGFyZW50ID0gZGV2OwotCWFk
ZXYtPmRldi5wbGF0Zm9ybV9kYXRhID0gKHZvaWQgX19mb3JjZSAqKWJhc2U7Ci0JYWRldi0+ZGV2
LnJlbGVhc2UgPSBlcWNfYXV4ZGV2X3JlbGVhc2U7Ci0JYWRldi0+aWQgPSBpZDsKIAotCXJldCA9
IGF1eGlsaWFyeV9kZXZpY2VfaW5pdChhZGV2KTsKLQlpZiAocmV0KQotCQlyZXR1cm4gcmV0Owot
Ci0JcmV0ID0gYXV4aWxpYXJ5X2RldmljZV9hZGQoYWRldik7Ci0JaWYgKHJldCkKLQkJYXV4aWxp
YXJ5X2RldmljZV91bmluaXQoYWRldik7Ci0KLQlyZXR1cm4gcmV0OworCWlmIChuYW1lKSB7CisJ
CWFkZXYgPSBkZXZtX2F1eGlsaWFyeV9kZXZpY2VfY3JlYXRlKGRldiwgbmFtZSwKKwkJCQkJCSAg
ICAodm9pZCBfX2ZvcmNlICopYmFzZSk7CisJCWlmICghYWRldikKKwkJCWRldl93YXJuKGRldiwg
ImZhaWxlZCBjcmVhdGluZyBhdXhpbGlhcnkgZGV2aWNlICVzLiVzXG4iLAorCQkJCSBLQlVJTERf
TU9ETkFNRSwgbmFtZSk7CisJfQogfQogCiBzdGF0aWMgaW50IGVxY19wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQpAQCAtMzY1LDcgKzM0NSw2IEBAIHN0YXRpYyBpbnQgZXFjX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJdW5zaWduZWQgaW50IGksIGNsa19j
b3VudDsKIAlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsKIAl2b2lkIF9faW9tZW0gKmJhc2U7Ci0JaW50
IHJldDsKIAogCWRhdGEgPSBkZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsKIAlpZiAoIWRhdGEp
CkBAIC0zNzksMjEgKzM1OCw5IEBAIHN0YXRpYyBpbnQgZXFjX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCiAJaWYgKCFiYXNlKQogCQlyZXR1cm4gLUVOT01FTTsKIAotCS8qIElu
aXQgb3B0aW9uYWwgcmVzZXQgYXV4aWxpYXJ5IGRldmljZS4gKi8KLQlpZiAoZGF0YS0+cmVzZXRf
YXV4ZGV2X25hbWUpIHsKLQkJcmV0ID0gZXFjX2F1eGRldl9jcmVhdGUoZGV2LCBiYXNlLCBkYXRh
LT5yZXNldF9hdXhkZXZfbmFtZSwgMCk7Ci0JCWlmIChyZXQpCi0JCQlkZXZfd2FybihkZXYsICJm
YWlsZWQgY3JlYXRpbmcgYXV4aWxpYXJ5IGRldmljZSAlcy4lczogJWRcbiIsCi0JCQkJIEtCVUlM
RF9NT0ROQU1FLCBkYXRhLT5yZXNldF9hdXhkZXZfbmFtZSwgcmV0KTsKLQl9Ci0KLQkvKiBJbml0
IG9wdGlvbmFsIHBpbmN0cmwgYXV4aWxpYXJ5IGRldmljZS4gKi8KLQlpZiAoZGF0YS0+cGluY3Ry
bF9hdXhkZXZfbmFtZSkgewotCQlyZXQgPSBlcWNfYXV4ZGV2X2NyZWF0ZShkZXYsIGJhc2UsIGRh
dGEtPnBpbmN0cmxfYXV4ZGV2X25hbWUsIDApOwotCQlpZiAocmV0KQotCQkJZGV2X3dhcm4oZGV2
LCAiZmFpbGVkIGNyZWF0aW5nIGF1eGlsaWFyeSBkZXZpY2UgJXMuJXM6ICVkXG4iLAotCQkJCSBL
QlVJTERfTU9ETkFNRSwgZGF0YS0+cGluY3RybF9hdXhkZXZfbmFtZSwgcmV0KTsKLQl9CisJLyog
SW5pdCBvcHRpb25hbCBhdXhpbGlhcnkgZGV2aWNlcy4gKi8KKwllcWNfYXV4ZGV2X2NyZWF0ZV9v
cHRpb25hbChkZXYsIGJhc2UsIGRhdGEtPnJlc2V0X2F1eGRldl9uYW1lKTsKKwllcWNfYXV4ZGV2
X2NyZWF0ZV9vcHRpb25hbChkZXYsIGJhc2UsIGRhdGEtPnBpbmN0cmxfYXV4ZGV2X25hbWUpOwog
CiAJaWYgKGRhdGEtPnBsbF9jb3VudCArIGRhdGEtPmRpdl9jb3VudCArIGRhdGEtPmZpeGVkX2Zh
Y3Rvcl9jb3VudCA9PSAwKQogCQlyZXR1cm4gMDsgLyogWmVybyBjbG9ja3MsIHdlIGFyZSBkb25l
LiAqLwoKLS0gCjIuNDcuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
