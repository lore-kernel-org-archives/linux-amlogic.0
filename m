Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45D0C021B8
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Mar 2025 18:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=16HDefQ86dUJ1JePUj4n0nncHDtCrM8UMCJx6SVQJII=; b=2Jh4sFBt1cA9h/
	mNXjoLbFE/bBsOlZPWG4BQPTIqsAFJ8cD+QQkBhxwEEsG1q2xhi6Ksghk4NuUmU/lFKCJkxtINs0J
	uoSEJlTXmxS5Brzc6zylanwhomOSgA4Evk5E5GO6BbpWcvOBumSWIUFAOx4Dpm2L/linfoX8dIXgP
	pus54SwJe5Q+HtBh72tSedsei5bWDcI4P2/AQX6dlYsTM1o4FRCH3xNogM6pzmSTGg3w7MG1K0zGZ
	M45/W2TCBdOIloDPpGRrt9jiZP83gOT3BDP1Z2xwC0KROL0CD8ecAZjc2A356bBcFbTkTIVNBAT0v
	shbGsI7FKDYTZeebOYJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpX8k-00000005sQ2-3Y9W;
	Tue, 04 Mar 2025 18:37:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpViA-00000005YDu-1JYY
	for linux-amlogic@bombadil.infradead.org;
	Tue, 04 Mar 2025 17:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=MzZ6ILzSkM4BJ8jDBuhIko6B+Jnu0p3f7pMZfR82Jo4=; b=keYM+f65vDh+BwPeCuIDv38QRE
	nOTg3qv16kkH/X/UQDV0sn683ixzcqGaILoxXUPPltGF+ItpDfFm03b411QYb6UAon3sYFa+nJFF9
	Ag6TQFpCx++By6/zG6yoJsudy1+o56OLSrmv086EOg1wbvs1JyYujZvuMooh8o9r3hKYo4ScRvUpH
	x65rl5ycrGkD9v4a0rbgiJ4D0DcZ9wKyPEHIBOHUe3AdWGsYlZVkNPyeEsSL+jdGNvRiVHLOaBaBW
	1DYlYxYCrS779pj3fZoAGwifh/U9uwUbQS23dpQTj5aeUVWt8faG0Xv3laNvPzEsuIMXP+1dliAOO
	AhMJjjwA==;
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVi4-00000002Cxr-1SFe
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Mar 2025 17:05:40 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-abf615d5f31so574797366b.2
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Mar 2025 09:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741107935; x=1741712735; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MzZ6ILzSkM4BJ8jDBuhIko6B+Jnu0p3f7pMZfR82Jo4=;
        b=LE+eh+IMTG1vJanP3LeJtNRN7CWgGUjkzdTVt1r9Iw3iQAOkp5QtV0hoIAaDH9ExHM
         0+EnJiQ5WpFuRx5zc5yyAXOH5/EemTAnI8iMsCALshbLOwBwO0oBihjBPxLm63lBhwEV
         JNTEn84o2CwyM9mYUxR7swcde0Zq90LnO0BQQD8LmN8YgeNamX6qf7/eaijiVdaA2jkN
         Jw/oQ27HFXEhoRt5X9zBhw41j3wXcMnYjqbE3arsCReRyx9PnbTVx4sw2Olg6wFoRip1
         +SiHu7X6OQO6fosBb1G/wWaNKNvjUov9YqszJIbrhW3oNvypKfcvQtdhFhI4LMW/A7dd
         W37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741107935; x=1741712735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzZ6ILzSkM4BJ8jDBuhIko6B+Jnu0p3f7pMZfR82Jo4=;
        b=nMqpoVkx0RLFCeY3xy5m6OlYKGN7fzM1ocv427Y06KlTpKwgqSwwgfHjH2MQkNRsHA
         b3IPyNuJdqr6kTuTfEx7grtmHx8+UmhAsalgZHChl1+6y0Nr6NLoO/pIIAPCKrWxF6mT
         kDMG9kx79JlEHThxdQKotp2Dk/lA4dFzRnvPHwZ5xYkAeD4Q/bmjYVWGkSDlboIDoELB
         uHefCz1Aanwu7LoETr38mngClT3ItdxxDXAnQtV/YAXmmvjInhAVCvQ4HiA/DKAhPrh4
         GR09Z4AFLpvtRvNfh6OYqSeHikxnG4/LEFirMcIKrt+n3ynjuC51RHutCwua5YqfPoTf
         QQ+A==
X-Forwarded-Encrypted: i=1; AJvYcCXsW20x5TBcGsZ0mZPdGovOcV4npJRg9Ew4xUWMJcElKUFVs3a5jpcF+W01aAZqiZSlKTjJkAaI2OLMOfYR@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2YTwOOJ2Yyi8Xzjcv0BrkC93D0I6o/UIaLDLAHb94rY4ZCBeH
	dtD9Pj2s78KXca4AX6AMA+yEo/g51Kbl4gnP3ougw5OHJh3pxk5WX807RLMMoAc=
X-Gm-Gg: ASbGncv3MBh2zkrh96ixsyUCDfEGfuOa+h7f7t6HRctkX+wZDbtcnVQOZ1E9uGmRsCf
	wBdDrfFXo10d2/MkMOQnls8BOjVe9fei+lZzdijxPNXIkUGHWtSs5OuZcI/9woPSydK1hja09OG
	v3rKis0NKuerU+oBzMwoSBdZEM3XdTVbQP4OQ53wdiXEBSq6dnvaU8bQqyxPL5fpK0c5w2tot//
	+/BxYir6udubscOC9+Vy//azWLmq7yUy8aS8FNEzZCIT6WK/Pa8SFvkbAYheOioCP3ZF7+gO1hi
	qYwFPHU6+7uhuPNTGFECoEoEKabr4CrOXDWsbE8QnK9xTHW5L29OgY6fLUoADPns6buugH0GRGO
	27/lsIO11jNvOj77QspowOWy/eqih
X-Google-Smtp-Source: AGHT+IFwDsDh5i25qijWXwIP4x1jml1OHqbOIRoS6nzVQBGxqFZ6SJJ2B5idZS+kqD7e/PzkpEaGBA==
X-Received: by 2002:a17:907:9490:b0:ac1:cceb:d9b0 with SMTP id a640c23a62f3a-ac20d8bcf0bmr3896666b.16.1741107933256;
        Tue, 04 Mar 2025 09:05:33 -0800 (PST)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf795ba15esm367589066b.131.2025.03.04.09.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 09:05:32 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 04 Mar 2025 17:05:31 +0000
Subject: [PATCH v2 03/16] rtc: aspeed: drop needless struct
 aspeed_rtc::rtc_dev member
MIME-Version: 1.0
Message-Id: <20250304-rtc-cleanups-v2-3-d4689a71668c@linaro.org>
References: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
In-Reply-To: <20250304-rtc-cleanups-v2-0-d4689a71668c@linaro.org>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 =?utf-8?q?T=C3=B3th_J=C3=A1nos?= <gomba007@gmail.com>, 
 Dianlong Li <long17.cool@163.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-amlogic@lists.infradead.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_170536_941658_5650C32E 
X-CRM114-Status: GOOD (  13.31  )
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

VGhlIG1lbW9yeSBwb2ludGVkIHRvIGJ5IHRoZSA6OnJ0Y19kZXYgbWVtYmVyIGlzIG1hbmFnZWQg
dmlhIGRldnJlcywKYW5kIG5vIGNvZGUgaW4gdGhpcyBkcml2ZXIgdXNlcyBpdCBwYXN0IF9wcm9i
ZSgpLgoKV2UgY2FuIGRyb3AgaXQgZnJvbSB0aGUgc3RydWN0dXJlIGFuZCBqdXN0IHVzZSBhIGxv
Y2FsIHRlbXBvcmFyeQp2YXJpYWJsZSwgcmVkdWNpbmcgcnVudGltZSBtZW1vcnkgY29uc3VtcHRp
b24gYnkgYSBmZXcgYnl0ZXMuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyw6kgRHJhc3ppayA8YW5kcmUu
ZHJhc3ppa0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvcnRjL3J0Yy1hc3BlZWQuYyB8IDE2ICsr
KysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDggZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvcnRjLWFzcGVlZC5jIGIvZHJpdmVycy9y
dGMvcnRjLWFzcGVlZC5jCmluZGV4IDg4MGIwMTVlZWJhZjc5NmY2OGVkODJjMjk5OThmMzQ1ZTFm
ZDQxOGIuLjBkMDA1M2I1MmY5YjkwYTYxNzI1YmYyOTQzNWJmYzgwNzE5NzdmOWUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvcnRjL3J0Yy1hc3BlZWQuYworKysgYi9kcml2ZXJzL3J0Yy9ydGMtYXNwZWVk
LmMKQEAgLTgsNyArOCw2IEBACiAjaW5jbHVkZSA8bGludXgvaW8uaD4KIAogc3RydWN0IGFzcGVl
ZF9ydGMgewotCXN0cnVjdCBydGNfZGV2aWNlICpydGNfZGV2OwogCXZvaWQgX19pb21lbSAqYmFz
ZTsKIH07CiAKQEAgLTg1LDYgKzg0LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBydGNfY2xhc3Nf
b3BzIGFzcGVlZF9ydGNfb3BzID0gewogc3RhdGljIGludCBhc3BlZWRfcnRjX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CiAJc3RydWN0IGFzcGVlZF9ydGMgKnJ0YzsKKwlz
dHJ1Y3QgcnRjX2RldmljZSAqcnRjX2RldjsKIAogCXJ0YyA9IGRldm1fa3phbGxvYygmcGRldi0+
ZGV2LCBzaXplb2YoKnJ0YyksIEdGUF9LRVJORUwpOwogCWlmICghcnRjKQpAQCAtOTQsMTcgKzk0
LDE3IEBAIHN0YXRpYyBpbnQgYXNwZWVkX3J0Y19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQogCWlmIChJU19FUlIocnRjLT5iYXNlKSkKIAkJcmV0dXJuIFBUUl9FUlIocnRjLT5i
YXNlKTsKIAotCXJ0Yy0+cnRjX2RldiA9IGRldm1fcnRjX2FsbG9jYXRlX2RldmljZSgmcGRldi0+
ZGV2KTsKLQlpZiAoSVNfRVJSKHJ0Yy0+cnRjX2RldikpCi0JCXJldHVybiBQVFJfRVJSKHJ0Yy0+
cnRjX2Rldik7CisJcnRjX2RldiA9IGRldm1fcnRjX2FsbG9jYXRlX2RldmljZSgmcGRldi0+ZGV2
KTsKKwlpZiAoSVNfRVJSKHJ0Y19kZXYpKQorCQlyZXR1cm4gUFRSX0VSUihydGNfZGV2KTsKIAog
CXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIHJ0Yyk7CiAKLQlydGMtPnJ0Y19kZXYtPm9wcyA9
ICZhc3BlZWRfcnRjX29wczsKLQlydGMtPnJ0Y19kZXYtPnJhbmdlX21pbiA9IFJUQ19USU1FU1RB
TVBfQkVHSU5fMTkwMDsKLQlydGMtPnJ0Y19kZXYtPnJhbmdlX21heCA9IDM4ODE0OTg5Mzk5TEw7
IC8qIDMxOTktMTItMzEgMjM6NTk6NTkgKi8KKwlydGNfZGV2LT5vcHMgPSAmYXNwZWVkX3J0Y19v
cHM7CisJcnRjX2Rldi0+cmFuZ2VfbWluID0gUlRDX1RJTUVTVEFNUF9CRUdJTl8xOTAwOworCXJ0
Y19kZXYtPnJhbmdlX21heCA9IDM4ODE0OTg5Mzk5TEw7IC8qIDMxOTktMTItMzEgMjM6NTk6NTkg
Ki8KIAotCXJldHVybiBkZXZtX3J0Y19yZWdpc3Rlcl9kZXZpY2UocnRjLT5ydGNfZGV2KTsKKwly
ZXR1cm4gZGV2bV9ydGNfcmVnaXN0ZXJfZGV2aWNlKHJ0Y19kZXYpOwogfQogCiBzdGF0aWMgY29u
c3Qgc3RydWN0IG9mX2RldmljZV9pZCBhc3BlZWRfcnRjX21hdGNoW10gPSB7CgotLSAKMi40OC4x
LjcxMS5nMmZlYWJhYjI1YS1nb29nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
