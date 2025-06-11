Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B69C71148
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Jun 2025 17:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ekAh0eaXsjAsfnGBV13VFzvFMGF+QL93stpPqwZcOjc=; b=Nxi0xUEwTflEAs
	PU7XF54iisGbRGwqeyniD8yHYgjgbLGXgn56yhIJsqzoLygplgGwl3jgLMS7hdiJIXCNgMo3BgDgN
	A8UhMAkk/5NLfSlud4YK53wFNVazU/Rd3Sj7OXsMKwWcZV9k6RpmN8UOgAGFd0xCDfZoVonkEhqab
	fU7rhsLp0avJC58vJsYu+dHldQaU8goQNuMf4bVOG9YgecoSzX5+0t0U9R/lYIgSyZLBH4upGMwcz
	K8PXa87rR4uHDCotd+VgR8UJ1X1UWLzAsk+956t5GpP+fcI4ZaCX146xwq2wcOoKMwpaJnvCzL5J1
	2/p6yzhVyQTYMZneGPGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPjc-0000000Alie-2lZV;
	Wed, 11 Jun 2025 17:59:36 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKyA-00000009t8C-0vBU
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Jun 2025 12:54:20 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a522224582so4057845f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Jun 2025 05:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749646457; x=1750251257; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hgyBVrfYOGwb8icwtwZuqsQvTSZXh6hVi38QgSu9syk=;
        b=yZLa8pcmgRVT+3drCCNnxmK60M/+k/42MBkvE9+KezVj6jf4GxMLg7grPF6UKTsI6F
         0iN6RL9Ih0vXoYXlCuH1kRESBDH9NfutwP9cU0cl4g6ndHwPKYm5aSV0l33rjTAsva8+
         b4Xxp/XDPWv+u0lQC0i+6MZx1B3S7VcMBLQ6/6lpN5SP3odSO6rkILfsHfmcUaNW/bx9
         AFO4hhOCDfXvMWOFXpIsU/8aHu+I1bOs7pNX2mzZrJvLVJPl+h++0QxUpzrF5gLroOu5
         gj9uq5sW0IO4oF92QQysHWfeaQY3TYgP9frZW7kkHbqte6cRM+ar3iUY62MiwLeX6WPM
         NmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646457; x=1750251257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgyBVrfYOGwb8icwtwZuqsQvTSZXh6hVi38QgSu9syk=;
        b=gTFbSkyTPp0SlY2ZO2WeTOTzjjVDoe2H/jCnmHCGyblTS7t07WTDngscreen4nj9ow
         U1Go1h3OolUuDkvcaWhfzIGLAxUORbAm8WWlsoKApjDUPDvNB0kG1SEulMQ5EZya2T40
         C4jSGm+hMW4/cKt7TwMQrIsMwTXSg+YNsFhiTaCUlR4/aXpqY7fgdAh9GBUWMTfS4vUH
         8EuRruydgH8Y1aM8kq58QGbkDtqSJhPBZV0ubCD1L1WU4IBg/9FtwlzIEug/WH+xdfz7
         Zh9QQpUGp/hWoQgf+LH+rYATVhWmEfXeu7ju+z3sx4qhbJr5FFuQgjLD04YuEo2zKt88
         UoFw==
X-Forwarded-Encrypted: i=1; AJvYcCUI6uwJEAmfhR2hW1xLtXSnDFaVanBLN/3HReyzHF1fxb8yTLXgXrX2iuQjmCQ0p0Hh80vqPZuIIJQYqE+Q@lists.infradead.org
X-Gm-Message-State: AOJu0YxZmSDyeB2+15GlQEVhRA7wCRE8i0VzT4AAl6pc5fhBPMVCTrHO
	lBevp/GppckieHBEFX523sD6WADOIY9vWlSt+HI/SauQuh41cih+Uyz88M3gUf+Rf1U=
X-Gm-Gg: ASbGnctnB6SM4zOWqG05BFGPADDZHiJs5hQGTDM5lTf9e6dzfVYEEKxRASTAVj6AiCG
	Xjsgpk8sqliLWGYjdb3xf7w1UiEt8LW43or4j37B3iy3Mffn95lzZCn4vdXs9Nse1LdBGDnwZGF
	gAVPg4inYFw4QsSj1WwmNnIDZrjDWjYfpuD0q0QoHGaWn62BRGZwukEHwTwg/zilskFumkAlpdX
	84OTz+N7E6QRkahqLhZCmJ9yGXBTnM5RtvI05FOckBXZq9J6vGp59ByvDx+WcamY9Sc+3zH6Khg
	UeFZVUDBrZ5izRuLgu48UpTFbl75rHnGptZijjpUoIfFmV01yrOBoGTuZ/FoP0UMkANaA8U4CFP
	5gFwqcDF7wVw=
X-Google-Smtp-Source: AGHT+IGSKQ+I1VSBXzjz0e0/4PIaSTIl1mLDIRYQG2dUdUWN1ZjW/HP6izLGdBlHKJXUN9U97V2Bhg==
X-Received: by 2002:a05:6000:4203:b0:3a5:1410:71c0 with SMTP id ffacd0b85a97d-3a5586dcff7mr2566047f8f.38.1749646456700;
        Wed, 11 Jun 2025 05:54:16 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ef3:a82f:ccaa:91b5])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a53245275esm15225486f8f.76.2025.06.11.05.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:54:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 11 Jun 2025 14:53:57 +0200
Subject: [PATCH 2/4] reset: eyeq: drop device_set_of_node_from_dev() done
 by parent
MIME-Version: 1.0
Message-Id: <20250611-clk-aux-v1-2-fb6575ed86a7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1637; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=RwzYmOF728hq2o8OgF4Q9VGpNb0lf0jDIwME53KEgHc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoSXxzT4vvsOSw1zz5K9DH+lG0L5oWKmI61cqwC
 Uao7DX7/vqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaEl8cwAKCRDm/A8cN/La
 hW4nD/wNd9PvOlo3p4RnDdZJ6qBC2p1a28mPHDfq6qSu/abBcGDIzBdcMUxT62vTPUu8vpWiUGQ
 pFFM9Ak0KjaeQXESXgfXTKh7Dal6utZtLY/jDkAbZPH1CwNYWpz499j+w4KpDXlZ70DGV9b4Wur
 nAc3LYPsix9HrCyBHL4J+bUdWbiZEJN65Ry0GGjj/77420eK2cPTNB0lcn0a/8Nspxs6a5eeb4x
 GxgMKDRbx5Gtc7q31GWbg4XsRhNczNAxGHol6J4U52E4/tdeyB0nWgnqg957uLKyzKff5npQ/3x
 VOpdHG074k8RLQ9kAbwpTGETzaVqm1Us6dEbwLkFAs6zy9EFjLCs0rNcy7xp9Vi04Za0zfGtX7Q
 Qv+i05679yJBJ3hUZJ7gmRPiPftx1Zig+ZdMH1rqLCKlxNbijywLN9bwy0nK+yxAxxKiq9KaZ6X
 G8UF309wZ65EgA57LA60CIS3n3dKEUMwNGPD+Hn0Ya/ZC9Jatg3rF9B6oQP1yDI3V9bMIpDksX5
 yFuQh8/1B89E/ZITsAi7jg6/KC3DsmCjIKGrovtwIdtyC61OzP6De4p6qQcK8KSUhcwFNB31vkO
 mITE+N4jmeeCX2ghVtBZIpexDdcjqcCN0r/MEOfdFdMYz77VtMrWDSAyYmnoEIXZv0b5OosDfZc
 pXrQkrGtqAn1Ltw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_055418_266723_69BA0104 
X-CRM114-Status: GOOD (  11.84  )
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

RnJvbTogVGjDqW8gTGVicnVuIDx0aGVvLmxlYnJ1bkBib290bGluLmNvbT4KCk91ciBwYXJlbnQg
ZHJpdmVyIChjbGstZXllcSkgbm93IGRvZXMgdGhlCglkZXZpY2Vfc2V0X29mX25vZGVfZnJvbV9k
ZXYoZGV2LCBkZXYtPnBhcmVudCkKY2FsbCB0aHJvdWdoIHRoZSBuZXdseSBpbnRyb2R1Y2VkIGRl
dm1fYXV4aWxpYXJ5X2RldmljZV9jcmVhdGUoKSBoZWxwZXIuCgpEb2luZyBpdCBhZ2FpbiBpbiB0
aGUgcmVzZXQtZXllcSBwcm9iZSB3b3VsZCBiZSByZWR1bmRhbnQuCkRyb3AgYm90aCB0aGUgV0FS
Tl9PTigpIGFuZCB0aGUgZGV2aWNlX3NldF9vZl9ub2RlX2Zyb21fZGV2KCkgY2FsbC4KQWxzbyBm
aXggdGhlIGZvbGxvd2luZyBjb21tZW50IHRoYXQgdGFsa3MgYWJvdXQgIm91ciBuZXdmb3VuZCBP
RiBub2RlIi4KClNpZ25lZC1vZmYtYnk6IFRow6lvIExlYnJ1biA8dGhlby5sZWJydW5AYm9vdGxp
bi5jb20+ClJldmlld2VkLWJ5OiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRl
PgpTaWduZWQtb2ZmLWJ5OiBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KLS0t
CiBkcml2ZXJzL3Jlc2V0L3Jlc2V0LWV5ZXEuYyB8IDEzICsrLS0tLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcmVzZXQvcmVzZXQtZXllcS5jIGIvZHJpdmVycy9yZXNldC9yZXNldC1leWVxLmMKaW5k
ZXggMDJkNTAwNDEwNDhiNDI5MjFlM2U1MTExNDhjZDI5ZjIxNWI1ZmM1ZS4uODAxOGZhODk1NDI3
YmIxZTUxZWEyM2I5OTgwM2RjN2ZlNjEwODQyMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9yZXNldC9y
ZXNldC1leWVxLmMKKysrIGIvZHJpdmVycy9yZXNldC9yZXNldC1leWVxLmMKQEAgLTQyMCwxNyAr
NDIwLDggQEAgc3RhdGljIGludCBlcXJfcHJvYmUoc3RydWN0IGF1eGlsaWFyeV9kZXZpY2UgKmFk
ZXYsCiAJaW50IHJldDsKIAogCS8qCi0JICogV2UgYXJlIGFuIGF1eGlsaWFyeSBkZXZpY2Ugb2Yg
Y2xrLWV5ZXEuIFdlIGRvIG5vdCBoYXZlIGFuIE9GIG5vZGUgYnkKLQkgKiBkZWZhdWx0OyBsZXQn
cyByZXVzZSBvdXIgcGFyZW50J3MgT0Ygbm9kZS4KLQkgKi8KLQlXQVJOX09OKGRldi0+b2Zfbm9k
ZSk7Ci0JZGV2aWNlX3NldF9vZl9ub2RlX2Zyb21fZGV2KGRldiwgZGV2LT5wYXJlbnQpOwotCWlm
ICghZGV2LT5vZl9ub2RlKQotCQlyZXR1cm4gLUVOT0RFVjsKLQotCS8qCi0JICogVXNpbmcgb3Vy
IG5ld2ZvdW5kIE9GIG5vZGUsIHdlIGNhbiBnZXQgbWF0Y2ggZGF0YS4gV2UgY2Fubm90IHVzZQot
CSAqIGRldmljZV9nZXRfbWF0Y2hfZGF0YSgpIGJlY2F1c2UgaXQgZG9lcyBub3QgbWF0Y2ggcmV1
c2VkIE9GIG5vZGVzLgorCSAqIEdldCBtYXRjaCBkYXRhLiBXZSBjYW5ub3QgdXNlIGRldmljZV9n
ZXRfbWF0Y2hfZGF0YSgpIGJlY2F1c2UgaXQgZG9lcworCSAqIG5vdCBhY2NlcHQgcmV1c2VkIE9G
IG5vZGVzOyBzZWUgZGV2aWNlX3NldF9vZl9ub2RlX2Zyb21fZGV2KCkuCiAJICovCiAJbWF0Y2gg
PSBvZl9tYXRjaF9ub2RlKGRldi0+ZHJpdmVyLT5vZl9tYXRjaF90YWJsZSwgZGV2LT5vZl9ub2Rl
KTsKIAlpZiAoIW1hdGNoIHx8ICFtYXRjaC0+ZGF0YSkKCi0tIAoyLjQ3LjIKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxp
bmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
