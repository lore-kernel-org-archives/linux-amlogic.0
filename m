Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11C6C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Nov 2021 23:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xLNWem+tDr9JdAyB+9jDHnEghjMUSb7rNI2yu4wYXsw=; b=XFlCiPI6DtoZQ8
	crAKoa7DUbWXg6C+aZ4zEaDYIAZXR405xBf/0nUzMYYNKNtLAIPuXnK6a27Vej7SF5fIfm5nqYUR6
	0AbklzQRRC7SwfY1ZiFklrhtpyRwoyoLEz5bkM35MlIm2ttNjDU+u4cFXD1dok411bf/6PruMgKwm
	Mb0Ja0Hk2YdktI3dCdo0l6LP39xRYsuSiVspyU8vmk5LqriBtpOTvDFmM2Ay3iik6dtxRYuSrFdYL
	HUBvoQc23nKGugYu7WYlPWUBlOduTu3gEvVe8lhYEWxCwReBEutHhvIekAMaSkpnC6CA7ZWgFLyj4
	GZGxCAG7t7sDCdqpICJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moZth-00D3yo-4j; Sat, 20 Nov 2021 23:35:53 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moZte-00D3yF-Kp
 for linux-amlogic@lists.infradead.org; Sat, 20 Nov 2021 23:35:51 +0000
Received: by mail-ed1-x530.google.com with SMTP id r25so22249705edq.7
 for <linux-amlogic@lists.infradead.org>; Sat, 20 Nov 2021 15:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HC1SzaAEYf39/EvZxx04OIpeGEanP6T7XQemSMatYLU=;
 b=c7XV7DlIA72x0bpWTceTwmuwI+uonsaCCAIPwOjAj4xjn4dZvGFfLVNNl3YxEPkMkG
 +Jei94uBBYROBq3/XD5J755kVb8Y4SdKU+uVqKuA6/f120NZbsLRcb3ywT4BqqI5rnmp
 h8AuiflI7yk5GcofuDkd4JVNfh8zzSXYfBTh8/8qW9Mja/jn73/WlFeHH0CE1M1qgps1
 JRZslrmwi3IrKEwZHDgrXL3MbZLtPprfi0ZekoyH3s9oEprhtMKLbkUc2DRaQdxCSM8C
 0l21/BBDb0dAGlCHE7+yhzlc3XHHD3prMhnh2Hc15TlsJ9JQCR1VnkklsXdF2vIrf4kz
 0vlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HC1SzaAEYf39/EvZxx04OIpeGEanP6T7XQemSMatYLU=;
 b=bhegrX3XdMFnAw4CgrbMS0zQ/jPDtARw9AkbL0hwdlZxBVtfG7C1cUPhD/mSGqs2CS
 Op/a9ulqAFv335lgz9s9mYt9M3sf5C1N+w4ivWNU1V5mPRkThuIb6SISg4hE8rBL2WZ+
 czhaEWfXz11e1Ep4OTb4K7S34Hx+luVkM1yTBzIKodvjghdMCka6pW4iSX9NfxGnz7C6
 swQHAurifKkQ19H2GsE3i3tCr5or5xvQqCPWrxz78rYEkodOoU/f6KWCWEU6Xm5SuDZR
 1iulP+8eiLzRbHhIw7CdwrjSYMtA5kfmswHC467n/29rP0bePRKRncSFMcE4SrpYL181
 26Dg==
X-Gm-Message-State: AOAM5320zdked9gjKGRkNxyL35lLsavDy3LP6bZLpq7TPtc5P44K7y56
 gs/LwOWESA/ZjtmpKZLXHvCSG7M4TzDc03M9pcQ=
X-Google-Smtp-Source: ABdhPJw4VCaLGbozZaTFdphS2Rl9EbqNz24USVqNs5AepkqJ75EQVe5HNXQCP9cAeLbJaJTVupQBbSrvEL8nZDeNb5M=
X-Received: by 2002:a17:906:229b:: with SMTP id
 p27mr24029990eja.264.1637451349065; 
 Sat, 20 Nov 2021 15:35:49 -0800 (PST)
MIME-Version: 1.0
References: <20211108134628.120474-1-u.kleine-koenig@pengutronix.de>
 <20211108134628.120474-3-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20211108134628.120474-3-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 21 Nov 2021 00:35:37 +0100
Message-ID: <CAFBinCCE8e+7b1PDZ=3aON95M1V_Sa0x9B7Y11mV1t9GT5nHYg@mail.gmail.com>
Subject: Re: [PATCH 3/4] pwm: meson: Simplify duplicated per-channel tracking
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, linux-pwm@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211120_153550_734837_3176177B 
X-CRM114-Status: UNSURE (   8.41  )
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

T24gTW9uLCBOb3YgOCwgMjAyMSBhdCAyOjQ2IFBNIFV3ZSBLbGVpbmUtS8O2bmlnCjx1LmtsZWlu
ZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gVGhlIGRyaXZlciB0cmFja3MgcGVy
LWNoYW5uZWwgZGF0YSB2aWEgc3RydWN0IHB3bV9kZXZpY2U6OmNoaXBfZGF0YSBhbmQKPiBzdHJ1
Y3QgbWVzb25fcHdtOjpjaGFubmVsc1tdLiBUaGUgbGF0dGVyIGhvbGRzIHRoZSBhY3R1YWwgZGF0
YSwgdGhlIGZvcm1lcgo+IGlzIG9ubHkgYSBwb2ludGVyIHRvIHRoZSBsYXR0ZXIuIFNvIHNpbXBs
aWZ5IGJ5IHVzaW5nIHN0cnVjdAo+IG1lc29uX3B3bTo6Y2hhbm5lbHNbXSBjb25zaXN0ZW50bHku
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBl
bmd1dHJvbml4LmRlPgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJs
dW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCm5vdGUgdG8gc2VsZjogdGhpcyBwYXRjaCBpcyBj
b21wbGV0ZSBiZWNhdXNlIHRoZSBmaXJzdCBwYXRjaCBpbiB0aGlzCnNlcmllcyBhbHJlYWR5IHJl
bW92ZXMgb25lIHVzYWdlIG9mIHB3bV9nZXRfY2hpcF9kYXRhCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdAps
aW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
