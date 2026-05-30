Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39291CD5BD0
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 May 2026 09:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e+8ivhn2OGnXmUGVqgv4FW0+naJ2k4tjtPYN+SVvqbE=; b=hsyqIj9FbY22Ze
	rza7ZYGlmNlaO+RzsXIS7x7Te4hGWciJsmGNX2oaZI9/SYSdnkVIuOX94GD07wmnh4MmW8WwqkC2m
	S74B3gdPBUplcQHDL1FM1KQozYBgJlwCn4dxvdxxEG2T2bsyLewzZIw75qMJODd1gs2K3VMesVpyH
	OjyAgyhubBd36VcN9FgU2B0uECMBOQDxayl+pdUgFcq1Gx/fR3d2ZD/w3J1hT/ycf58l9yUvr6T1H
	fkKlKANEGrurYnYkqDQQ5N7UsVnDvtzK+WZJsFN1elJCAiWwPDXE4TCCtEvSFJkjumfYElT0P19nI
	xWw/Pw5aPKulnADVfgNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGFB-00000008afc-2xRt;
	Sat, 30 May 2026 09:44:37 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTGF7-00000008adV-2Se0
	for linux-amlogic@lists.infradead.org;
	Sat, 30 May 2026 09:44:35 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3664df32e91so16316470a91.3
        for <linux-amlogic@lists.infradead.org>; Sat, 30 May 2026 02:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780134273; x=1780739073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrXJFZmxeXg5CYXAWJIPwYaWF/wPAlGFj3atI5I4qIQ=;
        b=U6Q8w75qoCmIU9EedTdURKijSunC8ZM5g1tJ8lJo1F5NDPsww15SXhWzdqY2pk7Lge
         zQPiwx4nHXTS2DDf5Ktn2iCCC5TLOyEziKkgPxyMMihMrw/wE2+IjhlS1Bjowf9te/2D
         Wo17HCoBQvUFhbmZVF84Hu52tMz/HfThuf1MRqCw8draw6mgPTDF/HQb7j49BlqVfnrE
         zOzkVp5ORzOVZDFwW+/GvJD+rRSJyeiO/hs0kvaDs2gZQcAMs1Epw9Ecc+RxHnTW0zgs
         HvUH2CsQvOOMxmeWuHjEGasdpvo+B4tZatzCsym6EUOxk4CLVfxafGx4lXLzSPFgwi8K
         RD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780134273; x=1780739073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BrXJFZmxeXg5CYXAWJIPwYaWF/wPAlGFj3atI5I4qIQ=;
        b=Cl0PqKWR/l3kGr6C/jiiU0ezdEnzmHd7CMPvYJN+W/ATvdVoSW0UBrgkm2i7zZ1gcp
         nwRiCO/4QBVh8Wc0s9uOKMBvYTfKfOxOY4Mnc9Tj/Ld4Ltaha+A5R4jJgFFGfqJIcNWL
         4SU+tXlgF+4OYTqzoPslP7UZL7Cxm1ZjOwpnwgVW/bdYotov2yFkzBrfQnHfsmnewRql
         AwSTJLP1SXUJncsCzjKQwrO4ly17qKXuIkruoi28NRTFTqOfOszMK4EZGr8PWl+Oj4cO
         OMvDykbK0bYH4m42Ekt1cP2VTHFd8Lr52wmXhbSWY/8tJ7eBL7zzDs0mh1IBBRe1lNUv
         3UJA==
X-Forwarded-Encrypted: i=1; AFNElJ9mdpa2OAMezmV+lHRe6SHYdc1HSm+N4KzXxKll5URCqI20hsJGuXlhHKtfmxoRa2PZhuBsW/Ql+jlmc2Q9@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1fg6wXFXvJhhTpbGkhtN7MstK6Hy2La16qdLBL6RelkDmEVbW
	0OCRpm0l7UKBaPNa8CexyTEyQSKm/a1lK2io5WVTrUlhRaWAyc+GCjqU
X-Gm-Gg: Acq92OF95Y+3YP0sWM6uJJv5Ww4oFfWNg49qYxYsSFAjgI4frrM9rgfFoFbbkZqO+SW
	40uR0qgH87oNLa8DAqXSkdSe+kyXmhfcEwjPeXHeZBOeaB+nUEwkd+w1CSsWYI49M9C4J4ko302
	Avg/CaE/4BxZoNhL2KnTuYSaWZG9jt+g/M5kO2Sm9HvBvxs+W9sDOrO7gIR+5nrIyfcaiB4oHEd
	CCWMnfyXjRjiJ5jT9DLV5l8sgZ6j4+DL6BjXUTm9ICuVDxEIjoiUZkZK6tG/z2lDaMosUUXxrtk
	ja8IFLHv3Tu71qjqgQd3YKLstP6XM57rWzOCCe3hsju7luXTODR42DLBj0DcOsKNg95Cf2Z+PNW
	IBt1RuBmM1dtLUjwkf8XZc6tVfi8mPHxh197W2lKEQH9UJcnt6rNVoBrnBMU6h8ey/TJhyAWxzu
	XTUoiJzYj5nDucDbja/2u1IZ47uoVH5Q0=
X-Received: by 2002:a17:902:da8e:b0:2bf:356f:4e0c with SMTP id d9443c01a7336-2bf36793916mr38435335ad.1.1780134272635;
        Sat, 30 May 2026 02:44:32 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.191])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e700csm61529945ad.10.2026.05.30.02.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 02:44:31 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH v6 3/8] media: meson: vdec: Handle kthread failure and free codec state
Date: Sat, 30 May 2026 15:12:49 +0530
Message-ID: <20260530094326.11892-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260530094326.11892-1-linux.amoon@gmail.com>
References: <20260530094326.11892-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_024433_632757_85DB3D38 
X-CRM114-Status: GOOD (  17.06  )
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
Cc: Sashiko <sashiko-bot@kernel.org>, Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

dmRlY19zdGFydF9zdHJlYW1pbmcoKSBsYXVuY2hlcyBhIHJlY3ljbGUgdGhyZWFkIHdoZW4gcmVx
dWlyZWQgYnkgdGhlCmNvZGVjLiBJZiBrdGhyZWFkX3J1bigpIGZhaWxzLCB0aGUgcHJldmlvdXMg
ZXJyb3IgcGF0aCBvbmx5IHBvd2VyZWQgb2ZmCnRoZSBoYXJkd2FyZSwgbGVhdmluZyBzZXNzLT5w
cml2IGFuZCBjb2RlYyBzdGF0ZSBhbGxvY2F0ZWQuIFRoaXMgY2F1c2VkCmEgcGVybWFuZW50IGxl
YWsgb2YgdGhlIGNvZGVjIGNvbnRleHQgYW5kIGFzc29jaWF0ZWQgRE1BIGJ1ZmZlcnMuCgpGaXgg
dGhpcyBieSBpbnRyb2R1Y2luZyBhIGRlZGljYXRlZCBlcnJfY2xlYW51cCBwYXRoOgoKLSBDYWxs
IGNvZGVjX29wcy0+c3RvcCgpIHRvIHJlbGVhc2UgdGhlIGNvZGVjIGNvbnRleHQgYW5kIGNsZWFy
IHNlc3MtPnByaXYuCi0gUG93ZXIgb2ZmIHRoZSBoYXJkd2FyZSBiZWZvcmUgZnJlZWluZyBidWZm
ZXJzIHRvIGF2b2lkIERNQSBmYXVsdHMuCi0gRnJlZSBjYW52YXMgSURzIGV4cGxpY2l0bHkgYW5k
IHNldCBzZXNzLT52aWZpZm9fdmFkZHIgPSBOVUxMIGFmdGVyCiAgZG1hX2ZyZWVfY29oZXJlbnQo
KSB0byBndWFyZCBhZ2FpbnN0IGRvdWJsZeKAkWZyZWUgaW4gZmFsbGJhY2sgc3RvcCBwYXRocy4K
LSBSZXNldCBjb3JlLT5jdXJfc2VzcyBhbmQgc2Vzcy0+c3RhdHVzIHRvIHByZXZlbnQgc3RhbGUg
cmVmZXJlbmNlcy4KCkZvbGxvd2luZyBjaGFuZ2UgY2xvc2VzIHRoZSBtZW1vcnkgbGVhayBvbiBr
dGhyZWFkX3J1bigpIGZhaWx1cmUgYW5kIGVuc3VyZXMKcm9idXN0IGNsZWFudXAgb2YgY29kZWMg
cmVzb3VyY2VzIGluIGJvdGggZXJyb3IgYW5kIHN0b3AgcGF0aHMuCgpDYzogTmljb2xhcyBEdWZy
ZXNuZSA8bmljb2xhc0BuZHVmcmVzbmUuY2E+ClJlcG9ydGVkLWJ5OiBTYXNoaWtvIDxzYXNoaWtv
LWJvdEBrZXJuZWwub3JnPgpDbG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2
MDUyMTA5MDk0NC5GMzU0MDFGMDBBM0RAc210cC5rZXJuZWwub3JnLwpGaXhlczogM2U3ZjUxYmQ5
NjA3ICgibWVkaWE6IG1lc29uOiBhZGQgdjRsMiBtMm0gdmlkZW8gZGVjb2RlciBkcml2ZXIiKQpT
aWduZWQtb2ZmLWJ5OiBBbmFuZCBNb29uIDxsaW51eC5hbW9vbkBnbWFpbC5jb20+Ci0tLQogZHJp
dmVycy9zdGFnaW5nL21lZGlhL21lc29uL3ZkZWMvdmRlYy5jIHwgMjYgKysrKysrKysrKysrKysr
KysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL21lZGlhL21lc29uL3ZkZWMvdmRlYy5j
IGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL21lc29uL3ZkZWMvdmRlYy5jCmluZGV4IDcyMzMwMDBl
MjIzMi4uOGE1YmYxYTk2ODMwIDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvbWVz
b24vdmRlYy92ZGVjLmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL21lc29uL3ZkZWMvdmRl
Yy5jCkBAIC0zMiw2ICszMiw4IEBAIHN0cnVjdCBkdW1teV9idWYgewogLyogMTYgTWlCIGZvciBw
YXJzZWQgYml0c3RyZWFtIHN3YXAgZXhjaGFuZ2UgKi8KICNkZWZpbmUgU0laRV9WSUZJRk8gU1pf
MTZNCiAKK3N0YXRpYyB2b2lkIHZkZWNfZnJlZV9jYW52YXMoc3RydWN0IGFtdmRlY19zZXNzaW9u
ICpzZXNzKTsKKwogc3RhdGljIHUzMiBnZXRfb3V0cHV0X3NpemUodTMyIHdpZHRoLCB1MzIgaGVp
Z2h0KQogewogCXJldHVybiBBTElHTih3aWR0aCAqIGhlaWdodCwgU1pfNjRLKTsKQEAgLTM1Miwx
NiArMzU0LDMxIEBAIHN0YXRpYyBpbnQgdmRlY19zdGFydF9zdHJlYW1pbmcoc3RydWN0IHZiMl9x
dWV1ZSAqcSwgdW5zaWduZWQgaW50IGNvdW50KQogCiAJc2Vzcy0+c2VxdWVuY2VfY2FwID0gMDsK
IAlzZXNzLT5zZXF1ZW5jZV9vdXQgPSAwOwotCWlmICh2ZGVjX2NvZGVjX25lZWRzX3JlY3ljbGUo
c2VzcykpCisJaWYgKHZkZWNfY29kZWNfbmVlZHNfcmVjeWNsZShzZXNzKSkgewogCQlzZXNzLT5y
ZWN5Y2xlX3RocmVhZCA9IGt0aHJlYWRfcnVuKHZkZWNfcmVjeWNsZV90aHJlYWQsIHNlc3MsCiAJ
CQkJCQkgICAidmRlY19yZWN5Y2xlIik7CisJCWlmIChJU19FUlIoc2Vzcy0+cmVjeWNsZV90aHJl
YWQpKSB7CisJCQlyZXQgPSBQVFJfRVJSKHNlc3MtPnJlY3ljbGVfdGhyZWFkKTsKKwkJCXNlc3Mt
PnJlY3ljbGVfdGhyZWFkID0gTlVMTDsKKwkJCWdvdG8gZXJyX2NsZWFudXA7CisJCX0KKwl9CiAK
IAlzY2hlZHVsZV93b3JrKCZzZXNzLT5lc3BhcnNlcl9xdWV1ZV93b3JrKTsKIAlyZXR1cm4gMDsK
IAorZXJyX2NsZWFudXA6CisJdmRlY19mcmVlX2NhbnZhcyhzZXNzKTsKKwl2ZGVjX3Bvd2Vyb2Zm
KHNlc3MpOworCWlmIChjb2RlY19vcHMgJiYgY29kZWNfb3BzLT5zdG9wICYmIHNlc3MtPnByaXYp
IHsKKwkJY29kZWNfb3BzLT5zdG9wKHNlc3MpOworCQlrZnJlZShzZXNzLT5wcml2KTsKKwkJc2Vz
cy0+cHJpdiA9IE5VTEw7CisJfQogdmlmaWZvX2ZyZWU6CiAJZG1hX2ZyZWVfY29oZXJlbnQoc2Vz
cy0+Y29yZS0+ZGV2LCBzZXNzLT52aWZpZm9fc2l6ZSwKIAkJCSAgc2Vzcy0+dmlmaWZvX3ZhZGRy
LCBzZXNzLT52aWZpZm9fcGFkZHIpOworCXNlc3MtPnZpZmlmb192YWRkciA9IE5VTEw7CiBidWZz
X2RvbmU6CiAJbXV0ZXhfbG9jaygmY29yZS0+bG9jayk7CiAJaWYgKGNvcmUtPmN1cl9zZXNzID09
IHNlc3MpCkBAIC00NDEsOCArNDU4LDExIEBAIHN0YXRpYyB2b2lkIHZkZWNfc3RvcF9zdHJlYW1p
bmcoc3RydWN0IHZiMl9xdWV1ZSAqcSkKIAogCQl2ZGVjX3Bvd2Vyb2ZmKHNlc3MpOwogCQl2ZGVj
X2ZyZWVfY2FudmFzKHNlc3MpOwotCQlkbWFfZnJlZV9jb2hlcmVudChzZXNzLT5jb3JlLT5kZXYs
IHNlc3MtPnZpZmlmb19zaXplLAotCQkJCSAgc2Vzcy0+dmlmaWZvX3ZhZGRyLCBzZXNzLT52aWZp
Zm9fcGFkZHIpOworCQlpZiAoc2Vzcy0+dmlmaWZvX3ZhZGRyKSB7CisJCQlkbWFfZnJlZV9jb2hl
cmVudChzZXNzLT5jb3JlLT5kZXYsIHNlc3MtPnZpZmlmb19zaXplLAorCQkJCQkgIHNlc3MtPnZp
Zmlmb192YWRkciwKKwkJCQkJICBzZXNzLT52aWZpZm9fcGFkZHIpOworCQl9CiAJCXZkZWNfcmVz
ZXRfdGltZXN0YW1wcyhzZXNzKTsKIAkJdmRlY19yZXNldF9idWZzX3JlY3ljbGUoc2Vzcyk7CiAJ
CWtmcmVlKHNlc3MtPnByaXYpOwotLSAKMi41MC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgt
YW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
