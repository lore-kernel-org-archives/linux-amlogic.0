Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAA8C5B552
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Jun 2025 12:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TBziOBo1uDuQbI6yQO9LHI85Hr1RJfT2xahaiXUGaQw=; b=CMkFI+hsqVhwtc
	TS6x4c6VO20mD0F+d2OZ5wJ1mCxJcF6iutvm0LuycE6Kql1iVsr0Xy/6unkTtRvLASA0OJNYIr4bv
	k43byGrdRxWJOCCNU5FpcV9+uEhsReJFS2j5JP3FeZbh5c+JkG2yi1Hxpwaf/5OvW18blZ5tdgX4D
	Z5WzWSSqq7fAjTbKAq1GPaw49qXWIrlNZUMUybWUgEnwVjMvZWMMeZcaTTn4slhpGO/KyD/6v9aB5
	/nL8PNBNrWlvKp5QwZqZ1jo/IPTn3WwFS/M5aedtNdFmuHzENsQj6hVotWEhOtCcf+mtgA9GTDcI9
	3E9aJrWWb4E4wpDJ8CPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyPz-00000006pnE-2czF;
	Tue, 10 Jun 2025 12:49:31 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxol-00000006jgJ-1oB1
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Jun 2025 12:11:04 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-32adebb15c5so35094571fa.3
        for <linux-amlogic@lists.infradead.org>; Tue, 10 Jun 2025 05:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749557461; x=1750162261; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NOuROJ72i5jBg6IZns7LWWw5bhW6PqP3nknc7q7Xb8=;
        b=IvvANS6V31q4W7579sYFxfiestDtX6W6b6GlHEdAyjxG2YcCKZbp7T/zxWGII/LJzR
         jHVhjJNyeujH08Sm8RANtFUwMVsGRNKBrXL0v7z4tMs3TSxTeXhLDiKxCxmrljuvyDBD
         lLk8gjsxqqP0h/nFT/i6gXbXG3A7Jsfw30O4sXRKyNv/IojRUSbYf3xR8oyYFgVd7M6x
         3YVvalff2fKFXD3ucAACvW5I/Tr0Y9g2pyzYfiuEIL7O8FNaFvrQSQ9uKEkXnhgCmqzI
         oCNJAJ0a4oWq6a3SJragDZFvZhZ/fCi4it6S+kheoJppxqxnYmjTNy79WekebyhDYXJU
         pNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557461; x=1750162261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+NOuROJ72i5jBg6IZns7LWWw5bhW6PqP3nknc7q7Xb8=;
        b=H47X2AZONPDhuGBMkw9G6yXxgEu7I9K1C7buRocxAv/0MhsKZM+o/TVxmHnzpwblqo
         nG4xnvZ2R51b1mIdqTpagLep+LFx+G1r+C9SfucOvQyfQL/8vbKynWkqrAkinGyWdId8
         wm0KwbqZYQYZSWvhGYc6my9/MnPU6ZZf7U5Z3+xXGNVe0laeFqwsvIL6cY/7ZPMCXnh4
         UFOjXEQwW7Uce2YFJ0Xp0eTxSHQtxlPdi7Mv9hzHsu/J+TdSD7UBge8RdegnK1ucn8mi
         S7aCTmcMicCgPndY7+0Je0flNU90n74DwZ72la5gMLjSu0Qy+JltKbGyJSA3ABK47DKD
         Ij7w==
X-Forwarded-Encrypted: i=1; AJvYcCVsHfD966s+uEc4We/K5Zf3vedOAe9NsZNpgmNoMCNiwtRQngTmAn3Lqr/KS01pIXjFV1NbTjVWZU0DUtch@lists.infradead.org
X-Gm-Message-State: AOJu0YwXdiFyXqvmSF1CFMZiVHE/wsF3aDH11pbmOI3iBZYMPN+gWC9f
	jdzqN33eo26f1klhMkbXI4daIJpb6D0VvcsYWZWAGKA+hSNYs4I0sxdph0lGjuGnbP5sYX9Vdll
	AFYLu2vtlYHDc1Mp90Z5PxL0JuSGhYoI2p+tcGerpSw==
X-Gm-Gg: ASbGncutmb+1hUc13ltzN3RUYtpoLnYIASuH42WJZ2dK4jaSzbctkFwnE+a66k36Z5P
	41bYCclhXfoFcUaNdImJSw4NDJwlUa3xJp/3V2cU+Oxzo+DFM3DQQLcnJo0m1ykNfFLQ2VHBdOv
	UnJ6Y9iRcnceo1+jQWx9EDLYKYUIFHj+7U6FQt11kFCJM=
X-Google-Smtp-Source: AGHT+IFOaMh8nguz7KHH0YUJYEvUW0KxuIsZirmTBD11BY3isr05ce1T1ObffoEpspV/AnboQI2h1yWBLpHu5xR5+Ac=
X-Received: by 2002:a05:651c:1545:b0:32a:8bb1:d971 with SMTP id
 38308e7fff4ca-32adfc290f3mr40168071fa.18.1749557461281; Tue, 10 Jun 2025
 05:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250527-s6-s7-pinctrl-v3-0-44f6a0451519@amlogic.com>
In-Reply-To: <20250527-s6-s7-pinctrl-v3-0-44f6a0451519@amlogic.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 14:10:49 +0200
X-Gm-Features: AX0GCFsNvqdvdVYFA3r4z4h1YT4-Cj2REHImr1bxE1u6VG-oVRcj138Ag5WMjho
Message-ID: <CACRpkdacp1YVjrjfGvHu_8Y2hq03LNwG8Yka30xMbTEwtQ_drA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Add support for Amlogic S7/S7D/S6 pinctrl
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_051103_478486_4F780F0E 
X-CRM114-Status: UNSURE (   7.99  )
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

T24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgNzoyM+KAr0FNIFhpYW53ZWkgWmhhbyB2aWEgQjQgUmVs
YXkKPGRldm51bGwreGlhbndlaS56aGFvLmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgoK
PiBYaWFud2VpIFpoYW8gKDYpOgo+ICAgICAgIGR0LWJpbmRpbmdzOiBwaW5jdGw6IGFtbG9naWMs
cGluY3RybC1hNDogQWRkIGNvbXBhdGlibGUgc3RyaW5nIGZvciBTNy9TN0QvUzYKPiAgICAgICBw
aW5jdHJsOiBtZXNvbjogYTQ6IHJlbW92ZSBzcGVjaWFsIGRhdGEgcHJvY2Vzc2luZwo+ICAgICAg
IHBpbmN0cmw6IG1lc29uOiBzdXBwb3J0IGFtbG9naWMgUzYvUzcvUzdEIFNvQwoKSSBoYXZlIGFw
cGxpZWQgdGhlc2UgdGhyZWUgdG8gdGhlIHBpbiBjb250cm9sIHRyZWUgZm9yIHY2LjE3LgoKPiAg
ICAgICBkdHM6IGFybTY0OiBhbWxvZ2ljOiBhZGQgUzcgcGluY3RybCBub2RlCj4gICAgICAgZHRz
OiBhcm02NDogYW1sb2dpYzogYWRkIFM3RCBwaW5jdHJsIG5vZGUKPiAgICAgICBkdHM6IGFybTY0
OiBhbWxvZ2ljOiBhZGQgUzYgcGluY3RybCBub2RlCgpQbGVhc2UgZnVubmVsIHRoZXNlIHRocm91
Z2ggdGhlIFNvQyB0cmVlIQoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
