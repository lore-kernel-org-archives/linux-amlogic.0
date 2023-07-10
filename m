Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6A3EB64DA
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jul 2023 07:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Y0wQfhjCLZ3udj0bMHZluF8Qa1vXaRaCjJyQHgBUUo=; b=0uySOVFT8J857y
	dJmT++bv8pYe27Al/HlbWpC1xAWZZz1zoda3elqy77E+ClELh7uWX4Gjd8tAbpKdyNvKK8F+We9tI
	29UIhBLqFEGuiMFxAQI8J81yv3fVFGgoWsHqGjUa5j6paQ/vxEk3qTAV7TLZTjJ8n+3Oz2hJ/w5RG
	8sFtEZCL/Bm8cxN11h54yZamvyB0/wvfh1wDdKTlrEA4FiuCa8RImd6gzec/NyVGBYC+k/0VtISC3
	m8P2Je3BBpqL+gBDJTr0S7fU8ya4oA3WI60/cT9p6BUlaZzzirewqCFSu6iQE/JCsk474VeyABRTy
	gHVBFGXV1z0RgOTba6lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIlPh-00AiGn-03;
	Mon, 10 Jul 2023 07:34:29 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIlPe-00AiFq-0z;
	Mon, 10 Jul 2023 07:34:27 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-51d805cb33aso5622162a12.3;
        Mon, 10 Jul 2023 00:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688974462; x=1691566462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uC11jQxTM278CfYH6leVR/8McJ3cZ7vdbLrjkZEbJGw=;
        b=awOhiEIHCeizxYWOYYQkn5nWaygxEoF8MMeEVGo+nO4HNB7xXvw4GZXQLA0TSJ/ZXT
         um+nXETYDLrf2dWTDBhO4+tmmmE05Jb72muqdjzkGlEfK66mS6NbIrmFxFX0MGNZgvHr
         ceTCV9XPlyM1fHyQMOWaJVHH+E5ZQBwffjPncvecTwHJCmuGW+plpTgzcZv1A1XOxP+1
         McTbWeLyD5dkeO1rylNwiG3zUExlsyz/XrQyCbZ1tV+1Huh2TFtKTQn9DDp4faquJpat
         Az1qahfDax4lGmmpaQv8TFCUqqp1Rg15CkDXQOb1q5bkErGl8W/c6sbhPAxaPkbVGb2K
         Ihhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688974462; x=1691566462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uC11jQxTM278CfYH6leVR/8McJ3cZ7vdbLrjkZEbJGw=;
        b=dBJu5TZ6Q/FjiluAdMiVP0D3WBakH+esurZcYa8GHWEDEIbupyG1R7Q/gL+H+TD+LX
         XcYnstMuszbpR+z+AUZRt4wRBY95zHEcFhAyL5VcP2ydxJgJDv56IKn1bIDaeepb6WrK
         LQU/dTrNr3CU81qz6knFfWm/Rya21/G2dyL6CBjEvyJgStgGOa+J2VlTpXAMMLcoKB5A
         LLRdFrNt9xKyFDi3rGZDyS+MiIqZAT080+ujJZVy0TxgPpvEz50LdoEagXBkMIFdGABW
         yHPgu+/ypwjCJHYn6PS7PWG5gd24Q1twtl48n3CiEY7cj1jcmXc/SEIwOl3Bk1IK39m7
         0fPA==
X-Gm-Message-State: ABy/qLYdjgVmOGzBW6588GlRzm+1bJ4ePCW3YFsm3FmGePZgWUiwc9LB
	GqHjOkx/fbTQnf7JG6migC37sbM+ZNpcREQ9spQ=
X-Google-Smtp-Source: APBJJlFMEGFMzXbrFF1vM1qCi4sFiiyXzl4HYs+MEnDHwXoy1wRZ7X3GWe/OsGZluqogZ42s9SdF3pmBOhCiVZUkiNg=
X-Received: by 2002:a17:906:f55:b0:988:4dc:e3a3 with SMTP id
 h21-20020a1709060f5500b0098804dce3a3mr9917388ejj.31.1688974462575; Mon, 10
 Jul 2023 00:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230710042812.2007928-1-huqiang.qin@amlogic.com> <20230710042812.2007928-3-huqiang.qin@amlogic.com>
In-Reply-To: <20230710042812.2007928-3-huqiang.qin@amlogic.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 10 Jul 2023 10:33:46 +0300
Message-ID: <CAHp75VevmTiv-OYVTn3bF_8UT9SKNU2oTrzS-AM1zoWefeJ=3w@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] pinctrl: Add driver support for Amlogic C3 SoCs
To: Huqiang Qin <huqiang.qin@amlogic.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, brgl@bgdev.pl, andy@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_003426_343673_D235C709 
X-CRM114-Status: GOOD (  10.98  )
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

T24gTW9uLCBKdWwgMTAsIDIwMjMgYXQgNzoyOOKAr0FNIEh1cWlhbmcgUWluIDxodXFpYW5nLnFp
bkBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4KPiBBZGQgYSBuZXcgcGluY3RybCBkcml2ZXIgZm9yIEFt
bG9naWMgQzMgU29DcyB3aGljaCBzaGFyZQo+IHRoZSBzYW1lIHJlZ2lzdGVyIGxheW91dCBhcyB0
aGUgcHJldmlvdXMgQW1sb2lnYyBTNC4KCi4uLgoKPiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dw
aW8vYW1sb2dpYy1jMy1ncGlvLmg+CgpTZWVtcyBzb21lIGhlYWRlcnMgYXJlIG1pc3NpbmcuIFRo
ZSBydWxlIG9mIHRodW1iIGlzIHRvIGluY2x1ZGUKaGVhZGVycyB0aGUgY29kZSB1c2VzIGRpcmVj
dGx5LgpNb3Jlb3ZlciwgdXNpbmcgYSAicHJveHkiIGhlYWRlciBpcyBub3QgdGhlIGJlc3QgaWRl
YS4KCmtlcm5lbC5oIC8vIEFSUkFZX1NJWkUoKQptb2RfZGV2aWNldGFibGUuaCAvLyBvZl9kZXZp
Y2VfaWQKbW9kdWxlLmgKcGxhdGZvcm1fZGV2aWNlLmgKCnBpbmN0cmwvcGluY3RybC5oCgo+ICsj
aW5jbHVkZSAicGluY3RybC1tZXNvbi5oIgo+ICsjaW5jbHVkZSAicGluY3RybC1tZXNvbi1heGct
cG14LmgiCgpXaXRoIHRoZSBhYm92ZSwgaXQgbWlnaHQgYmUgdGhhdCBleGlzdGluZyBpbmNsdXNp
b25zIGJlY29tZSB1bnVzZWQsIHNvCmRyb3AgdGhlbSBpbiBzdWNoIGEgY2FzZS4KCi4uLgoKPiAr
c3RhdGljIHN0cnVjdCBtZXNvbl9wbXhfZnVuYyBjM19wZXJpcGhzX2Z1bmN0aW9uc1tdID0gewo+
ICsgICAgICAgRlVOQ1RJT04oZ3Bpb19wZXJpcGhzKSwKPiArICAgICAgIEZVTkNUSU9OKHVhcnRf
YSksCj4gKyAgICAgICBGVU5DVElPTih1YXJ0X2IpLAo+ICsgICAgICAgRlVOQ1RJT04odWFydF9j
KSwKPiArICAgICAgIEZVTkNUSU9OKHVhcnRfZCksCj4gKyAgICAgICBGVU5DVElPTih1YXJ0X2Up
LAo+ICsgICAgICAgRlVOQ1RJT04oaTJjMCksCj4gKyAgICAgICBGVU5DVElPTihpMmMxKSwKPiAr
ICAgICAgIEZVTkNUSU9OKGkyYzIpLAo+ICsgICAgICAgRlVOQ1RJT04oaTJjMyksCj4gKyAgICAg
ICBGVU5DVElPTihpMmNfc2xhdmUpLAo+ICsgICAgICAgRlVOQ1RJT04ocHdtX2EpLAo+ICsgICAg
ICAgRlVOQ1RJT04ocHdtX2IpLAo+ICsgICAgICAgRlVOQ1RJT04ocHdtX2MpLAo+ICsgICAgICAg
RlVOQ1RJT04ocHdtX2QpLAo+ICsgICAgICAgRlVOQ1RJT04ocHdtX2UpLAo+ICsgICAgICAgRlVO
Q1RJT04ocHdtX2YpLAo+ICsgICAgICAgRlVOQ1RJT04ocHdtX2cpLAo+ICsgICAgICAgRlVOQ1RJ
T04ocHdtX2gpLAo+ICsgICAgICAgRlVOQ1RJT04ocHdtX2kpLAo+ICsgICAgICAgRlVOQ1RJT04o
cHdtX2opLAo+ICsgICAgICAgRlVOQ1RJT04ocHdtX2spLAo+ICsgICAgICAgRlVOQ1RJT04ocHdt
X2wpLAo+ICsgICAgICAgRlVOQ1RJT04ocHdtX20pLAo+ICsgICAgICAgRlVOQ1RJT04ocHdtX24p
LAo+ICsgICAgICAgRlVOQ1RJT04ocHdtX2NfaGl6KSwKPiArICAgICAgIEZVTkNUSU9OKGlyX291
dCksCj4gKyAgICAgICBGVU5DVElPTihpcl9pbiksCj4gKyAgICAgICBGVU5DVElPTihqdGFnX2Ep
LAo+ICsgICAgICAgRlVOQ1RJT04oanRhZ19iKSwKPiArICAgICAgIEZVTkNUSU9OKGdlbl9jbGsp
LAo+ICsgICAgICAgRlVOQ1RJT04oY2xrMTJfMjQpLAo+ICsgICAgICAgRlVOQ1RJT04oY2xrXzMy
a19pbiksCj4gKyAgICAgICBGVU5DVElPTihlbW1jKSwKPiArICAgICAgIEZVTkNUSU9OKG5hbmQp
LAo+ICsgICAgICAgRlVOQ1RJT04oc3BpZiksCj4gKyAgICAgICBGVU5DVElPTihzcGlfYSksCj4g
KyAgICAgICBGVU5DVElPTihzcGlfYiksCj4gKyAgICAgICBGVU5DVElPTihzZGNhcmQpLAo+ICsg
ICAgICAgRlVOQ1RJT04oc2RpbyksCj4gKyAgICAgICBGVU5DVElPTihwZG0pLAo+ICsgICAgICAg
RlVOQ1RJT04oZXRoKSwKPiArICAgICAgIEZVTkNUSU9OKG1jbGtfMCksCj4gKyAgICAgICBGVU5D
VElPTihtY2xrXzEpLAo+ICsgICAgICAgRlVOQ1RJT04odGRtKSwKPiArICAgICAgIEZVTkNUSU9O
KGxjZCkKCisgdHJhaWxpbmcgY29tbWEuIFRoZSBydWxlIG9mIHRodW1iIGlzIHRvIGFkZCBhIGNv
bW1hIHdoZW4gaXQncyBub3QgYQp0ZXJtaW5hdG9yIGVudHJ5LgoKPiArfTsKCi0tIApXaXRoIEJl
c3QgUmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
