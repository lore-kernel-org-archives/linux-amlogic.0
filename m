Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FB5C38142
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jan 2023 07:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZUrEEwsgzO/ywS4BK1w/1e9k+P3fbH9zMg3x9ksb4c=; b=RZn4SaoF97Ktmy
	y0yDLmnAie0Qf/XlsXKolb1NHjueqUjFHWLdooKkGb6n92kA8FTqYF/pz7N4pBlpJWOl+RB/RAAQm
	Tz+e2el7qNWZOUS+3CXWu4cCks+1DxL0nVKNG8ppNG4I7KZrJHa6n8l2kLcsLyAfK8uKos6RTFSdA
	kgjlGoMw0W/EubIdtKP0YA7LQB0vrTuA2G29E4A+8qF/lRHyNTxghb0IUZu9G3VB3I9Pprumi1atm
	9eDnOsojM5my332uDUUeZDTw+Hxwo5OCsuT6t2pamUr53C67ZudJWilW7FAWW2tSnoMdsoV6ZqmZk
	MA3WIfsCKnrQOeaQxGQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKDYE-002cDV-BT; Tue, 24 Jan 2023 07:17:02 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKDY4-002cBQ-FM
	for linux-amlogic@lists.infradead.org; Tue, 24 Jan 2023 07:16:53 +0000
Received: by mail-wm1-x335.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so12158575wmb.2
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jan 2023 23:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+hTtPbBF2Q6UH5MokSMoyqymn+L8qY1BRaG006W5dhY=;
        b=bxnQM4jVcaTKwE6lhG1gXYGuWV6R/ofAFC3f5/MqIWvUYFN8yL3DJPhXSJk84moB7F
         f3m4SgvqoPUYr5UhkTAItqsU3KnInjUUMgzPHUhelJbU5/UttaNqT9myJkj9dZrCGXWk
         JBziIlZrkLCLfRyPQxXIOXVISN0i98wElnjeidrqfG3dKazkBnCR/qvhR6bHZ7IcUQSa
         FBu6J/xmxVSqyMUD1a5E4W8dX0QVyjOeZN8UoyZGO4k6i3CfMC5q+x41Y3A6a5aEbrct
         zsJyklxKx+LsdEwMI42EP33CsrgrZcXe3yCbjZCIyWFAllNt3//909dHrOpzmkdko+LX
         rYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+hTtPbBF2Q6UH5MokSMoyqymn+L8qY1BRaG006W5dhY=;
        b=MK0xpLzqQMsU7qqdETrQ+AFrQKHXPLPP0klExMIvNcDe0e7Xwyv75L9dtiEirRTnPL
         nZa/v+ofOliz1013gxwpLmlKNqN+ejwnsTvViPkEzDla12wSzYx+3FWbisHqQ511WSYq
         nS0f/BsDAn9d2Zyf1YFUz9Oj3JrahmurJnWeMOFOgTUw/I4rtwOlgJDAn43lSriO7YtN
         sBVq0EJsYJslSR0zELVVt9DahHKpkVKaSuQn6lWVUKbP580XWS3NguT60wxcO1UUXCR7
         YDz78jyCiF6iwyx4TFx+qV0VbYg+bMrXNC/ng50bEgivb3Ki+8E+ZK2uLovyP3L/bpWm
         BQiQ==
X-Gm-Message-State: AFqh2kpbchWLP7BzM4/f38v7lfF/hCX0B6ZpxVQIyvKByZ4LX83nWtXZ
	BdZPaDvelIGbGurhUAGLY3NYlQ==
X-Google-Smtp-Source: AMrXdXsWH2VxzTlgVDRHedju/McxB7qKu5r3nMyPPOEdRkw/0Gr4d5VTUMtfg6PAsD4lFt6cYxt7eA==
X-Received: by 2002:a05:600c:3545:b0:3c6:e60f:3f4a with SMTP id i5-20020a05600c354500b003c6e60f3f4amr26899413wmq.1.1674544607642;
        Mon, 23 Jan 2023 23:16:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:7542:4469:3507:5738? ([2a01:e0a:982:cbb0:7542:4469:3507:5738])
        by smtp.gmail.com with ESMTPSA id k21-20020a05600c1c9500b003db30be4a54sm13316639wms.38.2023.01.23.23.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 23:16:47 -0800 (PST)
Message-ID: <0e48405a-d4e7-92a8-339f-4be2f4ec1378@linaro.org>
Date: Tue, 24 Jan 2023 08:16:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 0/8] soc: amlogic: switch bindings to yaml and adjust some
 dtbs's
To: Heiner Kallweit <hkallweit1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
Content-Language: fr
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <cb62dfc0-cb3d-beba-6d0b-8db18583dda0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_231652_518485_CD0B9C1B 
X-CRM114-Status: GOOD (  13.90  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgSGVpbmVyLAoKTGUgMjMvMDEvMjAyMyDDoCAyMjoyMiwgSGVpbmVyIEthbGx3ZWl0IGEgw6lj
cml0wqA6Cj4gQXQgZmlyc3QgYWRqdXN0IHNvbWUgZXhpc3RpbmcgZHRicydzIHNvIHRoYXQgdGhl
eSBwYXNzIGR0YnNfY2hlY2sKPiBhZnRlciBzd2l0Y2hpbmcgYmluZGluZ3MgdG8geWFtbC4KClRo
YW5rcyBmb3IgdGhpcyBwYXRjaHNldCwgYnV0IHBsZWFzZSBkcm9wIHBhdGNoZXMgMSwgMyAmIDQs
IGFuZCB0YWtlCmluIGFjY291bnQgdGhlIGV4aXN0aW5nIGNvbXBhdGlibGUgdXNhZ2UgaW4geW91
ciBuZXcgYmluZGluZ3MgbGlrZQpJIGRpZCBpbiBteSBjb252ZXJzaW9uIHBhdGNoc2V0LgoKV2hp
bGUgd2UgZGlkIHJlbW92ZSBzb21lIGJhZCBjb21wYXRpYmxlcyB3ZSBpbnRyb2R1Y2VkIGEgZmV3
IHllYXJzIGFnbywKbm93IHRoZSBHWEJCLCBHWEwgJiBHWE0gYXJlIG5vdyBzdGFibGUgYSBhZXcg
TFRTIHJlbGVhc2VzIG5vdyBhbmQKYSBmZXcgb3RoZXIgcHJvamVjdHMgdXNlcyB0aGVtIGFzLWlz
IChVLUJvb3QsIEJTRHMsIC4uLikgc28gY2hhbmdpbmcKdGhlIGNvbXBhdGlibGVzIGlzbid0IGFu
IG9wdGlvbiBhbnltb3JlLi4uIGFuZCB3ZSBjYW4ndCBrbm93IHdoaWNoCm9uZSB0aGV5IHVzZSBh
bmQgaG93IHRoZSBpbXBsZW1lbnRhdGlvbiBiZWhhdmVzIHdlIG11c3QgZG9jdW1lbnQKdGhlIGV4
aXN0aW5nIHVzYWdlIHdpdGhvdXQgYnJlYWtpbmcgYW55IHBvdGVudGlhbCB1c2VycyAoaW5jbHVk
aW5nIGxpbnV4KS4KClRoYW5rcywKTmVpbAoKCgo+IAo+IFRoZW4gc3dpdGNoIGZ1cnRoZXIgQW1s
b2dpYyBNZXNvbiBiaW5kaW5ncyB0byB5YW1sLgo+IFRlc3RlZCB3aXRoIG1ha2UgdGFyZ2V0cyBk
dF9iaW5kaW5nX2NoZWNrIGFuZCBkdGJzX2NoZWNrLgo+IAo+IEhlaW5lciBLYWxsd2VpdCAoOCk6
Cj4gICAgYXJtNjQ6IGR0czogbWVzb24tZ3g6IFJlbW92ZSBpbnZhbGlkIHB3bSBjb21wYXRpYmxl
Cj4gICAgYXJtNjQ6IGR0czogYW1sb2dpYzogRml4IG5vbi1jb21wbGlhbnQgU0QvU0RJTyBub2Rl
IG5hbWVzCj4gICAgYXJtNjQ6IGR0czogbWVzb24tZ3g6IFNldCBvbmx5IG9uZSBjb21wYXRpYmxl
IHN0cmluZyBmb3IgbW1jCj4gICAgYXJtNjQ6IGR0czogYW1sb2dpYzogUmVtb3ZlIGludmFsaWQg
Y29tcGF0aWJsZSBzdHJpbmcKPiAgICAgIGFtbG9naWMsbWVzb24tZ3Bpby1pbnRjCj4gICAgZHQt
YmluZGluZ3M6IHJ0YzogQWRkIEFtbG9naWMgTWVzb24gdnJ0YyBjb250cm9sbGVyIGJpbmRpbmcK
PiAgICBkdC1iaW5kaW5nczogcHdtOiBBZGQgQW1sb2dpYyBNZXNvbiBQV00gYmluZGluZwo+ICAg
IGR0LWJpbmRpbmdzOiBpbnRlcnJ1cHQtY29udHJvbGxlcjogQWRkIEFtbG9naWMgTWVzb24gR1BJ
TyBpbnRlcnJ1cHQKPiAgICAgIGNvbnRyb2xsZXIgYmluZGluZwo+ICAgIGR0LWJpbmRpbmdzOiBw
aW5jdHJsOiBBZGQgQW1sb2dpYyBNZXNvbiBwaW5jdHJsIGJpbmRpbmcKPiAKPiAgIC4uLi9hbWxv
Z2ljLG1lc29uLWdwaW8taW50Yy50eHQgICAgICAgICAgICAgICB8ICAzOCAtLS0tLS0KPiAgIC4u
Li9hbWxvZ2ljLG1lc29uLWdwaW8taW50Yy55YW1sICAgICAgICAgICAgICB8ICA3MiArKysrKysr
KysrKwo+ICAgLi4uL3BpbmN0cmwvYW1sb2dpYyxtZXNvbi1waW5jdHJsLnlhbWwgICAgICAgIHwg
MTIxICsrKysrKysrKysrKysrKysrKwo+ICAgLi4uL2JpbmRpbmdzL3BpbmN0cmwvbWVzb24scGlu
Y3RybC50eHQgICAgICAgIHwgIDk0IC0tLS0tLS0tLS0tLS0tCj4gICAuLi4vZGV2aWNldHJlZS9i
aW5kaW5ncy9wd20vcHdtLWFtbG9naWMueWFtbCAgfCAgNjEgKysrKysrKysrCj4gICAuLi4vZGV2
aWNldHJlZS9iaW5kaW5ncy9wd20vcHdtLW1lc29uLnR4dCAgICAgfCAgMjkgLS0tLS0KPiAgIC4u
Li9iaW5kaW5ncy9ydGMvYW1sb2dpYyxtZXNvbi12cnRjLnlhbWwgICAgICB8ICA1MCArKysrKysr
Kwo+ICAgLi4uL2JpbmRpbmdzL3J0Yy9ydGMtbWVzb24tdnJ0Yy50eHQgICAgICAgICAgIHwgIDIy
IC0tLS0KPiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1heGcuZHRzaSAgICB8
ICAgNSArLQo+ICAgLi4uL2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZzEyLWNvbW1vbi5kdHNpICAg
IHwgICA3ICstCj4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3guZHRzaSAg
ICAgfCAgMTUgKy0tCj4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3hiYi5k
dHNpICAgfCAgIDMgKy0KPiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1neGwu
ZHRzaSAgICB8ICAgMyArLQo+ICAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0
LmR0c2kgICAgIHwgICAzICstCj4gICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24t
c20xLmR0c2kgICAgfCAgIDMgKy0KPiAgIDE1IGZpbGVzIGNoYW5nZWQsIDMyMCBpbnNlcnRpb25z
KCspLCAyMDYgZGVsZXRpb25zKC0pCj4gICBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FtbG9naWMsbWVzb24t
Z3Bpby1pbnRjLnR4dAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9hbWxvZ2ljLG1lc29uLWdwaW8taW50
Yy55YW1sCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3BpbmN0cmwvYW1sb2dpYyxtZXNvbi1waW5jdHJsLnlhbWwKPiAgIGRlbGV0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9tZXNvbixw
aW5jdHJsLnR4dAo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9wd20vcHdtLWFtbG9naWMueWFtbAo+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vcHdtLW1lc29uLnR4dAo+ICAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ydGMvYW1s
b2dpYyxtZXNvbi12cnRjLnlhbWwKPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcnRjL3J0Yy1tZXNvbi12cnRjLnR4dAo+IAoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1h
aWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
