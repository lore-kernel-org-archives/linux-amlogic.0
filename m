Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F53DC61DA4
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Mar 2023 11:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IQIzfoXYUm5lbN30bRWN39hhwpyen/6KGKdQRvz9zsM=; b=xEEkj3/avEQlgq
	A61Jfv/bInbmBhKXXwqe//e9Z60bbkEZOUNVQkn/K2Yi9Z0eDWVB/5hDmHOO2t+1h8j9QCVj5v3G2
	S9FVCsxAwBTL/Fuv6YelK0j3lwZjjE2+B9Hq0NpFMHX6jxuRrcbTeGa18/Rr9UX36Gqk6g+DJ3OGW
	wpREXutWS6EZ9SrPxJGa6XdCofr7D/V5uctbdWxOfAALjMwPV+TLZ0aGNc/d93KXoj6Tr6cbjq3GE
	a8jAzqzGf7Jtkq+jxs/x7IcGRGXsBfiBYeriN69+rb38tGrJI2+m0y3/X2A+RxoqU9Nohw0Y5VrLj
	9GNUWjezIB2M8FaOBrfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxFk-000HYR-V8; Sat, 11 Mar 2023 11:19:08 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxBE-000F7j-4y
	for linux-amlogic@lists.infradead.org; Sat, 11 Mar 2023 11:14:29 +0000
Received: by mail-ed1-x52c.google.com with SMTP id x3so30658797edb.10
        for <linux-amlogic@lists.infradead.org>; Sat, 11 Mar 2023 03:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jkK+aVv8SUTMjymiJecRC6TXCtVH+76+bDm9GC9UQrk=;
        b=K7edE7tWndltwpFGVSxRBYG2F8nb06dGAnNa/42uRFz/61/lMloiZvbGZ48mMltNk+
         fYGp3Zjuy1mju0x6UEkRiTjYDzfLGp8KttaySEGSJR1WYvx2MXonW1nXreJ+rbnrCTvt
         1ax2FXLUzKafaWjDC5dX9oRP78UpLJyH23DOtLG9fSMYzsZBNh5b6i3ug51FTnZ4sUA7
         DtPtyJUpb21XDXRbrvwfHDY4HKex1EyshLTXoo4r+K2gzIWmt9qJJCcu6kIBssbYsIku
         VQ8p49pce63gC0BeKCQKgQ1u6JbvEpeof+UZ10IRKkMKLNxbFMZ0G4NaIpZAVhY/DZi0
         LR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jkK+aVv8SUTMjymiJecRC6TXCtVH+76+bDm9GC9UQrk=;
        b=sUEYuKs4rD/LKrJYI9ggks2L+Cl6ElnJqAnREaXcIOLnROU/wO4xFa/GbDZBpMhwAb
         GgJxi8mM0yWCjClIMyp7FkJd5Otn1blJfd3PIdrsbo0NSRfLPHKPxgt++Hv1R8mooqDY
         v1J5g77uVYxTtwQIsYEXE7xg2CBFmfzYgpyoQazwsThvE4COcHRu8cA3MramKe9pzrvP
         hnGgIzfWn3EddjZskdSjxs4sd8BlU+sYhiht+XuHxkKQcv8CKKTdNEuzvGla/QHdY7J+
         DtJGj0hKho6ymm38qdtlsfuZQUPa4F1gxvCPJ3R0yNTcUsPSP0iFlILjqRE67QqHqHpf
         niRw==
X-Gm-Message-State: AO0yUKVCl0wmIIjQ/36/iUO9tCQ8TZDw+2VSaR08gk3ZQ3lSl9jlXI80
	u4lLpNnlbPMshWAbSf54qFnnHs7YtUTf86U2vok=
X-Google-Smtp-Source: AK7set82nKL+Nh95hV4nsmijhkjFpC13c42M0w/eHSyxRRHrP5cTuoDkRJpqlc/pYCR8F52ArGxLhg==
X-Received: by 2002:a17:907:6eab:b0:7c0:efb9:bc0e with SMTP id sh43-20020a1709076eab00b007c0efb9bc0emr36972296ejc.62.1678533267663;
        Sat, 11 Mar 2023 03:14:27 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id w15-20020a50c44f000000b004bf28bfc9absm1063041edf.11.2023.03.11.03.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:14:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] irqchip: meson-gpio: mark OF related data as maybe unused
Date: Sat, 11 Mar 2023 12:14:23 +0100
Message-Id: <20230311111423.251383-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_031428_276797_19ECFCAC 
X-CRM114-Status: GOOD (  11.22  )
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

VGhlIGRyaXZlciBjYW4gYmUgY29tcGlsZSB0ZXN0ZWQgd2l0aCAhQ09ORklHX09GIG1ha2luZyBj
ZXJ0YWluIGRhdGEKdW51c2VkOgoKICBkcml2ZXJzL2lycWNoaXAvaXJxLW1lc29uLWdwaW8uYzox
NTM6MzQ6IGVycm9yOiDigJhtZXNvbl9pcnFfZ3Bpb19tYXRjaGVz4oCZIGRlZmluZWQgYnV0IG5v
dCB1c2VkIFstV2Vycm9yPXVudXNlZC1jb25zdC12YXJpYWJsZT1dCgpTaWduZWQtb2ZmLWJ5OiBL
cnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+Ci0tLQog
ZHJpdmVycy9pcnFjaGlwL2lycS1tZXNvbi1ncGlvLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNo
aXAvaXJxLW1lc29uLWdwaW8uYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtbWVzb24tZ3Bpby5jCmlu
ZGV4IDJhYWE5YWFkM2U4Ny4uN2RhMThlZjk1MjExIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lycWNo
aXAvaXJxLW1lc29uLWdwaW8uYworKysgYi9kcml2ZXJzL2lycWNoaXAvaXJxLW1lc29uLWdwaW8u
YwpAQCAtMTUwLDcgKzE1MCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbWVzb25fZ3Bpb19pcnFf
cGFyYW1zIHM0X3BhcmFtcyA9IHsKIAlJTklUX01FU09OX1M0X0NPTU1PTl9EQVRBKDgyKQogfTsK
IAotc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbWVzb25faXJxX2dwaW9fbWF0Y2hl
c1tdID0geworc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbWVzb25faXJxX2dwaW9f
bWF0Y2hlc1tdIF9fbWF5YmVfdW51c2VkID0gewogCXsgLmNvbXBhdGlibGUgPSAiYW1sb2dpYyxt
ZXNvbjgtZ3Bpby1pbnRjIiwgLmRhdGEgPSAmbWVzb244X3BhcmFtcyB9LAogCXsgLmNvbXBhdGli
bGUgPSAiYW1sb2dpYyxtZXNvbjhiLWdwaW8taW50YyIsIC5kYXRhID0gJm1lc29uOGJfcGFyYW1z
IH0sCiAJeyAuY29tcGF0aWJsZSA9ICJhbWxvZ2ljLG1lc29uLWd4YmItZ3Bpby1pbnRjIiwgLmRh
dGEgPSAmZ3hiYl9wYXJhbXMgfSwKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
