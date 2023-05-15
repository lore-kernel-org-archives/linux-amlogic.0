Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00717C77B7D
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 May 2023 20:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4oidc/LDO7qRChaaN8/hHBPFVacSAhtz+0TbnzWY2jA=; b=BqQyvRIcbIINDs
	qJ0j2UWvGlaOw5aeZQ9tpUrqt5dmPbAfJ7DIF6+9RmJfKLWFYjfFXUQakAecQcvmtC9VjqE0/Sto+
	yT3XUp9K7HsnWQRtkGLzAzi06AZZv2q8OGco0uIL5HyWeoLT5za2Wsa26oY06qbPaplNnm6sLuEXu
	LyeUcR98m+s4ZW2YYd6WLmi0iXvcB/BSVh9hpyBltbwriYNAdNS90qD08pfW07jPRAaPnb8KQWZaU
	gTY3j1yGV07JRFHYXloTaRTQKhb/ILmPbBGL+4DdFVb3i9ddBb7b5VAKiHb7465s8icBbX/WufLnO
	9BI6xl+2jA2b1vr2HTFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyesH-003RQ9-2F;
	Mon, 15 May 2023 20:32:53 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyesD-003ROm-30;
	Mon, 15 May 2023 20:32:51 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-307d58b3efbso2818274f8f.0;
        Mon, 15 May 2023 13:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684182767; x=1686774767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+een/p0Ou4xLIJ2JP/3dkDdNQUrW7bUdZBp+xlR4Eow=;
        b=a2ydbiH0IDuT1qZ9C7P5xNT7cP0ixiWcyuKGMPFSF1zeHcG3tM4vYafA/Y+5r+eM/T
         KvNg60DlCHCtKh648iIwUeztt8b1Lv+WJsbG+37AWMGGenma4IHZmjvdh0Hy2rEb+eOE
         +kZXzc7oiDWLxLjmouWZUyUwdm0n0Zm5jBFTLD7S/QxU0oUhECBDxFOYwKbx8K2e3eVm
         ZiuNqor/yki8ldRgX7lP1k5/L4MgskkfkNvuiEEqOtSS3VYYHVtirCi2nlB2JdQL/Khq
         y/FH3iXCCJ4SBpbbq/3xpq2hYNHqhfpork2DO4CyBgKo7JVVZGSgbA/XQxcwZPvfuOFF
         SnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684182767; x=1686774767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+een/p0Ou4xLIJ2JP/3dkDdNQUrW7bUdZBp+xlR4Eow=;
        b=Z0abJDS/fwTFnVPfrmLa6uDOMJE1M6uNNTAy+jRvKHoKPZyRR5SnSeHuLJu4R7LLFu
         AxNNwOz4j+N42tQacDJMMCp8XFNhuxfVV3A45viPmbPeX27zTbfo4C4P4pm6koapbvzN
         iuR3ayOFiEo8RQOWIY0loHW881La2h00DptWQDgZZ59PL6Kh1l75Uw2c3ysF11JWrG/T
         yBQhineYDJW4kzS6FITjQFFoSJYe28WF7AOgjbyTQAgj1QD/asUgqvd4/NF+zfMGplSI
         sOWqjsJbuRaxfDe8gRuqNx5EMrEqRrZBXzwj9jUh+VbhbfLUNJppH+HAa9Iir/JYvPAy
         RtnQ==
X-Gm-Message-State: AC+VfDzubTlIkF6hW1ubuW7bfhTJBtfP4yO3eCfvqVv/566nd+mymEiE
	nFFqZzrZCIm4VGUIJiEJ36k=
X-Google-Smtp-Source: ACHHUZ7oAEa4QeYDj9aFnVrfChSsMDlEBohSxF0u6Hy4t5M5NzJT6DzH6qlpgeKzWitAFHUk0voJXw==
X-Received: by 2002:adf:f7d1:0:b0:2ff:f37:9d0f with SMTP id a17-20020adff7d1000000b002ff0f379d0fmr23148872wrq.57.1684182766919;
        Mon, 15 May 2023 13:32:46 -0700 (PDT)
Received: from ?IPV6:2a01:c23:bd61:5400:edba:ccd5:9cfc:1976? (dynamic-2a01-0c23-bd61-5400-edba-ccd5-9cfc-1976.c23.pool.telefonica.de. [2a01:c23:bd61:5400:edba:ccd5:9cfc:1976])
        by smtp.googlemail.com with ESMTPSA id m9-20020adfdc49000000b002fb60c7995esm250358wrj.8.2023.05.15.13.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 13:32:46 -0700 (PDT)
Message-ID: <f6b93fcc-ca5a-43ae-729d-38338ba411bc@gmail.com>
Date: Mon, 15 May 2023 22:32:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] pwm: pwm-meson: fix handling of period/duty if greater
 than UINT_MAX
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <1d1a8ede-e789-bc4d-2dcd-9d06d2df4061@gmail.com>
 <CAFBinCCeh1eUo1=pfqmp4F7UsuKZ--cja-16mCqBhV-cgodzqw@mail.gmail.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <CAFBinCCeh1eUo1=pfqmp4F7UsuKZ--cja-16mCqBhV-cgodzqw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_133249_972136_FF1F8605 
X-CRM114-Status: UNSURE (   8.47  )
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

T24gMDguMDUuMjAyMyAyMTo0NiwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBPbiBXZWQs
IE1heSAzLCAyMDIzIGF0IDk6NTjigK9QTSBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21h
aWwuY29tPiB3cm90ZToKPj4KPj4gc3RhdGUtPnBlcmlvZC9kdXR5IGFyZSBvZiB0eXBlIHU2NCwg
YW5kIGlmIHRoZWlyIHZhbHVlIGlzIGdyZWF0ZXIgdGhhbgo+PiBVSU5UX01BWCwgdGhlbiB0aGUg
Y2FzdCB0byB1aW50IHdpbGwgY2F1c2UgcHJvYmxlbXMuIEZpeCB0aGlzIGJ5Cj4+IGNoYW5naW5n
IHRoZSB0eXBlIG9mIHRoZSByZXNwZWN0aXZlIGxvY2FsIHZhcmlhYmxlcyB0byB1NjQuCj4+Cj4+
IEZpeGVzOiBiNzljMzY3MGUxMjAgKCJwd206IG1lc29uOiBEb24ndCBkdXBsaWNhdGUgdGhlIHBv
bGFyaXR5IGludGVybmFsbHkiKQo+PiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+PiBTdWdn
ZXN0ZWQtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXgu
ZGU+Cj4+IFNpZ25lZC1vZmYtYnk6IEhlaW5lciBLYWxsd2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5j
b20+Cj4gUmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGlu
Z2xAZ29vZ2xlbWFpbC5jb20+CgpOb3Qgc3VyZSBhYm91dCB0aGUgcHJvY2VzcyBpbiBwd20gc3Vi
c3lzdGVtOiBXaGVuIHdpbGwgdGhlc2UgcGF0Y2hlcyBtYWtlCml0IHRvIGxpbnV4LW5leHQ/IEJl
Y2F1c2UgSSdkIGxpa2UgdG8gc3VibWl0IGZvbGxvdy11cHMgd2l0aCBhIGRlcGVuZGVuY3kKb25s
eSBhZnRlciBwZW5kaW5nIHBhdGNoZXMgaGF2ZSBiZWVuIGFwcGxpZWQuCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
