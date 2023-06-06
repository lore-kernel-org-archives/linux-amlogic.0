Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FBD2C7EE2A
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Jun 2023 19:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6I5G8iGr+GDQ3EwVBYE+Sls2Us5Sd/qobv1n0dFHQ20=; b=Kw9gm7B8Pks8AI
	4C7AvX//wus5CGQZ6c01rmUILyBdl8pFARJcoqsoqrGgwFrh5rNdGmjGB8uxmjCtrgj0tqa7v5bH3
	E97xHbPn901vAHSNPBOOQ1Rfrnsp9AaVjW4ysqqtDE87DQoT9fu58dqXYNzWdEfBmAUFqq3HGcNkj
	WhdP/0KLqhJI/4KetLIht1rD+ig1uaLxXF21S55rvS0h33JyXdYg6C2KA/T3ch6jppHEtTPN81zPW
	t3dvvKqcRhAwipiMGwfhmngwxHjydMiowLvWk/2nlCqft7Tnq8byM1nUoZysgHr3LbAQ1glJeFN3a
	6JGlUCDu3C/Nbx4fz5Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6cGI-002wMq-2o;
	Tue, 06 Jun 2023 19:22:34 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6cGF-002wLY-0W;
	Tue, 06 Jun 2023 19:22:32 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-977c89c47bdso636077666b.2;
        Tue, 06 Jun 2023 12:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1686079349; x=1688671349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GE52NOk0UypxP33bn8g4+XP8hmFg4c3opJesoY7LCg=;
        b=RFAg5LWJjkkZe0dQsr1JwstrCVaWo4VB47+fT3XZHOlWFBCkiIg1LETlrqMLYtgOsg
         5BDL43io2FCmpcFXE3l3+F4n66dXRDgEf8xfcxFAcdT+jznLUopgEfAvZ4GzL6SoX1da
         aoTg6k53fM94uXRiYbd5YxPCqOTK237dGA+saV3hjqJu4jF7dMwZEz+S3DD6kYhza7UE
         cQBOTuJiaDyPDGRJZwE+HyNAUqeEmCvkiwr16iMCYifHf/kQt3t5EckJoLJApR2EjiX0
         cut7EtiN7NbTHz4MfZe4TXtHdnX/LX65QcE520c2AaV9D22C7RCZtGc5YdpPoQ1Wpp/2
         296w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686079349; x=1688671349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2GE52NOk0UypxP33bn8g4+XP8hmFg4c3opJesoY7LCg=;
        b=fojscuyWKKgXuRbyau/jnX2fqOOCC4vF5NT8QHokcn9rtGCvfbb5BymwWg5Q8gAQ5Z
         b/Sx8UGv505BHOlPiM2VQbomeOeAbgSmFgsaQZKDYmXxNwA4bonMiZBi8j4AgNF0kpws
         I4JnKgYSWYlOQaEFgzDBja2WgI3JYJhCpPdjbc7FdC0I0ynQHlCEBndGEa9lPkaCrXU7
         U/gPhEOY8+FCQBM2lhU5s+256+vt/UBFepMHiZX3Yr2NDfVxlHHmBKkww/aSNFrso/oE
         Kn6d8SkGPAIGhlfZuZu6PXv4Ci2EI7/sQnH9rSF0/RIWX1ao+u7AZJX3/a8KnTvPX2LC
         sBDw==
X-Gm-Message-State: AC+VfDzlamoQnJLj52VqBfRHAUZQgBbrZmUUfYClw4B/19aklrUPgCZA
	kj3gPsu9IG5oNN1GYeAD9V94qEg6m+43vPk28DSbPtYDaUA=
X-Google-Smtp-Source: ACHHUZ5GUK/RF+eP4+MP5mNutQoh4cmUk9elSAwK6vWVlKbZiNz4TheLnToyRGeGcDtMLD6jZrkuCVoNOoQUQ2MDOyU=
X-Received: by 2002:a17:907:6e08:b0:978:6a95:512d with SMTP id
 sd8-20020a1709076e0800b009786a95512dmr4124880ejc.11.1686079349273; Tue, 06
 Jun 2023 12:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230606065918.460866-1-martin@geanix.com>
In-Reply-To: <20230606065918.460866-1-martin@geanix.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Jun 2023 21:22:18 +0200
Message-ID: <CAFBinCB4sv4Fk_VNEPFaPz384XF9CfXGemSqaH9YJnEh7QNnPg@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson: move mmc_request_done() call to irq thread
To: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	=?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <mhu@rtx.dk>, stable@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_122231_200066_42F87B87 
X-CRM114-Status: GOOD (  13.45  )
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

SGkgTWFydGluLAoKT24gVHVlLCBKdW4gNiwgMjAyMyBhdCA4OjU54oCvQU0gTWFydGluIEh1bmRl
YsO4bGwgPG1hcnRpbkBnZWFuaXguY29tPiB3cm90ZToKWy4uLl0KPiBAQCAtMTA0MCw2ICsxMDM0
LDEzIEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBtZXNvbl9tbWNfaXJxX3RocmVhZChpbnQgaXJxLCB2
b2lkICpkZXZfaWQpCj4gICAgICAgICBpZiAoV0FSTl9PTighY21kKSkKPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIElSUV9OT05FOwo+Cj4gKyAgICAgICBpZiAoIW1lc29uX21tY19ib3VuY2VfYnVm
X3JlYWQoY21kLT5kYXRhKSAmJgo+ICsgICAgICAgICAgICFtZXNvbl9tbWNfZ2V0X25leHRfY29t
bWFuZChjbWQpKSB7Cj4gKyAgICAgICAgICAgICAgIG1lc29uX21tY19yZXF1ZXN0X2RvbmUoaG9z
dC0+bW1jLCBjbWQtPm1ycSk7Cj4gKwo+ICsgICAgICAgICAgICAgICByZXR1cm4gSVJRX0hBTkRM
RUQ7Cj4gKyAgICAgICB9Cj4gKwpJJ20gd29uZGVyaW5nIGlmIHRoaXMgaXMgY2hhbmdpbmcgdGhl
IGJlaGF2aW9yIHdoZW4gY21kLT5lcnJvciBpcyBub24temVyby4KCkxldCdzIHRha2UgdGhlICJz
dGF0dXMgJiBJUlFfQ1JDX0VSUiIgY2FzZSBmcm9tIG1lc29uX21tY19pcnEoKSAtIHByZXZpb3Vz
bHk6Ci0gY21kLT5lcnJvciBpcyBzZXQKLSByZWdtYXBfdXBkYXRlX2JpdHMoaG9zdC0+cmVnbWFw
LCBTRF9FTU1DX1NUQVJULCBTVEFSVF9ERVNDX0JVU1ksIDApOwotIElSUV9XQUtFX1RIUkVBRAot
IHRoZW4gaW5zaWRlIG1lc29uX21tY19pcnFfdGhyZWFkKCk6Ci0tIG1lc29uX21tY193YWl0X2Rl
c2Nfc3RvcChob3N0KTsKLS0gbWVzb25fbW1jX3JlcXVlc3RfZG9uZShob3N0LT5tbWMsIGNtZC0+
bXJxKTsKCldpdGggdGhpcyBwYXRjaDoKLSBjbWQtPmVycm9yIGlzIHNldAotIHJlZ21hcF91cGRh
dGVfYml0cyhob3N0LT5yZWdtYXAsIFNEX0VNTUNfU1RBUlQsIFNUQVJUX0RFU0NfQlVTWSwgMCk7
Ci0gSVJRX1dBS0VfVEhSRUFECi0gdGhlbiBpbnNpZGUgbWVzb25fbW1jX2lycV90aHJlYWQoKToK
LS0gIW1lc29uX21tY19ib3VuY2VfYnVmX3JlYWQoY21kLT5kYXRhKSAmJgohbWVzb25fbW1jX2dl
dF9uZXh0X2NvbW1hbmQoY21kKSBjYW4gYmUgdHJ1ZSwgd2hpY2ggbWVhbnMgd2Ugb25seQpjYWxs
OgotLS0gbWVzb25fbW1jX3JlcXVlc3RfZG9uZShob3N0LT5tbWMsIGNtZC0+bXJxKTsKLS0tIChu
b3RlIHRoZSBtaXNzaW5nIG1lc29uX21tY193YWl0X2Rlc2Nfc3RvcCgpIGNhbGwgYmVmb3JlCm1l
c29uX21tY19yZXF1ZXN0X2RvbmUoKSkKCldoYXQgZG8geW91IHRoaW5rPwpNYXliZSB3ZSBqdXN0
IG5lZWQgdG8gcmVtb3ZlIHRoZSBjb2RlIGZyb20gbWVzb25fbW1jX2lycSgpIGFuZCBqdXN0Cm9t
aXQgYW55IG1vZGlmaWNhdGlvbnMgdG8gbWVzb25fbW1jX2lycV90aHJlYWQoKSAoYXMgaXQgc2Vl
bXMgYWxsCmNoZWNrcyB0aGF0IHlvdSdyZSBhZGRpbmcgYXJlIGFscmVhZHkgcHJlc2VudCBpbiB0
aGF0IGZ1bmN0aW9uIGJlbG93CnRoZSBjbWQtPmVycm9yIGNhc2UpLgoKCkJlc3QgcmVnYXJkcywK
TWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==
