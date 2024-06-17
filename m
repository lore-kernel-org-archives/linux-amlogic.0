Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703AFC2BC81
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jun 2024 15:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RFjXujGbmKSF4mSftDNwpGnvEQOGQ9JNxbBABDjRITw=; b=F9Ot5B1q+Igkuf
	2lKR2Lb1LOpbsFFSAAQGCQdcEvZ+ma/BsVTcpDedWeA1Lj6y6RC7C83Y1udSdUvyF1a97vePMAjdY
	NO8/mFhND6HC+NbQVAoESV+4olL/kjVPhhxuNM+1Oh1JL4PgyuX3EnGSSrztVvxuzkeY9W7Yj8qKA
	XfpI3N8gcvUFlJ+ZmvBubhc/6onpYXrT5cpgHukLvg61Z9wIE51wzL27DKBww8D7ZCLxFKGAglZg4
	Ppy/EjNnhtIoj9FFjqIx+pkpBfZaCfauObgjS1A4zkIOcLebQ4GlK+9OqKjqPRmGK6XbDiXdFrJlR
	NbM+ddmbnMt1Lpe22kQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDrA-0000000BKM4-40TV;
	Mon, 17 Jun 2024 15:01:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCkj-0000000AxJX-29uw
	for linux-amlogic@bombadil.infradead.org;
	Mon, 17 Jun 2024 13:50:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=l19FGmHt7cx9Y1e6lJcD6lg62Kq+f+HHsekNkW7FIwQ=; b=fFGjk4RRmLuODoItzc1qpf/a4R
	EYCj2tEdlw2HLdzTI0au7Jw1aIHgknpmGqijiqHpS4qPm8ckf0tQOF/vQWWaTR1uvFH5oe/t+r1t6
	/cPA035DzrnoAfLEcbPpUM3Bqd5HGefm/0Pw1ZwV/e6eaGQaCqCa0/OPIWC40rdbB3+GgkHXyhlGY
	nJtPuQiMxEhTRqmRBtv1dIyOp3pqD3XHr+4KnmnpIAGRR0C9+fpqe9b0ckClHLHVrIcw8ejN4KlIl
	vRaHI+JQ2ooMWXOtv7vwAEwTa6OaZZnhcUeAjFgkW8t7zCvGEuZIeqC/FEPUhlHxpPBrMiOg+Wrwu
	4NncfZWQ==;
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCke-00000006R9n-2poF
	for linux-amlogic@lists.infradead.org;
	Mon, 17 Jun 2024 13:50:32 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-797f222c9f9so258868385a.3
        for <linux-amlogic@lists.infradead.org>; Mon, 17 Jun 2024 06:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718632223; x=1719237023; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l19FGmHt7cx9Y1e6lJcD6lg62Kq+f+HHsekNkW7FIwQ=;
        b=GKl7d3zi7qtXnC+IIcuKX13J16jbw++94w33mMj4w1/LJlQFqne0/FXvVUnMHs1zXi
         U6emrRJ6P/t3y/8rTtH/NOfCYkrc9oPM4+dSQX6igMsgSGQ6MAZJacxEfRbiKs7aXsui
         /1+K00sgVOH6pR+JgpQW/GknZa9QoPwAjlw1OsVOpBpIxP37EOr1RTsEI11nJv9PP11n
         6FgG42A+EmM41j1fBQTnqu59/VcrOAWk2LnaNViOHU3ZsTz2ePiT5S9iRzKviBMmEfAM
         8hdGY6UoW/GfP9zqbXeb8JCNYt0CRU7j+fmRKB5MCba8YcU3rA/K4CbQd08Hl/Rbs3MH
         n2ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632223; x=1719237023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l19FGmHt7cx9Y1e6lJcD6lg62Kq+f+HHsekNkW7FIwQ=;
        b=imssEAFT6d9v52jPqDofI0pTPzbWhHDZCMHZuSFe3NSpUS5eQlPA3PAfzJbA+UuObk
         +kBYqPVBl4yzqLjJrE2oDXje7gWunOBg5iUVkka9pjff10C5UFt/AOgH6qiAwMGGq+NK
         wwXppLRch0/AJ//5lMijyyVJBLrAM1qAYsTYIlt0aD5HlZpqwa5jhWDBiJQqYcobKnn3
         LfYOtd6Owsr+z7/iHX7FrK3ByzF1biGRnOwFCAPGa83qK2jsuS5KsUx9fBwSR0kd0McB
         WBTHf0JP03lFnzpdL91v1nOIM+II1AB+2uKVXNoYTBV5+wO4Cn01BCrJq/CSDXy2uBY9
         v/1g==
X-Forwarded-Encrypted: i=1; AJvYcCWeQp9rOgHfGiJ7mAkff0NXV8hRn+wxUodCpiEJLYy4G+qJqwb5M99D3WldOJTaW62ZIrbRaAyuuWkumUdThfayg6uoZSenY8etvYQ4sjKr/b4=
X-Gm-Message-State: AOJu0Yx0RnFK/CVl8CcAMnmbRCvvGOzJDUh+Zi4AdKAWokI8vKTSCgUW
	Q9SzI0gmzCxlhWiDBhxtj+E+XzynkGnI54SwbR9Tfkr2+d4YQ8rO6u4LcqRwKUU=
X-Google-Smtp-Source: AGHT+IEh7KDprGK33BeeaVNTDiPQqvpWOrx7hEFjzf44w52REiEzqTJNM1IGPx8qlAanIRK9VBBUsQ==
X-Received: by 2002:a05:620a:4101:b0:795:dca5:e9b7 with SMTP id af79cd13be357-798d26b4948mr1182835585a.69.1718632223483;
        Mon, 17 Jun 2024 06:50:23 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-798aaecc004sm432892285a.31.2024.06.17.06.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 06:50:23 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
Date: Mon, 17 Jun 2024 09:49:58 -0400
Subject: [PATCH v3 18/41] iio: adc: stm32-dfsdm-adc: make use of
 regmap_clear_bits(), regmap_set_bits()
MIME-Version: 1.0
Message-Id: <20240617-review-v3-18-88d1338c4cca@baylibre.com>
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
X-CRM114-CacheID: sfid-20240617_145028_907782_26E13488 
X-CRM114-Status: GOOD (  11.17  )
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

SW5zdGVhZCBvZiB1c2luZyByZWdtYXBfdXBkYXRlX2JpdHMoKSBhbmQgcGFzc2luZyB0aGUgbWFz
ayB0d2ljZSwgdXNlCnJlZ21hcF9zZXRfYml0cygpLgoKSW5zdGVhZCBvZiB1c2luZyByZWdtYXBf
dXBkYXRlX2JpdHMoKSBhbmQgcGFzc2luZyB2YWwgPSAwLCB1c2UKcmVnbWFwX2NsZWFyX2JpdHMo
KS4KClN1Z2dlc3RlZC1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BiYXls
aWJyZS5jb20+ClNpZ25lZC1vZmYtYnk6IFRyZXZvciBHYW1ibGluIDx0Z2FtYmxpbkBiYXlsaWJy
ZS5jb20+Ci0tLQogZHJpdmVycy9paW8vYWRjL3N0bTMyLWRmc2RtLWFkYy5jIHwgMjkgKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCsp
LCAxNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9hZGMvc3RtMzItZGZz
ZG0tYWRjLmMgYi9kcml2ZXJzL2lpby9hZGMvc3RtMzItZGZzZG0tYWRjLmMKaW5kZXggOWE0N2Qy
Yzg3ZjA1Li5mYWJkNjU0MjQ1ZjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaWlvL2FkYy9zdG0zMi1k
ZnNkbS1hZGMuYworKysgYi9kcml2ZXJzL2lpby9hZGMvc3RtMzItZGZzZG0tYWRjLmMKQEAgLTc1
OSw4ICs3NTksNyBAQCBzdGF0aWMgaW50IHN0bTMyX2Rmc2RtX3N0YXJ0X2NvbnYoc3RydWN0IGlp
b19kZXYgKmluZGlvX2RldiwKIAlyZXR1cm4gMDsKIAogZmlsdGVyX3VuY29uZmlndXJlOgotCXJl
Z21hcF91cGRhdGVfYml0cyhyZWdtYXAsIERGU0RNX0NSMShhZGMtPmZsX2lkKSwKLQkJCSAgIERG
U0RNX0NSMV9DRkdfTUFTSywgMCk7CisJcmVnbWFwX2NsZWFyX2JpdHMocmVnbWFwLCBERlNETV9D
UjEoYWRjLT5mbF9pZCksIERGU0RNX0NSMV9DRkdfTUFTSyk7CiBzdG9wX2NoYW5uZWxzOgogCXN0
bTMyX2Rmc2RtX3N0b3BfY2hhbm5lbChpbmRpb19kZXYpOwogCkBAIC03NzQsOCArNzczLDcgQEAg
c3RhdGljIHZvaWQgc3RtMzJfZGZzZG1fc3RvcF9jb252KHN0cnVjdCBpaW9fZGV2ICppbmRpb19k
ZXYpCiAKIAlzdG0zMl9kZnNkbV9zdG9wX2ZpbHRlcihhZGMtPmRmc2RtLCBhZGMtPmZsX2lkKTsK
IAotCXJlZ21hcF91cGRhdGVfYml0cyhyZWdtYXAsIERGU0RNX0NSMShhZGMtPmZsX2lkKSwKLQkJ
CSAgIERGU0RNX0NSMV9DRkdfTUFTSywgMCk7CisJcmVnbWFwX2NsZWFyX2JpdHMocmVnbWFwLCBE
RlNETV9DUjEoYWRjLT5mbF9pZCksIERGU0RNX0NSMV9DRkdfTUFTSyk7CiAKIAlzdG0zMl9kZnNk
bV9zdG9wX2NoYW5uZWwoaW5kaW9fZGV2KTsKIH0KQEAgLTk1MSwxNiArOTQ5LDE0IEBAIHN0YXRp
YyBpbnQgc3RtMzJfZGZzZG1fYWRjX2RtYV9zdGFydChzdHJ1Y3QgaWlvX2RldiAqaW5kaW9fZGV2
KQogCiAJaWYgKGFkYy0+bmNvbnYgPT0gMSAmJiAhaW5kaW9fZGV2LT50cmlnKSB7CiAJCS8qIEVu
YWJsZSByZWd1bGFyIERNQSB0cmFuc2ZlciovCi0JCXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhh
ZGMtPmRmc2RtLT5yZWdtYXAsCi0JCQkJCSBERlNETV9DUjEoYWRjLT5mbF9pZCksCi0JCQkJCSBE
RlNETV9DUjFfUkRNQUVOX01BU0ssCi0JCQkJCSBERlNETV9DUjFfUkRNQUVOX01BU0spOworCQly
ZXQgPSByZWdtYXBfc2V0X2JpdHMoYWRjLT5kZnNkbS0+cmVnbWFwLAorCQkJCSAgICAgIERGU0RN
X0NSMShhZGMtPmZsX2lkKSwKKwkJCQkgICAgICBERlNETV9DUjFfUkRNQUVOX01BU0spOwogCX0g
ZWxzZSB7CiAJCS8qIEVuYWJsZSBpbmplY3RlZCBETUEgdHJhbnNmZXIqLwotCQlyZXQgPSByZWdt
YXBfdXBkYXRlX2JpdHMoYWRjLT5kZnNkbS0+cmVnbWFwLAotCQkJCQkgREZTRE1fQ1IxKGFkYy0+
ZmxfaWQpLAotCQkJCQkgREZTRE1fQ1IxX0pETUFFTl9NQVNLLAotCQkJCQkgREZTRE1fQ1IxX0pE
TUFFTl9NQVNLKTsKKwkJcmV0ID0gcmVnbWFwX3NldF9iaXRzKGFkYy0+ZGZzZG0tPnJlZ21hcCwK
KwkJCQkgICAgICBERlNETV9DUjEoYWRjLT5mbF9pZCksCisJCQkJICAgICAgREZTRE1fQ1IxX0pE
TUFFTl9NQVNLKTsKIAl9CiAKIAlpZiAocmV0IDwgMCkKQEAgLTk4MSw4ICs5NzcsOCBAQCBzdGF0
aWMgdm9pZCBzdG0zMl9kZnNkbV9hZGNfZG1hX3N0b3Aoc3RydWN0IGlpb19kZXYgKmluZGlvX2Rl
dikKIAlpZiAoIWFkYy0+ZG1hX2NoYW4pCiAJCXJldHVybjsKIAotCXJlZ21hcF91cGRhdGVfYml0
cyhhZGMtPmRmc2RtLT5yZWdtYXAsIERGU0RNX0NSMShhZGMtPmZsX2lkKSwKLQkJCSAgIERGU0RN
X0NSMV9SRE1BRU5fTUFTSyB8IERGU0RNX0NSMV9KRE1BRU5fTUFTSywgMCk7CisJcmVnbWFwX2Ns
ZWFyX2JpdHMoYWRjLT5kZnNkbS0+cmVnbWFwLCBERlNETV9DUjEoYWRjLT5mbF9pZCksCisJCQkg
IERGU0RNX0NSMV9SRE1BRU5fTUFTSyB8IERGU0RNX0NSMV9KRE1BRU5fTUFTSyk7CiAJZG1hZW5n
aW5lX3Rlcm1pbmF0ZV9hbGwoYWRjLT5kbWFfY2hhbik7CiB9CiAKQEAgLTEzMDUsOSArMTMwMSw4
IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBzdG0zMl9kZnNkbV9pcnEoaW50IGlycSwgdm9pZCAqYXJn
KQogCWlmIChzdGF0dXMgJiBERlNETV9JU1JfUk9WUkZfTUFTSykgewogCQlpZiAoaW50X2VuICYg
REZTRE1fQ1IyX1JPVlJJRV9NQVNLKQogCQkJZGV2X3dhcm4oJmluZGlvX2Rldi0+ZGV2LCAiT3Zl
cnJ1biBkZXRlY3RlZFxuIik7Ci0JCXJlZ21hcF91cGRhdGVfYml0cyhyZWdtYXAsIERGU0RNX0lD
UihhZGMtPmZsX2lkKSwKLQkJCQkgICBERlNETV9JQ1JfQ0xSUk9WUkZfTUFTSywKLQkJCQkgICBE
RlNETV9JQ1JfQ0xSUk9WUkZfTUFTSyk7CisJCXJlZ21hcF9zZXRfYml0cyhyZWdtYXAsIERGU0RN
X0lDUihhZGMtPmZsX2lkKSwKKwkJCQlERlNETV9JQ1JfQ0xSUk9WUkZfTUFTSyk7CiAJfQogCiAJ
cmV0dXJuIElSUV9IQU5ETEVEOwoKLS0gCjIuNDUuMgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4
LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
