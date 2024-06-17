Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8851C2BA15
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ALfFpp8X60qA5ypnYVP9l+58Wle7Hwbf7iKvkpHKJFY=; b=lrmNLwaJk+Gxvq
	XEPFfZ+eE/8npsQgMIbLgDyvZWK4hReFyrNLOo4Vf7Od7uhhUf9IbvKaxBnE6dwjNhfa8BjT67NWo
	M3ApLCdnKymuD3e677Z8VQVhNIP9A51Z3vvTVmfv6vHrGFM9tgfcpHp5T4m9OTO5DbiRZjxqH2mL8
	y+46hLPh8y3+Ndq6OAZFdWPCdUbHlMigROSrH6fyoCTcBqSE8wvjXFVGTQsbpXM8fdtfTg3+mxSIW
	s1gdpi0TBX9baGqbftsxTzFm4aACI/UKbVVdTXdFmUD6bFSOJ1H8o9aa336EbVzVr7kjUhSvNMPLe
	OjBlSqu/KIBJ+MgLxLWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCnq-0000000Azkd-2yc2;
	Mon, 17 Jun 2024 13:53:46 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCl0-0000000AxaR-13VN
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:50:56 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7960454db4fso263137085a.2
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632249; x=1719237049; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qNtak+2SP0bqKcAwBmLBKZAak83BgIl2xc15imfy8nI=;
        b=dJYdIXQcwaia4PmJUecGojjh+N5rp8na86jWvF1PV3RbDV7TuJNvmYUSHfsXJdK24k
         kdluZ0VlU+pFIN7BSwYnuCIYHHvqTGg9DGV05H6vUImPB55Vcv8AeGsaFRW/D0423qwq
         vs9NLxSzy02EHN9LLe71nkm3D4b5JylyPz8K+pTh3UHiuwUpxRNmjuvx5O1NAl75e9hb
         PJlrIzPnuUNqFL2YFB16lXfmEZZWqm6pui+qRGlyo2ykyQf9pgaiCOjpntNkb34fhHaZ
         +qV6pMoBCLZxKO2pSwNhmvPthdQymtCAXEebr7JyLlXXtByB7ur+5KyVjfdYOW+9gaQU
         UhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632249; x=1719237049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNtak+2SP0bqKcAwBmLBKZAak83BgIl2xc15imfy8nI=;
        b=AEOi9BWIqRC+39AX/SeMgk33lERGnyQL2gnfphG3ISJJ5TMFyHoS82dshxdSlnWMcE
         l2A3R8BI0oRBdQmVwWBbYPkIPB9VI4+mBwraV1/75uuKXag50KsqJJN1uIruifRJZ3as
         0ITC71Hj1p6y6tBuU1sCcpBWHSbwP98OHp3/ZQL2h/DDNdipibwcKEJEcNCweHQgY/sd
         jnza6tcscl9roZcN80hjSXRuGIXayZkAh7GKEixnp6qm1hkdrDhhvpJi3dqQD03dguUA
         WSEvRKdUpsdWKhcYh321g9TplfvvgNW7BSd7zDWsTQPscqtin/nmKAOs51CJbrmeGHCM
         hzmA==
X-Forwarded-Encrypted: i=1; AJvYcCV0Zb9zLJ3+PdnZF+Iq9JTkSVUoGBFKP9r7LbZAf6jc+W6Eg5XL9S+VY93ULjQlds35sdfv2huP/+E174KokFix0kovAcXm22Abl6g0sM+6cy8=
X-Gm-Message-State: AOJu0Ywtf1Eu1H68RL8X0W+X7vJwfEDtbuWXrgXaie2HkXL2wM01Owo9
	mwyuSZl1qzVPIbjncY1U4Knjv+mAgh/cNEkvLFw2f/2wfW5xrWFWEMmIFBpLkIo=
X-Google-Smtp-Source: AGHT+IEff9Dln+tnuVCEmbJAGpzplXAkkgqJD6yK1MHCx8a+d/cYhrzz8V7ALZ8zTjCZj6a+ffKadQ==
X-Received: by 2002:a05:620a:4088:b0:797:d55a:5166 with SMTP id af79cd13be357-798d258dd41mr1141019385a.58.1718632249174;
        Mon, 17 Jun 2024 06:50:49 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:48 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:10 -0400
Subject: [PATCH v3 30/41] iio: light: isl29018: make use of
 regmap_clear_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-30-88d1338c4cca@baylibre.com>
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
In-Reply-To: <20240617-review-v3-0-88d1338c4cca@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, Chen-Yu Tsai <wens@csie.org>, 
 Hans de Goede <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Saravanan Sekar <sravanhome@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, 
 Crt Mori <cmo@melexis.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_065050_578927_125A56AA 
X-CRM114-Status: GOOD (  10.27  )
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

SW5zdGVhZCBvZiB1c2luZyByZWdtYXBfdXBkYXRlX2JpdHMoKSBhbmQgcGFzc2luZyB2YWwgPSAw
LCB1c2UKcmVnbWFwX2NsZWFyX2JpdHMoKS4KClN1Z2dlc3RlZC1ieTogVXdlIEtsZWluZS1Lw7Zu
aWcgPHUua2xlaW5lLWtvZW5pZ0BiYXlsaWJyZS5jb20+ClNpZ25lZC1vZmYtYnk6IFRyZXZvciBH
YW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9paW8vbGlnaHQvaXNs
MjkwMTguYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2xpZ2h0L2lzbDI5MDE4LmMgYi9k
cml2ZXJzL2lpby9saWdodC9pc2wyOTAxOC5jCmluZGV4IDQzNDg0YzE4YjEwMS4uOGRmYzc1MGU2
OGMwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2lpby9saWdodC9pc2wyOTAxOC5jCisrKyBiL2RyaXZl
cnMvaWlvL2xpZ2h0L2lzbDI5MDE4LmMKQEAgLTU1MCw5ICs1NTAsOSBAQCBzdGF0aWMgaW50IGlz
bDI5MDE4X2NoaXBfaW5pdChzdHJ1Y3QgaXNsMjkwMThfY2hpcCAqY2hpcCkKIAkJCXJldHVybiAt
RU5PREVWOwogCiAJCS8qIENsZWFyIGJyb3dub3V0IGJpdCAqLwotCQlzdGF0dXMgPSByZWdtYXBf
dXBkYXRlX2JpdHMoY2hpcC0+cmVnbWFwLAotCQkJCQkgICAgSVNMMjkwMzVfUkVHX0RFVklDRV9J
RCwKLQkJCQkJICAgIElTTDI5MDM1X0JPVVRfTUFTSywgMCk7CisJCXN0YXR1cyA9IHJlZ21hcF9j
bGVhcl9iaXRzKGNoaXAtPnJlZ21hcCwKKwkJCQkJICAgSVNMMjkwMzVfUkVHX0RFVklDRV9JRCwK
KwkJCQkJICAgSVNMMjkwMzVfQk9VVF9NQVNLKTsKIAkJaWYgKHN0YXR1cyA8IDApCiAJCQlyZXR1
cm4gc3RhdHVzOwogCX0KCi0tIAoyLjQ1LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
