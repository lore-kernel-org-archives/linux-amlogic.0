Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE67C2BA15
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 13:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/sR5DszQHtoCmo8dtBxhUUNvDIUexTfTu18TQieq41s=; b=dY9Ng0+P8yez1t
	WHMZVCyXgBu77a2+3BhscuUwBxM61O2XrvHzEu1urHPcrjbU2v3Ge1H2LEkrUrgRQv1f2vDjcNdp3
	JIJEgptbCClZazikk8sa7O7GyWxUTLnKaXCty4p0WwEpw60OsKqj45WTeI+qedCZLdVs22i3CcGyJ
	3TZTU7jcINBZp+2AeA2TqTAQ9UAbfg8H/v1LsfwDFJ7STUWvlqzjpFSmfErz8g3LSQASNtyZPOOCA
	I3aYOeIommK69OCz7goOvHUImBvYs4Mh6Rg0DYJQImnZD9e4l4RuR7rXgN6GvcgzK/z8Ei69yNxwc
	lehnnd2GPGWguF87p2dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCoZ-0000000B0Ka-0idA;
	Mon, 17 Jun 2024 13:54:31 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJClB-0000000Axjm-0pIu
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:51:06 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-795569eedcaso228741685a.3
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632260; x=1719237060; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cCh+HIY0adNQEnDSauX7K8bw5POFZegMypjkhgGy1wk=;
        b=UucAIcqaQDHcTui/8kfQO9B7fUrlHFBR6fw9wBwxsvmfjjtUm4ei3HLdMMPia6HMGR
         6KbWvjUgFBf7SYh8AeFM632r3+d8YGnRChecDwUkVE6i8c6WF42xsq1EJwJfDFGi7c0N
         JC6Z5BAAhgTvKa5v41Z681Ga8ddwunIVMq0BDw2YElGSEorEgFHunXlSBRVCNNnvBLky
         rTlu8cRbj5yf0MoCu3DhmSCe17WP3YSLdtXP8vsH2hRnLYZKbRy48N6yn7JOW7UiTGUn
         C+0DkEv/+UQHBqPAyxvKO0pKK9XYWLi4oUHYUQe0/VXSdXYWNWozLPEs3E5w6j5hjN2/
         XQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632260; x=1719237060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCh+HIY0adNQEnDSauX7K8bw5POFZegMypjkhgGy1wk=;
        b=o/M7AeQPaj/jqpAcsV62UXXDpiaTSo6yrzikCRRXKyQ+y9wdiwT938LggifBfAiViN
         Tj4b/JdTVYyKiyGisRxWJjOc+Am1+Y8i4H5PVlrji6MfnNrsa6gBtBBOzw9lxOW07hj9
         el7cdaSFsFY+5wQEos1WqJTi3qForXaCn1khQnZ4kJEF3QNPnhJvjCtVYRAFqHnaE2dS
         FaQoGXak1GOeFmY3abFjg1lsdJVWNNH6AgbvIt/0Ajx5C1iSh7ExaTAqEaG/A/G4IKBa
         kEG+5TzLrM2Z2NZ0Gwoxfn85vhzJB6ThvPvos+RoL08H++I21o7BiPJxB/Abca8YsVVZ
         aPSA==
X-Forwarded-Encrypted: i=1; AJvYcCXRgCEJGxzGhgPiTWlSRNbiMV49YIO4eNfmhcE+p1XKJsdxM+/W6x4exwChCNehue0XPRVh9LW6vKgETA5gjGar9k0DUwgt4xpB7nVer26DQwo=
X-Gm-Message-State: AOJu0YznAliP8UDpAXoka7fishZKQHIQyLUYHpdga/BzsKL5YQPmH+2O
	haDtpZVBk8jUjJ71TED71gh/Mj5NrbSDNqXzOSfayO+sbqQbZX7tZ9yarq6ayCk=
X-Google-Smtp-Source: AGHT+IENId7QjpgihvaST50kcENjvnWyxdiSnte4lhDV+Skn20e41tG2cguOi5hNHA7+JrD8WB9kUA==
X-Received: by 2002:a05:620a:1a29:b0:795:50fa:c0be with SMTP id af79cd13be357-798d243ab42mr1258423585a.39.1718632259895;
        Mon, 17 Jun 2024 06:50:59 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:59 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:50:15 -0400
Subject: [PATCH v3 35/41] iio: pressure: bmp280-core: make use of
 regmap_clear_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-35-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_065101_727970_26D20203 
X-CRM114-Status: GOOD (  10.22  )
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
YW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJyZS5jb20+Ci0tLQogZHJpdmVycy9paW8vcHJlc3N1cmUv
Ym1wMjgwLWNvcmUuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9wcmVzc3VyZS9ibXAyODAt
Y29yZS5jIGIvZHJpdmVycy9paW8vcHJlc3N1cmUvYm1wMjgwLWNvcmUuYwppbmRleCAwOWY1M2Q5
ODdjN2QuLmVmN2Y1NDY4MzllNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9paW8vcHJlc3N1cmUvYm1w
MjgwLWNvcmUuYworKysgYi9kcml2ZXJzL2lpby9wcmVzc3VyZS9ibXAyODAtY29yZS5jCkBAIC0x
NTY2LDggKzE1NjYsOCBAQCBzdGF0aWMgaW50IGJtcDU4MF9udm1lbV93cml0ZSh2b2lkICpwcml2
LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LCB2b2lkICp2YWwsCiAJCQlnb3RvIGV4aXQ7CiAKIAkJLyog
RGlzYWJsZSBwcm9ncmFtbWluZyBtb2RlIGJpdCAqLwotCQlyZXQgPSByZWdtYXBfdXBkYXRlX2Jp
dHMoZGF0YS0+cmVnbWFwLCBCTVA1ODBfUkVHX05WTV9BRERSLAotCQkJCQkgQk1QNTgwX05WTV9Q
Uk9HX0VOLCAwKTsKKwkJcmV0ID0gcmVnbWFwX2NsZWFyX2JpdHMoZGF0YS0+cmVnbWFwLCBCTVA1
ODBfUkVHX05WTV9BRERSLAorCQkJCQlCTVA1ODBfTlZNX1BST0dfRU4pOwogCQlpZiAocmV0KSB7
CiAJCQlkZXZfZXJyKGRhdGEtPmRldiwgImVycm9yIHJlc2V0dGluZyBudm0gd3JpdGVcbiIpOwog
CQkJZ290byBleGl0OwoKLS0gCjIuNDUuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
