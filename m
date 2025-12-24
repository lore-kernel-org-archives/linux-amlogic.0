Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4915EE7849A
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Dec 2025 23:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ztpjUEKFFmalFprkEMTdOUEwHuWqK9K8/lscW6yX0E=; b=ZRRTYaKn0wichn
	MJR6ZfHkStEdGOl61YvltMKFDiL3CTO2PIxpAbPWcce3K0qWkIomdHnDGJ7EGQMlaQimywKxBVNHm
	/h2OPdBR20PaZXjf/5n7qe2taSIfpIDrzpk/SA6+gDnLmyiDg8KxisgdJTlke+/Hlr39/Ul2XLH3d
	8bXnSxGoyVQ3rQC0BmVZgYbiQZjVZGWhtC7vo17HUmO3zjTw+L17oFXYUDCa7ImBtAOtxB1BBudNe
	6MtjqvcmACGNu4BKHunxgGNPpOJRFyO3quopnjab+EbPMbc4kJILqlYy1guLvh9WEwclkI80Az9zh
	cEEy/sQ1v29k+rgcSoFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYY5H-0000000HUHs-2rL7;
	Wed, 24 Dec 2025 23:15:59 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYY5F-0000000HUGr-00aS
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Dec 2025 23:15:58 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2a099233e8dso52515085ad.3
        for <linux-amlogic@lists.infradead.org>; Wed, 24 Dec 2025 15:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766618156; x=1767222956; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMksNBI4okirn91dF+40cWo6VsIqz/Y3+k9t7y0NYw0=;
        b=jn3SrlAIUkMWC+ARIi+rw1LJljdGqv9D2Z9Nw471d1/PHlrHnej6c6cWXyfNCRkbuR
         /My3kt65rZiYXeXVzntxrZrAeJHhEZkU8YCSbF1tfYBCI2/WGDdWQXIY26aPEQwG8eXx
         CxssXQwpVzKf5fUlKfaDoNEG1+jGSoaeASPuYkbL9SiOxt3iJKpanoFKv4JkJv9lYRX6
         auZNnxmwHcg8tN+2upiGsvjwjvuv99ZRNiw4nLzTrTiNKWcIET6QU2cEliF4hWAoZqTp
         giL2rx0/V0q1b5HAKm/BVg8IVRnNusVuKmy2+b7H55QuSy1XheZ5/SMSw03Hi9kRJJTh
         VzRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766618156; x=1767222956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kMksNBI4okirn91dF+40cWo6VsIqz/Y3+k9t7y0NYw0=;
        b=muOGK5AQdU2LyR9xOYxykGs93TU/82gBFB7s1oJTAdphJdoeb/ebxFgMnwm92c1w+V
         EXdmXLMSSrTSdpuQudnwxWtUTCSYGWzonE8Y2JIlqD1VWIbXH/xlWU/nj3h+24ygAi5/
         vYwwuu1O0gAN6bxo8KV9pRFg51uNHJkVCBGnXdYRKvFb1Y9oQih+uDPmyCPWPIB5Sx/Z
         k4QrgSNxuGemw1ysrYeIn0c4HN/XIBr34bW5Wl3qoLRnwOqXnBEkKXQGqHO8BAO81j+U
         cOO/OWHqbJIoBhA/I7bcwKv4cdmToaDQ7CvUSLvDe77dmF4PAcrBtTQXVP8U/F8bke9l
         Yycg==
X-Forwarded-Encrypted: i=1; AJvYcCXFWxdwcQOkpg+jPI0haqgyaeFEcZlJVHf4dT3hEPNXJktahFFXb9KmjNvVwexHxH5Z8IvKKWB32bmffmjE@lists.infradead.org
X-Gm-Message-State: AOJu0YwBKZ+kLWZ3B02N7LCXlk+hFbFrjwIA6J7edSmlX9cWzkjB0M0F
	iLbY1soaeAZOjv2BR81PCIVC3aLJjO0dl/p+WRmXxujfSg0jdhLTGfdabnBgmRHUmn6aLxY+DYn
	h0HM7KF54vxyDc6YEpdlM4dhkaYi08xw=
X-Gm-Gg: AY/fxX7LZCTBSkubgGiMyDIVym7JOVThFJK8zdRsAvKu1G6BKHb8foimzPOim4Wm/O/
	UHnZHE1zMViu8JyflZRO7YgI6N1nZJe5Q8Zxe92PMrzoT595YPg0hjAs1zJS2nkRx6hZqW7EU1s
	CFIOzdf2xscJ6nNmyDWvH1Kesl7nf+AOZnhoQXcMqN50hBEkphqsl7GKOGJ3uES5seQj89Bd2da
	KSHqJAOHF3Jk+GUv/Uk/zafbutGB63rHwyvhMT5Z41mIaagJ6j2m44lLwD7gbrCVY1lq8J9ATO4
	1YrSnU8IfMNro2iGIxxsuY7N5/vX
X-Google-Smtp-Source: AGHT+IGimQCF7uDiWcIkQf5ZGHJsugq8yU99cywmoPn2usoL23Cf1mdn7HpaxV2mzn+gUNIWI2A4OkqUcmfvAbx8uk4=
X-Received: by 2002:a17:903:2308:b0:295:5668:2f27 with SMTP id
 d9443c01a7336-2a2f2205789mr144409705ad.9.1766618155975; Wed, 24 Dec 2025
 15:15:55 -0800 (PST)
MIME-Version: 1.0
References: <20251223-reset-s6-s7-s7d-v2-0-958f341449f1@amlogic.com> <20251223-reset-s6-s7-s7d-v2-3-958f341449f1@amlogic.com>
In-Reply-To: <20251223-reset-s6-s7-s7d-v2-3-958f341449f1@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 25 Dec 2025 00:15:45 +0100
X-Gm-Features: AQt7F2r2xC2wIc6GvAUS4OY-EHPUACvAJXV_sv-Et3PrOio9vmU4SqQg3y8gAnc
Message-ID: <CAFBinCBQbpsqujgU2_xqy-=ZmPww8AbXq7Gy9ih23TmOzZNTOQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: amlogic: Add S7 Reset Controller
To: xianwei.zhao@amlogic.com
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_151557_035940_DFBEF077 
X-CRM114-Status: UNSURE (   6.18  )
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

T24gVHVlLCBEZWMgMjMsIDIwMjUgYXQgNjozN+KAr0FNIFhpYW53ZWkgWmhhbyB2aWEgQjQgUmVs
YXkKPGRldm51bGwreGlhbndlaS56aGFvLmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgo+
Cj4gRnJvbTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9AYW1sb2dpYy5jb20+Cj4KPiBBZGQg
dGhlIGRldmljZSBub2RlIGFuZCByZWxhdGVkIGhlYWRlciBmaWxlIGZvciBBbWxvZ2ljCj4gUzcg
cmVzZXQgY29udHJvbGxlci4KPgo+IFNpZ25lZC1vZmYtYnk6IFhpYW53ZWkgWmhhbyA8eGlhbndl
aS56aGFvQGFtbG9naWMuY29tPgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFy
dGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
