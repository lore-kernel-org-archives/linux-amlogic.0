Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21BCC71147
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Jun 2025 17:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mfaayAnOeRTrLGPZ555G7XRwl69eF2Q7ygOil4YonLc=; b=WYCKMWU652caFq
	II1aAiYgRS/PcbU891QiUzqsYoy2g2DmcsfpicuNQ+qd2GC0rBTk2r/wHoICzbveYTNyVCE7kmYUN
	7BDrX4kXepR6DsEftVKgBZZ/6LasNCdLGkpCxJDZSMhhlZobLZVEd6KVQdNveym3hFnNlTTG1fLUw
	VmWdnOdPOlK6l5M607eAkm3IacmqvlCpFJ/08mj2gEIS/tNJ04Sg8nFCSKXqjmJZu5LXaZk1VXaQ+
	Wa/dNi/2f/uO999ibpt91RS4LQmKaW4K6Cmg9IZL/8GtFG9clkyzQsqOTWBQAnCei4VTlqf33305Z
	IYEleD57K3ek/EauTKsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPjc-0000000AliT-1JWw;
	Wed, 11 Jun 2025 17:59:36 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKy8-00000009t7h-2mdi
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Jun 2025 12:54:19 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so5396261f8f.2
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Jun 2025 05:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749646455; x=1750251255; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3hcVPfIPjKgnN/jxAK+0iuHy/Mp3frsm9eTH/rmctjg=;
        b=GqMVDYHv8/2gij++vD6nvOdqoBIFxnorkD1+9OnATlwSENMnHYhMn7YaUFgP0zJilp
         P9nqzbKvPK0vLUgNGS1FPkXMjuMD/1OEeNCnkgoEc0RPk8ZNZ2/j1KGu0MpFW5ECaJfR
         aUfUAzdqgfOjtDtCJIe+RX8RjjiHYheqsAVKE58yXZJttlZ2vKInDqYXjG5rgfBrtUzD
         AItAArMmlWwc7po8usNhOHjDgahJNiRmTVI9BanYhfvOiIUkSmi8txLXVoeikTamyhiE
         aiJdlgjaIVc9VKvdzVQcp4JKQ2yuGptcHS5Jx/263R0j1EL6L3WjhhOp6Fu2FtxnGhp1
         5UDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646455; x=1750251255;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3hcVPfIPjKgnN/jxAK+0iuHy/Mp3frsm9eTH/rmctjg=;
        b=ukiMP3pEMQAfaQEAm9rThCTTFIVH1lPzCxlgk5Nz/QHRV+oDao89rQSEimRMV1ji2W
         LkjPvTd0ndxaZg5S8W/dAgGP0Ayj5De8csCyUDnZ+HQBn0mz1G8AWgc2clZz+/SxGno7
         wvtksY6L4aGO3KGcVIeO/Gh5OetoQx0m3hy/wCykqZTRU1kCaXFJuPF+w1DLLRQQP7Sk
         oIXqyPefSJI1X2V5ErY4IuqAbFlLYjRQm8ICghNSgmvxAYFyjajX/sLMStk43/kBxOA6
         cI1ZDmumyWsD3ezTlNCa2pQvKvsclWBZAzof39MHjm3Aotniq1nrL16fcZFgm3m3sKHI
         kqmw==
X-Forwarded-Encrypted: i=1; AJvYcCX7tXecI6iYhYpyctbQloYEkNsPkX2N+VU39M0toAi9SNGitosdO3ekisiPDyG4Y02zBjqx6Hg8pfn6oS6i@lists.infradead.org
X-Gm-Message-State: AOJu0YxsGFWD3n+8DLOgALRnq2d0VecCAPhcK9MiIW8NdEo2Hguxp9DF
	j3Uw4s/MheyPlmzxe7OEbg6WHkIPQw3zt/epAl5qEdCnl8YyO0pAfz9p5VkBX8WUTZA=
X-Gm-Gg: ASbGnct50rRL1MCyBHEABsPDqm9hVg9um7Gov8giAfI5zz/kxRlk5CUtK+kN9OFtWIh
	64AbBYVykLpnqXykg+1CDoOYddYwpUGu9DOOTpEn51JdD/MkIT/4EwcyV/NisRyTMOY+6DWQJEz
	Pt9xJIgcc2wNw5wMCMQAfi6Btp/vh1PlKDzLzqGh80hkxGaXEoYdv9kEePuPsS2FzjzLtIClnxM
	tZ8wBgLZZmwmhzvyO7wEXhaSsGE93Y8T4WVyasSV2xdCNRYUBtM123Z+pE3qCdOhtS2SeVam1Y5
	/RuH+tQ0dDv3rYKzSZC9spDVSTQ9z68Vfxj4nnGWXkwuO0WQZl/xj94hBjHQYP97M0zfLFRhMvn
	T
X-Google-Smtp-Source: AGHT+IGrOsdxa4zJCbGnTi4fEsX+7CHAps/JT+rDRqNsXkWOF1cXauuh0d8YfM1q6aZsNyF7ST0Luw==
X-Received: by 2002:a05:6000:1448:b0:3a4:f52d:8b11 with SMTP id ffacd0b85a97d-3a5586f1905mr2571117f8f.20.1749646454734;
        Wed, 11 Jun 2025 05:54:14 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ef3:a82f:ccaa:91b5])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a53245275esm15225486f8f.76.2025.06.11.05.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:54:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/4] clk: use the auxiliary device creation helper
Date: Wed, 11 Jun 2025 14:53:55 +0200
Message-Id: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGN8SWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0ND3eScbN3E0gpdA0tDs1QDMwvLJMM0JaDqgqLUtMwKsEnRsbW1AFE
 JXr9ZAAAA
X-Change-ID: 20250611-clk-aux-0916e0689b1f
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=MwCg4L2h46PDOS0g7q2n/0TFp7dWTy5pPJdpMQqZbyo=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoSXxt57wn6gj2MMaDJqXctxiVe/tEY4F+6WgSm
 BnehdmmFCqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaEl8bQAKCRDm/A8cN/La
 hV6kD/4mGMjR2Csvf4Ac7+0h9kIkcrt+1BCIsyu7vwlVO5wjBbzWtmF7BE6DQqByhYj1kk2WBcj
 y167kxXU9BFQ41uDY1MCnyPCp3WYUj3c+RR93vorROw+S1ly382yPWEBrE8uhY+rHiiBTrdOwsI
 h/SJbofzfUdCnCYA1Nzj8mbOnR/F0Le8LFdXtcHEjXvHu7tq9YJg64XwjXCQ1NBndkGclowoBQ1
 YXn9L/WM6qXhVilWbeMq4pDMMoE2EKP7gIuj93iNbtuHqqSyTPTJBCbrYCXSVaJ8KOwKRzf/4S9
 KoiKe+nPFlHxM7fCBW65F/BrfxwBqjPhp7epi9iZvqIFg7OlDW69nCy+UogWg1lb62tAIA5lEjT
 kf+omgPU5kR9UgjbG34eKbe30yHput+jherUVzyWZAWJENmL3uEOt4BoTV45navcvdaIBPdJ96W
 8qq8vlmjdnwPqPZDOBj6/tPBre4GYpgxDIwrhlwRiqTrxRKlHe0V8yGGewu5ARh3Zu6oTVZrRCv
 pPJr05s++w6148vJUMNhFcTkuyQpIKBg7Ca+Qyt2Bh0YxKw3m+KF3YCU6Lr14zr6RmYPD1S8pVv
 0+xW+vylPjCd8KSajuG7qkmLX2dzHXoY2NDlPGSG6DcicgVxfEMbtP7apQ358uzjYH1c6uSy0mn
 RNqdkBmE81/FQ+Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_055416_934780_33A852BB 
X-CRM114-Status: UNSURE (   8.44  )
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

VGhpcyBzZXJpZXMgaXMgZXNzZW50aWFsbHkgYSByZXNlbmQgb2YgdGhlIGNsb2NrIHJlbGF0ZWQg
Y2hhbmdlcyBvZiB0aGlzCnNlcmllcyBbMV0gc2VudCBhIGZldyBtb250aHMgYWdvLgoKVGhlIG5l
Y2Vzc2FyeSBhdXhpbGlhcnkgYnVzIHN1cHBvcnQgaGFzIG5vdyBiZWVuIG1lcmdlZCB3aXRoCnY2
LjE2LXJjMSwgc28gdGhpcyBjaGFuZ2Ugc2hvdWxkIGJlIHNhZmUgdG8gYXBwbHkuCgpJJ3ZlIGlu
Y2x1ZGVkIHRoZSByZXNldCBjaGFuZ2UgZnJvbSBUaGVvLiBJdCBoYXMgYmVlbiByZXZpZXdlZCBi
eSBQaGlsaXBwCmFuZCBpdCBpcyBwcm9iYWJseSBiZXN0IGlmIGl0IGNhbiBnbyBhbG9uZyB0aGUg
ZXllcSBjbG9jayBjaGFuZ2UgdG8gYXZvaWQgYQpXQVJOKCkgaW4gcmVzZXQuCgpbMV06IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTAyMTgtYXV4LWRldmljZS1jcmVhdGUtaGVscGVyLXY0
LTAtYzNkN2RmZGVhMmU2QGJheWxpYnJlLmNvbQoKU2lnbmVkLW9mZi1ieTogSmVyb21lIEJydW5l
dCA8amJydW5ldEBiYXlsaWJyZS5jb20+Ci0tLQpKZXJvbWUgQnJ1bmV0ICgzKToKICAgICAgY2xr
OiBleWVxOiB1c2UgdGhlIGF1eGlsaWFyeSBkZXZpY2UgY3JlYXRpb24gaGVscGVyCiAgICAgIGNs
azogY2xrLWlteDhtcC1hdWRpb21peDogdXNlIHRoZSBhdXhpbGlhcnkgZGV2aWNlIGNyZWF0aW9u
IGhlbHBlcgogICAgICBjbGs6IGFtbG9naWM6IGF4Zy1hdWRpbzogdXNlIHRoZSBhdXhpbGlhcnkg
cmVzZXQgZHJpdmVyCgpUaMOpbyBMZWJydW4gKDEpOgogICAgICByZXNldDogZXllcTogZHJvcCBk
ZXZpY2Vfc2V0X29mX25vZGVfZnJvbV9kZXYoKSBkb25lIGJ5IHBhcmVudAoKIGRyaXZlcnMvY2xr
L2Nsay1leWVxLmMgICAgICAgICAgICAgICAgfCAgNTcgKysrKy0tLS0tLS0tLS0tLS0KIGRyaXZl
cnMvY2xrL2lteC9jbGstaW14OG1wLWF1ZGlvbWl4LmMgfCAgNDkgKysrLS0tLS0tLS0tLS0tCiBk
cml2ZXJzL2Nsay9tZXNvbi9LY29uZmlnICAgICAgICAgICAgIHwgICAzICstCiBkcml2ZXJzL2Ns
ay9tZXNvbi9heGctYXVkaW8uYyAgICAgICAgIHwgMTE0ICsrKystLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0KIGRyaXZlcnMvcmVzZXQvcmVzZXQtZXllcS5jICAgICAgICAgICAgfCAgMTMg
Ky0tLQogNSBmaWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCAxOTkgZGVsZXRpb25zKC0p
Ci0tLQpiYXNlLWNvbW1pdDogMTkyNzJiMzdhYTRmODNjYTUyYmRmOWMxNmQ1ZDgxYmRkMTM1NDQ5
NApjaGFuZ2UtaWQ6IDIwMjUwNjExLWNsay1hdXgtMDkxNmUwNjg5YjFmCgpCZXN0IHJlZ2FyZHMs
Ci0tIApKZXJvbWUKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
